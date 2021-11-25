Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C749245E0A0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 19:45:16 +0100 (CET)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqJkB-0006aI-J5
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 13:45:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJg3-0004VQ-1y
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:40:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqJg0-0005SW-A2
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 13:40:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637865655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b5bHf5vqcocNliWSxt7Rthlfrgd5nQ6mz5oQBD9bOI0=;
 b=CB1Ycx66UGfJcVXXgrLbMmVsafuo6UQnEToXfRU3loIOdZiydZYqBCTGBPBpyyUTvMwjIO
 0slwtpBhxQQDsgcb/SUDdY0OSI26SM3UEIfjB1COesK8VaVrJ3Pw5J+UPfcV6GQUEmihvx
 1gxjaP0MsbX+arIMDaVkyoSnyt9a1C0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-wwzwDTGHMoiHCeF8n2b7fw-1; Thu, 25 Nov 2021 13:40:54 -0500
X-MC-Unique: wwzwDTGHMoiHCeF8n2b7fw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so3632787wmj.7
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 10:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b5bHf5vqcocNliWSxt7Rthlfrgd5nQ6mz5oQBD9bOI0=;
 b=m3FtJMYbsiNlHA8cqEcWEC5VWlCt0bD/X1mXPrhFEHiiQLFEfowW0RLr/EG8VzCl/4
 l+F1c6ONYIEOcE7pfxeUcT/kFf//hk9P6sG6DJDznve5iQJIhg0uHifUqd1RffO3uB8H
 niOw/ojlc6fWHNVkyLpG0l9WN+zmlCXf9WI+A+qdZejMp8m0zaXnahirAO+3R22zYNrN
 B6/tRrEfciB41nmkeVyQvmCMNkH2ofKKI3lqlYz6fJ1DbJXzMdUuv83Ixb4Q1Tix/TYO
 qmlH5aDHlgscuxF1tNI1EAkesWMCHSSrQgqdJF8MURWYxlzkKnJQrjJgZL3BNQ6sbit1
 Sm2g==
X-Gm-Message-State: AOAM530wpwqDqOHGaJ1LBFm056ZmMasJuZochlOJ5+MF/x8TgSWp64dy
 tQXYO+QAWn2PXFaRM+mdcnBA1GPXW1H/bJfs1MukMG3v0MkhVzw2m+2LpJEA/KDoO6o4Sxnru/C
 ZKoKKa0wxHPs2KS4=
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr10246761wmb.84.1637865653127; 
 Thu, 25 Nov 2021 10:40:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdGta/KZC4fbLkvQwyXMDKPxQfs0Qg75aDi4BXx2ZW0mRJ4ChCcMcUgsscHn6ns89QFXXipA==
X-Received: by 2002:a05:600c:1e27:: with SMTP id
 ay39mr10246720wmb.84.1637865652942; 
 Thu, 25 Nov 2021 10:40:52 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id be3sm10450545wmb.1.2021.11.25.10.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 10:40:52 -0800 (PST)
Date: Thu, 25 Nov 2021 18:40:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 05/23] multifd: The variable is only used inside the
 loop
Message-ID: <YZ/YsmpFaC9pA3zv@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-6-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-6-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index cdeffdc4c5..ce7101cf9d 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -629,7 +629,6 @@ static void *multifd_send_thread(void *opaque)
>      MultiFDSendParams *p = opaque;
>      Error *local_err = NULL;
>      int ret = 0;
> -    uint32_t flags = 0;
>  
>      trace_multifd_send_thread_start(p->id);
>      rcu_register_thread();
> @@ -652,7 +651,7 @@ static void *multifd_send_thread(void *opaque)
>          if (p->pending_job) {
>              uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
> -            flags = p->flags;
> +            uint32_t flags = p->flags;
>  
>              if (used) {
>                  ret = multifd_send_state->ops->send_prepare(p, used,
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


