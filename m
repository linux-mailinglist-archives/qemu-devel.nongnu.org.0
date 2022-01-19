Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49347493CED
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 16:21:56 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nACmW-0005gc-E4
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 10:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABwU-0006uM-6P
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:28:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABwA-000208-5G
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 09:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642602451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqWEhoMgmUoi/tlXjvRoOTW1XP+CsbNlcJf2sHuVClw=;
 b=Q0EO/jAo1GUXhhvYJQOa3T8etqcqL7LA3Jq6WPEp3+CKTXA/flwXAyKBtQHdeHCdff7/40
 CYvM9IMgEODzUUotI736dK/yHbv8kx02jBplSgBYXUp7ng/W/W658Ze3GtawamTcVsY+Im
 jj3GYmcOqThYmwbohTs7zh21VIWmnQ4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-mknwcXwFO6uRCA_7ktPgDQ-1; Wed, 19 Jan 2022 09:27:30 -0500
X-MC-Unique: mknwcXwFO6uRCA_7ktPgDQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a05640250cb00b003fa024f87c2so2647379edb.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 06:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wqWEhoMgmUoi/tlXjvRoOTW1XP+CsbNlcJf2sHuVClw=;
 b=VqzaGdhhnCe/TZf59KaWawKg8JghSrCZh6UcL01awDiADL6KMJ43OJcHcdqBQL0YSp
 IV2CMFu6L7XGQIMl+xDYNI6Kjglr8GzZMGs/XfvRWlZFMKRf7RcOUfK/578VY3h+LArc
 p98UEJ/HmV67adPLC4vy58UQ98v6DcIvTaqrsdvGyV4wOYU6KtTg5jbGdw8bSMkXduzI
 fpzRh/fFXhTsNeaKLCldusC3O7xvxf+rxk6k0EEZH3SQGs4rn9DqCLwOBnH8vMzJfJsW
 KDuychs5rYhWTU+1PIu5m+GostfAIdOZAPs6tFWxFNu5TSotQi2kniU2k6xiOg7qIb4O
 WPcw==
X-Gm-Message-State: AOAM530tMMlm5ZUGPb74A4Dst2n8xaz8zp3iecsJ5YGKaZrFpK8m3UnH
 m9OhTYBAg82IxFPWuvEkBLhATbsFmhPq5my7y9QY8+su1kuDcWOpInql6ocUez9BJ1rcw4JZMqG
 vaaVMB0aosNikGAA=
X-Received: by 2002:adf:fb4a:: with SMTP id c10mr28483261wrs.644.1642602449313; 
 Wed, 19 Jan 2022 06:27:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgHB1WlWMyQIBJhnr1txmox9nXheQg/oXzBF9VZrbhYd3TX6r0Sayks58Or6KPi4/0tebAHw==
X-Received: by 2002:adf:fb4a:: with SMTP id c10mr28483246wrs.644.1642602449093; 
 Wed, 19 Jan 2022 06:27:29 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l20sm7307494wms.24.2022.01.19.06.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 06:27:28 -0800 (PST)
Date: Wed, 19 Jan 2022 14:27:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 04/15] migration: Add postcopy_has_request()
Message-ID: <Yegfzj/O3wKaj8BI@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-5-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-5-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
> Add a helper to detect whether postcopy has pending request.
> 
> Since at it, cleanup the code a bit, e.g. in unqueue_page() we shouldn't need
> to check it again on queue empty because we're the only one (besides cleanup
> code, which should never run during this process) that will take a request off
> the list, so the request list can only grow but not shrink under the hood.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 45 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 94b0ad4234..dc6ba041fa 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -354,6 +354,12 @@ static RAMState *ram_state;
>  
>  static NotifierWithReturnList precopy_notifier_list;
>  
> +/* Whether postcopy has queued requests? */
> +static bool postcopy_has_request(RAMState *rs)
> +{
> +    return !QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests);
> +}
> +
>  void precopy_infrastructure_init(void)
>  {
>      notifier_with_return_list_init(&precopy_notifier_list);
> @@ -1533,28 +1539,33 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
>   */
>  static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>  {
> +    struct RAMSrcPageRequest *entry;
>      RAMBlock *block = NULL;
>  
> -    if (QSIMPLEQ_EMPTY_ATOMIC(&rs->src_page_requests)) {
> +    if (!postcopy_has_request(rs)) {
>          return NULL;
>      }
>  
>      QEMU_LOCK_GUARD(&rs->src_page_req_mutex);
> -    if (!QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
> -        struct RAMSrcPageRequest *entry =
> -                                QSIMPLEQ_FIRST(&rs->src_page_requests);
> -        block = entry->rb;
> -        *offset = entry->offset;
> -
> -        if (entry->len > TARGET_PAGE_SIZE) {
> -            entry->len -= TARGET_PAGE_SIZE;
> -            entry->offset += TARGET_PAGE_SIZE;
> -        } else {
> -            memory_region_unref(block->mr);
> -            QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
> -            g_free(entry);
> -            migration_consume_urgent_request();
> -        }
> +
> +    /*
> +     * This should _never_ change even after we take the lock, because no one
> +     * should be taking anything off the request list other than us.
> +     */
> +    assert(postcopy_has_request(rs));
> +
> +    entry = QSIMPLEQ_FIRST(&rs->src_page_requests);
> +    block = entry->rb;
> +    *offset = entry->offset;
> +
> +    if (entry->len > TARGET_PAGE_SIZE) {
> +        entry->len -= TARGET_PAGE_SIZE;
> +        entry->offset += TARGET_PAGE_SIZE;
> +    } else {
> +        memory_region_unref(block->mr);
> +        QSIMPLEQ_REMOVE_HEAD(&rs->src_page_requests, next_req);
> +        g_free(entry);
> +        migration_consume_urgent_request();
>      }
>  
>      return block;
> @@ -2996,7 +3007,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>          t0 = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>          i = 0;
>          while ((ret = qemu_file_rate_limit(f)) == 0 ||
> -                !QSIMPLEQ_EMPTY(&rs->src_page_requests)) {
> +               postcopy_has_request(rs)) {
>              int pages;
>  
>              if (qemu_file_get_error(f)) {
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


