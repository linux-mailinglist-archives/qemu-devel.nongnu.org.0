Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0585B461CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:27:25 +0100 (CET)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkR2-0001XP-5I
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:27:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkGT-0003y1-Mf
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:16:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkGQ-0001mG-Rg
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638206185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hY1fUPtq/x7/ArKHgRYrlSSue/8Q1jQNIbPBPHrbrj4=;
 b=JjlQ4XR6+6GPLIg9ZUodtevJuaNE7mTsa6PQAZItnkgXJCd4pgI+UWyF/fWCBAP7VKpcsb
 epRGmdYrMfwS2cLATUFR/OKJI27AhZdoMERW4L4sjYJiCk/TcXR+PyoxzhNFQvqdkBfDnW
 +UoG8Gw4qK9PQZ8Bh2muKz+Tkpvl+IE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-heYnscWgMQqq-hVke-WOgQ-1; Mon, 29 Nov 2021 12:16:24 -0500
X-MC-Unique: heYnscWgMQqq-hVke-WOgQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y141-20020a1c7d93000000b0033c2ae3583fso8929796wmc.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hY1fUPtq/x7/ArKHgRYrlSSue/8Q1jQNIbPBPHrbrj4=;
 b=w31PIAB+qF8AMzcLP1Re7hzXVqZZRg9VZYyp1edj7wVLYjwnti7B9IExdgi61DwecU
 4DYFnuUYzGhanynNNHaGOwnm4uALDLVXQLWkhDkir0aBkb+N1NWP47BufRvzAqwOKExU
 ZUP6o20erSfO3tSj+dE3Qzd9OvYusiiPcVwPmrricxt7VNn6IXrQXuYs3jR+pM99zYPJ
 W0N3z7qH2+IxHruoMF4L5bYARPDoh1A+wEWaRginYTDy80ThuHFbB7rEpMK1E7Es4uRY
 voT40HVVEFwqQ1gAXsDmxXfszEp3X3sl1ZcnjhIRvoRltF7n7wnwPmqUhiugoBp3diA7
 Qtcg==
X-Gm-Message-State: AOAM531f9sMOndNM/C1rykcC+Fc/2Mhg3unslGKuJb9fcwvnP19wyNdp
 +8d3SAbgKn+s/2TfNsgJtY2dNF5IJqhKd6dljzSpC8+yyuOANcliZCHTUqckj6vgTcpQuAO74cp
 ZrJBbBR/g7DzbOTU=
X-Received: by 2002:a1c:7405:: with SMTP id p5mr36896555wmc.152.1638206183384; 
 Mon, 29 Nov 2021 09:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxptFZS17kozaQMb7zsC7xE2N9F6oynVXD2UapL6IoN86yIiPZYKQVqJ86Zqa8YTkGkFBH5PQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr36896525wmc.152.1638206183191; 
 Mon, 29 Nov 2021 09:16:23 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id a198sm228649wme.1.2021.11.29.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:16:22 -0800 (PST)
Date: Mon, 29 Nov 2021 17:16:20 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 09/23] multifd: Make zstd compression method not use
 iovs
Message-ID: <YaUK5C7AnOPtisLJ@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-10-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-10-quintela@redhat.com>
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
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd-zstd.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index a8b104f4ee..2d5b61106c 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include <zstd.h>
>  #include "qemu/rcu.h"
> +#include "exec/ramblock.h"
>  #include "exec/target_page.h"
>  #include "qapi/error.h"
>  #include "migration.h"
> @@ -111,8 +112,8 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
>   */
>  static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
> -    struct iovec *iov = p->pages->iov;
>      struct zstd_data *z = p->data;
> +    size_t page_size = qemu_target_page_size();
>      int ret;
>      uint32_t i;
>  
> @@ -126,8 +127,8 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>          if (i == p->pages->num - 1) {
>              flush = ZSTD_e_flush;
>          }
> -        z->in.src = iov[i].iov_base;
> -        z->in.size = iov[i].iov_len;
> +        z->in.src = p->pages->block->host + p->pages->offset[i];
> +        z->in.size = page_size;
>          z->in.pos = 0;
>  
>          /*
> @@ -256,7 +257,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      uint32_t in_size = p->next_packet_size;
>      uint32_t out_size = 0;
> -    uint32_t expected_size = p->pages->num * qemu_target_page_size();
> +    size_t page_size = qemu_target_page_size();
> +    uint32_t expected_size = p->pages->num * page_size;
>      uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
>      struct zstd_data *z = p->data;
>      int ret;
> @@ -278,10 +280,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>      z->in.pos = 0;
>  
>      for (i = 0; i < p->pages->num; i++) {
> -        struct iovec *iov = &p->pages->iov[i];
> -
> -        z->out.dst = iov->iov_base;
> -        z->out.size = iov->iov_len;
> +        z->out.dst = p->pages->block->host + p->pages->offset[i];
> +        z->out.size = page_size;
>          z->out.pos = 0;
>  
>          /*
> @@ -295,8 +295,8 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>          do {
>              ret = ZSTD_decompressStream(z->zds, &z->out, &z->in);
>          } while (ret > 0 && (z->in.size - z->in.pos > 0)
> -                         && (z->out.pos < iov->iov_len));
> -        if (ret > 0 && (z->out.pos < iov->iov_len)) {
> +                         && (z->out.pos < page_size));
> +        if (ret > 0 && (z->out.pos < page_size)) {
>              error_setg(errp, "multifd %d: decompressStream buffer too small",
>                         p->id);
>              return -1;
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


