Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B85492D38
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:24:36 +0100 (CET)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9t9n-0003ao-Bz
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:24:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9t87-0002vn-8g
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9t84-0007x5-9a
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642530166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KwIp03EvCMvJjamxEdgxzH/Pi7Hni9uq3WYEMMLOwpg=;
 b=OwtBNPvn3ss/sxkySMGt0x3YlH4k3orbNAdaf2BDyBkAAjS3oNUpZQ+8LEx5b4dTlF4u8M
 hCY/KhUWDwCgBBSmGN4yya5K8Llq+1eCjrAm+rlHvsw7jSGkA1HRM4m4LQIHYCRNtRJ67R
 1mkeYxK1WZL6UslIROlvpKQV1fxsb0E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-8l_0pQd-PFS9u9S0VFRPwA-1; Tue, 18 Jan 2022 13:22:45 -0500
X-MC-Unique: 8l_0pQd-PFS9u9S0VFRPwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so7480874wms.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 10:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KwIp03EvCMvJjamxEdgxzH/Pi7Hni9uq3WYEMMLOwpg=;
 b=hTqcIv64Jbhv5i6XI6U2A5TgqpVAAN4Qh458eL6+5S+HMkGAp4ddjMQIoFN5EvZeqE
 krCq599B/LJexJmkwL+X3ImMu5qzuaFf5KYZJO+0H5Snb6df1wtgjVKpTwcnbfxXNKQ6
 5m4yjbHHdp794bgAeyc4ev5i64UHe7ZfYbpECRchpgq5PWMXsPdNQu8IxQ1Ah9nwvjiA
 VB29C4yCaW5rJyYCiM/82FfkqsDTBKFVMBM+EooGVK4keXSKBNB3p7OTysvoiX63ZaBV
 SoaqCZB/qnfmj4Yh/mU3HaxxRvi0r8e2Kc7OSZnO62TjQKoUZX5SSj6dCt8gnltoYnBp
 i+Ww==
X-Gm-Message-State: AOAM532ZKmf7+AFlcGibuN1B1fx1RXaCMRwy0BjRVwIn7r3iYNEkoEJy
 c5aOyYJAqylkD6FefpX52fRBvN8aZDeka4z/XvJvl114Ur8eTce9eqvDZEy8eR2zmmdS9GrxcsG
 3XWDRbJlh4yOE/JU=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr18676798wrs.592.1642530164410; 
 Tue, 18 Jan 2022 10:22:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwLIT2dLiFK/ljJi0z0xWfkY23TmzID/CJ9qN3aPnnLBzb9r5WPc9tir4oSHjTjpe/b81yBg==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr18676773wrs.592.1642530164148; 
 Tue, 18 Jan 2022 10:22:44 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u13sm2836984wmm.16.2022.01.18.10.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 10:22:43 -0800 (PST)
Date: Tue, 18 Jan 2022 18:22:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 11/23] multifd: Remove send_write() method
Message-ID: <YecFcVZg5SIj0/8/@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-12-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-12-quintela@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
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
> index 71480c82bb..ba90f1aaf4 100644
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
> index bd393aee0d..757434d1ee 100644
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
> index f75bd3c188..96b9cc0d8b 100644
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
> @@ -690,7 +673,8 @@ static void *multifd_send_thread(void *opaque)
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
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


