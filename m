Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392C2D1732
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:12:20 +0100 (CET)
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmK3e-0005zK-Pt
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJyN-0003Q3-6i
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJyJ-0004WB-Vw
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607360807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojyGFDfjc+BtMgdyP6/Td1Byl+gpo0CL2ZttP/B5IBA=;
 b=Q8iC9VK8OgeDxH77MBIc/M6b44oFrWQJyTGB/+S7lU0CkjApHkzqmhkBR3kMWR1TtC3MdG
 Q7dPe68oqr7HtN1YG3LmgtE7pMPK8KVcWYW7bvqYfPP4SodE8sJe26C5iyF9+ATfTLzcMu
 ee6/XssDr/0z1AFKMD0jLkxorlvUzP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-IJEyuQQ2NtinI_4CUB-DLA-1; Mon, 07 Dec 2020 12:06:45 -0500
X-MC-Unique: IJEyuQQ2NtinI_4CUB-DLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E123858184
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 17:06:44 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 133805D9D0;
 Mon,  7 Dec 2020 17:06:42 +0000 (UTC)
Date: Mon, 7 Dec 2020 18:06:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/15] memory: allow creating MemoryRegions before
 accelerators
Message-ID: <20201207180641.6a649b8a@redhat.com>
In-Reply-To: <20201202081854.4126071-14-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-14-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Dec 2020 03:18:52 -0500
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Compute the DIRTY_MEMORY_CODE bit in memory_region_get_dirty_log_mask
> instead of memory_region_init_*.  This makes it possible to allocate
> memory backend objects at any time.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/memory.c | 12 ++++++------
>  softmmu/vl.c     |  6 +-----
>  2 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 11ca94d037..89a4723fe5 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1548,7 +1548,6 @@ void memory_region_init_ram_shared_nomigrate(MemoryRegion *mr,
>      mr->terminates = true;
>      mr->destructor = memory_region_destructor_ram;
>      mr->ram_block = qemu_ram_alloc(size, share, mr, &err);
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> @@ -1573,7 +1572,6 @@ void memory_region_init_resizeable_ram(MemoryRegion *mr,
>      mr->destructor = memory_region_destructor_ram;
>      mr->ram_block = qemu_ram_alloc_resizeable(size, max_size, resized,
>                                                mr, &err);
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> @@ -1598,7 +1596,6 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
>      mr->destructor = memory_region_destructor_ram;
>      mr->align = align;
>      mr->ram_block = qemu_ram_alloc_from_file(size, mr, ram_flags, path, &err);
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> @@ -1622,7 +1619,6 @@ void memory_region_init_ram_from_fd(MemoryRegion *mr,
>      mr->ram_block = qemu_ram_alloc_from_fd(size, mr,
>                                             share ? RAM_SHARED : 0,
>                                             fd, &err);
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>      if (err) {
>          mr->size = int128_zero();
>          object_unparent(OBJECT(mr));
> @@ -1641,7 +1637,6 @@ void memory_region_init_ram_ptr(MemoryRegion *mr,
>      mr->ram = true;
>      mr->terminates = true;
>      mr->destructor = memory_region_destructor_ram;
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
>  
>      /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
>      assert(ptr != NULL);
> @@ -1661,7 +1656,7 @@ void memory_region_init_ram_device_ptr(MemoryRegion *mr,
>      mr->ops = &ram_device_mem_ops;
>      mr->opaque = mr;
>      mr->destructor = memory_region_destructor_ram;
> -    mr->dirty_log_mask = tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
> +
>      /* qemu_ram_alloc_from_ptr cannot fail with ptr != NULL.  */
>      assert(ptr != NULL);
>      mr->ram_block = qemu_ram_alloc_from_ptr(size, ptr, mr, &error_fatal);
> @@ -1819,6 +1814,11 @@ uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>                               memory_region_is_iommu(mr))) {
>          mask |= (1 << DIRTY_MEMORY_MIGRATION);
>      }
> +
> +    if (tcg_enabled() && rb) {
> +        /* TCG only cares about dirty memory logging for RAM, not IOMMU.  */
> +        mask |= (1 << DIRTY_MEMORY_CODE);
> +    }
>      return mask;
>  }
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 0f63d80472..023c16245b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1715,11 +1715,7 @@ static bool object_create_early(const char *type, QemuOpts *opts)
>          return false;
>      }
>  
> -    /* Memory allocation by backends needs to be done
> -     * after configure_accelerator() (due to the tcg_enabled()
> -     * checks at memory_region_init_*()).
> -     *
> -     * Also, allocation of large amounts of memory may delay
> +    /* Allocation of large amounts of memory may delay
>       * chardev initialization for too long, and trigger timeouts
>       * on software that waits for a monitor socket to be created
>       * (e.g. libvirt).


