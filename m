Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F418564E8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 10:50:38 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg3dV-0004nz-Ms
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 04:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <hang.yuan@linux.intel.com>) id 1hg18U-0002Wi-Hb
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 02:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hang.yuan@linux.intel.com>) id 1hg18Q-0005LD-18
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 02:10:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:34941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hang.yuan@linux.intel.com>)
 id 1hg18M-0004wF-1z
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 02:10:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 23:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; d="scan'208";a="337098619"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.156.132])
 by orsmga005.jf.intel.com with ESMTP; 25 Jun 2019 23:10:02 -0700
From: hang.yuan@linux.intel.com
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 14:00:15 +0800
Message-Id: <1561528815-4912-1-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
X-Mailman-Approved-At: Wed, 26 Jun 2019 04:46:31 -0400
Subject: [Qemu-devel] [PATCH] target/i386: HAX: Enable ROM/ROM device memory
 region support
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hang Yuan <hang.yuan@linux.intel.com>

Add ROM and ROM device memory region support in HAX. Their memory region is
read only and write access will generate EPT violation. The violation will
be handled in the HAX kernel with the following patch.

https://github.com/intel/haxm/commit/33ceea09a1655fca12c47f1e112b1d269357ff28

Signed-off-by: Hang Yuan <hang.yuan@linux.intel.com>
---
 target/i386/hax-mem.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/i386/hax-mem.c b/target/i386/hax-mem.c
index 6bb5a24917..685e88cb45 100644
--- a/target/i386/hax-mem.c
+++ b/target/i386/hax-mem.c
@@ -175,15 +175,11 @@ static void hax_process_section(MemoryRegionSection *section, uint8_t flags)
     uint64_t host_va;
     uint32_t max_mapping_size;
 
-    /* We only care about RAM and ROM regions */
-    if (!memory_region_is_ram(mr)) {
-        if (memory_region_is_romd(mr)) {
-            /* HAXM kernel module does not support ROMD yet  */
-            warn_report("Ignoring ROMD region 0x%016" PRIx64 "->0x%016" PRIx64,
-                        start_pa, start_pa + size);
-        }
+    /* We only care about RAM/ROM regions and ROM device */
+    if (memory_region_is_rom(mr) || (memory_region_is_romd(mr)))
+	flags |= HAX_RAM_INFO_ROM;
+    else if (!memory_region_is_ram(mr))
         return;
-    }
 
     /* Adjust start_pa and size so that they are page-aligned. (Cf
      * kvm_set_phys_mem() in kvm-all.c).
-- 
2.21.0


