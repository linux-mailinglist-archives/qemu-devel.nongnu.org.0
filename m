Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A538686EE5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIiw-00077o-Kr; Wed, 01 Feb 2023 14:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIiu-00077R-HX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIis-0000QL-8w
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675279484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vMRTvfm31xUylfeo0jXkAk9qjJKleBlkx619L91P+LM=;
 b=JTYn3Gur23c2deNPrG7Fhcb/VvE0iF8IHQCsy8kLhTVL+YqlU8wdAS3ktpZpejxMns60yr
 MgPAVSxgSNz9GCT7Ys1a+/oDNaPXtWRRxL8nNZPHmh7FwrYCiGm5hVKZmsSiukjhJo/B4j
 8c3RHEG3kTpF1Dvq3xuFTEJLqQiiO5g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-OxD5vAPEPGyO_RX2Rj0N4Q-1; Wed, 01 Feb 2023 14:24:43 -0500
X-MC-Unique: OxD5vAPEPGyO_RX2Rj0N4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003deab30bb8bso1315683wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vMRTvfm31xUylfeo0jXkAk9qjJKleBlkx619L91P+LM=;
 b=GxexMEg7389iVIoMFZM5/3pwiexVU1RVAFqkJnLg8oHEWsKRR/Jh/S/oPO+TEg57BL
 d6ZMreA0vM9weOawgBDzTQHH0F3GIyUebL3C8MiUVlV0PckfkF9uVpJcLl2Dk404XjuS
 lZRepeQGXCZx6uZ5qjkNuxlblbCbLbCqA7cM3Bl+TdOX/zvwJCgKRjEkTsghkZJZKknM
 PizjwqbnifsNe0KCUYiNLx9m+Kig2a5yOdtl93TjsWZE3ZC5THgkAZ4k7uFIP1oLN8Kn
 AFRMr1ClLprXD2+YtlKw61HqNXgAIEdMlkl0zHkS27zk0PkmrRFirIb8sU0l7cSLBVZR
 rZZA==
X-Gm-Message-State: AO0yUKWHwqPJAwLBRE7aHAp/CJbXgy2OWElw3zF72ubRR/e6TswoD/w3
 OOzrzCcC4s5k4JXSQbGsaeAvRkpp7V3XZHsaihzyqLCs/Z3NjRHG99B+tfU53+4490Td77kD11P
 RWDcCgD70e+k18D4=
X-Received: by 2002:a05:600c:1994:b0:3d3:5709:68e8 with SMTP id
 t20-20020a05600c199400b003d3570968e8mr3006512wmq.36.1675279482044; 
 Wed, 01 Feb 2023 11:24:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9wjLKz4sQ/zxZLkdBvhw1d2FR+H8jvWV074p61+JdD7DEww/7Ty0LY37s+T+J4DRIJZHLiHA==
X-Received: by 2002:a05:600c:1994:b0:3d3:5709:68e8 with SMTP id
 t20-20020a05600c199400b003d3570968e8mr3006498wmq.36.1675279481833; 
 Wed, 01 Feb 2023 11:24:41 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c42d300b003dc53217e07sm2409357wme.16.2023.02.01.11.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 11:24:41 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 20/21] migration: Handle page faults using
 UFFDIO_CONTINUE
In-Reply-To: <20230117220914.2062125-21-peterx@redhat.com> (Peter Xu's message
 of "Tue, 17 Jan 2023 17:09:13 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-21-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 20:24:40 +0100
Message-ID: <87edr9w5mv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Teach QEMU to be able to handle page faults using UFFDIO_CONTINUE for
> hugetlbfs double mapped ranges.
>
> To copy the data, we need to use the mirror buffer created per ramblock by
> a raw memcpy(), then we can kick the faulted threads using UFFDIO_CONTINUE
> by installing the pgtables.
>
> Move trace_postcopy_place_page(host) upper so that it'll dump something for
> either UFFDIO_COPY or UFFDIO_CONTINUE.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

> ---
>  migration/postcopy-ram.c | 55 ++++++++++++++++++++++++++++++++++++++--
>  migration/trace-events   |  4 +--
>  2 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 8a2259581e..c4bd338e22 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -1350,6 +1350,43 @@ int postcopy_notify_shared_wake(RAMBlock *rb, uint64_t offset)
>      return 0;
>  }
>  
> +/* Returns the mirror_host addr for a specific host address in ramblock */
> +static inline void *migration_ram_get_mirror_addr(RAMBlock *rb, void *host)
> +{
> +    return (void *)((__u64)rb->host_mirror + ((__u64)host - (__u64)rb->host));

This is gross :-(
I hate this C miss-feature.

What about:
    return (char *)rb->host_mirror + (char*)host - (char*)rb->host;

But I don't know if it (much) clearer.  And no, I don't remember if we
ever need more parents.

gcc used to do "the right" thing on void * arithmetic, but it is not in
the standard, and I don't know what is worse.

> +}
> +
> +static int
> +qemu_uffd_continue(MigrationIncomingState *mis, RAMBlock *rb, void *host,
> +                   void *from)
> +{
> +    void *mirror_addr = migration_ram_get_mirror_addr(rb, host);
> +    /* Doublemap uses small host page size */
> +    uint64_t psize = qemu_real_host_page_size();
> +    struct uffdio_continue req;
> +
> +    /*
> +     * Copy data first into the mirror host pointer; we can't directly copy
> +     * data into rb->host because otherwise our thread will get trapped too.
> +     */
> +    memcpy(mirror_addr, from, psize);
> +
> +    /* Kick off the faluted threads to fetch data from the page cache
                       ^^^^^^^
> */

Faulted

> +    req.range.start = (__u64)host;
> +    req.range.len = psize;
> +    req.mode = 0;
> +	if (ioctl(mis->userfault_fd, UFFDIO_CONTINUE, &req)) {
> +        error_report("%s: UFFDIO_CONTINUE failed for start=%p"
> +                     " len=0x%"PRIx64": %s\n", __func__, host,
> +                     psize, strerror(-req.mapped));
> +        return req.mapped;
> +    }
> +
> +    postcopy_mark_received(mis, rb, host, psize / qemu_target_page_size());
> +
> +    return 0;
> +}
> +
>  /*
>   * Place a host page (from) at (host) atomically
>   * returns 0 on success
> @@ -1359,6 +1396,18 @@ int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
>  {
>      size_t pagesize = migration_ram_pagesize(rb);
>  
> +    trace_postcopy_place_page(rb->idstr, (uint8_t *)host - rb->host, host);
> +
> +    if (postcopy_use_minor_fault(rb)) {
> +        /*
> +         * If minor fault used, we use UFFDIO_CONTINUE instead.
> +         *
> +         * TODO: support shared uffds (e.g. vhost-user). Currently we're
> +         * skipping them.
> +         */
> +        return qemu_uffd_continue(mis, rb, host, from);
> +    }
> +
>      /* copy also acks to the kernel waking the stalled thread up
>       * TODO: We can inhibit that ack and only do it if it was requested
>       * which would be slightly cheaper, but we'd have to be careful
> @@ -1372,7 +1421,6 @@ int postcopy_place_page(MigrationIncomingState *mis, void *host, void *from,
>          return -e;
>      }
>  
> -    trace_postcopy_place_page(host);
>      return postcopy_notify_shared_wake(rb,
>                                         qemu_ram_block_host_offset(rb, host));
>  }
> @@ -1385,10 +1433,13 @@ int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
>                               RAMBlock *rb)
>  {
>      size_t pagesize = migration_ram_pagesize(rb);
> -    trace_postcopy_place_page_zero(host);
> +    trace_postcopy_place_page_zero(rb->idstr, (uint8_t *)host - rb->host, host);

It is me, or to be standard compliant, you need to cast also rb->host?


>      /* Normal RAMBlocks can zero a page using UFFDIO_ZEROPAGE
>       * but it's not available for everything (e.g. hugetlbpages)
> +     *
> +     * NOTE: when hugetlb double-map enabled, then this ramblock will never
> +     * have RAM_UF_ZEROPAGE, so it'll always go to postcopy_place_page().
>       */
>      if (qemu_ram_is_uf_zeroable(rb)) {
>          if (qemu_ufd_copy_ioctl(mis, host, NULL, pagesize, rb)) {
> diff --git a/migration/trace-events b/migration/trace-events
> index 6b418a0e9e..7baf235d22 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -265,8 +265,8 @@ postcopy_discard_send_range(const char *ramblock, unsigned long start, unsigned
>  postcopy_cleanup_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
>  postcopy_init_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
>  postcopy_nhp_range(const char *ramblock, void *host_addr, size_t offset, size_t length) "%s: %p offset=0x%zx length=0x%zx"
> -postcopy_place_page(void *host_addr) "host=%p"
> -postcopy_place_page_zero(void *host_addr) "host=%p"
> +postcopy_place_page(const char *id, size_t offset, void *host_addr) "id=%s offset=0x%zx host=%p"
> +postcopy_place_page_zero(const char *id, size_t offset, void *host_addr) "id=%s offset=0x%zx host=%p"
>  postcopy_ram_enable_notify(void) ""
>  mark_postcopy_blocktime_begin(uint64_t addr, void *dd, uint32_t time, int cpu, int received) "addr: 0x%" PRIx64 ", dd: %p, time: %u, cpu: %d, already_received: %d"
>  mark_postcopy_blocktime_end(uint64_t addr, void *dd, uint32_t time, int affected_cpu) "addr: 0x%" PRIx64 ", dd: %p, time: %u, affected_cpu: %d"

I think that you can split the part of the patch that changes the
traces.  But again, it is up to you.


