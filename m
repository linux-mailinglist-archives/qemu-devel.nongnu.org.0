Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63035274DE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 03:44:10 +0200 (CEST)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq3Io-0000dL-0P
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 21:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F8-0003K7-R1
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:23 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F7-0002hl-9m
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:22 -0400
Received: by mail-pg1-x530.google.com with SMTP id 202so10938079pgc.9
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGPG1Q4prfE/rl5qsEZlPOkMPbP4eygWnz8hzswRd/4=;
 b=cR3ws6f1/E0n2n7vF0zR7G67jsroEnEHUNMY6cXoS/GBFsBE970SVqSbPR6kfHuEWE
 bTNkyWdRYyjfFqlmjdo4LOZJ2VzvyjY66taMZiIPiTCfLuNTfr4N5toKGlSSy6sYN7PI
 UdzzSmTPFTtrK/5IL2VSm21b1hItDF505po+mrU3sK4ek8AiAA/zjHzeuVzBlWZrO0hL
 8gr+e2kSPaZijFZmEkyruzxPZSi+Cr90yYBJ7iRTDfsY33S+/gYdCNMvmrsxCn9bUqZ/
 Xawh3nu/BWcsBzOG+2evs8n1Z1ijhlVeDuvqVI/gXIfito6HVURzMRRBAOaQulpprE13
 4AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGPG1Q4prfE/rl5qsEZlPOkMPbP4eygWnz8hzswRd/4=;
 b=WR2y1068YIWMGOW1pT713nR7P2VYkvGbEJV7nEs/DBUqI2OYV+uWMvlnk4KXBwwNdE
 5aQD/lXawXzcjq+k0mc11LY/iMZnX4pMvEmb01Qbr3H2H9cFsCU1LEogSn7t4tD5e6wt
 Ujlupv/M2W03tFc6b5f6Ydy0ONNd8Jakg3rXrqfOtPrTsINTiYmiS7CsRQj9aqrtsuBq
 dgFZSmBdGsqmsvLvsIDIZIkOKc+u6nWBmYzzCSzhs5r3FzvotmrMFXLGvShVLuf4lug9
 OlhObTbziovdFqJhq4Z/HvM5s31mlM198d4YKw+EIw4Waj2qM08//j2cAJxyzBR4+tB9
 Impg==
X-Gm-Message-State: AOAM530sboqHF9z6VDBsRtO3572c3Y08p5YfeXhgW5olZ/V1+uayORFQ
 ZQBMIlfngTW+K/Q/BhVWwoBuEu0lCSU=
X-Google-Smtp-Source: ABdhPJxdD0fE1jz01AKQ4DOi818HJdV0mD+kfRa2p7eYzyLNUMND2BYOBU0loqL9wuXWCmSLNCPKRg==
X-Received: by 2002:a05:6a00:1307:b0:50d:b02e:11df with SMTP id
 j7-20020a056a00130700b0050db02e11dfmr11435637pfu.4.1652578818293; 
 Sat, 14 May 2022 18:40:18 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 21-20020a630b15000000b003db580384d6sm3963954pgl.60.2022.05.14.18.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 18:40:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 4/4] target/openrisc: Do not reset delay slot flag on early tb
 exit
Date: Sun, 15 May 2022 10:39:48 +0900
Message-Id: <20220515013948.2993495-5-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220515013948.2993495-1-shorne@gmail.com>
References: <20220515013948.2993495-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was found when running linux crypto algorithm selftests used by
wireguard.  We found that randomly the tests would fail.  We found
through investigation that a combination of a tick timer interrupt,
raised when executing a delay slot instruction at a page boundary caused
the issue.

This was caused when handling the TB_EXIT_REQUESTED case in cpu_tb_exec.
On OpenRISC, which doesn't implement synchronize_from_tb, set_pc was
being used as a fallback.  The OpenRISC set_pc implementation clears
dflag, which caused the exception handling logic to not account for the
delay slot.  This was the bug, because it meant when execution resumed
after the interrupt was handling it resumed in the wrong place.

Fix this by implementing synchronize_from_tb which simply updates pc,
and not clear the delay slot flag.

Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index dfbafc5236..41d1b2a24a 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -21,6 +21,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -30,6 +31,15 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
+                                             const TranslationBlock *tb)
+{
+    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
+
+    cpu->env.pc = tb->pc;
+}
+
+
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
@@ -186,6 +196,7 @@ static const struct SysemuCPUOps openrisc_sysemu_ops = {
 
 static const struct TCGCPUOps openrisc_tcg_ops = {
     .initialize = openrisc_translate_init,
+    .synchronize_from_tb = openrisc_cpu_synchronize_from_tb,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = openrisc_cpu_tlb_fill,
-- 
2.31.1


