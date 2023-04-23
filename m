Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055E6EBFCC
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 15:39:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqZv2-0001fU-AM; Sun, 23 Apr 2023 09:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>) id 1pqWVY-0001RH-Rh
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:59:48 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>) id 1pqWVW-0008LD-3J
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 05:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682243986; x=1713779986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dxp49splJXZs6OXaQAJeS2e5dUjiddxJp6EqfgMNFvo=;
 b=kHqFUvcU2hmyRo/d3JeQ44qBfNAhpUuhHs/o9wxlfQ0A7oCzgOoTGlJ8
 q9aRaMHHoD6jvuvuQ9IsmG8iOaN2kV3bkwMNs+Si4BVmKKE2TRRAO52rF
 0PTyrXMt2FqFnUSQR2PDF4rCLSC5sxdmjE9hZvCLYC1ILIxj1naXhz6y5
 IOu2YV2bJG3+XltJq8cgmz/T4BztyIKOjXvWEkND4O16iPaRZOUJeqVce
 tD7zvhl0BLromC1BZW82inv9fpW1SuROXeVcPcO0i+dxrF3tY5p1lAUc6
 +Q+drU5t5aeQW2KsivjE00iH91V3ecmjY56MIADHpZ/9m1PQiW3mEk2JU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="432542849"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; d="scan'208";a="432542849"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 02:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="643004682"
X-IronPort-AV: E=Sophos;i="5.99,220,1677571200"; d="scan'208";a="643004682"
Received: from intel-optiplex-7090.sh.intel.com ([10.67.104.162])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2023 02:59:41 -0700
From: Yong Li <yong.li@intel.com>
To: qemu-devel@nongnu.org
Cc: Yong Li <yong.li@intel.com>,
	"Zhiwei Liu" <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH] hw/riscv/virt: Fix the boot logic if pflash0 is specified
Date: Sun, 23 Apr 2023 17:59:38 +0800
Message-Id: <20230423095938.3232631-1-yong.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yong.li@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Apr 2023 09:38:11 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The firmware may be specified with -bios
and the plfash0 device with option -drive if=pflash.
If both options are applied, it is intented that the pflash0 will
store the secure variable and the firmware be the one specified
by -bios. Explicitly specify "-bios none" if choose to boot from
pflash0

Signed-off-by: Yong Li <yong.li@intel.com>
Cc: "Zhiwei Liu" <zhiwei_liu@linux.alibaba.com>
---
 hw/riscv/virt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4e3efbee16..b38b41e685 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1296,10 +1296,12 @@ static void virt_machine_done(Notifier *notifier, void *data)
         kernel_entry = 0;
     }
 
-    if (drive_get(IF_PFLASH, 0, 0)) {
+    if (drive_get(IF_PFLASH, 0, 0) &&
+            !strcmp(machine->firmware, "none")) {
         /*
-         * Pflash was supplied, let's overwrite the address we jump to after
-         * reset to the base of the flash.
+         * If pflash (unit 0) was supplied and at the same time the -bois
+         * is not specified, then let's overwrite the address we jump to
+         * after reset to the base of the flash.
          */
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
-- 
2.25.1


