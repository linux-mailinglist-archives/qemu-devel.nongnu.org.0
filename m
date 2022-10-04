Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFD85F4582
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:31:47 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofixW-0003TV-DH
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofiOJ-0005hq-Pd
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ofiOF-00063N-UO
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664891718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0LiOhogjHqkYTazvm90ozpckrrkfzXSlVjhe9B4VJs=;
 b=Pa/wMl/+nhyF5oba4X4eV7WYzOOb/9+P4JZPtH+29ipIhUFk34fwU94H8ybWabusDC/2Bd
 rD5K3iC1ODqO09kbsYPqNcnnZv8kh99pgKPBS6fiEYMN2xufGYLEXwI4972TgLUM++YFZd
 Hc2+n56BkaapjcbuZqE0/8j82Os15bk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-RP1l-OSnOnWCtddTqZfPnw-1; Tue, 04 Oct 2022 09:55:14 -0400
X-MC-Unique: RP1l-OSnOnWCtddTqZfPnw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e14-20020adf9bce000000b0022d18139c79so3193868wrc.5
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=s0LiOhogjHqkYTazvm90ozpckrrkfzXSlVjhe9B4VJs=;
 b=P5phBKbVB4Cr7hrrS4Wez27CVoCN7MhTTz4Wv2OT2KkI2J6VOcgU78dG127UKXekZL
 EEdl93x1A/GUv6xuQd2qc5yrMIuKI1nVSTC5Jlo0kgnZgBvuNB0lQDDy+yaNpn8dHW/n
 0dGjnGdPUYxeagLyi5TNvcb0EzBOjpHEpqrN5OU5ffWX0Jc5QPipphWqkt6+TUldMza7
 YQ+Y+4oaCUuh90KTNZLaNGyti8ss3FXPUe0+wwYWOgc60bt3oevud1kD6bPiNxBgNffk
 dSQ9xh90KvUnrBI287lqudUHPFKu7DpW4sYa5FL0DnQ583wuM4VQc1mDVKhC+3mAxMiM
 iedA==
X-Gm-Message-State: ACrzQf0vuavxXK3K/m5lrSZRrxtzdvMfPsd2uVx1OjAFoDn6eeTVp6JQ
 yN/QPtkbqm4t/V3iC8OAE2hZJE2V0TieZl/NwID1zJCba4TZimKDno1C1TaXk+tMuUw+WcBsQJd
 N5Mk0ZW/yJVjpoCY=
X-Received: by 2002:a05:600c:358f:b0:3b4:a699:3121 with SMTP id
 p15-20020a05600c358f00b003b4a6993121mr10518280wmq.166.1664891713681; 
 Tue, 04 Oct 2022 06:55:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6E63iLqQ2RtcdAFz0ZXuD8MAmKb3M1kMKGawz5vTJ1fzTmCqDUNqYEEyR5j9zvJDNYU8jRvA==
X-Received: by 2002:a05:600c:358f:b0:3b4:a699:3121 with SMTP id
 p15-20020a05600c358f00b003b4a6993121mr10518273wmq.166.1664891713446; 
 Tue, 04 Oct 2022 06:55:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfec86000000b0022b1d74dc56sm12539927wrn.79.2022.10.04.06.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:55:12 -0700 (PDT)
Date: Tue, 4 Oct 2022 14:55:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 05/14] migration: Yield bitmap_mutex properly when
 sending/sleeping
Message-ID: <Yzw7Po4Qg/0WJNke@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225210.48732-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225210.48732-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

I generally dont like taking locks conditionally; but this kind of looks
OK; I think it needs a big comment on the start of the function saying
that it's called and left with the lock held but that it might drop it
temporarily.

> ---
>  migration/ram.c | 42 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 8303252b6d..6e7de6087a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2463,6 +2463,7 @@ static void postcopy_preempt_reset_channel(RAMState *rs)
>   */
>  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>  {
> +    bool page_dirty, release_lock = postcopy_preempt_active();

Could you rename that to something like 'drop_lock' - you are taking the
lock at the end even when you have 'release_lock' set - which is a bit
strange naming.

>      int tmppages, pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
> @@ -2486,22 +2487,41 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>              break;
>          }
>  
> +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> +        /*
> +         * Properly yield the lock only in postcopy preempt mode because
> +         * both migration thread and rp-return thread can operate on the
> +         * bitmaps.
> +         */
> +        if (release_lock) {
> +            qemu_mutex_unlock(&rs->bitmap_mutex);
> +        }

Shouldn't the unlock/lock move inside the 'if (page_dirty) {' ?


>          /* Check the pages is dirty and if it is send it */
> -        if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
> +        if (page_dirty) {
>              tmppages = ram_save_target_page(rs, pss);
> -            if (tmppages < 0) {
> -                return tmppages;
> +            if (tmppages >= 0) {
> +                pages += tmppages;
> +                /*
> +                 * Allow rate limiting to happen in the middle of huge pages if
> +                 * something is sent in the current iteration.
> +                 */
> +                if (pagesize_bits > 1 && tmppages > 0) {
> +                    migration_rate_limit();

This feels interesting, I know it's no change from before, and it's
difficult to do here, but it seems odd to hold the lock around the
sleeping in the rate limit.

Dave

> +                }
>              }
> +        } else {
> +            tmppages = 0;
> +        }
>  
> -            pages += tmppages;
> -            /*
> -             * Allow rate limiting to happen in the middle of huge pages if
> -             * something is sent in the current iteration.
> -             */
> -            if (pagesize_bits > 1 && tmppages > 0) {
> -                migration_rate_limit();
> -            }
> +        if (release_lock) {
> +            qemu_mutex_lock(&rs->bitmap_mutex);
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
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


