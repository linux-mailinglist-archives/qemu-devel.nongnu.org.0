Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE714874E2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 10:41:30 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5lkW-0007vw-U2
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 04:41:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbQ-0005y7-Bp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:05 -0500
Received: from mga05.intel.com ([192.55.52.43]:22251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yang.zhong@intel.com>)
 id 1n5lbN-00077l-0H
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 04:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641547921; x=1673083921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ws/VgoWNa3UOYS/0yITKgvzTtuOkLiQPfrBN2aWTLhg=;
 b=Rgl0EMNEktRktQLpiJc49zdkdXGR+Ys7W069U2uwOIupk8lzATXmYNN8
 nRReaqxC4kujZhVJ7V2gACm/xFOG132W2ZB5s6tAWvw6tz5ZfKqXl4PG9
 /VtSbkzw/OACC67DpNRgMO2KngN+kcurvFmxLIXr6EY1uPVXxB1F+2GB6
 vriNoa0GWtdDkmPfemlDcCYhvK9yq80LVEDV7vjLg8SId+fglDDOVn8/W
 GzBQ86NrwaXwohY8ws1CydBoZZadUK8NwQjcPU4QPe62kqtTHtRE1633J
 X1a2XefTMITFWmEXENLf8gZLaJx0JDHmkz2oPpjwkrfhWnJCOH0EFT47R g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329184203"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="329184203"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 01:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="527239102"
Received: from 984fee00bf64.jf.intel.com ([10.165.54.77])
 by fmsmga007.fm.intel.com with ESMTP; 07 Jan 2022 01:31:42 -0800
From: Yang Zhong <yang.zhong@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/7] x86: Add AMX XTILECFG and XTILEDATA components
Date: Fri,  7 Jan 2022 01:31:29 -0800
Message-Id: <20220107093134.136441-3-yang.zhong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107093134.136441-1-yang.zhong@intel.com>
References: <20220107093134.136441-1-yang.zhong@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yang.zhong@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: yang.zhong@intel.com, kevin.tian@intel.com, seanjc@google.com,
 jing2.liu@linux.intel.com, wei.w.wang@intel.com, guang.zeng@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

AMX XTILECFG and XTILEDATA are managed by XSAVE feature
set. State component 17 is used for 64-byte TILECFG register
(XTILECFG state) and component 18 is used for 8192 bytes
of tile data (XTILEDATA state).

Add AMX feature bits to x86_ext_save_areas array to set
up AMX components. Add structs that define the layout of
AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
structs sizes.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 target/i386/cpu.h | 16 +++++++++++++++-
 target/i386/cpu.c |  8 ++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7f9700544f..768a8218be 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -537,6 +537,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_XTILE_CFG_BIT            17
+#define XSTATE_XTILE_DATA_BIT           18
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -1343,6 +1345,16 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+/* Ext. save area 17: AMX XTILECFG state */
+typedef struct XSaveXTILE_CFG {
+    uint8_t xtilecfg[64];
+} XSaveXTILE_CFG;
+
+/* Ext. save area 18: AMX XTILEDATA state */
+typedef struct XSaveXTILE_DATA {
+    uint8_t xtiledata[8][1024];
+} XSaveXTILE_DATA;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1350,6 +1362,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_CFG) != 0x40);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILE_DATA) != 0x2000);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
@@ -1357,7 +1371,7 @@ typedef struct ExtSaveArea {
     uint32_t need_align;
 } ExtSaveArea;
 
-#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
 
 extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 47bc4d5c1a..dd2c919c33 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1401,6 +1401,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_XTILE_CFG_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILE_CFG),
+    },
+    [XSTATE_XTILE_DATA_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILE_DATA),
+    },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)

