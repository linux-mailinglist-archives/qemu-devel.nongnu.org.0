Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A52426AE1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:34:36 +0200 (CEST)
Received: from localhost ([::1]:57064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp59-0003nQ-Cg
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowv-0002yK-KL
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowt-0006to-RU
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id m22so29410987wrb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5rte+4aR3/Vd75ajXIv4otNTx3jNTOeHVc3H5M5GOsw=;
 b=gMePPYgGei8PddWDNSqZKIhwt4Lry5ceOib9g7QyMJrtF9uPDkJcEpF9oLyA9G2Bl9
 JJqvZT/FfXdn9qme85XizD/85VjNwXyX7NZ30WNE3ZdHdnq2sR8WHwB+8Mb6xcTkZ14I
 Q4bim2IzrBKXKkiZIKYn6yR9mSCp6yjstytA1m0xhuob2Cj/rBR+nNdpaRB8MYFO4TQD
 py8POP80Ugsmz8NcYFtwe7q6rxTAbpUSQ8EWnEhElnnio+HKHtHdIj/uPAYcJXh+dVD+
 CY1XBAsfz2KycY17Nc0mtArWH6ln2isfI8fOaLqta67Rm8SXag31wNnCYdYWRrK+U83C
 xywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5rte+4aR3/Vd75ajXIv4otNTx3jNTOeHVc3H5M5GOsw=;
 b=K5xTUIGdeSK96eEHhIDJ3IIpfY3RlSc4IIpbuKlGgnbJ5NpFUCPC+c8plcH4XEUO3a
 Xz43XfiLy5gNEVK3vWP2CrG+bDfmIYEjQszSet5mPEEOEL8ofEosNAbTPolacvl2/DU/
 k21SP5Gb44QOCQDdffwwPWzExCuqT4cBXM6EbiKeHtwBv875o5qsHDlmCZzgRhwJcd9g
 L+ePl14qXHK00wViay1wNTEU4KQoIp0WsQOUMvS/3mPgnFZGB0dkKlEi9+gBQJPOZ1RK
 rT73tEV4toCjeh4Ugv4uuwpbq3n+U64jJN5s6LX87kUGPFxdYsAGmhRm6+fbMG24nCME
 VtBw==
X-Gm-Message-State: AOAM532mWq5uXaPp4FQ/Qd0KKB1RTaxYesCtzsWsTjYQ2zKcbH40ApMC
 QynYmYgcpJLJ0No+z3VVzWt4aA==
X-Google-Smtp-Source: ABdhPJzz+GhEG4dM4IV1D2WglWJmf7FNSf1epLpZFkeWfpsjNa34dm8r2S8LCZrhQeHlAY+xmRWN4A==
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr3728979wri.241.1633695962512; 
 Fri, 08 Oct 2021 05:26:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o6sm3501954wri.49.2021.10.08.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73FFC1FF9A;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 03/12] tests/tcg: move some multiarch files and make conditional
Date: Fri,  8 Oct 2021 13:25:47 +0100
Message-Id: <20211008122556.757252-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We had some messy code to filter out stuff we can't build. Lets junk
that and simplify the logic by pushing some stuff into subdirs. In
particular we move:

  float_helpers into libs - not a standalone test
  linux-test into linux - so we only build on Linux hosts

This allows for at least some of the tests to be nominally usable
by *BSD user builds.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210917162332.3511179-4-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/libs/float_helpers.c
similarity index 99%
rename from tests/tcg/multiarch/float_helpers.c
rename to tests/tcg/multiarch/libs/float_helpers.c
index bc530e5732..4e68d2b659 100644
--- a/tests/tcg/multiarch/float_helpers.c
+++ b/tests/tcg/multiarch/libs/float_helpers.c
@@ -22,7 +22,7 @@
 #include <float.h>
 #include <fenv.h>
 
-#include "float_helpers.h"
+#include "../float_helpers.h"
 
 #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux/linux-test.c
similarity index 100%
rename from tests/tcg/multiarch/linux-test.c
rename to tests/tcg/multiarch/linux/linux-test.c
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 3f283eabe6..6ccb592aac 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -8,18 +8,23 @@
 MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
 
 # Set search path for all sources
-VPATH 		+= $(MULTIARCH_SRC)
-MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
-MULTIARCH_TESTS  =$(filter-out float_helpers, $(MULTIARCH_SRCS:.c=))
+VPATH 	       += $(MULTIARCH_SRC)
+MULTIARCH_SRCS =  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
+ifneq ($(CONFIG_LINUX),)
+VPATH 	       += $(MULTIARCH_SRC)/linux
+MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
+endif
+MULTIARCH_TESTS = $(MULTIARCH_SRCS:.c=)
 
+$(info SRCS=${MULTIARCH_SRCS} and ${MULTIARCH_TESTS})
 #
 # The following are any additional rules needed to build things
 #
 
 
 float_%: LDFLAGS+=-lm
-float_%: float_%.c float_helpers.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/float_helpers.c -o $@ $(LDFLAGS)
+float_%: float_%.c libs/float_helpers.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)
 
 run-float_%: float_%
 	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<,"$< on $(TARGET_NAME)")
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 2151ea6302..d7a7385583 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -8,8 +8,12 @@
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
+ifneq ($(CONFIG_LINUX),)
 X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
+else
+TESTS=$(MULTIARCH_TESTS)
+endif
 QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
-- 
2.30.2


