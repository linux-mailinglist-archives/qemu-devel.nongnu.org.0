Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477E4655F5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 19:57:57 +0100 (CET)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUnk-0001LG-Fi
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 13:57:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msUmb-0000cM-Bw
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:56:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msUmX-000568-Cy
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638384999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ILNRdfpWN6Yce3bFnaHEWybj5EjtgSDHcYOOos/DXs0=;
 b=K0CaJAMjp3ZNLKr35/nSnS4rg12c795y/4HefpyAcCZKxaiPa/jqTOhjJq8oakkhQOh1fT
 Q76V0BEanGQcQxADrXziec1g1AYsZAH0+k26So+/6DSC022wOww/k74RuvZVFjRZ3eEmHv
 g4szF+UL2RDpdWpVOaLZwTjx6kCuayc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-xpu_vz-ONe-oDfZpZLIvfQ-1; Wed, 01 Dec 2021 13:56:38 -0500
X-MC-Unique: xpu_vz-ONe-oDfZpZLIvfQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so294963wma.5
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 10:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ILNRdfpWN6Yce3bFnaHEWybj5EjtgSDHcYOOos/DXs0=;
 b=cxCcju1D5yaSq+1g9Un/K5DalwD5aem+cKzt8PxcRJ58Qm4lAFKZVTPmbk7WOlsGfl
 H/wK6S742je9Zxw909HgJzlemreRBWrTe495BW6I0QhrL6rxzybaNvQt/t5XsAtrUHHL
 439yetETwn0pZ/nQD1yD5Cg1VosrhccUfZ6VvKqIElSGRa2qbegCTmHh28R7zaUJKTYX
 /0XfYdtHv0JBpVe06bnQX+ViTkWOqSicymuURxv1vyLzDtw4VAHL+/Jr4h5pR11xo2Qi
 UNfxeWW00LwAgwBst/5I2z0yPgBjUjfRtx5zcsSU2AmUqYZd9Li+ISrwzPdB/LC95dhy
 KhZQ==
X-Gm-Message-State: AOAM533g0alJkCTTJoupBPULIkahSUiiqnxbyiARAuLn+ikwoVeXL2bG
 ycZTGv67c/pc8bCETx9FgqsmTYrsAVYznvpG4/rqc97LpAIXuIikamStS/g2icLsvHAGyvzIFfb
 VVgixjOP/Urw6CoM=
X-Received: by 2002:adf:a389:: with SMTP id l9mr8973618wrb.121.1638384997028; 
 Wed, 01 Dec 2021 10:56:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUN9ReQghkLgMpyAQuTwVJejctL9F3kfRsZHBQU7YVKkCZYFs+Mfh18/sv2PS7EC0RwzNA6Q==
X-Received: by 2002:adf:a389:: with SMTP id l9mr8973600wrb.121.1638384996856; 
 Wed, 01 Dec 2021 10:56:36 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id h22sm119288wmq.14.2021.12.01.10.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 10:56:36 -0800 (PST)
Date: Wed, 1 Dec 2021 18:56:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 19/23] multifd: recv side only needs the RAMBlock host
 address
Message-ID: <YafFYpHLUeeAieGT@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-20-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-20-quintela@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
> So we can remove the MultiFDPages.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.h      | 4 ++--
>  migration/multifd-zlib.c | 2 +-
>  migration/multifd-zstd.c | 2 +-
>  migration/multifd.c      | 7 ++-----
>  4 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index 9fbcb7bb9a..ab32baebd7 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -136,8 +136,8 @@ typedef struct {
>      bool running;
>      /* should this thread finish */
>      bool quit;
> -    /* array of pages to receive */
> -    MultiFDPages_t *pages;
> +    /* ramblock host address */
> +    uint8_t *host;
>      /* packet allocated len */
>      uint32_t packet_len;
>      /* pointer to the packet */
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index cc143b829d..bf4d87fa16 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -253,7 +253,7 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>          }
>  
>          zs->avail_out = page_size;
> -        zs->next_out = p->pages->block->host + p->normal[i];
> +        zs->next_out = p->host + p->normal[i];
>  
>          /*
>           * Welcome to inflate semantics
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 93d504ce0f..dd64ac3227 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -264,7 +264,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
>      z->in.pos = 0;
>  
>      for (i = 0; i < p->normal_num; i++) {
> -        z->out.dst = p->pages->block->host + p->normal[i];
> +        z->out.dst = p->host + p->normal[i];
>          z->out.size = page_size;
>          z->out.pos = 0;
>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 3ffb1aba64..dc76322137 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -147,7 +147,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>      for (int i = 0; i < p->normal_num; i++) {
> -        p->iov[i].iov_base = p->pages->block->host + p->normal[i];
> +        p->iov[i].iov_base = p->host + p->normal[i];
>          p->iov[i].iov_len = page_size;
>      }
>      return qio_channel_readv_all(p->c, p->iov, p->normal_num, errp);
> @@ -340,7 +340,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> -    p->pages->block = block;
> +    p->host = block->host;
>      for (i = 0; i < p->normal_num; i++) {
>          uint64_t offset = be64_to_cpu(packet->offset[i]);
>  
> @@ -1004,8 +1004,6 @@ int multifd_load_cleanup(Error **errp)
>          qemu_sem_destroy(&p->sem_sync);
>          g_free(p->name);
>          p->name = NULL;
> -        multifd_pages_clear(p->pages);
> -        p->pages = NULL;
>          p->packet_len = 0;
>          g_free(p->packet);
>          p->packet = NULL;
> @@ -1146,7 +1144,6 @@ int multifd_load_setup(Error **errp)
>          qemu_sem_init(&p->sem_sync, 0);
>          p->quit = false;
>          p->id = i;
> -        p->pages = multifd_pages_init(page_count);
>          p->packet_len = sizeof(MultiFDPacket_t)
>                        + sizeof(uint64_t) * page_count;
>          p->packet = g_malloc0(p->packet_len);
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


