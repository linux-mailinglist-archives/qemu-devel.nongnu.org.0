Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E03874F5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:21:09 +0200 (CEST)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livuW-0002hl-TI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhc-0008EQ-Di
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhV-0005Yf-S9
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so9331240wrs.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ixk657I5//cYk7jh7CcKVpBQwY+q/L7bzigPvOyEwc=;
 b=Ms7rXcqRG5LKylAj/ep4M2EqRMQFTtztBnVgVUlG6/GFL88cFNn3uN8CkB9mh7upi2
 Vrd+U/svLvwcTrInZ7ESRS8k9nf6ovcCeXRS0OMNSZzQZS+knMwF0AGhAePfDzScqkt9
 cdUng4VVZHURNDCmyMhjsi+YZH24ASw0AnyMsLynfjO/QBre2KaMYgqgY304MLf+Ww6a
 bAdQNvWoNwFhauf6SGwcwl2FtYYKJ03/ReJBwVIOzuKrXZGjH6rETGfzU/90TXUUlBl8
 7KJZv0YQwTxJ3jsYtcV8OKnyrGVj9nF0AQHClxc3wov/Bpd8KpGpKunxNheOjpydmAuq
 hbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ixk657I5//cYk7jh7CcKVpBQwY+q/L7bzigPvOyEwc=;
 b=Yxdz1gfnxciSO6yWbWxd37ZeT2sNN3vz/siT+MHR2bcOlj6V52ZzT8ER7o75VNcrXy
 ziux/hWyljaHhXNHrsnt+9zdEn3xJWE0f+TGQqblVwqOEvT1IrJTmOLwCwb01yEFPdTv
 5wuDgc9uZBQD7t4gu34vvZBNAYFExf7hA2K+3qcxi3CguPcoDAVSmX09ZFw/5R8KRs84
 UbBAAmfnuFoUMCtP7fKLaG1VItzeRLIvg7D18TuPkD1a5BpqMquuaEcHMTkkq8Z5rA0Q
 wvLXIflxmhiFN4m4BSE21jt/eOE33IfHR2VRgD35pM+qPo87YzQSgPeRWoXtBMP+z3bN
 kEsg==
X-Gm-Message-State: AOAM533NmZBaFv7ypjBmeMmmpW05QzQD280GI31KOiuy7OkAEFh+/spO
 1j165qGXeBXP6fvvbeLXwszaNQ==
X-Google-Smtp-Source: ABdhPJy/1WHFqX1WUc2uVJKbqBYpwMtRH/GyKgqi5stHnOarq5iFjjgSo34ydpkCUUPgWY6lSx1EnQ==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr5482888wrm.174.1621328860102; 
 Tue, 18 May 2021 02:07:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f188sm1954354wmf.24.2021.05.18.02.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 297F21FF9C;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 13/29] tests/tcg/tricore: Add build infrastructure
Date: Tue, 18 May 2021 10:07:04 +0100
Message-Id: <20210518090720.21915-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

this includes the Makefile and linker script to build all the tests.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-5-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-15-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 7572859317..40bba0fc4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -349,6 +349,7 @@ S: Maintained
 F: target/tricore/
 F: hw/tricore/
 F: include/hw/tricore/
+F: tests/tcg/tricore/
 
 Multiarch Linux User Tests
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/tests/tcg/tricore/Makefile.softmmu-target b/tests/tcg/tricore/Makefile.softmmu-target
new file mode 100644
index 0000000000..d64a99b95f
--- /dev/null
+++ b/tests/tcg/tricore/Makefile.softmmu-target
@@ -0,0 +1,15 @@
+TESTS_PATH = $(SRC_PATH)/tests/tcg/tricore
+
+LDFLAGS = -T$(TESTS_PATH)/link.ld
+ASFLAGS =
+
+QEMU_OPTS += -M tricore_testboard -nographic -kernel
+
+%.pS: $(TESTS_PATH)/%.S
+	$(HOST_CC) -E -o $@ $<
+
+%.o: %.pS
+	$(AS) $(ASFLAGS) -o $@ $<
+
+%.tst: %.o
+	$(LD) $(LDFLAGS) $< -o $@
diff --git a/tests/tcg/tricore/link.ld b/tests/tcg/tricore/link.ld
new file mode 100644
index 0000000000..364bcdc00a
--- /dev/null
+++ b/tests/tcg/tricore/link.ld
@@ -0,0 +1,60 @@
+/* Default linker script, for normal executables */
+OUTPUT_FORMAT("elf32-tricore")
+OUTPUT_ARCH(tricore)
+ENTRY(_start)
+
+/* the internal ram description */
+MEMORY
+{
+  text_ram (rx!p): org = 0x80000000, len = 15K
+  data_ram (w!xp): org = 0xd0000000, len = 130K
+}
+/*
+ * Define the sizes of the user and system stacks.
+ */
+__USTACK_SIZE = DEFINED (__USTACK_SIZE) ? __USTACK_SIZE : 1K ;
+/*
+ * Define the start address and the size of the context save area.
+ */
+__CSA_BEGIN =  0xd0000000 ;
+__CSA_SIZE =  8k ;
+__CSA_END = __CSA_BEGIN + __CSA_SIZE ;
+
+SECTIONS
+{
+  .text  :
+  {
+    *(.text)
+    . = ALIGN(8);
+  } > text_ram
+
+  .rodata :
+  {
+    *(.rodata)
+    *(.rodata1)
+  } > data_ram
+
+  .data :
+  {
+    . = ALIGN(8) ;
+    *(.data)
+    *(.data.*)
+    . = ALIGN(8) ;
+    __USTACK = . + __USTACK_SIZE -768;
+
+  } > data_ram
+  /*
+   * Allocate space for BSS sections.
+   */
+  .bss  :
+  {
+    BSS_BASE = . ;
+    *(.bss)
+    *(COMMON)
+    . = ALIGN(8) ;
+  } > data_ram
+  /* Make sure CSA, stack and heap addresses are properly aligned.  */
+  _. = ASSERT ((__CSA_BEGIN & 0x3f) == 0 , "illegal CSA start address") ;
+  _. = ASSERT ((__CSA_SIZE & 0x3f) == 0 , "illegal CSA size") ;
+
+}
-- 
2.20.1


