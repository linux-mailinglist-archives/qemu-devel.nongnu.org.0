Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A432F698BA2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:18:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWeH-0002IV-3I; Thu, 16 Feb 2023 00:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeF-0002Hn-7k
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:35 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSWeD-0002zH-Bd
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:17:34 -0500
Received: by mail-lf1-x12b.google.com with SMTP id y25so1372616lfa.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/mhdnoI8V3zPJb7Pp3bfWPtRM6qlhJB1hb2CGMA88s=;
 b=NrvpjH1wqaKaFVSmvKXk2+cF6Cg41RgdJnMf+XUvaLUsugmLvyl1VUuhfFA39Yyhpc
 lmJ1wnkJP5GZQ9Yeb6M3D5YGmQlZIvb3mDRvEl9Rln0A5XszD1NLY7EBHwkEFHl64voj
 VXe4SWd3fkVUSHdSUJc74n/sLb90yNaGjz7jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v/mhdnoI8V3zPJb7Pp3bfWPtRM6qlhJB1hb2CGMA88s=;
 b=agyEmorRDdT3GJVdEwbBFUu0Bytk1OxRL37Oz+b+nPVc5sVnFdWx/I/yrKjGFqsWJv
 G9ZLGHIRioe/dzmDUt6x5JG+LtNLm4Ei0RQNacZJa1ZoZCpz7m5J1RKLuDe24d1ohcYJ
 tGNMKd9u82g0Y/15BZfSNIc2DSv8xIOtJjXikBsEWAN/Nl/zDZUvhPtIk0LB2ON1ye+D
 IF8PVbXGRr80inl09CwyvVB7br7ml4vISjnZ5tvYWDJwm+bAAxpWIH8mnoADaa9UIzQE
 +Xelfc9dqn7ujZ2CFKdIRSQsz53R9hEj3VO0fNEAqEK+0fORZ1e6jK9H/7SCRUvhmkYO
 pEug==
X-Gm-Message-State: AO0yUKU6d2JC+OG8vnLQdYVpiK/USmsStLvtU6wcVVBKpjInED6C+knS
 yKVVmG7d313aWSsUYQSYXeu6Zv/136JdjH3N
X-Google-Smtp-Source: AK7set8Fskt98IQpmAC0ShRWmP9ldQqzDG6712h6zLiMQkkVlH4uOdXCepVZChYjhNt/c1ajwq6Evg==
X-Received: by 2002:ac2:5395:0:b0:4a4:68b7:e71c with SMTP id
 g21-20020ac25395000000b004a468b7e71cmr1090074lfh.6.1676524651395; 
 Wed, 15 Feb 2023 21:17:31 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 s1-20020a19ad41000000b004b7033da2d7sm141278lfd.128.2023.02.15.21.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:17:30 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v2 3/4] target/mips: implement CP0.Config7.WII bit support
Date: Thu, 16 Feb 2023 06:17:16 +0100
Message-Id: <20230216051717.3911212-4-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
References: <20230216051717.3911212-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-lf1-x12b.google.com
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

Some pre-release 6 cores use CP0.Config7.WII bit to indicate that a
disabled interrupt should wake up a sleeping CPU.
Enable this bit by default for M14K(c) and P5600. There are potentially
other cores that support this feature, but I do not have a complete
list.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
---
 target/mips/cpu-defs.c.inc | 3 +++
 target/mips/cpu.c          | 6 ++++--
 target/mips/cpu.h          | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

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
index 7a565466cb..7ba359696f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -144,12 +144,14 @@ static bool mips_cpu_has_work(CPUState *cs)
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
-            (env->insn_flags & ISA_MIPS_R6)) {
+            (env->insn_flags & ISA_MIPS_R6) ||
+            (env->CP0_Config7 & (1 << CP0C7_WII))) {
             has_work = true;
         }
     }
diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 0a085643a3..abee7a99d7 100644
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
2.25.1


