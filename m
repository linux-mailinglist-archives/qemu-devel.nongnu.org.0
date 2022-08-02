Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96C587969
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:56:09 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInh9-0003Pa-KB
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oInZD-0003h8-3x
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oInZ9-0003Cc-5V
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659430070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cej2XdN4K8UmGEfk6gFQhUcYzXJUN8KyddTHBcy5Tbw=;
 b=X4c8huO6Q4TQXq2oaDocoLbTtdOn6SuWmxrKgBm9HCVkQlYlBNg4FxThVqdDBHxahpQ2IZ
 Q+7/LrWQNuLsVJBUQDAx7za8kYHKWEvGbH43PqGZ9Q9a7VfKHv3JmRKU/wH9Pr4b5XSoQy
 drueEICAHXq1zKj8GLXKjYB1pqJMynY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-ir15jneTNSCcJo7HYJftVg-1; Tue, 02 Aug 2022 04:47:49 -0400
X-MC-Unique: ir15jneTNSCcJo7HYJftVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m7-20020adfa3c7000000b0021ef71807e3so3260287wrb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 01:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cej2XdN4K8UmGEfk6gFQhUcYzXJUN8KyddTHBcy5Tbw=;
 b=zemmNxQI9asUiItM4AQXo2yjrVd7pi9wBr5wGsm013+fSxYwJ1VDgpBfNf0budmikh
 azlo5lohg/5ZNR6rNs1wxYCD5/AMjpTCVk8TBny2fUIm8mc0RLemUKmpa3lGiCZo7vUm
 LD2TosZBmdZ5mMguKKW6jEgpCglRBWsSi7WaA5qxFnxHRsmtt63X+atk77xgxjzbbEBB
 IiNXccTm0lUr2ACxeNBw7UXBtga5xif3o+yhlRnTK+a1olYkq1EsSIe7yi2NPVSTBO2x
 FNOQAyrrYeEuJ6lJLzLVviRLFrqJMVTkjWBx6ouAXFhk02xN6X603sZOCsiXsk/13XF5
 FxAg==
X-Gm-Message-State: AJIora8nN9BRMThV8DeJ9gtnmAsO/v3l9lGZcAqH27iMoKoK2vVG03Q6
 FPJSysiDxSyu9TI6Y6lIhk+5YO1OHgYOYY/3Hm8/Mu1tPrqPuwTzaDzTK8F/N3NYA82VQxoL9B+
 FrRGtTTeEgMaHUmM=
X-Received: by 2002:a1c:7401:0:b0:3a3:182f:7be9 with SMTP id
 p1-20020a1c7401000000b003a3182f7be9mr13313611wmc.189.1659430067227; 
 Tue, 02 Aug 2022 01:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvgJIJBWDl80ILJZfTI3w2dhek6MDzu1JcSiNF1ObVdt5flmt0dfJ/XPKI18lfA4s/agq0iw==
X-Received: by 2002:a1c:7401:0:b0:3a3:182f:7be9 with SMTP id
 p1-20020a1c7401000000b003a3182f7be9mr13313600wmc.189.1659430066970; 
 Tue, 02 Aug 2022 01:47:46 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfd4ca000000b002205cbc1c74sm8516137wrk.101.2022.08.02.01.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 01:47:46 -0700 (PDT)
Date: Tue, 2 Aug 2022 09:47:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH for-7.1] Revert "migration: Simplify unqueue_page()"
Message-ID: <YujksCJ/JjRAJc9N@work-vm>
References: <20220802061949.331576-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802061949.331576-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URG_BIZ=0.573 autolearn=no autolearn_force=no
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

* Thomas Huth (thuth@redhat.com) wrote:
> This reverts commit cfd66f30fb0f735df06ff4220e5000290a43dad3.
> 
> The simplification of unqueue_page() introduced a bug that sometimes
> breaks migration on s390x hosts. Seems like there are still pages here
> that do not have their dirty bit set.

I don't think it's about 'not having their dirty bit set' - it's
perfectly fine to have the bits clear (which indicates the page has
already been sent to the destination, sometime inbetween the page request
being sent from the destination and it being unqueued).
My suspicion is that either:
  * you're hitting a case where the removal of the loop
    causes it to stop when it hits a !dirty page, even though there are some
    diries left behind it.
  * We're retransmitting a page that is already marked !dirty
    which would cause overwriting of a now modified page on the
    destination.

I have no idea why either of these would be s390 specific.


> The problem is not fully understood yet, but since we are already in
> the freeze for QEMU 7.1 and we need something working there, let's
> revert this patch for the upcoming release. The optimization can be
> redone later again in a proper way if necessary.

Yeh OK

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2099934
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  migration/ram.c        | 37 ++++++++++++++++++++++++++-----------
>  migration/trace-events |  3 ++-
>  2 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b94669ba5d..dc1de9ddbc 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1612,7 +1612,6 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>  {
>      struct RAMSrcPageRequest *entry;
>      RAMBlock *block = NULL;
> -    size_t page_size;
>  
>      if (!postcopy_has_request(rs)) {
>          return NULL;
> @@ -1629,13 +1628,10 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>      entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
>      block = entry->rb;
>      *offset = entry->offset;
> -    page_size = qemu_ram_pagesize(block);
> -    /* Each page request should only be multiple page size of the ramblock */
> -    assert((entry->len % page_size) == 0);
>  
> -    if (entry->len > page_size) {
> -        entry->len -= page_size;
> -        entry->offset += page_size;
> +    if (entry->len > TARGET_PAGE_SIZE) {
> +        entry->len -= TARGET_PAGE_SIZE;
> +        entry->offset += TARGET_PAGE_SIZE;
>      } else {
>          memory_region_unref(block->mr);
>          QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
> @@ -1643,9 +1639,6 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>          migration_consume_urgent_request();
>      }
>  
> -    trace_unqueue_page(block->idstr, *offset,
> -                       test_bit((*offset >> TARGET_PAGE_BITS), block->bmap));
> -
>      return block;
>  }
>  
> @@ -2069,8 +2062,30 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>  {
>      RAMBlock  *block;
>      ram_addr_t offset;
> +    bool dirty;
> +
> +    do {
> +        block = unqueue_page(rs, &offset);
> +        /*
> +         * We're sending this page, and since it's postcopy nothing else
> +         * will dirty it, and we must make sure it doesn't get sent again
> +         * even if this queue request was received after the background
> +         * search already sent it.
> +         */
> +        if (block) {
> +            unsigned long page;
> +
> +            page = offset >> TARGET_PAGE_BITS;
> +            dirty = test_bit(page, block->bmap);
> +            if (!dirty) {
> +                trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
> +                                                page);
> +            } else {
> +                trace_get_queued_page(block->idstr, (uint64_t)offset, page);
> +            }
> +        }
>  
> -    block = unqueue_page(rs, &offset);
> +    } while (block && !dirty);
>  
>      if (block) {
>          /* See comment above postcopy_preempted_contains() */
> diff --git a/migration/trace-events b/migration/trace-events
> index a34afe7b85..57003edcbd 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -85,6 +85,8 @@ put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
>  qemu_file_fclose(void) ""
>  
>  # ram.c
> +get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
> +get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
>  migration_bitmap_sync_start(void) ""
>  migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
>  migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
> @@ -110,7 +112,6 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
>  ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
>  ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>  ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
> -unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
>  postcopy_preempt_triggered(char *str, unsigned long page) "during sending ramblock %s offset 0x%lx"
>  postcopy_preempt_restored(char *str, unsigned long page) "ramblock %s offset 0x%lx"
>  postcopy_preempt_hit(char *str, uint64_t offset) "ramblock %s offset 0x%"PRIx64
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


