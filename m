Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A465F551B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 15:13:18 +0200 (CEST)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og4D7-0000Bj-EC
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 09:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og444-0003Eo-I8
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1og440-0006RB-7X
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 09:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664975030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=reAOztVK+PRZpsNdO5sw4ka3qgJZbI0Z0OI/dfkTFcM=;
 b=O/5Zj6hA3b7bvWLEX3l/BRs/cBHUGrZ4D14jdsdpN4vS+suSaS7ahwR9NFKTKI/moYBIr+
 /U6rRJ3V60hmUeV55G0/PyOsZ5isxERBmrmyupyjf8tHXnV1PWxceISgYRbq9wQuVitZeI
 Szt6g3KnJBFpb0YcU6yLBl4eD+FyH2g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-E9_csA2dO1miMwLsGxBJ6A-1; Wed, 05 Oct 2022 09:03:48 -0400
X-MC-Unique: E9_csA2dO1miMwLsGxBJ6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so369268wmi.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 06:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=reAOztVK+PRZpsNdO5sw4ka3qgJZbI0Z0OI/dfkTFcM=;
 b=4oGC+RX87shV1Pqmc5xSR/AZ6b4YS9g52S0YmGUuYNvST+lImA2lylsA8u9GfMLWI/
 +Vcx13+ENbFmpk/IEXE/iKkBpvu7su8nwKWW4gp/kKopWag0amhEbadhqr7EVrPrtN4x
 glrJxJv8cqZTNgjG69soSEAdnewNsIucr4HqlDbo27O2akagPQXm4pc/BPqhbgE67GkL
 xeX7eTE667cuiIFhgehhEwRgkWwD3X3y8+EK1gc9tMgaRxHix0Z949KN0P27XWIiKTX+
 f4kAkYZHB+xsUrzd4I4OvqnDHdE8iyCJOa/0Z9fpEz7JDXgljLhMItChuUpRFd/EFumW
 82tw==
X-Gm-Message-State: ACrzQf1pgN416k27bbZBAoQ3oKWng4iZ3rNQyMxXwqLz4WkTn7a+iAzW
 f0XwM+MaVq62FUCA3GaQednYsTp54nvyc6WFbcQPm+ef00fGW0QsyXUD059kIA5eJZPuIUyrsEr
 MiHMW5YXzAw+dTF0=
X-Received: by 2002:a05:600c:1910:b0:3b4:bb80:c95e with SMTP id
 j16-20020a05600c191000b003b4bb80c95emr3072516wmq.54.1664975027514; 
 Wed, 05 Oct 2022 06:03:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4E7ei66id6nmOJTcSD8AiUSkg/jWG2Jl1XmpZTPjEOGmIODhmQvxPAWM5Jt6QoI80k4QcjpA==
X-Received: by 2002:a05:600c:1910:b0:3b4:bb80:c95e with SMTP id
 j16-20020a05600c191000b003b4bb80c95emr3072495wmq.54.1664975027225; 
 Wed, 05 Oct 2022 06:03:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j29-20020adfa55d000000b00228d6bc8450sm19302576wrb.108.2022.10.05.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 06:03:46 -0700 (PDT)
Date: Wed, 5 Oct 2022 14:03:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 08/14] migration: Introduce pss_channel
Message-ID: <Yz2AsH5ZWYEmK64i@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225217.48893-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225217.48893-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
> Introduce pss_channel for PageSearchStatus, define it as "the migration
> channel to be used to transfer this host page".
> 
> We used to have rs->f, which is a mirror to MigrationState.to_dst_file.
> 
> After postcopy preempt initial version, rs->f can be dynamically changed
> depending on which channel we want to use.
> 
> But that later work still doesn't grant full concurrency of sending pages
> in e.g. different threads, because rs->f can either be the PRECOPY channel
> or POSTCOPY channel.  This needs to be per-thread too.
> 
> PageSearchStatus is actually a good piece of struct which we can leverage
> if we want to have multiple threads sending pages.  Sending a single guest
> page may not make sense, so we make the granule to be "host page", and in
> the PSS structure we allow specify a QEMUFile* to migrate a specific host
> page.  Then we open the possibility to specify different channels in
> different threads with different PSS structures.
> 
> The PSS prefix can be slightly misleading here because e.g. for the
> upcoming usage of postcopy channel/thread it's not "searching" (or,
> scanning) at all but sending the explicit page that was requested.  However
> since PSS existed for some years keep it as-is until someone complains.
> 
> This patch mostly (simply) replace rs->f with pss->pss_channel only. No
> functional change intended for this patch yet.  But it does prepare to
> finally drop rs->f, and make ram_save_guest_page() thread safe.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 70 +++++++++++++++++++++++++++----------------------
>  1 file changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 3f720b6de2..40ff5dc49f 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -446,6 +446,8 @@ void dirty_sync_missed_zero_copy(void)
>  
>  /* used by the search for pages to send */
>  struct PageSearchStatus {
> +    /* The migration channel used for a specific host page */
> +    QEMUFile    *pss_channel;
>      /* Current block being searched */
>      RAMBlock    *block;
>      /* Current page to search from */
> @@ -768,9 +770,9 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
> -                            ram_addr_t current_addr, RAMBlock *block,
> -                            ram_addr_t offset)
> +static int save_xbzrle_page(RAMState *rs, QEMUFile *file,
> +                            uint8_t **current_data, ram_addr_t current_addr,
> +                            RAMBlock *block, ram_addr_t offset)
>  {
>      int encoded_len = 0, bytes_xbzrle;
>      uint8_t *prev_cached_page;
> @@ -838,11 +840,11 @@ static int save_xbzrle_page(RAMState *rs, uint8_t **current_data,
>      }
>  
>      /* Send XBZRLE based compressed page */
> -    bytes_xbzrle = save_page_header(rs, rs->f, block,
> +    bytes_xbzrle = save_page_header(rs, file, block,
>                                      offset | RAM_SAVE_FLAG_XBZRLE);
> -    qemu_put_byte(rs->f, ENCODING_FLAG_XBZRLE);
> -    qemu_put_be16(rs->f, encoded_len);
> -    qemu_put_buffer(rs->f, XBZRLE.encoded_buf, encoded_len);
> +    qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
> +    qemu_put_be16(file, encoded_len);
> +    qemu_put_buffer(file, XBZRLE.encoded_buf, encoded_len);
>      bytes_xbzrle += encoded_len + 1 + 2;
>      /*
>       * Like compressed_size (please see update_compress_thread_counts),
> @@ -1298,9 +1300,10 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
>   * @block: block that contains the page we want to send
>   * @offset: offset inside the block for the page
>   */
> -static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
> +static int save_zero_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
> +                          ram_addr_t offset)
>  {
> -    int len = save_zero_page_to_file(rs, rs->f, block, offset);
> +    int len = save_zero_page_to_file(rs, file, block, offset);
>  
>      if (len) {
>          qatomic_inc(&ram_counters.duplicate);
> @@ -1317,15 +1320,15 @@ static int save_zero_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
>   *
>   * Return true if the pages has been saved, otherwise false is returned.
>   */
> -static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> -                              int *pages)
> +static bool control_save_page(PageSearchStatus *pss, RAMBlock *block,
> +                              ram_addr_t offset, int *pages)
>  {
>      uint64_t bytes_xmit = 0;
>      int ret;
>  
>      *pages = -1;
> -    ret = ram_control_save_page(rs->f, block->offset, offset, TARGET_PAGE_SIZE,
> -                                &bytes_xmit);
> +    ret = ram_control_save_page(pss->pss_channel, block->offset, offset,
> +                                TARGET_PAGE_SIZE, &bytes_xmit);
>      if (ret == RAM_SAVE_CONTROL_NOT_SUPP) {
>          return false;
>      }
> @@ -1359,17 +1362,17 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>   * @buf: the page to be sent
>   * @async: send to page asyncly
>   */
> -static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
> -                            uint8_t *buf, bool async)
> +static int save_normal_page(RAMState *rs, QEMUFile *file, RAMBlock *block,
> +                            ram_addr_t offset, uint8_t *buf, bool async)
>  {
> -    ram_transferred_add(save_page_header(rs, rs->f, block,
> +    ram_transferred_add(save_page_header(rs, file, block,
>                                           offset | RAM_SAVE_FLAG_PAGE));
>      if (async) {
> -        qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
> +        qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
>                                migrate_release_ram() &&
>                                migration_in_postcopy());
>      } else {
> -        qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
> +        qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
>      }
>      ram_transferred_add(TARGET_PAGE_SIZE);
>      qatomic_inc(&ram_counters.normal);
> @@ -1402,8 +1405,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
>  
>      XBZRLE_cache_lock();
>      if (rs->xbzrle_enabled && !migration_in_postcopy()) {
> -        pages = save_xbzrle_page(rs, &p, current_addr, block,
> -                                 offset);
> +        pages = save_xbzrle_page(rs, pss->pss_channel, &p, current_addr,
> +                                 block, offset);
>          if (!rs->last_stage) {
>              /* Can't send this cached data async, since the cache page
>               * might get updated before it gets to the wire
> @@ -1414,7 +1417,8 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
>  
>      /* XBZRLE overflow or normal page */
>      if (pages == -1) {
> -        pages = save_normal_page(rs, block, offset, p, send_async);
> +        pages = save_normal_page(rs, pss->pss_channel, block, offset,
> +                                 p, send_async);
>      }
>  
>      XBZRLE_cache_unlock();
> @@ -1422,10 +1426,10 @@ static int ram_save_page(RAMState *rs, PageSearchStatus *pss)
>      return pages;
>  }
>  
> -static int ram_save_multifd_page(RAMState *rs, RAMBlock *block,
> +static int ram_save_multifd_page(QEMUFile *file, RAMBlock *block,
>                                   ram_addr_t offset)
>  {
> -    if (multifd_queue_page(rs->f, block, offset) < 0) {
> +    if (multifd_queue_page(file, block, offset) < 0) {
>          return -1;
>      }
>      ram_counters.normal++;
> @@ -1720,7 +1724,7 @@ static int ram_save_release_protection(RAMState *rs, PageSearchStatus *pss,
>          uint64_t run_length = (pss->page - start_page) << TARGET_PAGE_BITS;
>  
>          /* Flush async buffers before un-protect. */
> -        qemu_fflush(rs->f);
> +        qemu_fflush(pss->pss_channel);
>          /* Un-protect memory range. */
>          res = uffd_change_protection(rs->uffdio_fd, page_address, run_length,
>                  false, false);
> @@ -2307,7 +2311,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>      ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
>      int res;
>  
> -    if (control_save_page(rs, block, offset, &res)) {
> +    if (control_save_page(pss, block, offset, &res)) {
>          return res;
>      }
>  
> @@ -2315,7 +2319,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>          return 1;
>      }
>  
> -    res = save_zero_page(rs, block, offset);
> +    res = save_zero_page(rs, pss->pss_channel, block, offset);
>      if (res > 0) {
>          /* Must let xbzrle know, otherwise a previous (now 0'd) cached
>           * page would be stale
> @@ -2336,7 +2340,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>       */
>      if (!save_page_use_compression(rs) && migrate_use_multifd()
>          && !migration_in_postcopy()) {
> -        return ram_save_multifd_page(rs, block, offset);
> +        return ram_save_multifd_page(pss->pss_channel, block, offset);
>      }
>  
>      return ram_save_page(rs, pss);
> @@ -2533,10 +2537,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>          return 0;
>      }
>  
> -    if (postcopy_preempt_active()) {
> -        postcopy_preempt_choose_channel(rs, pss);
> -    }
> -
>      /* Update host page boundary information */
>      pss_host_page_prepare(pss);
>  
> @@ -2597,7 +2597,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss)
>       * explicit flush or it won't flush until the buffer is full.
>       */
>      if (migrate_postcopy_preempt() && pss->postcopy_requested) {
> -        qemu_fflush(rs->f);
> +        qemu_fflush(pss->pss_channel);
>      }
>  
>      res = ram_save_release_protection(rs, pss, start_page);
> @@ -2663,6 +2663,12 @@ static int ram_find_and_save_block(RAMState *rs)
>          }
>  
>          if (found) {
> +            /* Update rs->f with correct channel */
> +            if (postcopy_preempt_active()) {
> +                postcopy_preempt_choose_channel(rs, &pss);
> +            }
> +            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
> +            pss.pss_channel = rs->f;
>              pages = ram_save_host_page(rs, &pss);
>          }
>      } while (!pages && again);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


