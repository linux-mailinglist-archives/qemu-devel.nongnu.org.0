Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920B03C3531
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:37:01 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F2K-0002XQ-HT
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExK-0004wu-3y
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:50 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExH-0002Bo-BM
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v7so13187746pgl.2
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e4JQCoLagiwo+NLZJ+PbMyT1KAOuchSbSiU5YOPxFFA=;
 b=trAzHBptJnNp+NxqI4nE63DfDqV6VOF87YocvASlnhQ91dVjUVZwyTOClozZyxq2fU
 62YVGwSz1Iz2XBOUU+SIJfPTFd2mvqnqSfkjD8jU63qOj65WR4laPR1VlC2guvztt2QJ
 0qg0Xqw3g99VkjK4u/z3DVGuXBrh/YBqfd0/kMh9xWmVzXZS8UEca+eKCGFBWxBqUMWr
 dxgyEqjR6id+q72LmOIt45ZkblEov1HSBVGQyLF4Ro0Sf6VyCkwjj8UwVjFP48jSi7Di
 f7y+JJTD+vJB0l24LVlrScg8z3K9/dqUIOfOeqHb7Bomh6huXiYoZoVwG2NhZuVhrNBb
 WXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e4JQCoLagiwo+NLZJ+PbMyT1KAOuchSbSiU5YOPxFFA=;
 b=cZ2JcbsyVRKUy5uQkqBR9fARu6w5v327dsMGP/3FAxbmW6NBjlbXn5D1eyyizdy8NW
 Zb+JDgyUqqHoXYZ0rgZA0DEDNOS+OCZVYmigzitTTPgyeNYXfxPmlS1dcKpEdG+nldRs
 kKNueaTPzDwEsGjWCvWxnXbip/2rxUNfdJyPsbjEgBNL2UEZHBtmhelSbLObeI5sdP2E
 XqaSSZ8ex+ecUKpY3WMdknNEDP0MQEIqsW1YARqzj29b2ibUweBtFyTZVSs0vUGOigGx
 azhmUuxhmsmr/3Q2bQ+us6EDq8/ScbF2JEMfYsBDEhJwsU0b+wJwXq110M2ZCJFIhpVs
 inKQ==
X-Gm-Message-State: AOAM5306HhF3kR7lNLM5Fqz0KGw0B/D/j0F/EM4QveNQj5bOvmxNt5wL
 o6J5nqAx7cG8uniL8V1P1O9j+143L9l/VA==
X-Google-Smtp-Source: ABdhPJxcwHEX2yo1lElM9aHIuF8oN9eotJpHShOC+VhvznvTorDkGRnK01O9O3afqcVelILaKvrf4Q==
X-Received: by 2002:a65:5503:: with SMTP id f3mr39079189pgr.232.1625931106186; 
 Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/41] tcg: Avoid including 'trace-tcg.h' in target translate.c
Date: Sat, 10 Jul 2021 08:31:04 -0700
Message-Id: <20210710153143.1320521-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The root trace-events only declares a single TCG event:

  $ git grep -w tcg trace-events
  trace-events:115:# tcg/tcg-op.c
  trace-events:137:vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"

and only a tcg/tcg-op.c uses it:

  $ git grep -l trace_guest_mem_before_tcg
  tcg/tcg-op.c

therefore it is pointless to include "trace-tcg.h" in each target
(because it is not used). Remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210629050935.2570721-1-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c      | 1 -
 target/arm/translate-a64.c    | 1 -
 target/arm/translate-sve.c    | 1 -
 target/arm/translate.c        | 1 -
 target/cris/translate.c       | 1 -
 target/hppa/translate.c       | 1 -
 target/i386/tcg/translate.c   | 1 -
 target/m68k/translate.c       | 1 -
 target/microblaze/translate.c | 1 -
 target/mips/tcg/translate.c   | 1 -
 target/openrisc/translate.c   | 1 -
 target/ppc/translate.c        | 1 -
 target/rx/translate.c         | 1 -
 target/s390x/translate.c      | 1 -
 target/sh4/translate.c        | 1 -
 target/sparc/translate.c      | 1 -
 target/xtensa/translate.c     | 1 -
 17 files changed, 17 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f2922f5f8c..a607c898f4 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -28,7 +28,6 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e81cc20d04..a6dd9ec701 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -35,7 +35,6 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#include "trace-tcg.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 46210eb696..35d838aa06 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -30,7 +30,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-#include "trace-tcg.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 28e478927d..fdf2b3d1c8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -34,7 +34,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 4cfe5c86d9..a6796c83b9 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5c..424ec3252e 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -27,7 +27,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 /* Since we have a distinction between register size and address size,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b21873ed23..85b00a6945 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -30,7 +30,6 @@
 #include "exec/helper-gen.h"
 #include "helper-tcg.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define PREFIX_REPZ   0x01
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154..348fc6e844 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -31,7 +31,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c1b13f4c7d..5dfb08d49f 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -29,7 +29,6 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index ae33c75f08..cb82426f66 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -32,7 +32,6 @@
 #include "semihosting/semihost.h"
 
 #include "trace.h"
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5..5db63d7609 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -33,7 +33,6 @@
 #include "exec/helper-gen.h"
 #include "exec/gen-icount.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 /* is_jmp field values */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81ea..07d79acc08 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -32,7 +32,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c630..22a15ee11d 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -26,7 +26,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 typedef struct DisasContext {
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f350..5af68e01c6 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -42,7 +42,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 4dcfff81f6..8a25a4362e 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -28,7 +28,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4bfa3179f8..f3fe7a0369 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -29,7 +29,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "asi.h"
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d..d5da35f4fc 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -43,7 +43,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
-- 
2.25.1


