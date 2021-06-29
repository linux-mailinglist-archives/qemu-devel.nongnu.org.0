Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60553B6DD2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:11:05 +0200 (CEST)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly61Y-0004f9-8t
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly60D-0003DD-KX
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:09:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly60B-0005gW-9j
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 01:09:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id y3so4718668wrq.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 22:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rqJR0T/mvKOWBAomwxj702HMWg6sJaWKC8RYzwzxKjs=;
 b=A741z+16vFyYtyJxJ0cctAOVw25th9s/C9/BY8j9VA7yGARPQszTNbojk5USIxEi3l
 RYqjYcX3oiE7EPOpbj8o+LRQkPgZ/xcW67oDBQbpGB56Cg2/C3g74OwHLRbmdEc0z9q1
 ufpIhAVBbDRSZO2oDr2/ulTUEGJglSihfPavlVrsOLUU6Z5r2hKpMPqtDmV1CEmiRIth
 WuNt83ZLqso4IhCgfidgXuTKkIqViJw+yD9mt5TifgHXRDLqWT9Tgk/hEzwXyD9nLUfu
 t68RUpgHHIare3bHfo1fjnRl2m5PxsLdv/zslJwmgWNq6GyVYraDdR+sSHfg8Kbj2j2T
 ZSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rqJR0T/mvKOWBAomwxj702HMWg6sJaWKC8RYzwzxKjs=;
 b=nMjdxVLOlzyZIZrnHAXBdgOiqsgauycmO+2MyPjo36fRGoQg0styosbjL3Tr29h+lj
 AALtZLjmPao892Yw6rsdYV97rdZRzrbNMeGkzIkj2LuKGNYwl7NFe2kcR2OMufAgCvX5
 Gia/5euiuRUSjLDIKnyxEyjzYWXG50U5SJQ6NmQNebyzliJTAmC1Q16MIulqEA2igdTG
 xznUnnYQ1nkk+rsx3wPQ2kX4cqJFQR5/3harIC2EeoHm+057PbWp/VHXSDum89pN7oTz
 bu1VmTQBIS6HeRsU6yEpEkaeKjZwAueOGVyA+8q64nJ6tLZ6/JszF+mVKBNAqiKu2Hnp
 SLuA==
X-Gm-Message-State: AOAM532uNfutISnJkGYbvn5jidqXdYWvkzeJ/4WCakAmRREXZGVCVJc7
 3DAMJE/J4DOfHxcTvzPBdQWWNC3QBg4U9A==
X-Google-Smtp-Source: ABdhPJy/BonFAOoTI33DbzYfwa9eNPYC+QEbue5Fb4NB4iiYg9OZ6NybQQzVXDWQumvUDSPZz5tnxg==
X-Received: by 2002:adf:e810:: with SMTP id o16mr6085734wrm.391.1624943377493; 
 Mon, 28 Jun 2021 22:09:37 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y20sm15239580wmi.25.2021.06.28.22.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 22:09:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tcg: Avoid including 'trace-tcg.h' in target translate.c
Date: Tue, 29 Jun 2021 07:09:35 +0200
Message-Id: <20210629050935.2570721-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
v2: Rebased due to mips-next conflict (was already queued)
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
index f454adea5e0..5fcedd85d36 100644
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
index 7f74d0e81a9..066d942b7fc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -35,7 +35,6 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#include "trace-tcg.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 46210eb696d..35d838aa068 100644
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
index 9e2cca77077..3a3ccc97eb6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -34,7 +34,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 6dd5a267a61..044e587eeb2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5cc..424ec3252ed 100644
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
index a7f5c0c8f20..5fb3350c5a8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -30,7 +30,6 @@
 #include "exec/helper-gen.h"
 #include "helper-tcg.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define PREFIX_REPZ   0x01
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154e..348fc6e844e 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -31,7 +31,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c1b13f4c7d3..5dfb08d49f1 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -29,7 +29,6 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index b4a454ec09b..37970500daa 100644
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
index a9c81f8bd5b..5db63d76093 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -33,7 +33,6 @@
 #include "exec/helper-gen.h"
 #include "exec/gen-icount.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 /* is_jmp field values */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81eac..07d79acc08f 100644
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
index 9ea941c6302..22a15ee11d8 100644
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
index e243624d2a6..d7c7f37e363 100644
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
index 93127906237..1096817ee79 100644
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
index 4bfa3179f8e..f3fe7a03699 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -29,7 +29,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "asi.h"
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d8..d5da35f4fcd 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -43,7 +43,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
-- 
2.31.1


