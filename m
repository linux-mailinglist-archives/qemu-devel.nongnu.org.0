Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C831A3BC9E6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:27:17 +0200 (CEST)
Received: from localhost ([::1]:50468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iIO-0007Ed-Pq
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htx-00012u-23
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htp-0002IO-V0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 j39-20020a05600c1c27b029020028e48b8fso1301821wms.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ct6r5RZE0o1S7vdFdC1Guo8aTFQIoeJvAIVNu2PxIuI=;
 b=ValOFLSGLR7cAZSSe16iu2XAXy4oavw+LZwkCj4WDEac/CXm2hK3ScekuINIoPq9q/
 wQVuIcYLD8x5mC4PTRG8N0El/7SUnisYKxapIG1Y+svCGCbcUSjXE54HpZt41pPF1vKA
 J7nom7TbFjEUtzFwnHmmKCpoWgAF9pQJkMMJIEU3oORnaZka+0JlFBXC1izsl+609lNZ
 Gj26m4+/MUyW1Xh+nIuvZYWVKGqpXgrztbe0vIYvXZHVcXswbAcnrEb4du5GmMA2Wc/k
 rjCaucgoqIP9Y7Jt3lxDqPrURAbYy9ttisndkbCeZlCFpJu1FL9kmBv0Fl6FAkL/cu5T
 2RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ct6r5RZE0o1S7vdFdC1Guo8aTFQIoeJvAIVNu2PxIuI=;
 b=uNu3hCSwRSMl2r9OtE1yrq/CdO5Yh2AYjdW+H7W/1kzwvDYQ1bhi9SCTRc9qPrCo2w
 FkkJLqxrtLA9/tFWOt4z5v5lwk0956R5MXd63mOB2dTqXTIWKigNbFFrG2YwlNsUgc1e
 5YVcxBZNCj0+V0algLWM+hhTYHBknhtv/ZRVLFG75RRNDBinaVo6V6eInz7spsExUCSV
 24eHvaJDu/rE+oACc+sxromki751MnvDCsug6NMikFzQeEEcHI3iHw7cb5U+vfWqEyvN
 DOAGlkrhn2vT+MYZWwLZeu0DAye9sG01+ylXquJwZFul3OOAtS2zhm/NsMTAlj7msumg
 VEPg==
X-Gm-Message-State: AOAM530mXfcg2VUCquftKq1pHNPwYR0SyVcjKrT6P++0OYw92LWuZ9A5
 h0BDkX4t4Xio0ImNc6Jz3YCTkaGa2U4=
X-Google-Smtp-Source: ABdhPJxr6D0GplibUUtX6m0evBhhb90mu2lJoyuxqnpolgsNSheOB0/XF+Qy2VmqWah8t4hA4wOpIQ==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr3215779wmq.145.1625565712529; 
 Tue, 06 Jul 2021 03:01:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/40] target/i386: Move X86XSaveArea into TCG
Date: Tue,  6 Jul 2021 12:01:16 +0200
Message-Id: <20210706100141.303960-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Given that TCG is now the only consumer of X86XSaveArea, move the
structure definition and associated offset declarations and checks to a
TCG specific header.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-9-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h            | 57 ------------------------------------
 target/i386/tcg/fpu_helper.c |  1 +
 target/i386/tcg/tcg-cpu.h    | 57 ++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 57 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 96b672f8bd..0f7ddbfeae 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1305,48 +1305,6 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
-#define XSAVE_FCW_FSW_OFFSET    0x000
-#define XSAVE_FTW_FOP_OFFSET    0x004
-#define XSAVE_CWD_RIP_OFFSET    0x008
-#define XSAVE_CWD_RDP_OFFSET    0x010
-#define XSAVE_MXCSR_OFFSET      0x018
-#define XSAVE_ST_SPACE_OFFSET   0x020
-#define XSAVE_XMM_SPACE_OFFSET  0x0a0
-#define XSAVE_XSTATE_BV_OFFSET  0x200
-#define XSAVE_AVX_OFFSET        0x240
-#define XSAVE_BNDREG_OFFSET     0x3c0
-#define XSAVE_BNDCSR_OFFSET     0x400
-#define XSAVE_OPMASK_OFFSET     0x440
-#define XSAVE_ZMM_HI256_OFFSET  0x480
-#define XSAVE_HI16_ZMM_OFFSET   0x680
-#define XSAVE_PKRU_OFFSET       0xa80
-
-typedef struct X86XSaveArea {
-    X86LegacyXSaveArea legacy;
-    X86XSaveHeader header;
-
-    /* Extended save areas: */
-
-    /* AVX State: */
-    XSaveAVX avx_state;
-
-    /* Ensure that XSaveBNDREG is properly aligned. */
-    uint8_t padding[XSAVE_BNDREG_OFFSET
-                    - sizeof(X86LegacyXSaveArea)
-                    - sizeof(X86XSaveHeader)
-                    - sizeof(XSaveAVX)];
-
-    /* MPX State: */
-    XSaveBNDREG bndreg_state;
-    XSaveBNDCSR bndcsr_state;
-    /* AVX-512 State: */
-    XSaveOpmask opmask_state;
-    XSaveZMM_Hi256 zmm_hi256_state;
-    XSaveHi16_ZMM hi16_zmm_state;
-    /* PKRU State: */
-    XSavePKRU pkru_state;
-} X86XSaveArea;
-
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1355,21 +1313,6 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
-
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
     uint32_t offset, size;
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 4e11965067..74bbe94b80 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include <math.h>
 #include "cpu.h"
+#include "tcg-cpu.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
diff --git a/target/i386/tcg/tcg-cpu.h b/target/i386/tcg/tcg-cpu.h
index 36bd300af0..53a8494455 100644
--- a/target/i386/tcg/tcg-cpu.h
+++ b/target/i386/tcg/tcg-cpu.h
@@ -19,6 +19,63 @@
 #ifndef TCG_CPU_H
 #define TCG_CPU_H
 
+#define XSAVE_FCW_FSW_OFFSET    0x000
+#define XSAVE_FTW_FOP_OFFSET    0x004
+#define XSAVE_CWD_RIP_OFFSET    0x008
+#define XSAVE_CWD_RDP_OFFSET    0x010
+#define XSAVE_MXCSR_OFFSET      0x018
+#define XSAVE_ST_SPACE_OFFSET   0x020
+#define XSAVE_XMM_SPACE_OFFSET  0x0a0
+#define XSAVE_XSTATE_BV_OFFSET  0x200
+#define XSAVE_AVX_OFFSET        0x240
+#define XSAVE_BNDREG_OFFSET     0x3c0
+#define XSAVE_BNDCSR_OFFSET     0x400
+#define XSAVE_OPMASK_OFFSET     0x440
+#define XSAVE_ZMM_HI256_OFFSET  0x480
+#define XSAVE_HI16_ZMM_OFFSET   0x680
+#define XSAVE_PKRU_OFFSET       0xa80
+
+typedef struct X86XSaveArea {
+    X86LegacyXSaveArea legacy;
+    X86XSaveHeader header;
+
+    /* Extended save areas: */
+
+    /* AVX State: */
+    XSaveAVX avx_state;
+
+    /* Ensure that XSaveBNDREG is properly aligned. */
+    uint8_t padding[XSAVE_BNDREG_OFFSET
+                    - sizeof(X86LegacyXSaveArea)
+                    - sizeof(X86XSaveHeader)
+                    - sizeof(XSaveAVX)];
+
+    /* MPX State: */
+    XSaveBNDREG bndreg_state;
+    XSaveBNDCSR bndcsr_state;
+    /* AVX-512 State: */
+    XSaveOpmask opmask_state;
+    XSaveZMM_Hi256 zmm_hi256_state;
+    XSaveHi16_ZMM hi16_zmm_state;
+    /* PKRU State: */
+    XSavePKRU pkru_state;
+} X86XSaveArea;
+
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fcw) != XSAVE_FCW_FSW_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.ftw) != XSAVE_FTW_FOP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpip) != XSAVE_CWD_RIP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpdp) != XSAVE_CWD_RDP_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.mxcsr) != XSAVE_MXCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.fpregs) != XSAVE_ST_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, legacy.xmm_regs) != XSAVE_XMM_SPACE_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
+
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
 
 #endif /* TCG_CPU_H */
-- 
2.31.1



