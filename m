Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B3461D7B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:20:55 +0100 (CET)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrlGn-0004Gv-Q6
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:20:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrlFG-0003Na-9z
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrlFC-0001uM-Nx
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638209953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VNJDLnKRDBUOfpERgMfF+tlyO7N2itnoR0gf3HyS+OU=;
 b=fnOIv9D8WVHIey01oXHFjNXDnNEliO9EjmiV3FqEb6XOna1s+lzK0W35hGMMccr/hc2OgY
 U9qPKNS/V0s5cw5JP2IFtOqIb4qH8WC9BD9YFo8WB6jyaS/PLBPK462Jvj0SuIo9z3kKgA
 XjpJ7qb1SoTLmKHRIdGj2QcFg8Icc/k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-4_NyUE5ZMSezry89S9ywSw-1; Mon, 29 Nov 2021 13:19:12 -0500
X-MC-Unique: 4_NyUE5ZMSezry89S9ywSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so11281877wms.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 10:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VNJDLnKRDBUOfpERgMfF+tlyO7N2itnoR0gf3HyS+OU=;
 b=X3yDjAP802MdfUPFBjH6oOrRRgV0hAPDEMCHIbb9yq73cv7dB1iSDcLu5P0wPhsbEO
 XaQE7JNsurvnNtTCuCOCeN7wtY3Ua2Z+m/82KxtPqTVGuN9i6kjMtzJo/yW88wuPZitd
 hbBqtTCVbDZbwQ46q7Ql79Gzrq28wovVK3yrML/j3eErl42HIdqTp0PPf7SvTLBw/0ao
 +0oxE2ozeK+cWpPjajEsyOtkgFc2UWPGx/pXcmyyF+jBK437r5Hm0ovw/P8gv2qNjB6W
 5+I97DgjOg5DM791Z+ZjLHE/nTNMIMha9xI9fXHE5VugumuzRyqDS9v/6u1+1+qTcMbX
 wffA==
X-Gm-Message-State: AOAM531ag60zYjdzmgFH3btGFL20Btk1GNTFUcz0QWWJ12rjvSPQ9mMD
 BCj0LPoYOQXQnCjypMu0HpZ1vDnw5bm1623CTrE7+2ZWyksqA89XcRbFzOhPHjSevb9pa0p3qud
 wLJFlLOiMT2atVsE=
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr35331738wrd.206.1638209950402; 
 Mon, 29 Nov 2021 10:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhoC7ko7QyDYW4tQOBC5tNAuygKp6xu9RGQFXB5D3mADMXKMmFpLs3Sof/9PBOosAKLE0ikw==
X-Received: by 2002:a5d:58f9:: with SMTP id f25mr35331705wrd.206.1638209950100; 
 Mon, 29 Nov 2021 10:19:10 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l5sm52655wms.16.2021.11.29.10.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:19:09 -0800 (PST)
Date: Mon, 29 Nov 2021 18:19:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 14/23] multifd: Remove send_write() method
Message-ID: <YaUZm1X+CT9T6UC4@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-15-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-15-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Everything use now iov's.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.h      |  2 --
>  migration/multifd-zlib.c | 17 -----------------
>  migration/multifd-zstd.c | 17 -----------------
>  migration/multifd.c      | 20 ++------------------
>  4 files changed, 2 insertions(+), 54 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index c3f18af364..7496f951a7 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -164,8 +164,6 @@ typedef struct {
>      void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
>      /* Prepare the send packet */
>      int (*send_prepare)(MultiFDSendParams *p, Error **errp);
> -    /* Write the send packet */
> -    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
>      /* Setup for receiving side */
>      int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
>      /* Cleanup for receiving side */
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index 478a4af115..f65159392a 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -152,22 +152,6 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>      return 0;
>  }
>  
> -/**
> - * zlib_send_write: do the actual write of the data
> - *
> - * Do the actual write of the comprresed buffer.
> - *
> - * Returns 0 for success or -1 for error
> - *
> - * @p: Params for the channel that we are using
> - * @used: number of pages used
> - * @errp: pointer to an error
> - */
> -static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
> -{
> -    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
> -}
> -
>  /**
>   * zlib_recv_setup: setup receive side
>   *
> @@ -307,7 +291,6 @@ static MultiFDMethods multifd_zlib_ops = {
>      .send_setup = zlib_send_setup,
>      .send_cleanup = zlib_send_cleanup,
>      .send_prepare = zlib_send_prepare,
> -    .send_write = zlib_send_write,
>      .recv_setup = zlib_recv_setup,
>      .recv_cleanup = zlib_recv_cleanup,
>      .recv_pages = zlib_recv_pages
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 259277dc42..6933ba622a 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -163,22 +163,6 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>      return 0;
>  }
>  
> -/**
> - * zstd_send_write: do the actual write of the data
> - *
> - * Do the actual write of the comprresed buffer.
> - *
> - * Returns 0 for success or -1 for error
> - *
> - * @p: Params for the channel that we are using
> - * @used: number of pages used
> - * @errp: pointer to an error
> - */
> -static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
> -{
> -    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
> -}
> -
>  /**
>   * zstd_recv_setup: setup receive side
>   *
> @@ -320,7 +304,6 @@ static MultiFDMethods multifd_zstd_ops = {
>      .send_setup = zstd_send_setup,
>      .send_cleanup = zstd_send_cleanup,
>      .send_prepare = zstd_send_prepare,
> -    .send_write = zstd_send_write,
>      .recv_setup = zstd_recv_setup,
>      .recv_cleanup = zstd_recv_cleanup,
>      .recv_pages = zstd_recv_pages
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 37487fd01c..71bdef068e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -100,22 +100,6 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
>      return 0;
>  }
>  
> -/**
> - * nocomp_send_write: do the actual write of the data
> - *
> - * For no compression we just have to write the data.
> - *
> - * Returns 0 for success or -1 for error
> - *
> - * @p: Params for the channel that we are using
> - * @used: number of pages used
> - * @errp: pointer to an error
> - */
> -static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
> -{
> -    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
> -}
> -
>  /**
>   * nocomp_recv_setup: setup receive side
>   *
> @@ -173,7 +157,6 @@ static MultiFDMethods multifd_nocomp_ops = {
>      .send_setup = nocomp_send_setup,
>      .send_cleanup = nocomp_send_cleanup,
>      .send_prepare = nocomp_send_prepare,
> -    .send_write = nocomp_send_write,
>      .recv_setup = nocomp_recv_setup,
>      .recv_cleanup = nocomp_recv_cleanup,
>      .recv_pages = nocomp_recv_pages
> @@ -687,7 +670,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>  
>              if (used) {
> -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> +                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> +                                             &local_err);
>                  if (ret != 0) {
>                      break;
>                  }
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


