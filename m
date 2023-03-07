Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E006AFAB0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh24-0000q0-4P; Tue, 07 Mar 2023 18:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh22-0000lI-7M
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:46 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh20-0002h6-BS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so13763271wrh.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UexqQ8oqlDlV/fYFNmt7r3WxJQAbUfO1HiCV98NJrIs=;
 b=xpHqSQjC6XxNvGRkFLSBULrlNVEwLrfAQR4at4tDWIiLtfpspvR5jbl3QyaUZnax1Z
 sM3l8T9ik/gJt/mAJH/Mva11HaqEw8sr2s+/infKaLe0L0A4ETxhdf4yclSEmlY1Sq7D
 /F3Dwlk04isG+Zh6SOFypAohSGzKB68n5Yov4jP+0b1iOnU9+Z9O2dRDJEM4sFp1tf+0
 NRU/aVDe8JZy65iWLNUwWQTmEdc/eYr2BlvXWRmFqtUUGapHCruSe/4c/g7HU6Wn7gDQ
 4bG/8kvIqdKnXMBxE5DtxpUrHIw2uiHOTrxV8MdIKz/dzZ2yRaJ9VkVQ0qzCH/L85YHs
 /3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UexqQ8oqlDlV/fYFNmt7r3WxJQAbUfO1HiCV98NJrIs=;
 b=WgzAb3Y6gJEQE1+E75R2uoaTEEWlahcPKZf1Q3xucVz5rq1OSPogOyBNvGRnrbVtyS
 3qBbFHVfQaOrXtef0xtC85QsmXBDiVPNvejFA9R5zyr9IxmV4CLoQMXqR1z5u1TP4Cox
 vw5ZoG1AeDeJ2VSNm34ScYya89BJVTw0ByKH/M52B4rLjLx6Lbjyuz7koxLuwTDlT8m4
 Ap3LefEy54QCKUuJH6tzI9I+x//HAiTr/HBsHxgPVXTARujzTUg6uI6SwaDOvBxyKC45
 3oyuVoJQqSXfdK8OM1bdGg6Te0p00Sc0YH6YOKbx0dwTUJUaal/B48x9If/PQcJK1fU1
 xE0w==
X-Gm-Message-State: AO0yUKU8ztFdnx/2KiFbDSX1Ftma3z5mEsEvBMS82ApCGx0p29U53jMa
 EGBBYeBbBu5xA5eayL70SvaOVhbEpLKPYxvxaPk=
X-Google-Smtp-Source: AK7set8h9djBO4YR7FnvSTNruVytS5s4381JUCTLlLdU8ofPvXLMnm4F0ywUwwihVTaPcsuegaJHhg==
X-Received: by 2002:adf:ea47:0:b0:2cb:4df5:932d with SMTP id
 j7-20020adfea47000000b002cb4df5932dmr9905010wrn.22.1678232862757; 
 Tue, 07 Mar 2023 15:47:42 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfd4d1000000b002c6d0462163sm13738825wrk.100.2023.03.07.15.47.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Marcin Nowakowski <marcin.nowakowski@fungible.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 05/20] target/mips: Implement CP0.Config7.WII bit support
Date: Wed,  8 Mar 2023 00:46:56 +0100
Message-Id: <20230307234711.55375-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Marcin Nowakowski <marcin.nowakowski@fungible.com>

Some pre-release 6 cores use CP0.Config7.WII bit to indicate that a
disabled interrupt should wake up a sleeping CPU.
Enable this bit by default for M14K(c) and P5600. There are potentially
other cores that support this feature, but I do not have a complete
list.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230216051717.3911212-4-marcin.nowakowski@fungible.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu-defs.c.inc | 3 +++
 target/mips/cpu.c          | 4 +++-
 target/mips/cpu.h          | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 480e60aeec..fdde04dfb9 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -333,6 +333,7 @@ const mips_def_t mips_defs[] =
         .CP0_Config1 = MIPS_CONFIG1,
         .CP0_Config2 = MIPS_CONFIG2,
         .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (1 << CP0C3_VInt),
+        .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
         .SYNCI_Step = 32,
@@ -354,6 +355,7 @@ const mips_def_t mips_defs[] =
                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
         .CP0_Config2 = MIPS_CONFIG2,
         .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),
+        .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
         .SYNCI_Step = 32,
@@ -392,6 +394,7 @@ const mips_def_t mips_defs[] =
         .CP0_Config5_rw_bitmask = (1 << CP0C5_K) | (1 << CP0C5_CV) |
                                   (1 << CP0C5_MSAEn) | (1 << CP0C5_UFE) |
                                   (1 << CP0C5_FRE) | (1 << CP0C5_UFR),
+        .CP0_Config7 = 1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 0,
         .SYNCI_Step = 32,
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 05caf54999..543da911e3 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -143,11 +143,13 @@ static bool mips_cpu_has_work(CPUState *cs)
     /*
      * Prior to MIPS Release 6 it is implementation dependent if non-enabled
      * interrupts wake-up the CPU, however most of the implementations only
-     * check for interrupts that can be taken.
+     * check for interrupts that can be taken. For pre-release 6 CPUs,
+     * check for CP0 Config7 'Wait IE ignore' bit.
      */
     if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
         cpu_mips_hw_interrupts_pending(env)) {
         if (cpu_mips_hw_interrupts_enabled(env) ||
+            (env->CP0_Config7 & (1 << CP0C7_WII)) ||
             (env->insn_flags & ISA_MIPS_R6)) {
             has_work = true;
         }
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index caf2b06911..142c55af47 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -980,6 +980,7 @@ typedef struct CPUArchState {
 #define CP0C6_DATAPREF        0
     int32_t CP0_Config7;
     int64_t CP0_Config7_rw_bitmask;
+#define CP0C7_WII          31
 #define CP0C7_NAPCGEN       2
 #define CP0C7_UNIMUEN       1
 #define CP0C7_VFPUCGEN      0
-- 
2.38.1


