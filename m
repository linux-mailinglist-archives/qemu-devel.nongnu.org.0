Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4325F438595
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:50:55 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOuk-000620-8l
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsO-0003eY-9W
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsM-0005BN-8r
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e12so4783194wra.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PaHjQTT6bAAmhFELO4JrHHj9/5ukp2x4qgAluVj1msY=;
 b=d4tusU++8M3s+/L4hYgW+Wvj0NdENZG8iFierInblO1toh8ASjvilhBlQJBzMZ7X/5
 zFYIPkgohr+8EzKynY5qh7/Tm3viFwCmnpfjjh36G5KvrklTZrlZ1eihBEHToFReJ/4I
 yxGbTxmgx0BduxONuYLtyry08EeON/0Qh+Un2cRrEnR8bwmU/S8159tt25XUVbZ3X0eY
 4aM++ShpIvdYt2R1GkMI8imX4BiblSXL3lpt/tqMQV2zYzGjHXLTykwKmxj9FgvSvNJW
 TkD5cGxr31DvXnzOpm3ctJRy814kVsqD9rp5CPizWN/jf73gtZzbCQkMbcOtnK626fe+
 JIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PaHjQTT6bAAmhFELO4JrHHj9/5ukp2x4qgAluVj1msY=;
 b=5rbhT9hh5HizjxksUl0kBoe6QiBhaoRq0NWMOTSH4dpcXMwYIDJYhj7Xg5MAUG5JEw
 xOc2S4qQJmOmXWanl3HU8BNIeh1JR2AKMiq26jjQIgnRCVze3s2YXlsEt9tw2sA/Bd7u
 BP64QSQV5rlXdUmNmozZVAJznkSXgy4CMch5waB5It7qZBiJXYSxmPX7YqIR8KYpMTal
 jKA2BXMBUvVQzu6gSpuX5nw8B9gGTixnuJgCDS2OSyvo2qZw4SB51XefjG+5ahHkPobj
 etZUHk31EhOgI6/T5UfnKWziUQhYeaZH0nUyTDRzTPqHRDCfONJwMEwOjwLg+gr8WPV+
 L2pg==
X-Gm-Message-State: AOAM533k6nyABjPJqzvdA2c/G4p6HffdJ4M0CcCGE4wwepdiFfSAuZUp
 IG6SCQ0ANtH8PROqCcI751vYslNjiv4=
X-Google-Smtp-Source: ABdhPJzAOpPyHnayxM4LueypYP5M9j4k1tmYItr/BpO44Aq+o2h13h72UOOsdLWrfo02i06BheHWrA==
X-Received: by 2002:adf:a30c:: with SMTP id c12mr10711111wrb.366.1635025704829; 
 Sat, 23 Oct 2021 14:48:24 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 t11sm11509355wrz.65.2021.10.23.14.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/33] tests/tcg/mips: Run MSA opcodes tests on user-mode
 emulation
Date: Sat, 23 Oct 2021 23:47:34 +0200
Message-Id: <20211023214803.522078-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following commits added various user-mode tests
for various MSA instructions:

 - 0fdd986a6c8 ("Add tests for MSA integer add instructions")
 - 1be82d89011 ("Add tests for MSA integer average instructions")
 - 1d336c87a3c ("Add tests for MSA bit set instructions")
 - 1e6bea794c8 ("Add tests for MSA integer max/min instructions")
 - 2a367db039f ("Add tests for MSA pack instructions")
 - 3d9569b8550 ("Add tests for MSA move instructions")
 - 4b302ce90db ("Add tests for MSA integer multiply instructions")
 - 520e210c0aa ("Add tests for MSA integer compare instructions")
 - 53e116fed6d ("Add tests for MSA integer subtract instructions")
 - 666952ea7c1 ("Add tests for MSA bit move instructions")
 - 72f463bc080 ("Add tests for MSA integer divide instructions")
 - 8598f5fac1c ("Add tests for MSA FP max/min instructions")
 - 99d423e576a ("Add tests for MSA shift instructions")
 - a8f91dd9fd0 ("Add tests for MSA integer dot product instructions")
 - b62592ab655 ("Add tests for MSA bit counting instructions")
 - ba632924450 ("Add tests for MSA logic instructions")
 - fc76f486677 ("Add tests for MSA interleave instructions")

Cover them in the buildsys machinery so they are run automatically
when calling 'make check-tcg'.

Start running them on the mips64el target.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/tcg/mips/ase-msa.mak         | 30 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 tests/tcg/mips/Makefile.target     |  5 +++++
 tests/tcg/mips64/Makefile.target   |  9 +++++++++
 tests/tcg/mips64el/Makefile.target | 12 ++++++++++++
 tests/tcg/mipsel/Makefile.target   |  9 +++++++++
 6 files changed, 66 insertions(+)
 create mode 100644 tests/tcg/mips/ase-msa.mak
 create mode 100644 tests/tcg/mips64/Makefile.target
 create mode 100644 tests/tcg/mips64el/Makefile.target
 create mode 100644 tests/tcg/mipsel/Makefile.target

diff --git a/tests/tcg/mips/ase-msa.mak b/tests/tcg/mips/ase-msa.mak
new file mode 100644
index 00000000000..be1ba967a5b
--- /dev/null
+++ b/tests/tcg/mips/ase-msa.mak
@@ -0,0 +1,30 @@
+# -*- Mode: makefile -*-
+#
+# MIPS MSA specific TCG tests
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+MSA_DIR = $(SRC_PATH)/tests/tcg/mips/user/ase/msa
+
+MSA_TEST_CLASS = bit-count bit-move bit-set fixed-multiply \
+				float-max-min int-add int-average int-compare int-divide \
+				int-dot-product interleave int-max-min int-modulo \
+				int-multiply int-subtract logic move pack shift
+
+MSA_TEST_SRCS = $(foreach class,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(class)/*.c))
+
+MSA_TESTS = $(patsubst %.c,%,$(notdir $(MSA_TEST_SRCS)))
+
+$(MSA_TESTS): CFLAGS+=-mmsa $(MSA_CFLAGS)
+$(MSA_TESTS): %: $(foreach CLASS,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(CLASS)/%.c))
+	$(CC) -static $(CFLAGS) -o $@ \
+		$(foreach CLASS,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(CLASS)/$@.c))
+
+$(foreach test,$(MSA_TESTS),run-$(test)): QEMU_OPTS += -cpu $(MSA_CPU)
+
+# FIXME: These tests fail when using plugins
+ifneq ($(CONFIG_PLUGIN),y)
+TESTS += $(MSA_TESTS)
+endif
diff --git a/MAINTAINERS b/MAINTAINERS
index 4e77d03651b..53c6c549b80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3111,6 +3111,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: tcg/mips/
+F: tests/tcg/mips*
 
 PPC TCG target
 M: Richard Henderson <richard.henderson@linaro.org>
diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
index 1a994d5525e..191fe179119 100644
--- a/tests/tcg/mips/Makefile.target
+++ b/tests/tcg/mips/Makefile.target
@@ -17,3 +17,8 @@ TESTS += $(MIPS_TESTS)
 hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
 hello-mips: LDFLAGS+=-nostdlib
 endif
+
+# FIXME enable MSA tests
+#MSA_CFLAGS=-march=mips64r5 -mnan=2008
+#MSA_CPU=P5600
+#include $(SRC_PATH)/tests/tcg/mips/ase-msa.mak
diff --git a/tests/tcg/mips64/Makefile.target b/tests/tcg/mips64/Makefile.target
new file mode 100644
index 00000000000..d876b92f219
--- /dev/null
+++ b/tests/tcg/mips64/Makefile.target
@@ -0,0 +1,9 @@
+# -*- Mode: makefile -*-
+#
+# mips64el specific TCG tests
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# 64-bit MSA is tested on little-endian target
diff --git a/tests/tcg/mips64el/Makefile.target b/tests/tcg/mips64el/Makefile.target
new file mode 100644
index 00000000000..87c0d6dce18
--- /dev/null
+++ b/tests/tcg/mips64el/Makefile.target
@@ -0,0 +1,12 @@
+# -*- Mode: makefile -*-
+#
+# mips64el specific TCG tests
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# MSA
+MSA_CFLAGS=-march=mips64r5 -mnan=legacy
+MSA_CPU=Loongson-3A4000
+include $(SRC_PATH)/tests/tcg/mips/ase-msa.mak
diff --git a/tests/tcg/mipsel/Makefile.target b/tests/tcg/mipsel/Makefile.target
new file mode 100644
index 00000000000..c8acacb4497
--- /dev/null
+++ b/tests/tcg/mipsel/Makefile.target
@@ -0,0 +1,9 @@
+# -*- Mode: makefile -*-
+#
+# mipsel specific TCG tests
+#
+# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# 32-bit MSA is tested on big-endian target
-- 
2.31.1


