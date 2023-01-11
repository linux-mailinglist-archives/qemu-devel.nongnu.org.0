Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD00E666061
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFduk-0007QK-IZ; Wed, 11 Jan 2023 11:25:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFdui-0007Pr-00
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:25:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pFdug-0004tQ-5h
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673454316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cecPB55W25pGLEKDJ+GDaifgMTbWvukrV+AQLVPunWU=;
 b=ckO6Y/X7v5vvs+c9RWBMvYFLvquozxZ+mkssXiSGiB1jFhHLydrbXUve0/oai0XB/TjygI
 1jNgwiAMgTcSEQ785slpiKrAPWMQw1VRyxRvc3j8FHWSqyTcof9MEIsy3hTHSDZKYWntvH
 l/lxUAmRnHlKaLgeux4cUEr2F4W1X8E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-158-gJi7kUtvOdql0oK9rVgHhA-1; Wed, 11 Jan 2023 11:25:15 -0500
X-MC-Unique: gJi7kUtvOdql0oK9rVgHhA-1
Received: by mail-ej1-f70.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso10586979ejb.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cecPB55W25pGLEKDJ+GDaifgMTbWvukrV+AQLVPunWU=;
 b=ZAGcpol63O2pfFHt0kv8AjsVbd1M8ZIg7gcAR3zydHkMNqaGc1tGgyeTMNr4OkT/Jy
 7kiipDmLk8jYQJYOt/5+vt7qjT4tn41GfYdvFdh3lD6BqL7Fx9XLqsNOSR50l5ppmAjk
 fRIBEBIVh0p2i1TZ+sMkF9swuqGhaGS1rGyZCEiDXhDXWi9p5QH65yafALC0xU2DjM0I
 zkWRRhqB1r9MHiflvGE+DP9qG1nEyp4cOOClKheJ17MyTP8UMyLo6JRgw0WIVGbSsxqR
 uuKhz2Ps+apo6+zOtpbtHczFbxjV+1f5DIwbFM/T3aMNvWkxnZT5XkKtPd7DNweQB0vp
 e0Rw==
X-Gm-Message-State: AFqh2kpULl3f6sxqbp7wKTps/7zquJFbt5agY72A6c6fe/GaLK5g8CRb
 nKWNhtewgxap4BBlpohHkv1+XV3SCtVadoegTfzOWhl8V3y1JTJWzimlWKkvaKvgQXJeeXkgIg9
 SF+AFyd/5teP7U1k=
X-Received: by 2002:a17:906:a191:b0:7c0:d605:fe42 with SMTP id
 s17-20020a170906a19100b007c0d605fe42mr63626269ejy.18.1673454314272; 
 Wed, 11 Jan 2023 08:25:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvqIROL0DvQ68psjqhl6kZ+HGXh5JuDuz9e4T+I7EufB/OiXssR+KPTwLXIaloOdqqf9cUqvA==
X-Received: by 2002:a17:906:a191:b0:7c0:d605:fe42 with SMTP id
 s17-20020a170906a19100b007c0d605fe42mr63626253ejy.18.1673454314037; 
 Wed, 11 Jan 2023 08:25:14 -0800 (PST)
Received: from redhat.com ([109.253.181.221]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170906538200b0085c3f08081esm1483674ejo.13.2023.01.11.08.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 08:25:13 -0800 (PST)
Date: Wed, 11 Jan 2023 11:25:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, paul@xen.org
Subject: Re: [RFC] Notify IRQ sources of level interrupt ack/EOI
Message-ID: <20230111112425-mutt-send-email-mst@kernel.org>
References: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Jan 11, 2023 at 02:41:58PM +0000, David Woodhouse wrote:
> This allows drivers to register a callback on a qemu_irq, which is
> invoked when a level-triggered IRQ is acked on the irqchip.
> 
> This allows us to simulate level-triggered interrupts more efficiently,
> by resampling the state of the interrupt only when it actually matters.

I think we tried this with vfio and had to give up on this.
I don't remember the details though. Alex probably does?


