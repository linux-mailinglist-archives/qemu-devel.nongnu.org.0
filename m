Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE66BA546
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:36:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGyR-0001rm-3W; Tue, 14 Mar 2023 22:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcGyO-0001rL-Km
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 22:34:40 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcGyM-0005cg-RK
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 22:34:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id y2so17301307pjg.3
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 19:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678847676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y6DLzmJoWt1vmQbipWXDqDJft5MZbWaEV1+Jevg7c1g=;
 b=qguhIk2HNbFNZG9Zfw5oIKcEj+35bvHt6GRN08/P8q5tsnmnIcihPlAGCTVsuonF5B
 jz3s31FheSKm7wxb2EkJowpssNWoDbpIN4MAFD8r1nJvrM/GDFRFeRoL6cVueu3TL4v8
 LsG0QzHZH4R0qNfo5+MpUEKDofi4AAe0zYUFkHGfN34VnwNhOH06hVGPobInWjWGAxa8
 FWElM1YhZo0K2j3b1vSDixjknVpDTjdCC6U4pfHpLU1+QXIRwBkDPIwvhVePAAtnCjUF
 P+1iG4u5P/vmoI/m1RA0nUokEMJzD3gJyG13O24JXRunRdOKVUik67Ljk76SUkPUAhEG
 GpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678847676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y6DLzmJoWt1vmQbipWXDqDJft5MZbWaEV1+Jevg7c1g=;
 b=nIo/7zvmV9bhvi7QyVnA6hygw1zImdvi9wDV7WXDR0IBPbCpF3QYzORR4H/W9ETOtz
 NHIuRDMks6K+UuXLJ3f0Mvt4IACAZG716PiXgZI3sUrsyUw2Cb2g2kOItiHZx6CKtaRd
 uDnBCD1jpIP1egQ/nifZo2qA2pOe52r8C977jQFN9qJvntWTOSi59crdK2GVISmz2c0D
 KC/QcKULHlUfgJMzyJ5KGdFa2oxgXszzBGRK1/aoP+XU83hGLuX0HeiN0ClPGARspU09
 xCF7GgbLFZr+qYOByfC/ZdQWQxW3Svno7iFCq574KEn5dzAQYxYxv40pnEzGdrpsydp/
 xbHA==
X-Gm-Message-State: AO0yUKULADbgJ9xEXYWjieMx4txHZ+LdrW4Gh2+vHvX8Q40rKW3Caqja
 epTCz4jvSQfZftkU3dQj81D5sWJnrpc=
X-Google-Smtp-Source: AK7set8J55EA7f66NtsuKERWS7wA3b5H3cPlBdhd/N95z8J3ehVWWr/dVGZx1FEdsQDGtDwNTIc6sA==
X-Received: by 2002:a17:903:1106:b0:19d:7a4:4063 with SMTP id
 n6-20020a170903110600b0019d07a44063mr1368608plh.46.1678847676487; 
 Tue, 14 Mar 2023 19:34:36 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:6cf0:82fd:def:4205])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a1709029a0900b0019ac7319ed1sm2398763plp.126.2023.03.14.19.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 19:34:36 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] tests/tcg/xtensa: allow testing big-endian cores
Date: Tue, 14 Mar 2023 19:34:27 -0700
Message-Id: <20230315023427.2224654-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Don't disable all big-endian tests, instead check whether $(CORE) is
supported by the configured $(QEMU) and enable tests if it is.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                                | 1 +
 tests/tcg/xtensa/Makefile.softmmu-target   | 4 ++--
 tests/tcg/xtensaeb/Makefile.softmmu-target | 5 +++++
 3 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/xtensaeb/Makefile.softmmu-target

diff --git a/MAINTAINERS b/MAINTAINERS
index d51ddee0b94b..94faa804610e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -371,6 +371,7 @@ S: Maintained
 F: target/xtensa/
 F: hw/xtensa/
 F: tests/tcg/xtensa/
+F: tests/tcg/xtensaeb/
 F: disas/xtensa.c
 F: include/hw/xtensa/xtensa-isa.h
 F: configs/devices/xtensa*/default.mak
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 948c0e6506bd..ba6cd9fde3fe 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -2,7 +2,8 @@
 # Xtensa softmmu tests
 #
 
-ifneq ($(TARGET_BIG_ENDIAN),y)
+CORE=dc232b
+ifneq ($(shell $(QEMU) -cpu help | grep -w $(CORE)),)
 
 XTENSA_SRC = $(SRC_PATH)/tests/tcg/xtensa
 XTENSA_ALL = $(filter-out $(XTENSA_SRC)/linker.ld.S,$(wildcard $(XTENSA_SRC)/*.S))
@@ -15,7 +16,6 @@ XTENSA_USABLE_TESTS = $(filter-out $(XTENSA_BROKEN_TESTS), $(XTENSA_TESTS))
 TESTS += $(XTENSA_USABLE_TESTS)
 VPATH += $(XTENSA_SRC)
 
-CORE=dc232b
 QEMU_OPTS+=-M sim -cpu $(CORE) -nographic -semihosting -icount 6 $(EXTFLAGS) -kernel
 
 INCLUDE_DIRS = $(SRC_PATH)/target/xtensa/core-$(CORE)
diff --git a/tests/tcg/xtensaeb/Makefile.softmmu-target b/tests/tcg/xtensaeb/Makefile.softmmu-target
new file mode 100644
index 000000000000..4204a96d53c0
--- /dev/null
+++ b/tests/tcg/xtensaeb/Makefile.softmmu-target
@@ -0,0 +1,5 @@
+#
+# Xtensa softmmu tests
+#
+
+include $(SRC_PATH)/tests/tcg/xtensa/Makefile.softmmu-target
-- 
2.30.2


