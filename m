Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D867DB60
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 02:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLDnR-0005Uf-MM; Thu, 26 Jan 2023 20:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pL6fY-0000uc-4a
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:08:16 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave.jiang@intel.com>)
 id 1pL6fW-0005MA-7v
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674756494; x=1706292494;
 h=subject:from:to:cc:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l1I6/T4zyQnPJZVoVcaHZ2pJED6Bo2HR8YzE059/uqQ=;
 b=ArnGCB+RmabE9eAGn9R9+ECcXuWoDYjLhzD9urgQjurQRvM7YfJ893/H
 eB8unG2z9UX5ua9eV36L2c3FTA50FOgKUxl3QB/LnnutDsSyjc/DQ+ced
 BJdIe7mH4j86Ux8fbgcoyPmeQvEAR4doNQ2IS9+5tyG2eDhmXYylmJ3Ka
 kLgVj3B+nY/H4asMqo0mJZ9Va5+0itwHlBC35akPAL71OYRt3dTca6RCm
 vE+4STBNhwyG3ZN6AFYhKx7VDuFsM2hxP1vu9M411o+m0EGeFapQPE1el
 psLIn5pd5Y77nGM8zlqywdaTi8V7GgC/Pcpdx8Iiy1M2GKKYfHlTZeVo8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328157205"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="328157205"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:07:40 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="640405916"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="640405916"
Received: from djiang5-mobl3.amr.corp.intel.com (HELO djiang5-mobl3.local)
 ([10.212.112.115])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:07:39 -0800
Subject: [PATCH] hw/cxl: Add QTG _DSM support for ACPI0017 device
From: Dave Jiang <dave.jiang@intel.com>
To: Jonathan.Cameron@huawei.com
Cc: mst@redhat.com, bwidawsk@kernel.org, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, linux-cxl@vger.kernel.org
Date: Thu, 26 Jan 2023 11:07:37 -0700
Message-ID: <167475645654.1386523.7101990863993668595.stgit@djiang5-mobl3.local>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=dave.jiang@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:44:36 -0500
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

Add a simple _DSM call support for the ACPI0017 device to return a fake QTG
ID value. Given the current CXL implementation does not involve switches,
a faked value of 0 can be returned for the QTG ID. The enabling is for _DSM
plumbing testing from the OS.

Signed-off-by: Dave Jiang <dave.jiang@intel.com>
---
 hw/acpi/cxl.c         |   57 +++++++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  |    1 +
 include/hw/acpi/cxl.h |    1 +
 3 files changed, 59 insertions(+)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 2bf8c0799359..cd6839c24416 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -30,6 +30,63 @@
 #include "qapi/error.h"
 #include "qemu/uuid.h"
 
+void build_cxl_dsm_method(Aml *dev)
+{
+    Aml *method, *ifctx, *ifctx2;
+
+    method = aml_method("_DSM", 4, AML_SERIALIZED);
+    {
+        Aml *function, *uuid;
+
+        uuid = aml_arg(0);
+        function = aml_arg(2);
+        /* CXL spec v3.0 9.17.3.1 *, QTG ID _DSM */
+        ifctx = aml_if(aml_equal(
+            uuid, aml_touuid("F365F9A6-A7DE-4071-A66A-B40C0B4F8E52")));
+
+        /* Function 0, standard DSM query function */
+        ifctx2 = aml_if(aml_equal(function, aml_int(0)));
+        {
+            uint8_t byte_list[1] = { 0x01 }; /* functions 1 only */
+
+            aml_append(ifctx2,
+                       aml_return(aml_buffer(sizeof(byte_list), byte_list)));
+        }
+        aml_append(ifctx, ifctx2);
+
+        /*
+         * Function 1
+         * A return value of {1, {0}} inciate that
+         * max supported QTG ID of 1 and recommended QTG is 0.
+         * The values here are faked to simplify emulation.
+         */
+        ifctx2 = aml_if(aml_equal(function, aml_int(1)));
+        {
+            uint16_t word_list[1] = { 0x01 };
+            uint16_t word_list2[1] = { 0 };
+            uint8_t *byte_list = (uint8_t *)word_list;
+            uint8_t *byte_list2 = (uint8_t *)word_list2;
+            Aml *pak, *pak1;
+
+            /*
+             * The return package is a package of a WORD and another package.
+             * The embedded package contains 0 or more WORDs for the
+             * recommended QTG IDs.
+             */
+            pak1 = aml_package(1);
+            aml_append(pak1, aml_buffer(sizeof(uint16_t), byte_list2));
+            pak = aml_package(2);
+            aml_append(pak, aml_buffer(sizeof(uint16_t), byte_list));
+            aml_append(pak, pak1);
+
+            aml_append(ifctx2, aml_return(pak));
+        }
+        aml_append(ifctx, ifctx2);
+    }
+    aml_append(method, ifctx);
+    aml_append(dev, method);
+}
+
 static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl.cxl_host_bridge);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 285829802b1a..623f26a16db3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1313,6 +1313,7 @@ static void build_acpi0017(Aml *table)
     method = aml_method("_STA", 0, AML_NOTSERIALIZED);
     aml_append(method, aml_return(aml_int(0x01)));
     aml_append(dev, method);
+    build_cxl_dsm_method(dev);
 
     aml_append(scope, dev);
     aml_append(table, scope);
diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
index acf441888683..8f22c71530d8 100644
--- a/include/hw/acpi/cxl.h
+++ b/include/hw/acpi/cxl.h
@@ -25,5 +25,6 @@ void cxl_build_cedt(GArray *table_offsets, GArray *table_data,
                     BIOSLinker *linker, const char *oem_id,
                     const char *oem_table_id, CXLState *cxl_state);
 void build_cxl_osc_method(Aml *dev);
+void build_cxl_dsm_method(Aml *dev);
 
 #endif



