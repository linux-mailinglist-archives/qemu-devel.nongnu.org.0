Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094322D1684
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:42:27 +0100 (CET)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJak-0001wp-3s
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJXH-0008Kd-Jb
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmJXF-0007z7-S0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607359129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1k3eNRJR8BcZ798+q1Spw3PwVb8Kvx4aIpO5KhBGkyY=;
 b=UtoTd61QMrILT+z7nYyT2ilyeOkTe7BSnCbi3XZgJJNUbvVYb2o/NUi8ZplbpmWswBzzJD
 iA6OFLSnFO5F2+HEkyErzT+c2MKMmlR74nWTvmmOvH1DJoSZIY6JjgoBo67IC+gRXetbnw
 USY8Et4r3lTWj7CJaGzT5fJXQbnIHgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-LHjAFTwPNUmy_5qJapK0qA-1; Mon, 07 Dec 2020 11:38:47 -0500
X-MC-Unique: LHjAFTwPNUmy_5qJapK0qA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89359800D62
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 16:38:46 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B32C01002C10;
 Mon,  7 Dec 2020 16:38:45 +0000 (UTC)
Date: Mon, 7 Dec 2020 17:38:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 13/15] memory: allow creating MemoryRegions before
 accelerators
Message-ID: <20201207173843.4cc85ead@redhat.com>
In-Reply-To: <20201202081854.4126071-14-pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-14-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> 
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

Is following also necessary?:

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 11ca94d037..f1de42e50f 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2033,7 +2033,8 @@ void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
     }
 
     memory_region_transaction_begin();
-    mr->dirty_log_mask = (mr->dirty_log_mask & ~mask) | (log * mask);
+    mr->dirty_log_mask = (memory_region_get_dirty_log_mask(mr) & ~mask) |
+                         (log * mask);
     memory_region_update_pending |= mr->enabled;
     memory_region_transaction_commit();
 }

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


