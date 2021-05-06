Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954AE374CFE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 03:45:54 +0200 (CEST)
Received: from localhost ([::1]:59778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leT5N-0000Nw-N7
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 21:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0q-0002ca-Li
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:23057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1leT0o-0007bf-AJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 21:41:12 -0400
IronPort-SDR: Ux8tefLZPxZEpWBCrXwzy1BfRfvL+YnIxLJYWnQRuKiIQa22um3U3pz8RO7XYehlX1GAqbB4Mf
 pg0dGrrHGmgw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="178579137"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="178579137"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:41:08 -0700
IronPort-SDR: gsQl2CG711TFP2h5d0I0AByrDQOClSnXfc2qiNvEDN3PjPRLf/LL5/xuSbtHhEnI5NMKmHJJbs
 59ntSv8QpGIg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="469220338"
Received: from yy-desk-7060.sh.intel.com ([10.239.159.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 18:40:57 -0700
From: Yuan Yao <yuan.yao@linux.intel.com>
To: pbonzini@redhat.com
Subject: [RFC][PATCH v1 02/10] Currently,
 guest memory access for debugging purposes is performed using
 memcpy(). Extend the 'struct MemoryRegion' to include new callbacks that can
 be used to override the use of memcpy() with something else.
Date: Thu,  6 May 2021 09:40:29 +0800
Message-Id: <20210506014037.11982-3-yuan.yao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506014037.11982-1-yuan.yao@linux.intel.com>
References: <20210506014037.11982-1-yuan.yao@linux.intel.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=yuan.yao@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Thomas.Lendacky@amd.com, ashish.kalra@amd.com,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, mtosatti@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 yuan.yao@intel.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brijesh Singh <brijesh.singh@amd.com>

The new callbacks can be used to display the guest memory of an SEV guest
by registering callbacks to the SEV memory encryption/decryption APIs.

Typical usage:

mem_read(uint8_t *dest,
         const uint8_t *hva_src, hwaddr gpa_src,
         uint32_t len, MemTxAttrs attrs);
mem_write(uint8_t *hva_dest, hwaddr gpa_des,
          const uint8_t *src, uint32_t len, MemTxAttrs attrs);

MemoryRegionRAMReadWriteOps ops;
ops.read = mem_read;
ops.write = mem_write;

memory_region_init_ram(mem, NULL, "memory", size, NULL);
memory_region_set_ram_debug_ops(mem, ops);

Yuan Yao:
 - Add the gpa_src/gpa_des for read/write interface

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Yuan Yao <yuan.yao@intel.com>

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b2..7e6fdcb8e4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -444,6 +444,19 @@ struct IOMMUMemoryRegionClass {
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
 typedef struct MemoryRegionIoeventfd MemoryRegionIoeventfd;
 
+/* Memory Region RAM debug callback */
+typedef struct MemoryRegionRAMReadWriteOps MemoryRegionRAMReadWriteOps;
+
+struct MemoryRegionRAMReadWriteOps {
+    /* Write data into guest memory */
+    int (*write) (uint8_t *hva_dest, hwaddr gpa_des,
+                  const uint8_t *src, uint32_t len, MemTxAttrs attrs);
+    /* Read data from guest memory */
+    int (*read) (uint8_t *dest,
+                 const uint8_t *hva_src, hwaddr gpa_src,
+                 uint32_t len, MemTxAttrs attrs);
+};
+
 /** MemoryRegion:
  *
  * A struct representing a memory region.
@@ -487,6 +500,7 @@ struct MemoryRegion {
     const char *name;
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
+    const MemoryRegionRAMReadWriteOps *ram_debug_ops;
 };
 
 struct IOMMUMemoryRegion {
@@ -1130,6 +1144,20 @@ void memory_region_init_rom_nomigrate(MemoryRegion *mr,
                                       uint64_t size,
                                       Error **errp);
 
+/**
+ * memory_region_set_ram_debug_ops: Set access ops for a give memory region.
+ *
+ * @mr: the #MemoryRegion to be initialized
+ * @ops: a function that will be used when accessing @target region during
+ *       debug
+ */
+static inline void
+memory_region_set_ram_debug_ops(MemoryRegion *mr,
+                                const MemoryRegionRAMReadWriteOps *ops)
+{
+    mr->ram_debug_ops = ops;
+}
+
 /**
  * memory_region_init_rom_device_nomigrate:  Initialize a ROM memory region.
  *                                 Writes are handled via callbacks.
-- 
2.20.1


