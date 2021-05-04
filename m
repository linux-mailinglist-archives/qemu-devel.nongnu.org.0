Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F093C372890
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:14:11 +0200 (CEST)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds4B-0007Jf-1b
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrze-0002RZ-NU
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrza-0006iv-Tl
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l2so8726302wrm.9
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDzjlNZz/GlC70CH5HhSB4c445lM3jEK8WC7UgJUryw=;
 b=ubxfGTD/vK0TaiENyKZAbHDbxUMfzuWYXM78xIyWz8RoaWQ7WTeJk3jr8U0n5WevMG
 8+ckljRNgLuY6HMmOjN3kZeNs5YARnsoMoh1/LKO48snUqGQJ4rXTRUSkY5O8fkW0MQa
 CnPsQqEytooFr4mTuDnOJtHhkQFJTL8PGRqat1KvKASOHRR7qXxKXHcnU2nwAsbv6ycf
 +XCIAUzCGOWJv40sMKKPoR/x4fuEnCxpYKzXa2VR7iVbTf+J/ZMnzU6e7fgq39a6Z1bP
 EfjBsbaOKVulApAjjAysxtCfHsTzuwyF9O2kq+cwcz5AWbtrvPNwSsMPXo6px+0Dps+K
 l8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDzjlNZz/GlC70CH5HhSB4c445lM3jEK8WC7UgJUryw=;
 b=nlfJpBsZChetb4hxvMP+ASIDIycql/Xy106zV68PnU2S3S55z6vLST00lXH0Nj4KkT
 cJlHGmK7B9jM2mM95MXnGqiBUMz/xe5BmUMEyAKBrlI4P1LLY1DeRGqtZH0WHGlSrBTt
 COLLyFd5KRfuHOET60RA5IgYNFqJPxCkwdSTvZ8Yzx/9jA7p5QhXs7b94d5UBBTvTu1y
 XUEf2kXt9XglmF8JZfPetjgGQBrGABbz7D4GMqOqAUHihcRACtIqzuys3U0H3wwsnfeZ
 9RG5r2PftIx7o+LuEPJy7OeuzjVfVZAuvm/op29RWZM5wMIpjQpDdw73SyBZUAvqAwQ2
 6mjw==
X-Gm-Message-State: AOAM533EYkeSwcYuwbZNHSumyxr6DblxC5vGa5kaXCVC+4rjx2eBocxX
 MwvE6sJ7pCG2VWUhnjIM3hs1PFnbcqVUTQ==
X-Google-Smtp-Source: ABdhPJwlD+KzaulwIP+tG0tAjoB7z8lrqXhHRiX2yABOpqRwQXcGQMyJ1FvHIdZm0QBPhMht4WBeKA==
X-Received: by 2002:adf:f38c:: with SMTP id m12mr25117367wro.282.1620122965158; 
 Tue, 04 May 2021 03:09:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm1916301wmc.44.2021.05.04.03.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4049C1FF9F;
 Tue,  4 May 2021 11:02:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/30] tests/tcg/tricore: Add macros to create tests and
 first test 'abs'
Date: Tue,  4 May 2021 11:02:09 +0100
Message-Id: <20210504100223.25427-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

This kind of tests is inspired by the riscv-tests repository. This adds
macros that makes it easy to create single instruction self containing
tests.

It is achieved by macros that create a test sequence for an
instruction and check for a supplied correct value. If the value is correct the
next instruction is tested. Otherwise we jump to fail handler that writes is
test number as a status code back to qemu that then exits on that status code.
If all tests pass we write back 0 as a status code and exit.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-Id: <20210305170045.869437-7-kbastian@mail.uni-paderborn.de>
[AJB: add container_hosts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/tricore/macros.h                | 53 +++++++++++++++++++++++
 tests/tcg/configure.sh                    |  6 +++
 tests/tcg/tricore/Makefile.softmmu-target |  2 +
 tests/tcg/tricore/test_abs.S              |  7 +++
 4 files changed, 68 insertions(+)
 create mode 100644 tests/tcg/tricore/macros.h
 create mode 100644 tests/tcg/tricore/test_abs.S

diff --git a/tests/tcg/tricore/macros.h b/tests/tcg/tricore/macros.h
new file mode 100644
index 0000000000..76c133132a
--- /dev/null
+++ b/tests/tcg/tricore/macros.h
@@ -0,0 +1,53 @@
+/* Helpers */
+#define LI(reg, val)           \
+    mov.u reg, lo:val;         \
+    movh DREG_TEMP_LI, up:val; \
+    or reg, reg, DREG_TEMP_LI; \
+
+/* Address definitions */
+#define TESTDEV_ADDR 0xf0000000
+/* Register definitions */
+#define DREG_RS1 %d0
+#define DREG_CALC_RESULT %d1
+#define DREG_TEMP_LI %d10
+#define DREG_TEMP %d11
+#define DREG_TEST_NUM %d14
+#define DREG_CORRECT_RESULT %d15
+
+#define DREG_DEV_ADDR %a15
+
+/* Test case wrappers */
+#define TEST_CASE(num, testreg, correct, code...) \
+test_ ## num:                                     \
+    code;                                         \
+    LI(DREG_CORRECT_RESULT, correct)              \
+    mov DREG_TEST_NUM, num;                       \
+    jne testreg, DREG_CORRECT_RESULT, fail        \
+
+/* Actual test case type
+ * e.g inst %dX, %dY      -> TEST_D_D
+ *     inst %dX, %dY, %dZ -> TEST_D_DD
+ *     inst %eX, %dY, %dZ -> TEST_E_DD
+ */
+#define TEST_D_D(insn, num, result, rs1)      \
+    TEST_CASE(num, DREG_CALC_RESULT, result,  \
+    LI(DREG_RS1, rs1);                        \
+    insn DREG_CALC_RESULT, DREG_RS1;          \
+    )
+
+/* Pass/Fail handling part */
+#define TEST_PASSFAIL                       \
+        j pass;                             \
+fail:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j fail;                             \
+pass:                                       \
+        LI(DREG_TEMP, TESTDEV_ADDR)         \
+        mov.a DREG_DEV_ADDR, DREG_TEMP;     \
+        mov DREG_TEST_NUM, 0;               \
+        st.w [DREG_DEV_ADDR], DREG_TEST_NUM;\
+        debug;                              \
+        j pass;
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed378e7840..11009fe433 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -180,6 +180,12 @@ for target in $target_list; do
       container_image=debian-sparc64-cross
       container_cross_cc=sparc64-linux-gnu-gcc
       ;;
+    tricore-softmmu)
+      container_hosts=x86_64
+      container_image=debian-tricore-cross
+      container_cross_as=tricore-as
+      container_cross_ld=tricore-ld
+      ;;
     x86_64-*)
       container_hosts="aarch64 ppc64el x86_64"
       container_image=debian-amd64-cross
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
index d64a99b95f..3b048e49fa 100644
--- a/tests/tcg/tricore/Makefile.softmmu-target
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -3,6 +3,8 @@ TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
 LDFLAGS = -T$(TESTS_PATH)/link.ld
 ASFLAGS =
 
+TESTS += test_abs.tst
+
 QEMU_OPTS += -M tricore_testboard -nographic -kernel
 
 %.pS: $(TESTS_PATH)/%.S
diff --git a/tests/tcg/tricore/test_abs.S b/tests/tcg/tricore/test_abs.S
new file mode 100644
index 0000000000..e42240159a
--- /dev/null
+++ b/tests/tcg/tricore/test_abs.S
@@ -0,0 +1,7 @@
+#include "macros.h"
+.text
+.global _start
+_start:
+    TEST_D_D(abs, 1, 0, 0)
+
+    TEST_PASSFAIL
-- 
2.20.1


