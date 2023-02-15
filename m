Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12759697F63
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJYR-0002ch-G8; Wed, 15 Feb 2023 10:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSZ-0006xu-JU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:15 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.nowakowski@fungible.com>)
 id 1pSDSY-00071x-1Z
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:15 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-16cc1e43244so17860991fac.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ooA3RfAvBE8YoFTL0liD39KM6/U3xfuZBPasSLp8UkA=;
 b=PvWMIo4D7VwfiDcJDl+LOYxsq8frwxMbUVoCfCJ4IVtdCIyS9Rh8XHc+g4HFxKtYxD
 KuCiUdscKgguHP/UhaXMyMcTw5cY1jKQ8GCC17sGs3joYnKK0QACUuIj03ZQrJphTiXU
 wNFSG9x0JwuyIA+qJPgE/rDekDBfvfla2L0zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ooA3RfAvBE8YoFTL0liD39KM6/U3xfuZBPasSLp8UkA=;
 b=VFgQPHxx0LV6MbNU6i1gTS/kyJrEEljXT/K8eiDUhv+q4dtOcAF5bl/oF9X/aTB48e
 ERp4UdBUGhAaOR6TkpN+sxFu7zDJUlkFgiURT4Eb+t4+Lk989RJjNmL7IRyHqKU5EzsZ
 jJPxN6u+J0dSq9nUaUlqWj4XGRr+Ao0bvPY9FFYzRu2NDcqZO2jNlZhWFbccl59QGALm
 OT5IFKicRQdDsQWt+HdOf0+qqSSIPcIVxkwm8nuzxRCQhwaaTOYeSdC0ZdmhJpDOLXIY
 QocdtarG8reh3a6z3i+j6KRcbPEQDs22C/x+tk1Y3gkuf38i2vfQARCSxz7GhKnDxN9E
 7KcA==
X-Gm-Message-State: AO0yUKWJQM7JPsy9e/lXd9E5MdIf9nLsxOEQpG8vffP2eIQ5cGnQnNG8
 eaQM+HOBS+tt0kkR7BqTt+d3XZusDgKngcNg
X-Google-Smtp-Source: AK7set+OOrrXoIBH3SsD/bRwtlzJ/NxA+JWDWJc1t3VhHxPZhJx3ghl7KiCMNSlT1BQWq+AGlNGrjQ==
X-Received: by 2002:a05:6870:a11d:b0:16d:c064:1a9 with SMTP id
 m29-20020a056870a11d00b0016dc06401a9mr703905oae.10.1676450892576; 
 Wed, 15 Feb 2023 00:48:12 -0800 (PST)
Received: from WR-NOWAKOWSKI.fungible.local (77-255-255-121.adsl.inetia.pl.
 [77.255.255.121]) by smtp.gmail.com with ESMTPSA id
 a9-20020a056870d60900b0013bc40b09dasm6788811oaq.17.2023.02.15.00.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 00:48:12 -0800 (PST)
From: Marcin Nowakowski <marcin.nowakowski@fungible.com>
To: qemu-devel@nongnu.org
Cc: marcin.nowakowski@fungible.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH 3/3] target/mips: implement CP0.Config7.WII bit support
Date: Wed, 15 Feb 2023 09:47:54 +0100
Message-Id: <20230215084754.3816747-4-marcin.nowakowski@fungible.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=marcin.nowakowski@fungible.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 15 Feb 2023 10:18:35 -0500
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

Some older cores use CP0.Config7.WII bit to indicate that a disabled
interrupt should wake up a sleeping CPU.
Enable this bit by default for M14Kc, which supports that. There are
potentially other cores that support this feature, but I do not have a
complete list.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@fungible.com>
---
 target/mips/cpu-defs.c.inc | 1 +
 target/mips/cpu.c          | 6 ++++--
 target/mips/cpu.h          | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index 480e60aeec..57856e2e72 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -354,6 +354,7 @@ const mips_def_t mips_defs[] =
                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA),
         .CP0_Config2 = MIPS_CONFIG2,
         .CP0_Config3 = MIPS_CONFIG3 | (0x2 << CP0C3_ISA) | (0 << CP0C3_VInt),
+        .CP0_Config7 = 0x1 << CP0C7_WII,
         .CP0_LLAddr_rw_bitmask = 0,
         .CP0_LLAddr_shift = 4,
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


