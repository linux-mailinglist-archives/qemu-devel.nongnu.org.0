Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB538754A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:38:15 +0200 (CEST)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwB4-0002G0-Cs
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpF-0005DH-EH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp0-00013s-QV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id v12so9358875wrq.6
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8UuEZj2MtU/t2ayU7Vg0m6MuJkBOt7allBeNrJsAek=;
 b=XO+GYugoApvjZK80yNsP39obaP+dfI6/GlfcwHQxW4peotsr4MLToauLslH27Q+jIu
 on25WKdHN2KwQvEFl0dvI847QyG5XWR2VYSQ0D4CzkBJL8EwAyKvvTluc52tGNpcSz1l
 bjyzYn3ZqzN5wy7BsN++vup2YQsWWoTChG11J71ZJj77Q/URwqHSIhkfx5iKX+MgWV8E
 xSWKZPgJa1xggW4EeOwO5DMsvRSJsi9B86IczlSEGMyiohbUwBjCKKhlDGMnkaVWT1Hu
 abZUMcsaSw3j/L4j6h4o2e4+UGS9fZINhNlGdCPEDJdwgkjHCwHtL0Cx6B2m3EMykcPw
 2e5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8UuEZj2MtU/t2ayU7Vg0m6MuJkBOt7allBeNrJsAek=;
 b=fCk2vrI0TpIXnUD7ytEDK7A851ou5UD3iPWWakj3BEFNJUMlgHvShOv+LtvftCFsTS
 ksm0s8Y3M/2cxcwLVe4yQc+NaSe+ANe+Px/uotv/I+wAvqsMLELPbKQOo2kQU6Lpw9yg
 mrRcB9XBgjrOwdxrLdmi6ZTEFBTS6MjUTcSM5+jT83Brc2LR0f/Z8yLO1wugl+0Nkc1t
 QJZd0pk1BcsMQbQFGVaXX6V5e4h5DhgBSxR5r5kqFfv4xOqawvXenQTJGkw+50N52E3r
 X7ZvY9/KhLrWubwiHtGJwPEu17VDS8GP0BXbLKJBK1B2Own6uFl1TSJ0jvDnXnvCDpOy
 peJQ==
X-Gm-Message-State: AOAM533p8xSn73AnbiDHvgj96qtKzrRLXHGeAKZLyevH2cHxfyii6jXp
 XBWQ02XQ4BeA75LgwCIalaYoEQ==
X-Google-Smtp-Source: ABdhPJzowHeXI7XaYziLn6uhLYJvU7/YbmUxDaP2Jz8R4mSxWogFGy3mrhxMGPdIBb9o66hNyXv38Q==
X-Received: by 2002:a05:6000:180e:: with SMTP id
 m14mr5564572wrh.229.1621329325229; 
 Tue, 18 May 2021 02:15:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i11sm20979372wrq.26.2021.05.18.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 081081FFAB;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 22/29] tests/tcg/tricore: Add madd test
Date: Tue, 18 May 2021 10:07:13 +0100
Message-Id: <20210518090720.21915-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Message-Id: <20210305170045.869437-14-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-24-alex.bennee@linaro.org>

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
index e6a41cd1a2..0d76fc403a 100644
--- a/tests/tcg/tricore/macros.h
+++ b/tests/tcg/tricore/macros.h
@@ -9,6 +9,7 @@
 /* Register definitions */
 #define DREG_RS1 %d0
 #define DREG_RS2 %d1
+#define DREG_RS3 %d4
 #define DREG_CALC_RESULT %d1
 #define DREG_CALC_PSW %d2
 #define DREG_CORRECT_PSW %d3
@@ -85,6 +86,23 @@ test_ ## num:                                                      \
     insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2;          \
     )
 
+#define TEST_D_DDD_PSW(insn, num, result, psw, rs1, rs2, rs3) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    LI(DREG_RS3, rs3);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, DREG_RS3;      \
+    )
+
+#define TEST_D_DDI_PSW(insn, num, result, psw, rs1, rs2, imm) \
+    TEST_CASE_PSW(num, DREG_CALC_RESULT, result, psw,         \
+    LI(DREG_RS1, rs1);                                        \
+    LI(DREG_RS2, rs2);                                        \
+    rstv;                                                     \
+    insn DREG_CALC_RESULT, DREG_RS1, DREG_RS2, imm;           \
+    )
+
 #define TEST_E_ED(insn, num, res_hi, res_lo, rs1_hi, rs1_lo, rs2) \
     TEST_CASE_E(num, res_lo, res_hi,                              \
     LI(EREG_RS1_LO, rs1_lo);                                      \
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index fcc7b6c1c9..8de005523e 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -10,6 +10,7 @@ TESTS += test_dvstep.tst
 TESTS += test_fadd.tst
 TESTS += test_fmul.tst
 TESTS += test_ftoi.tst
+TESTS += test_madd.tst
 
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
diff --git a/tests/tcg/tricore/test_madd.S b/tests/tcg/tricore/test_madd.S
new file mode 100644
index 0000000000..5d839772bb
--- /dev/null
+++ b/tests/tcg/tricore/test_madd.S
@@ -0,0 +1,11 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_DDI_PSW(madd,    1, 0x0000fffd, 0x60000b80, 0x0000ffff, 0x7fffffff,2)
+    TEST_D_DDI_PSW(madd,    2, 0xffff7fff, 0x60000b80, 0xffff8001, 0x7fffffff,2)
+    TEST_D_DDD_PSW(madds.u, 3, 0xffffffff, 0x60000b80, 0x00000000, 0x80000000, \
+                             0x80000000)
+
+    TEST_PASSFAIL
+
-- 
2.20.1


