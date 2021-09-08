Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89961403788
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:07:22 +0200 (CEST)
Received: from localhost ([::1]:50950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuUD-0000tW-Fb
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRk-0006NT-Jr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:48 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRg-0002uV-Fl
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:46 -0400
Received: by mail-wr1-x429.google.com with SMTP id u9so2387694wrg.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVOq4P2b9fV7Bm+VGFLgDnTn5rJi9DMdnCOkpoB4vL0=;
 b=VroxlX5ftuTbsEDPxOAgb0ADcC25C7ActfvuOS+OyeJkQDCmxDIyFT3TsvKKA7y210
 daHXFdQwry0c9BleXi0scPWyi/uhwFGvsnMzW3r3In0VgN0iY1vkiQkE0GfVRFBV1nRR
 BvDPcAl2dIfFaw7ypqYxeNbqD6Pm9r5RmanyDD9ONHswCYULW9vvQpGTI+lVPQj6ZtmW
 xnUkFdO3DSCpGh8ZqRsq4KYrXPlPNQS2IdSZRt97kKHKc19A6AhleDXbcrPROpisNDed
 oHblsDsJkqd8VAIIWSM705go9oGPQ80vx/QWiQFbJaV6MPiTpSML7oVq+bx40WTfbd6U
 W+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tVOq4P2b9fV7Bm+VGFLgDnTn5rJi9DMdnCOkpoB4vL0=;
 b=IcIc1mA78PBI5ZkDlzmaBPE1O6FOhdVAYgWjBJnwC5lESYy9yum0j9Yxl0SmwIaSfP
 v/gdQepY8rvFhPjxnddjrH0W7BNKYRqcKpPRugm3ZUQShZ/AzUDsoLqM2osadC/YFQsj
 uahu3XSYOOQG2XfFlhb7aEQSPWdkCRtG206fr/XAVd1vuYYnN/lpcyMg5M2b1dI7N3f4
 BWB7YDL4TMBFgZQjg4LDmwSb+maY9HKuXZvOACOtuKVCMKsyr1F2Dv+WISA1/519h0Yu
 hKVfsiNbSHQkyk4Ng63ILWaouVNPgmU74HYlUtgn/k19ASw0M0XH0M1weEJR9GR4chub
 9hNg==
X-Gm-Message-State: AOAM533GHbLJ/HyphIU5UO3jBm2nPNIDrqKCa+5IFqr/VxC3wXXHHz1Q
 tv6y1H+Cec5guYW57taDWcRmOtrrOzA=
X-Google-Smtp-Source: ABdhPJwylfDWP9g2Gk1ZJ+8lgbVx5n2BQXUWB+g3Op71gMYiSu0C0WgN+NntNWBFK22L2uiARi1hKg==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr3054852wrn.122.1631095482415; 
 Wed, 08 Sep 2021 03:04:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 09/43] memory: Add RAM_PROTECTED flag to skip IOMMU mappings
Date: Wed,  8 Sep 2021 12:03:52 +0200
Message-Id: <20210908100426.264356-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Add a new RAMBlock flag to denote "protected" memory, i.e. memory that
looks and acts like RAM but is inaccessible via normal mechanisms,
including DMA.  Use the flag to skip protected memory regions when
mapping RAM for DMA in VFIO.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>

v1-->v2:
   - Unified the "share" and "protected" arguments with ram_flags in the
     memory_region_init_ram_from_fd()(Paolo).
Message-Id: <20210719112136.57018-2-yang.zhong@intel.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/vfio/common.c      |  1 +
 include/exec/memory.h | 15 ++++++++++++++-
 softmmu/memory.c      |  5 +++++
 softmmu/physmem.c     |  3 ++-
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..1289cfa8be 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -562,6 +562,7 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
+           memory_region_is_protected(section->mr) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
             * addresses in the upper part of the 64-bit address space.  These
diff --git a/include/exec/memory.h b/include/exec/memory.h
index c3d417d317..9446874d21 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -190,6 +190,9 @@ typedef struct IOMMUTLBEvent {
  */
 #define RAM_NORESERVE (1 << 7)
 
+/* RAM that isn't accessible through normal means. */
+#define RAM_PROTECTED (1 << 8)
+
 static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
                                        IOMMUNotifierFlag flags,
                                        hwaddr start, hwaddr end,
@@ -1267,7 +1270,7 @@ void memory_region_init_ram_from_file(MemoryRegion *mr,
  * @name: the name of the region.
  * @size: size of the region.
  * @ram_flags: RamBlock flags. Supported flags: RAM_SHARED, RAM_PMEM,
- *             RAM_NORESERVE.
+ *             RAM_NORESERVE, RAM_PROTECTED.
  * @fd: the fd to mmap.
  * @offset: offset within the file referenced by fd
  * @errp: pointer to Error*, to store an error if it happens.
@@ -1568,6 +1571,16 @@ static inline bool memory_region_is_romd(MemoryRegion *mr)
     return mr->rom_device && mr->romd_mode;
 }
 
+/**
+ * memory_region_is_protected: check whether a memory region is protected
+ *
+ * Returns %true if a memory region is protected RAM and cannot be accessed
+ * via standard mechanisms, e.g. DMA.
+ *
+ * @mr: the memory region being queried
+ */
+bool memory_region_is_protected(MemoryRegion *mr);
+
 /**
  * memory_region_get_iommu: check whether a memory region is an iommu
  *
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..54cd0e9824 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1811,6 +1811,11 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
     return mr->ram_device;
 }
 
+bool memory_region_is_protected(MemoryRegion *mr)
+{
+    return mr->ram && (mr->ram_block->flags & RAM_PROTECTED);
+}
+
 uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
 {
     uint8_t mask = mr->dirty_log_mask;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 23e77cb771..088660d973 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2055,7 +2055,8 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     int64_t file_size, file_align;
 
     /* Just support these ram flags by now. */
-    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE)) == 0);
+    assert((ram_flags & ~(RAM_SHARED | RAM_PMEM | RAM_NORESERVE |
+                          RAM_PROTECTED)) == 0);
 
     if (xen_enabled()) {
         error_setg(errp, "-mem-path not supported with Xen");
-- 
2.31.1



