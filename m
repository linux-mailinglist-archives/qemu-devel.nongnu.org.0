Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F063874E8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:17:46 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livrF-0005wK-DR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhc-0008GS-TI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhY-0005ZS-2Q
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id y14so7242030wrm.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjZ2XX0/mEu1lfy1D32TpTcB0SCk0bY9PontMklLOBw=;
 b=xHu8kJhwWpIOpJqouXDdPS7H4y1pdIyJUp+a8v4l+8LlrPU9EbV56RsWmBAc+DwbS3
 COftDckQYe936aHPLg+0z8J2Mr5Ui210QEb43T38GSV0G8oAurGN8fKVd+yZL9LIqlYc
 EqyHWJT0lbnoUE7xFjVNgkBGZR4ubXK7U40JO1FRsGJpFjX/tmOErclUtooUvQJN0pNP
 4qlQuqH3xVze/P+cryaOkpt4w9oyzGzgv0V/Epg6tCdGAxKCka+5YwBA9KEeITV0t4rS
 +h9cm8YWU4jLzjzTXFRqE7f2Vj5bmK1auFNpYyb6zRMSZP2UMcPkUHiirj1V3VO3bLGr
 d5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjZ2XX0/mEu1lfy1D32TpTcB0SCk0bY9PontMklLOBw=;
 b=LAtZV98lNK1b/K3ZgWa4q0T2SL/VN1apTXBOAWj61j0UHAFr2oVE5A1y0wUBrj2xy9
 kbgLYCWjA2BC4rtZgR+hhO44jo1Wal84pKpp1s9LGCS9Em0bT/UkIx/IhGH1Ap3cxXQi
 0CzhX5DPCryDLZhafFFrVC28X1kg+7gwXxHoAhu53orz9ZRHkapEdXbS/gnarbk38R2z
 I1HHo3E4CC8rlnW+cTEwsEFOTNqQEqW8Su3AHropFVrmEe7T5/WiCw11q/ThK8YB2Hsp
 twdR/sGXfXUM1KdaJndG9RyEKwM6f5bKYcHMGyG3axyc5JaXGRF6azWYiLeGmD8ZRf9G
 oqRw==
X-Gm-Message-State: AOAM531B483phd0e2X5LXFcomkKz43TgZkj6lgmZrM4NAcRB9gnkE3Gi
 S9X2D3YqXmbh0FtLmCqoSwShIgDFoMOhYg==
X-Google-Smtp-Source: ABdhPJxas54KIUeXJ5QeY5w4vfMn+0pwIK0AQYkRq8XVXrCyrG5QQJuSO9F0vO21mToh7JUj1m8otg==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr5618549wru.363.1621328862726; 
 Tue, 18 May 2021 02:07:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm2596552wmb.1.2021.05.18.02.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E6E01FF9F;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 16/29] tests/tcg/tricore: Add bmerge test
Date: Tue, 18 May 2021 10:07:07 +0100
Message-Id: <20210518090720.21915-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20210305170045.869437-8-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-18-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index 76c133132a..52aa936c56 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -8,7 +8,10 @@
 #define TESTDEV_ADDR 0xf0000000
 /* Register definitions */
 #define DREG_RS1 %d0
+#define DREG_RS2 %d1
 #define DREG_CALC_RESULT %d1
+#define DREG_CALC_PSW %d2
+#define DREG_CORRECT_PSW %d3
 #define DREG_TEMP_LI %d10
 #define DREG_TEMP %d11
 #define DREG_TEST_NUM %d14
@@ -24,6 +27,17 @@ test_ ## num:                                     \
     mov DREG_TEST_NUM, num;                       \
     jne testreg, DREG_CORRECT_RESULT, fail        \
 
+#define TEST_CASE_PSW(num, testreg, correct, correct_psw, code...) \
+test_ ## num:                                                      \
+    code;                                                          \
+    LI(DREG_CORRECT_RESULT, correct)                               \
+    mov DREG_TEST_NUM, num;                                        \
+    jne testreg, DREG_CORRECT_RESULT, fail;                        \
+    mfcr DREG_CALC_PSW, $psw;                                      \
+    LI(DREG_CORRECT_PSW, correct_psw)                              \
+    mov DREG_TEST_NUM, num;                                        \
+    jne DREG_CALC_PSW, DREG_CORRECT_PSW, fail;
+
 /* Actual test case type
  * e.g inst %dX, %dY      -> TEST_D_D
  *     inst %dX, %dY, %dZ -> TEST_D_DD
@@ -35,6 +49,16 @@ test_ ## num:                                     \
     insn DREG_CALC_RESULT, DREG_RS1;          \
     )
 
+#define TEST_D_DD_PSW(insn, num, result, psw, rs1, rs2) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,   \
+    LI(DREG_RS1, rs1);                                  \
+    LI(DREG_RS2, rs2);                                  \
+    rstv;                                               \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
+    )
+
+
+
 /* Pass/Fail handling part */
 #define TEST_PASSFAIL                       \
         j pass;                             \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index 3b048e49fa..de6a2cc88e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -4,6 +4,7 @@ LDFLAGS = -T$(TESTS_PATH)/link.ld
 ASFLAGS =
 
 TESTS += test_abs.tst
+TESTS += test_bmerge.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_bmerge.S b/tests/tcg/tricore/test_bmerge.S
new file mode 100644
index 0000000000..8a0fa6d3f6
--- /dev/null
+++ b/tests/tcg/tricore/test_bmerge.S
@@ -0,0 +1,8 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DD_PSW(bmerge, 1, 0x555557f7, 0x00000b80, 0x0000001d, 0x0000ffff)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


