Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C72D916F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 01:41:16 +0100 (CET)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kobvP-0007Lv-NO
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 19:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobn6-0005Lh-B5
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:40 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kobn4-0003L5-Qf
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 19:32:40 -0500
Received: by mail-wr1-x444.google.com with SMTP id i9so14744114wrc.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 16:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tiLrE9BtsdFPhNtY2DXHquXLU9v+7Ir7R7907jubF5Q=;
 b=Ymb7a8rCLcpv7noR/SwPmlyRvYtjyTQ/sWsZUhA/HwiZGSHgUfguOmsJ1jk7uSezAc
 yr6MhsCOlqkZCV8xoeFymiMORBrmto3WsLHGU3W276u5NpzqUq+nPthGLcMtM+DigrL/
 Mbu8yrSLk6/jnXSWPhn3c9oFdWT9FYg1sLQq1FdCkjZOvitmPvHzMkZLXkmdTukhs45D
 L8NB43GaUe6T6w/Q6Qxzdjl9fOkwi4uYHPfJ+EQxC5dxqifCGIG+VGBod2HxUpWul6D/
 jHIPJAP/vhTq0fOEOxb7q/MkucTu2+gUH12W6ZMngK3mNBnOfW6beIy8JRG/kQYC0mb9
 6fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tiLrE9BtsdFPhNtY2DXHquXLU9v+7Ir7R7907jubF5Q=;
 b=d4dNbMUCKJ9x3M0GS0eVfXX15FRkWTDVbtRgiqWaSlGGj5vYwGgFvzRUwWc/I2d49+
 bRGpIULkpwrJe2geL1gqItueNrtxJqkOsarEaKJ5zOXg/fGfNmEZFk4WkHmUoqEbvuDI
 L+GtozE2xn2ID2pFYcEmWPPCdC+jd8SIBhFBMc2EdV/ad5yAOQLWkDrrY7WQW0MHmmLf
 /U2I05hreaqlxzm/I89EuUdK9vUkqTltdozzH8nUsJj6m3Fo78uW/uh9Xj2yA/b8fugJ
 uTsVDsC5bv9dZv6b5H5F1iO85fDx/0SKwkTYFZiqHnQ6kGM5bmdu9qn7A/FauqibREGk
 glJw==
X-Gm-Message-State: AOAM532SGA5s8hiN/SiYJZu8bUG36Uars/lbKQb2m0zqmtsCmlovGl+z
 qV6EOKQs7g6GZidq2B1kyXvbLcnK1oM=
X-Google-Smtp-Source: ABdhPJylOGaRxQ/m73BFBMqV9all+TEgM44/aPZXDlGag/nDX0ywkOmpBPXC5gwhtcr0y4qdb0Zj9g==
X-Received: by 2002:adf:f94b:: with SMTP id q11mr26505896wrr.351.1607905957192; 
 Sun, 13 Dec 2020 16:32:37 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z2sm29036497wml.23.2020.12.13.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 16:32:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
Date: Mon, 14 Dec 2020 01:32:13 +0100
Message-Id: <20201214003215.344522-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201214003215.344522-1-f4bug@amsat.org>
References: <20201214003215.344522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA features are usually denoted in read-only bits from
CPU registers. Add the GET_FEATURE_REG_EQU() macro which
checks if a CPU register has bits set to a specific value.

Use the macro to check the 'Architecture Revision' level
of the Config0 register, which is '2' when the Release 6
ISA is implemented.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h    |  1 +
 linux-user/elfload.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 23f8c6f96cd..2639b0ea06c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -844,6 +844,7 @@ struct CPUMIPSState {
 #define CP0C0_MT   7     /*  9..7  */
 #define CP0C0_VI   3
 #define CP0C0_K0   0     /*  2..0  */
+#define CP0C0_AR_LENGTH 3
     int32_t CP0_Config1;
 #define CP0C1_M    31
 #define CP0C1_MMU  25    /* 30..25 */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b7c6d30723a..8f943f93ba7 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "disas/disas.h"
+#include "qemu/bitops.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/guest-random.h"
@@ -995,17 +996,26 @@ enum {
 #define GET_FEATURE_REG_SET(_reg, _mask, _hwcap) \
     do { if (cpu->env._reg & (_mask)) { hwcaps |= _hwcap; } } while (0)
 
+#define GET_FEATURE_REG_EQU(_reg, _start, _length, _val, _hwcap) \
+    do { \
+        if (extract32(cpu->env._reg, (_start), (_length)) == (_val)) { \
+            hwcaps |= _hwcap; \
+        } \
+    } while (0)
+
 static uint32_t get_elf_hwcap(void)
 {
     MIPSCPU *cpu = MIPS_CPU(thread_cpu);
     uint32_t hwcaps = 0;
 
-    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
+    GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, CP0C0_AR_LENGTH,
+                        2, HWCAP_MIPS_R6);
     GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
 
     return hwcaps;
 }
 
+#undef GET_FEATURE_REG_EQU
 #undef GET_FEATURE_REG_SET
 #undef GET_FEATURE_INSN
 
-- 
2.26.2


