Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756B687CA8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:49:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNY4u-0005yd-II; Thu, 02 Feb 2023 06:48:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY4n-0005xO-RF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:48:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNY4m-00036L-6M
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675338503;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=V6qrMs4VE0Q4hPbHSu73AJON+bFtZq2CvMLE880dcIE=;
 b=Pri6M3T2/26GvY2PolDapuNbGEW/1fLEk92bNog86Vmi6pLHvVAvH3BItjdghTzYFQiakK
 0GKsUScWYeD75LBkbzl5bHojqr2jV7NCOQL3/DAkbfxlpg8JFqWfDIBhjfH3Lgzaf4ClYo
 RLJRDLciFVbT1fyNfX7AJcQtRpxemzo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-X0CyXgJWOkWXTIMlQUJeCg-1; Thu, 02 Feb 2023 06:48:21 -0500
X-MC-Unique: X0CyXgJWOkWXTIMlQUJeCg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o5-20020a05600c4fc500b003db0b3230efso2687112wmq.9
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6qrMs4VE0Q4hPbHSu73AJON+bFtZq2CvMLE880dcIE=;
 b=HsgO+om506Nk1YSvMb9R73NiKmTIyRwsCJsWanIicQbN49fyGjcnQTDrn+5C3IxYBn
 +oxDg5/dKHkCySEhP/hzena/e6S0hd5yK14194k9OMkOT4haR1flLyA0BzRSeV2uHm1g
 JfoeomklPC7PnKkABAI76FgfW+IMJMeJsPSeIsmC/Imwnyr1wytUT/17MS80dnFiV7Hu
 alSdD66DguyhMAf3ef8h+YC8l+BiDWlJ7zLuViWPIMTfDOxYus1ZcFU1ZyQRGd4c03yb
 J0RR+DC+VBTrf77pXpA6g/6MixuPPcfD/lVp5PUKCZUBs1oglYi6IbKoVe9ADd+0UduW
 4Gqg==
X-Gm-Message-State: AO0yUKU+ryVKBWq95DchHue/dTTY2RZysjo43SCboOcSWWE4qVWR0eX6
 msc0el/TiFpWK1Av3z7aqVBhxm7cPuC6qERUi9ddxIJfOIgO9KVmh1H4T0IjjbrSSrw2BqgbS6q
 s6a40Yz7oiK2q1lU=
X-Received: by 2002:a05:600c:1d99:b0:3dc:d5c:76d9 with SMTP id
 p25-20020a05600c1d9900b003dc0d5c76d9mr5739147wms.0.1675338499865; 
 Thu, 02 Feb 2023 03:48:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/hWB7itLB0nj3HigEHALI2P+vKavsFZ0C+WbkAWV8YkohRSrtDMerZSag1zWCO9Y5RxG+93A==
X-Received: by 2002:a05:600c:1d99:b0:3dc:d5c:76d9 with SMTP id
 p25-20020a05600c1d9900b003dc0d5c76d9mr5739138wms.0.1675338499705; 
 Thu, 02 Feb 2023 03:48:19 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600c364a00b003daf7721bb3sm4392249wmq.12.2023.02.02.03.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:48:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,  "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v5 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
In-Reply-To: <20230117112249.244096-3-david@redhat.com> (David Hildenbrand's
 message of "Tue, 17 Jan 2023 12:22:43 +0100")
References: <20230117112249.244096-1-david@redhat.com>
 <20230117112249.244096-3-david@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 12:48:18 +0100
Message-ID: <875yckp9tp.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

David Hildenbrand <david@redhat.com> wrote:
> ... and store it in the migration state. This is a preparation for
> storing selected vmds's already in qemu_savevm_state_setup().
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


