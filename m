Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2650493ED1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:09:08 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAESI-0002lo-RI
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nADxG-0004Ok-Hi
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nADxD-0007kk-MA
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642610215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27/8K1ti0NgFNDivJwjLutrYkMBRAZ+w9uE7SLx07K4=;
 b=L3QNisXZaqpHUUS/8gOBCfd8XqlZAaSjZAnq3xKAr6IfaAVkHYGs2PldqjFvXtcaNfScSq
 TfnALo1ZAdGItfqOUbkQG8pLzTgycgsWKYDtR//wsIAPSeetmXFZBZ7KKg7d9M/LbKaeqo
 ueoeCNigHiLxBJtKaZSDXyq4XsMTDcI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-_9TPjsEOPJa-Omvb4yrtBA-1; Wed, 19 Jan 2022 11:36:54 -0500
X-MC-Unique: _9TPjsEOPJa-Omvb4yrtBA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so2081306wmi.8
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 08:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=27/8K1ti0NgFNDivJwjLutrYkMBRAZ+w9uE7SLx07K4=;
 b=In7IQquX3f3i7qrGfexYDDN9hNPF5igtoP7/C1O7UnDcOGfzq2+El+AK9pzosCBLLF
 ZG74NqcQGO3nRDg5gR0UsHMfN4NHqBNIGOWY6M5F/6t0+V7IayDvSR96Az/21is8/jha
 etxbc4HIUw4gvFbMG/2ieyhtiWsvcqj5xwbgsYjgXiDbUdfcnW2bRx9Tf4051HdO9ZC4
 s7o7H7ulpLgxfLmT2bBuCUvdgLKzThc9p+3mFlnnGynQOxIw2huanS3bN/I5wnF+SsJB
 My4mGrzi274H2zZRYNebc2r6vFUXIwYf9lnwvg9jowF00duiaaYB6+avaIbVsTRr+0y7
 dBRw==
X-Gm-Message-State: AOAM530Kzcs6ShdELpuap1LWE/aBVvcTUZ1+ZsLjF3RnZY1/DA+jIHQr
 ncvoz/yo8wmqg80bkrzKGRI8xcG/uVUXo4+4Tnec3lQqoY7TqnvvCbSMAbrYd7KgHtFb11qP9GK
 PvfVSr9AnBX3sdK8=
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr28780488wrp.90.1642610213094; 
 Wed, 19 Jan 2022 08:36:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpRpL/uo7go6FxNIdtK/NuLtK9UB/sMso3wrSfGCtfB1/ZoPc1U2V4hZQaofPPL1F52X/fgA==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr28780471wrp.90.1642610212778; 
 Wed, 19 Jan 2022 08:36:52 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id k37sm6600743wms.0.2022.01.19.08.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:36:52 -0800 (PST)
Date: Wed, 19 Jan 2022 16:36:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 05/15] migration: Simplify unqueue_page()
Message-ID: <Yeg+IjgX2JG7ok8u@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-6-peterx@redhat.com>
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> This patch simplifies unqueue_page() on both sides of it (itself, and caller).
> 
> Firstly, due to the fact that right after unqueue_page() returned true, we'll
> definitely send a huge page (see ram_save_huge_page() call - it will _never_
> exit before finish sending that huge page), so unqueue_page() does not need to
> jump in small page size if huge page is enabled on the ramblock.  IOW, it's
> destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
> we'll notice the whole huge page has already been sent anyway.  Switching to
> operating on huge page reduces a lot of the loops of redundant unqueue_page().
> 
> Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
> time to jump over clean pages, as ram_save_host_page() has already done so,
> while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
> ram_save_host_page()", 2021-05-13)).  So that's not necessary too.
> 
> Drop the two tracepoints along the way - based on above analysis it's very
> possible that no one is really using it..
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, OK

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Although:
  a) You might like to keep a trace in get_queued_page just to see
what's getting unqueued
  b) I think originally it was a useful diagnostic to find out when we
were getting a lot of queue requests for pages that were already sent.

Dave


> ---
>  migration/ram.c        | 34 ++++++++--------------------------
>  migration/trace-events |  2 --
>  2 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index dc6ba041fa..0df15ff663 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1541,6 +1541,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>  {
>      struct RAMSrcPageRequest *entry;
>      RAMBlock *block = NULL;
> +    size_t page_size;
>  
>      if (!postcopy_has_request(rs)) {
>          return NULL;
> @@ -1557,10 +1558,13 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>      entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
>      block = entry->rb;
>      *offset = entry->offset;
> +    page_size = qemu_ram_pagesize(block);
> +    /* Each page request should only be multiple page size of the ramblock */
> +    assert((entry->len % page_size) == 0);
>  
> -    if (entry->len > TARGET_PAGE_SIZE) {
> -        entry->len -= TARGET_PAGE_SIZE;
> -        entry->offset += TARGET_PAGE_SIZE;
> +    if (entry->len > page_size) {
> +        entry->len -= page_size;
> +        entry->offset += page_size;
>      } else {
>          memory_region_unref(block->mr);
>          QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
> @@ -1942,30 +1946,8 @@ static bool get_queued_page(RAMState *rs, PageSearchStatus *pss)
>  {
>      RAMBlock  *block;
>      ram_addr_t offset;
> -    bool dirty;
>  
> -    do {
> -        block = unqueue_page(rs, &offset);
> -        /*
> -         * We're sending this page, and since it's postcopy nothing else
> -         * will dirty it, and we must make sure it doesn't get sent again
> -         * even if this queue request was received after the background
> -         * search already sent it.
> -         */
> -        if (block) {
> -            unsigned long page;
> -
> -            page = offset >> TARGET_PAGE_BITS;
> -            dirty = test_bit(page, block->bmap);
> -            if (!dirty) {
> -                trace_get_queued_page_not_dirty(block->idstr, (uint64_t)offset,
> -                                                page);
> -            } else {
> -                trace_get_queued_page(block->idstr, (uint64_t)offset, page);
> -            }
> -        }
> -
> -    } while (block && !dirty);
> +    block = unqueue_page(rs, &offset);
>  
>      if (!block) {
>          /*
> diff --git a/migration/trace-events b/migration/trace-events
> index e165687af2..3a9b3567ae 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -85,8 +85,6 @@ put_qlist_end(const char *field_name, const char *vmsd_name) "%s(%s)"
>  qemu_file_fclose(void) ""
>  
>  # ram.c
> -get_queued_page(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
> -get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, unsigned long page_abs) "%s/0x%" PRIx64 " page_abs=0x%lx"
>  migration_bitmap_sync_start(void) ""
>  migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
>  migration_bitmap_clear_dirty(char *str, uint64_t start, uint64_t size, unsigned long page) "rb %s start 0x%"PRIx64" size 0x%"PRIx64" page 0x%lx"
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


