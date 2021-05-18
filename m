Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E060438751A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:28:50 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw1x-0001Qp-RZ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp2-00054F-Pg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livop-0000zo-Ud
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1059070wmh.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsF0TlqIKHgI5XTG+7/s+PUC7Yv/S8qNsIgGgG42ddk=;
 b=p1peGg3vKQUYV/MCVs4ASqBy3vZsEmt6Bd/NWJDqvl3lM4Ic+i/nFt49pCbFnuMZEB
 lVhU19A1gDNNb7g65jxQ8pav+nsg6vxup/bhv3tYuCcmY8AIxmISz+0Zj/TcoQ327qtb
 WgNu1lV+WZ7SEX3fJQfzRbF7LwJv7CilO9cB29r1HoD77k59PoDq07RXue0mOIUNBa7F
 zkbdZQCOdWv06QS0N0+M7TAYr4D0AGoD3NSsUfwkrEJs3Gw2zRJyS71tUgYQ5ND3HBAc
 c012ZLFgR45y/qr/mZQYuneOnJ1qWktQvpU7emYCF/47uUDnsV8z/I1nJA2xfVpZjTyF
 W8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsF0TlqIKHgI5XTG+7/s+PUC7Yv/S8qNsIgGgG42ddk=;
 b=s4d02dYj2rfm06IHVduPgzmXrCUHb8Mcj9vJGkZqRJkMs/eMeHVjRjXsMQacfG2Utx
 4MikJfabL1BHalAJOUfCyQzOGiqEw20muUz55JCrzxo85QrUNvpGd52oFyeDj2qXbOgY
 Jl0H8Ahci54V5kqbgzz3Iuv+dR06oZMHnEs+MeKkkgXoS8hOykKJ5Vom42y0ydIoBoBI
 EtZ4/OyYOWGpm9Ew6UeKe46r6ot1/rRR2rpqxtD0jfcTx3kZlcIZU8xRCBQEX+Qxk8nc
 4F+MCgauWEqsYSulnnvNIsiTbxZI3EDcAtZxh77aeYAwOuBj+cknQMAcAGicPit/Qh50
 o1lw==
X-Gm-Message-State: AOAM530PZ/XyuBj3thGDPOPg/RSrL2oDvEVITsX+4VjFF5Fs5J5r8lYP
 zeK8h7Av/OR3a0n7A/yoVxyduA==
X-Google-Smtp-Source: ABdhPJy07HkBNbz3yd6fnyq0WntwSj2GyjodSBnBNFh9s8MysMcpnnzZEJE8Kc6rguqz12ksQwfaMw==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr4303435wmh.151.1621329313164; 
 Tue, 18 May 2021 02:15:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p14sm20632854wrm.70.2021.05.18.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D65D1FFA6;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 18/29] tests/tcg/tricore: Add dvstep test
Date: Tue, 18 May 2021 10:07:09 +0100
Message-Id: <20210518090720.21915-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-10-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-20-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 52aa936c56..59b4b9a352 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -19,6 +19,18 @@
 
 #define DREG_DEV_ADDR %a15
 
+#define EREG_RS1 %e6
+#define EREG_RS1_LO %d6
+#define EREG_RS1_HI %d7
+#define EREG_RS2 %e8
+#define EREG_RS2_LO %d8
+#define EREG_RS2_HI %d9
+#define EREG_CALC_RESULT %e8
+#define EREG_CALC_RESULT_HI %d9
+#define EREG_CALC_RESULT_LO %d8
+#define EREG_CORRECT_RESULT_LO %d0
+#define EREG_CORRECT_RESULT_HI %d1
+
 /* Test case wrappers */
 #define TEST_CASE(num, testreg, correct, code...) \
 test_ ## num:                                     \
@@ -27,6 +39,15 @@ test_ ## num:                                     \
     mov DREG_TEST_NUM, num;                       \
     jne testreg, DREG_CORRECT_RESULT, fail        \
 
+#define TEST_CASE_E(num, correct_lo, correct_hi, code...)  \
+test_ ## num:                                              \
+    code;                                                  \
+    mov DREG_TEST_NUM, num;                                \
+    LI(EREG_CORRECT_RESULT_LO, correct_lo)                 \
+    jne EREG_CALC_RESULT_LO, EREG_CORRECT_RESULT_LO, fail; \
+    LI(EREG_CORRECT_RESULT_HI, correct_hi)                 \
+    jne EREG_CALC_RESULT_HI, EREG_CORRECT_RESULT_HI, fail;
+
 #define TEST_CASE_PSW(num, testreg, correct, correct_psw, code...) \
 test_ ## num:                                                      \
     code;                                                          \
@@ -57,7 +78,13 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
-
+#define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
+    TEST_CASE_E(num, res_lo, res_hi,                              \
+    LI(EREG_RS1_LO, rs1_lo);                                      \
+    LI(EREG_RS1_HI, rs1_hi);                                      \
+    LI(DREG_RS2, rs2);                                            \
+    insn EREG_CALC_RESULT, EREG_RS1, DREG_RS2;                    \
+    )
 
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index a9b81545e2..799b51191e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -6,6 +6,7 @@ ASFLAGS =
 TESTS += test_abs.tst
 TESTS += test_bmerge.tst
 TESTS += test_clz.tst
+TESTS += test_dvstep.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_dvstep.S b/tests/tcg/tricore/test_dvstep.S
new file mode 100644
index 0000000000..858dbc62dd
--- /dev/null
+++ b/tests/tcg/tricore/test_dvstep.S
@@ -0,0 +1,15 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    #                              Result                   RS1            RS2
+    TEST_E_ED(dvstep,   1, 0x000001ff, 0xfffe5cff, 0x00000001, 0xfffffe5c, 0x0)
+    TEST_E_ED(dvstep,   2, 0x00000000, 0x000000ff, 0x00000000, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   3, 0x0000f000, 0x000000fd, 0x010000f0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep,   4, 0xfffff000, 0x00000000, 0x7ffffff0, 0x00000000, 0x0)
+    TEST_E_ED(dvstep.u, 5, 0xffffff00, 0x100008ff, 0xffffffff, 0x00100008, 0x0)
+    TEST_E_ED(dvstep.u, 6, 0x00000100, 0x00000000, 0x08000001, 0x00000000, \
+                           0xffffff2d)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


