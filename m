Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E836401C33
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:22:59 +0200 (CEST)
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEaQ-0004M7-6Y
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPC-0000hl-Pw
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP9-0007T3-Ny
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so4986024wme.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVOq4P2b9fV7Bm+VGFLgDnTn5rJi9DMdnCOkpoB4vL0=;
 b=cGP+ZcYUA5kROXwuys8iXV6KrZjO0PTmZmB3Wi1GQ87kf1TVdUzWf+Uza39Vg0V+ZV
 cqT0e5Xcc3e/7NoS9ox1P1YQO/Ku/nsDPJeSDNawgNZ9laOd+kxkgQ2bV3y5oLj/IQib
 kQNLy5SUfqWssVb8OSRY8kV2+kFJ7gFJdylZ4PTix7k0IaqRz7OKx3wprakhb/pl+L5F
 t86HVGWTMHfhx02jAwIiVK5a9iNGfIxHb2LLcppR+n97moEhE2xM06Gxh0kqNylK9j98
 If3RAxQNBodNd9E/we8dl/jlQUtzB3iB8SWOt0aeOWe6YWQeoeFAPPpWbYP5ZAOFwwbC
 aSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tVOq4P2b9fV7Bm+VGFLgDnTn5rJi9DMdnCOkpoB4vL0=;
 b=lbmZM+yTW+l/2fJiYO1ju3bnPPFP3q3AKdRhYCRWjmrrSFBjxxdi9/HMmCYZ6VcNnx
 1Q1JV3IQxWYclqQalcbgUFtuxCxaj3lBt+yew+EuqImXD2zoPycBDTBF+rLYm4rMScet
 DOJ/Vtc5ZJzss8tbHatSxLwlGHPZpf5vIUCVjczmIMoJXuw4Q7mE00RJTYuM67PglRlS
 SQlabWpWC1jE9XfQud8R3lKWeJDkp87OW0kFF7JPCrypp4MEM6o2sm9hRzCi8mhCpqHR
 TqKkCP3nySeWmcSsbxI7IE2WQMRuz4JvDSX/CGyJ/0Rraq5y9xHi5onyYlO7CDoaVZyC
 4hzQ==
X-Gm-Message-State: AOAM531pg/lOd38Ko+NtfCi1e5FC9vmSVWIb92PhsIeTjSCrnzAAYlZE
 mSeYLxIIe6W1yFB8sq64FkY3cogE2rU=
X-Google-Smtp-Source: ABdhPJxWC8WbBL2ek39/4VPZwQtaSmH3K9TngGVpq+/iLoqe/MHd88zmS2tMusQL+52ZlMNdf5Cahg==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr11240669wmb.11.1630933878427; 
 Mon, 06 Sep 2021 06:11:18 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/36] memory: Add RAM_PROTECTED flag to skip IOMMU mappings
Date: Mon,  6 Sep 2021 15:10:32 +0200
Message-Id: <20210906131059.55234-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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



