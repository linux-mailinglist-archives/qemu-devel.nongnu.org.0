Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA44628D65
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:27:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiek-0004Wj-Em; Mon, 14 Nov 2022 18:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ouie1-0001hU-SC
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ouhT8-0003v8-CM
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 16:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668463097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZzW4AgZbMmxrsBOBTOhV6/gULQ2dQ1fNvnQET4mXFA=;
 b=I27TqvSUjfUgnOUtQovHqrcIu7MI2qi80eBIwlzifjMczVivIG3HrHqPpZ8FD4P3y3mUsF
 mNa/edtd3kWmukVXqyrHtNT8O8gyZ8T/IcGEvey5BGVJ0wkyQLMPmM/rp3opzz3KoOMRyM
 N63GzhxzBOzarbuQRnNoMDtrQ8zlwq4=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-a1uci68UMLi2HqQp-PhdMA-1; Mon, 14 Nov 2022 16:58:15 -0500
X-MC-Unique: a1uci68UMLi2HqQp-PhdMA-1
Received: by mail-io1-f72.google.com with SMTP id
 w27-20020a05660205db00b006dbce8dc263so6421879iox.16
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZzW4AgZbMmxrsBOBTOhV6/gULQ2dQ1fNvnQET4mXFA=;
 b=4l+cAZXv7TtN7gXJJPSskrumkqkxyf03IrrIJQYE+vWUq9YcHejGt0CHJW6fXoZCcw
 ITckZ5B2jGJ6vK27iKPHmUlRqLPv2E5MM2fGctjWpcppjy1aGtMIbzPT+xr88uMuOofX
 8Rs4VIxZfrYfcNnIbW85HIB3P2nLfIA/V87v0N37fPW67dY9C4WnbhDqezzMNTaOKJ7p
 EYRlNLpFx/PTwk1DXuKoFjEOhesQHI9TB4MfUwBUToltykcnlgIsYlD9NOo3zxUNheAx
 3o6vcRUQd0AEURPTuIVH6L40y1yq5mB6XQOCPAfN7ZwtA5S/6CZnGDaRW8IuxM1UZFWU
 evMQ==
X-Gm-Message-State: ANoB5pmLph6nK5eFYaTVJeUcnUQg4muETxmUzEq57MtBmP4+qrAcko7/
 jtsU99WIPjLF4zPmdjuCQwzUXZ4qTUffFgushFEoa8t22d0adxngKW6KsBGa8yRJKPWSFABdo9i
 aLR7KHD6eXML5xUQ=
X-Received: by 2002:a05:6638:3cc3:b0:363:cdfd:3b94 with SMTP id
 bc3-20020a0566383cc300b00363cdfd3b94mr6584129jab.254.1668463095013; 
 Mon, 14 Nov 2022 13:58:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ipJfUVcJn0WCqLOtKomK2JTy4DYOo2InkQIoTXzwGcxxThlBV//EiKeE4zN6kMSaQr8b7xQ==
X-Received: by 2002:a05:6638:3cc3:b0:363:cdfd:3b94 with SMTP id
 bc3-20020a0566383cc300b00363cdfd3b94mr6584119jab.254.1668463094740; 
 Mon, 14 Nov 2022 13:58:14 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056602034b00b006d276f4e01csm4512639iou.20.2022.11.14.13.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 13:58:14 -0800 (PST)
Date: Mon, 14 Nov 2022 14:58:12 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: quintela@redhat.com
Cc: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: Re: KVM call for 2022-11-15
Message-ID: <20221114145812.1740308b.alex.williamson@redhat.com>
In-Reply-To: <87o7t969lv.fsf@secure.mitica>
References: <87o7t969lv.fsf@secure.mitica>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 14 Nov 2022 12:47:40 +0100
quintela@redhat.com wrote:

> Hi
> 
> Please, send any topic that you are interested in covering.
> 
> We already have some topics:
> Re agenda, see below topics our team would like to discuss:
> 
>    - QEMU support for kernel/vfio V2 live migration patches
>    - acceptance of changes required for Grace/Hopper passthrough and vGPU
>    support
>       - the migration support is now looking like it will converge on the
>       6.2 kernel
>    - tuning GPU migration performance on QEMU/vfio, beyond what the V2 work
>    delivers
> 
> 
>  Call details:
> 
> By popular demand, a google calendar public entry with it
> 
>   https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
> 
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).

This url doesn't work for me, but the one embedded in your previous
call for agenda[1] does.  Thanks,

Alex

[1]https://lore.kernel.org/all/87tu3nvrzo.fsf@secure.mitica/


