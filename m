Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7532141AF88
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:59:17 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVChY-0005kN-Et
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCa1-0006N8-Gm
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:29 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCZt-0001J3-Qt
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:25 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b26so34523127edt.0
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTQc9AFcRDhvJrgR1HuvP2H0f8isuj93MihqGubbVPI=;
 b=c9fQsSsxKIrcxRSarTZb/QlBGYAyDrEkIZGppyFYPZPm+L0Do5egKy9xI1+QeueQRm
 Sy2cVYO/rQGZZ9za5J3N7MsRo+UAekg7E0cuLn0TBqrZbKZOxptN+bdOVPBaXEiQp88x
 ehdLWm2pMyUda+Jtk/h+LV8v5ZGaFFEAHzyCALlz7O8Fybi1Cld0L3SpLmvQE6qI1Wse
 fLe2fvvKOc+j1AYMp/TBRkftUgJYC3pjWum+4aTEFRRjxj4tcgNLKf6kruxh7qEyEn/Z
 jhWK1Nki7NyBBXSaa0jpdRBP65UApnoRKz11FX7HjXJ9t26iSQ7PmUfRoPNhBmRzuSXe
 wi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HTQc9AFcRDhvJrgR1HuvP2H0f8isuj93MihqGubbVPI=;
 b=ox82nbEdiIVXYJUopERFXd2gp21Bo9IRsuqSwy440xNNFKnewt4KwpNg5GrkugJxXE
 XmFEwpUyLLzdA0bH3YX9xx3Hvm6REF4TzzB6TQ7H+QqSupL/Z0jDQNh0DiXG1lcdbN9b
 kLXmgnwBK8+oJpV0L/X41DoVlbdoDP0c0xgoUVLdnhjatkG+SQLQ4DNLLBYSvohgMk6+
 JszV7zXfOkxj8/14jLQu/rRQWFlxtw2WTV3n3ZhJfw9cyZXoG9fXRT0HizIr3dRqa3sw
 BNr7uAgGHr/atYTNdnX7UyOOCkDJXBF9l/CAd7WEY14daOlPdVV7B/k1xZ+unF2//y6+
 bslg==
X-Gm-Message-State: AOAM532007qRSHKmfeTb6Yz3qwqbm631C0pAc0TGPPSICM9t/kit4tfL
 6qaSGFqWjs5OzaRue23jDN1XozdRvx8=
X-Google-Smtp-Source: ABdhPJwg0Lp7rekQqCUrHG4z/k6fXxaVMtDDnmrnKPNuAScn9wlJeDE98DOXW3Il6cWjCdrqLDpvaw==
X-Received: by 2002:a50:be87:: with SMTP id b7mr7602776edk.382.1632833479661; 
 Tue, 28 Sep 2021 05:51:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] memory: Add RAM_PROTECTED flag to skip IOMMU mappings
Date: Tue, 28 Sep 2021 14:50:44 +0200
Message-Id: <20210928125116.183620-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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



