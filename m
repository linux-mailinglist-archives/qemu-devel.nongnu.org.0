Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892955F631F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:56:01 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMff-00024O-Od
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogMNz-00081M-19
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogMNs-0006YY-N7
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqzDHdbDLUPFFH1BNlzMoMJ6WwW120b4s02+xwHC9Ig=;
 b=FismmCOewWVPOTSW8tSF94Kr2kDOU1zNZWBZoTvJpn4DDMo7BedFCbiEoZ5n3/tYifAqKZ
 zA+4WpUkDDUxRVgIkPDyxaW4mPSmdiaKMpCFh9oiTpZpAYNBhtvOJMAbnDruUEByQyoxPq
 ApMoAumn/dWRN/nvKhssud0+HAhXUj8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-K1OxMfNjOPKYtzdrobIgFw-1; Thu, 06 Oct 2022 04:37:34 -0400
X-MC-Unique: K1OxMfNjOPKYtzdrobIgFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso253498wra.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 01:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pqzDHdbDLUPFFH1BNlzMoMJ6WwW120b4s02+xwHC9Ig=;
 b=eyCybAqIZ65CTZVT+38EwByhpfElQKyhyGBSQ6mIQ89k752rni7YiisZsrD4jEOGi6
 ZBjaUoWdzFWiwOLGoylH2ZBheDBFHYA1ukBNoAioDPiTke28nDvhNjFM9WjEvobso+yT
 6GRNjsSnbPvotVbE+m1vFkhwegOUlNSlR87dX+Dj64BghJ55CFf/xXinxZEG4kH8OuQ1
 /SX+5M4v9sxMFhmYwMC/WP6W9G87rncZl/vJRQJMvduMsIs9ch4F8qA0udk0WDhzWXJq
 Qn26DleRiFV3W1NIH193U38D1KjU1ebkz5lxJSDUu0tTBTj0y8A+vi5JyEv4eg+fcXaz
 sPPw==
X-Gm-Message-State: ACrzQf1zpguG2xUFVeLlt/uIclK5Xv/LTdKABqbDB3cHSOK1SVWtuTQF
 RgDnL9P/HbhrEDKhUcJF6ZmvfemiixAXiWxmNp2/FLGN6Q/0cwQyoUvKc4l4iT2c7KohkpGajG2
 O4ryYukTS+7M55Qw=
X-Received: by 2002:adf:ed41:0:b0:225:3fde:46ea with SMTP id
 u1-20020adfed41000000b002253fde46eamr2246629wro.345.1665045453732; 
 Thu, 06 Oct 2022 01:37:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58OFFctYuoyAME4BIt4pFSYFS9EmZR4+Cjtp0Pmi3pUCL6c4vHy0y1s/+2hRpC0mcRNZ813g==
X-Received: by 2002:adf:ed41:0:b0:225:3fde:46ea with SMTP id
 u1-20020adfed41000000b002253fde46eamr2246610wro.345.1665045453489; 
 Thu, 06 Oct 2022 01:37:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h42-20020a05600c49aa00b003b27f644488sm3987669wmp.29.2022.10.06.01.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 01:37:32 -0700 (PDT)
Date: Thu, 6 Oct 2022 09:37:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 10/14] migration: Make PageSearchStatus part of RAMState
Message-ID: <Yz6Ty1FMEKHkFW2O@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225221.48999-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225221.48999-1-peterx@redhat.com>
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
> We used to allocate PSS structure on the stack for precopy when sending
> pages.  Make it static, so as to describe per-channel ram migration status.
> 
> Here we declared RAM_CHANNEL_MAX instances, preparing for postcopy to use
> it, even though this patch has not yet to start using the 2nd instance.
> 
> This should not have any functional change per se, but it already starts to
> export PSS information via the RAMState, so that e.g. one PSS channel can
> start to reference the other PSS channel.
> 
> Always protect PSS access using the same RAMState.bitmap_mutex.  We already
> do so, so no code change needed, just some comment update.  Maybe we should
> consider renaming bitmap_mutex some day as it's going to be a more commonly
> and big mutex we use for ram states, but just leave it for later.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 112 ++++++++++++++++++++++++++----------------------
>  1 file changed, 61 insertions(+), 51 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b4b36ca59e..dbe11e1ace 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -85,6 +85,46 @@
>  
>  XBZRLECacheStats xbzrle_counters;
>  
> +/* used by the search for pages to send */
> +struct PageSearchStatus {
> +    /* The migration channel used for a specific host page */
> +    QEMUFile    *pss_channel;
> +    /* Current block being searched */
> +    RAMBlock    *block;
> +    /* Current page to search from */
> +    unsigned long page;
> +    /* Set once we wrap around */
> +    bool         complete_round;
> +    /*
> +     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
> +     * postcopy.  When set, the request is "urgent" because the dest QEMU
> +     * threads are waiting for us.
> +     */
> +    bool         postcopy_requested;
> +    /*
> +     * [POSTCOPY-ONLY] The target channel to use to send current page.
> +     *
> +     * Note: This may _not_ match with the value in postcopy_requested
> +     * above. Let's imagine the case where the postcopy request is exactly
> +     * the page that we're sending in progress during precopy. In this case
> +     * we'll have postcopy_requested set to true but the target channel
> +     * will be the precopy channel (so that we don't split brain on that
> +     * specific page since the precopy channel already contains partial of
> +     * that page data).
> +     *
> +     * Besides that specific use case, postcopy_target_channel should
> +     * always be equal to postcopy_requested, because by default we send
> +     * postcopy pages via postcopy preempt channel.
> +     */
> +    bool         postcopy_target_channel;
> +    /* Whether we're sending a host page */
> +    bool          host_page_sending;
> +    /* The start/end of current host page.  Invalid if host_page_sending==false */
> +    unsigned long host_page_start;
> +    unsigned long host_page_end;
> +};
> +typedef struct PageSearchStatus PageSearchStatus;
> +
>  /* struct contains XBZRLE cache and a static page
>     used by the compression */
>  static struct {
> @@ -319,6 +359,11 @@ typedef struct {
>  struct RAMState {
>      /* QEMUFile used for this migration */
>      QEMUFile *f;
> +    /*
> +     * PageSearchStatus structures for the channels when send pages.
> +     * Protected by the bitmap_mutex.
> +     */
> +    PageSearchStatus pss[RAM_CHANNEL_MAX];
>      /* UFFD file descriptor, used in 'write-tracking' migration */
>      int uffdio_fd;
>      /* Last block that we have visited searching for dirty pages */
> @@ -362,7 +407,12 @@ struct RAMState {
>      uint64_t target_page_count;
>      /* number of dirty bits in the bitmap */
>      uint64_t migration_dirty_pages;
> -    /* Protects modification of the bitmap and migration dirty pages */
> +    /*
> +     * Protects:
> +     * - dirty/clear bitmap
> +     * - migration_dirty_pages
> +     * - pss structures
> +     */
>      QemuMutex bitmap_mutex;
>      /* The RAMBlock used in the last src_page_requests */
>      RAMBlock *last_req_rb;
> @@ -444,46 +494,6 @@ void dirty_sync_missed_zero_copy(void)
>      ram_counters.dirty_sync_missed_zero_copy++;
>  }
>  
> -/* used by the search for pages to send */
> -struct PageSearchStatus {
> -    /* The migration channel used for a specific host page */
> -    QEMUFile    *pss_channel;
> -    /* Current block being searched */
> -    RAMBlock    *block;
> -    /* Current page to search from */
> -    unsigned long page;
> -    /* Set once we wrap around */
> -    bool         complete_round;
> -    /*
> -     * [POSTCOPY-ONLY] Whether current page is explicitly requested by
> -     * postcopy.  When set, the request is "urgent" because the dest QEMU
> -     * threads are waiting for us.
> -     */
> -    bool         postcopy_requested;
> -    /*
> -     * [POSTCOPY-ONLY] The target channel to use to send current page.
> -     *
> -     * Note: This may _not_ match with the value in postcopy_requested
> -     * above. Let's imagine the case where the postcopy request is exactly
> -     * the page that we're sending in progress during precopy. In this case
> -     * we'll have postcopy_requested set to true but the target channel
> -     * will be the precopy channel (so that we don't split brain on that
> -     * specific page since the precopy channel already contains partial of
> -     * that page data).
> -     *
> -     * Besides that specific use case, postcopy_target_channel should
> -     * always be equal to postcopy_requested, because by default we send
> -     * postcopy pages via postcopy preempt channel.
> -     */
> -    bool         postcopy_target_channel;
> -    /* Whether we're sending a host page */
> -    bool          host_page_sending;
> -    /* The start/end of current host page.  Only valid if host_page_sending==true */
> -    unsigned long host_page_start;
> -    unsigned long host_page_end;
> -};
> -typedef struct PageSearchStatus PageSearchStatus;
> -
>  CompressionStats compression_counters;
>  
>  struct CompressParam {
> @@ -2627,7 +2637,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>   */
>  static int ram_find_and_save_block(RAMState *rs)
>  {
> -    PageSearchStatus pss;
> +    PageSearchStatus *pss = &rs->pss[RAM_CHANNEL_PRECOPY];
>      int pages = 0;
>      bool again, found;
>  
> @@ -2648,11 +2658,11 @@ static int ram_find_and_save_block(RAMState *rs)
>          rs->last_page = 0;
>      }
>  
> -    pss_init(&pss, rs->last_seen_block, rs->last_page);
> +    pss_init(pss, rs->last_seen_block, rs->last_page);
>  
>      do {
>          again = true;
> -        found = get_queued_page(rs, &pss);
> +        found = get_queued_page(rs, pss);
>  
>          if (!found) {
>              /*
> @@ -2660,27 +2670,27 @@ static int ram_find_and_save_block(RAMState *rs)
>               * preempted precopy.  Otherwise find the next dirty bit.
>               */
>              if (postcopy_preempt_triggered(rs)) {
> -                postcopy_preempt_restore(rs, &pss, false);
> +                postcopy_preempt_restore(rs, pss, false);
>                  found = true;
>              } else {
>                  /* priority queue empty, so just search for something dirty */
> -                found = find_dirty_block(rs, &pss, &again);
> +                found = find_dirty_block(rs, pss, &again);
>              }
>          }
>  
>          if (found) {
>              /* Update rs->f with correct channel */
>              if (postcopy_preempt_active()) {
> -                postcopy_preempt_choose_channel(rs, &pss);
> +                postcopy_preempt_choose_channel(rs, pss);
>              }
>              /* Cache rs->f in pss_channel (TODO: remove rs->f) */
> -            pss.pss_channel = rs->f;
> -            pages = ram_save_host_page(rs, &pss);
> +            pss->pss_channel = rs->f;
> +            pages = ram_save_host_page(rs, pss);
>          }
>      } while (!pages && again);
>  
> -    rs->last_seen_block = pss.block;
> -    rs->last_page = pss.page;
> +    rs->last_seen_block = pss->block;
> +    rs->last_page = pss->page;
>  
>      return pages;
>  }
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


