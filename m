Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE164655FC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 20:02:22 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUs0-0003cS-2D
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 14:02:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msUq9-0002pX-RT
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:00:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1msUq7-0007Am-11
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638385221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e4T7p4rnCTeIRcS37SEog6imyiZMSUxM+IXnfQBoEKI=;
 b=Z4mSnH8mAuRgo79f0wC2hnoiLguhEwNIvqaA4oAtP1I4zagQVIaqh1WQfu6ruKCncphNc+
 ij9yk57sIsxUwB0JWr+jDzNpb3+17f+rpyU/aTilDUN4yWZi7uoW/ICGrpe/FF5C5xhfZR
 ObPfFK+jbQFC+0O9D/Zzcz+DyGOSODA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-YKFjXu06Mvayq6FvWdxJLA-1; Wed, 01 Dec 2021 14:00:20 -0500
X-MC-Unique: YKFjXu06Mvayq6FvWdxJLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so12707027wmg.9
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 11:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e4T7p4rnCTeIRcS37SEog6imyiZMSUxM+IXnfQBoEKI=;
 b=QSwSJKggeVKDCnimetbXlu4wLYqub+s/7JnXZ/+Y6LBPZr4VyPBY5ctq4I/NYvQwTn
 h4z/DSVJ/iWEAomcuhcr84pkHFPLUVH+9Dc9o45DqQY/v34m8lgIDW/7++xdRBWEPTJ3
 zd5v0W8L9zot+97AQ2ZO40duRm0YpEnE6eZvsIV6f72a+T79Kxt13kLzh3yVH2mSDMDf
 /9LOrj1fZBBSP/z9lh7suKmzx44xWk+p3aSV0RrOdJlEDi+4vty0Ju6uLqk+oGhuZllw
 dWu1j0jXkmLtpEJCz5ieFyKMjehrZPADve/mtayIiwOxUgRL2UNjdavzmb9YY+COyCnR
 GRVQ==
X-Gm-Message-State: AOAM5334veWjfUKI+GDRkwtib/7gmgKKZm6PgUVEY0GMv9W3bBGe21+x
 DF0zf2J1uPvZ0lUtmjDD4ZtvDv007S95IKeqCRrZiYNqxtPJaz0HUKpujW9Gqz3j2KDgBnxc2Sk
 9ROOKAe6MtdEOliA=
X-Received: by 2002:a5d:6449:: with SMTP id d9mr8972786wrw.332.1638385219107; 
 Wed, 01 Dec 2021 11:00:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMpTEt7Bt8ihMSAqokt+8LBfxAiKPdtYXHRbHuZ893wmKHPc3Di3mKmeGL9Hx+dbAUn51u6A==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr8972764wrw.332.1638385218918; 
 Wed, 01 Dec 2021 11:00:18 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z6sm178474wmp.9.2021.12.01.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 11:00:18 -0800 (PST)
Date: Wed, 1 Dec 2021 19:00:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 20/23] multifd: Rename pages_used to normal_pages
Message-ID: <YafGQOJUool6qUj5@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-21-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-21-quintela@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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

(This series has a painful lot of small renamy patches)


> ---
>  migration/multifd.h | 3 ++-
>  migration/multifd.c | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/multifd.h b/migration/multifd.h
> index ab32baebd7..39e55d7f05 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -44,7 +44,8 @@ typedef struct {
>      uint32_t flags;
>      /* maximum number of allocated pages */
>      uint32_t pages_alloc;
> -    uint32_t pages_used;
> +    /* non zero pages */
> +    uint32_t normal_pages;
>      /* size of the next packet that contains pages */
>      uint32_t next_packet_size;
>      uint64_t packet_num;
> diff --git a/migration/multifd.c b/migration/multifd.c
> index dc76322137..d1ab823f98 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
>  
>      packet->flags = cpu_to_be32(p->flags);
>      packet->pages_alloc = cpu_to_be32(p->pages->allocated);
> -    packet->pages_used = cpu_to_be32(p->normal_num);
> +    packet->normal_pages = cpu_to_be32(p->normal_num);
>      packet->next_packet_size = cpu_to_be32(p->next_packet_size);
>      packet->packet_num = cpu_to_be64(p->packet_num);
>  
> @@ -316,7 +316,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>          return -1;
>      }
>  
> -    p->normal_num = be32_to_cpu(packet->pages_used);
> +    p->normal_num = be32_to_cpu(packet->normal_pages);
>      if (p->normal_num > packet->pages_alloc) {
>          error_setg(errp, "multifd: received packet "
>                     "with %d pages and expected maximum pages are %d",
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


