Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8738461EC8
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:36:57 +0100 (CET)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrlWK-0005oc-C6
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:36:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrlUn-00055o-LD
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:35:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrlUk-0004BL-Rv
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:35:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638210918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tGLwY5jVn4rstVpY334BjiQvx+uqHNHrkEPCag/HKEo=;
 b=bfkEgk5iO4/CEXNrN3s7SmS0OGlHkAaMdOl37TicRdYiGJEjIQHqTGTx7AFaxMifgaitKU
 mHUJBSsCozf0n+4jvCgWh2W/ROi3XfpQTtRibZZOgv80mJy2UfbQclVDFeaFDtAtLkSK9G
 dY1exLiJ3ZgvsstFmrSoZgzYjTByoOQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-D3hxYMNgM_CH6DKXAgHiRA-1; Mon, 29 Nov 2021 13:35:16 -0500
X-MC-Unique: D3hxYMNgM_CH6DKXAgHiRA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso3110636wrw.10
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 10:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tGLwY5jVn4rstVpY334BjiQvx+uqHNHrkEPCag/HKEo=;
 b=wo4dLe7IJYQZt3nmw6pvnvXNjfXys5YB39Fp7NAnJpv2TZV7Hv8lYKkWYoD8Upa9Ky
 mqC9ucNZx4hkVdSZGEgLEqcZ1z8Gg6tIHIBPqdgxM3imvXiC8rCZEWXPTe32wDRVnDhu
 RgU+l0IsyrOlLIJR7+9mo/xkfn7b/cUC7YCgOFS8fKL+kVzJehX2tfBwJNK7+CN6v8Ap
 r5JfK/KBR5/40D8WbneQBhiS6THk2RkOI7mwnIX028QgMdBzlobob28zjL/8tZDmzPAi
 RkpzR0FWU230GWHzgKkK8jPbHx/d5h6hkwZwutf4H3b1VGQq7VzWpcQZsXW6UnCwl7d8
 EVlw==
X-Gm-Message-State: AOAM530CuOxhu7YjvTwESudeWNg2pBXrDFfEB21w1SBAJtW/E3OWxgSD
 rVZZe08mhdHvXJTmgNCFtdArbd/UOnpYB0NHKpDsXffGUnto+gjbyblmi/pJjB46OzoJQXQWV0K
 O/mqImUT54KhR6BU=
X-Received: by 2002:adf:df85:: with SMTP id z5mr36204367wrl.445.1638210915874; 
 Mon, 29 Nov 2021 10:35:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXd3Co4Vt4GxlmbHA5U+JmRbn8MihJdvYOaSNx7QZEKYHX8qDqDCaaXpPPg9bEZ1xqlhX5cA==
X-Received: by 2002:adf:df85:: with SMTP id z5mr36204345wrl.445.1638210915638; 
 Mon, 29 Nov 2021 10:35:15 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n4sm16652851wri.41.2021.11.29.10.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:35:15 -0800 (PST)
Date: Mon, 29 Nov 2021 18:35:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 15/23] multifd: Use a single writev on the send side
Message-ID: <YaUdYb8+hUveWe0X@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-16-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-16-quintela@redhat.com>
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
> Until now, we wrote the packet header with write(), and the rest of the
> pages with writev().  Just increase the size of the iovec and do a
> single writev().
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 71bdef068e..65676d56fd 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -643,7 +643,7 @@ static void *multifd_send_thread(void *opaque)
>              uint32_t used = p->pages->num;
>              uint64_t packet_num = p->packet_num;
>              uint32_t flags = p->flags;
> -            p->iovs_num = 0;
> +            p->iovs_num = 1;
>  
>              if (used) {
>                  ret = multifd_send_state->ops->send_prepare(p, &local_err);
> @@ -663,20 +663,15 @@ static void *multifd_send_thread(void *opaque)
>              trace_multifd_send(p->id, packet_num, used, flags,
>                                 p->next_packet_size);
>  
> -            ret = qio_channel_write_all(p->c, (void *)p->packet,
> -                                        p->packet_len, &local_err);
> +            p->iov[0].iov_len = p->packet_len;
> +            p->iov[0].iov_base = p->packet;
> +
> +            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> +                                         &local_err);
>              if (ret != 0) {
>                  break;
>              }
>  
> -            if (used) {
> -                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> -                                             &local_err);
> -                if (ret != 0) {
> -                    break;
> -                }
> -            }
> -
>              qemu_mutex_lock(&p->mutex);
>              p->pending_job--;
>              qemu_mutex_unlock(&p->mutex);
> @@ -913,7 +908,8 @@ int multifd_save_setup(Error **errp)
>          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
>          p->name = g_strdup_printf("multifdsend_%d", i);
>          p->tls_hostname = g_strdup(s->hostname);
> -        p->iov = g_new0(struct iovec, page_count);
> +        /* We need one extra place for the packet header */
> +        p->iov = g_new0(struct iovec, page_count + 1);
>          socket_send_channel_create(multifd_new_send_channel_async, p);
>      }
>  
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


