Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F745FC975
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 18:48:30 +0200 (CEST)
Received: from localhost ([::1]:35762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oieuD-0006wQ-Sw
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 12:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oiepu-0003ey-RQ
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oieps-0003Di-Ae
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665593039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6OprDxGVPVlD6sVApApoVTdrYWxQnuX9DlQq5vuleM=;
 b=QBcrDPEbsKbOiRqjqUfjlJFJx9hwNrnL/OXbNEMWfLkc/4FkasKWfVAxWQeY58G+PjYSuQ
 /K5kc6ceEzz9bPcwWGDXYUm+Y69qR9PjjCqelLUzia4qJuK/rzwq9xPdqCkBV7nqBFIrXa
 bAmy1gGonriu/Z1azhiS7cKaGZdeBQY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-WO80avyoMI6fvolbAIChnw-1; Wed, 12 Oct 2022 12:43:57 -0400
X-MC-Unique: WO80avyoMI6fvolbAIChnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo1383206wma.1
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6OprDxGVPVlD6sVApApoVTdrYWxQnuX9DlQq5vuleM=;
 b=MnqzXrtCJGMmHOufbOerasSOcIGJgAcZBZnEejKdCXkx6nijn+HBGLONNbFq36p64h
 +ReP2mRy6lcAmW1sBwksqyEcFgUJElLsqtcJRyCTKOIQcFufV1RSJrSdGFh2wKX3YeHK
 HlhRjCywjzSv+EonAetFPQ/9eQlq2Pa83GLnsLB3ax/6GnWyVsbE2cUHVeMOA5LQ7BTz
 XWSpW7uDuBJA+mXYT8EJdZ4b7IMId7pC+F4j5HJ9Pk7UsCnAvWwmMyKMXcDgXbrSQ16v
 pRZUyXTzvkO23Hbjp5Bjof0JjvsacoZHnv2/w83pAAkH7dhX0no0IxBC5P+g3rIBQAgC
 czeA==
X-Gm-Message-State: ACrzQf12/7pB2ZhC1QwtQ5qV5P6ISt+AUYt4JthU0RlxoT91C3lgiw8u
 UypgTOj7PHt+tyahRTS/Mqv+Wl30zNV/KVXukFnXM6HV6yKfrCmgmd1pKtNr+q1yFTCtJ40gCja
 tzPA3uB2S3TZtJ1s=
X-Received: by 2002:a5d:5585:0:b0:22d:f0cd:e3b9 with SMTP id
 i5-20020a5d5585000000b0022df0cde3b9mr18370475wrv.347.1665593036670; 
 Wed, 12 Oct 2022 09:43:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4aN8Ukeup0b1ADJ9y76t427kJmoTWcDHXO1xJPP5q7HXaNZD3pVAxx3S/WTDAGU742JlASYQ==
X-Received: by 2002:a5d:5585:0:b0:22d:f0cd:e3b9 with SMTP id
 i5-20020a5d5585000000b0022df0cde3b9mr18370457wrv.347.1665593036444; 
 Wed, 12 Oct 2022 09:43:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6945000000b0022cc0a2cbecsm157264wrw.15.2022.10.12.09.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:43:55 -0700 (PDT)
Date: Wed, 12 Oct 2022 17:43:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 06/15] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Y0buySbboE3xOVoQ@work-vm>
References: <20221011215559.602584-1-peterx@redhat.com>
 <20221011215559.602584-7-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011215559.602584-7-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Don't take the bitmap mutex when sending pages, or when being throttled by
> migration_rate_limit() (which is a bit tricky to call it here in ram code,
> but seems still helpful).
> 
> It prepares for the possibility of concurrently sending pages in >1 threads
> using the function ram_save_host_page() because all threads may need the
> bitmap_mutex to operate on bitmaps, so that either sendmsg() or any kind of
> qemu_sem_wait() blocking for one thread will not block the other from
> progressing.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

although a comment above the reclaration of ram_save_host_pages saying
it can drop the lock would be veyr good.

Dave


> ---
>  migration/ram.c | 41 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b9ac2d6921..578ad8d70a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2462,6 +2462,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
>   */
>  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>  {
> +    bool page_dirty, preempt_active = postcopy_preempt_active();
>      int tmppages, pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> @@ -2485,22 +2486,40 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>              break;
>          }
>  
> -        /* Check the pages is dirty and if it is send it */
> -        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> -            tmppages = ram_save_target_page(rs, pss);
> -            if (tmppages < 0) {
> -                return tmppages;
> -            }
> +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
>  
> -            pages += tmppages;
> +        /* Check the pages is dirty and if it is send it */
> +        if (page_dirty) {
>              /*
> -             * Allow rate limiting to happen in the middle of huge pages if
> -             * something is sent in the current iteration.
> +             * Properly yield the lock only in postcopy preempt mode
> +             * because both migration thread and rp-return thread can
> +             * operate on the bitmaps.
>               */
> -            if (pagesize_bits > 1 && tmppages > 0) {
> -                migration_rate_limit();
> +            if (preempt_active) {
> +                qemu_mutex_unlock(&rs->bitmap_mutex);
> +            }
> +            tmppages = ram_save_target_page(rs, pss);
> +            if (tmppages >= 0) {
> +                pages += tmppages;
> +                /*
> +                 * Allow rate limiting to happen in the middle of huge pages if
> +                 * something is sent in the current iteration.
> +                 */
> +                if (pagesize_bits > 1 && tmppages > 0) {
> +                    migration_rate_limit();
> +                }
>              }
> +            if (preempt_active) {
> +                qemu_mutex_lock(&rs->bitmap_mutex);
> +            }
> +        } else {
> +            tmppages = 0;
>          }
> +
> +        if (tmppages < 0) {
> +            return tmppages;
> +        }
> +
>          pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
>      } while ((pss->page < hostpage_boundary) &&
>               offset_in_ramblock(pss->block,
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


