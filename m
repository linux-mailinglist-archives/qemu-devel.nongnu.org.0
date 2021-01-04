Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0E72E9FE3
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:18:35 +0100 (CET)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYBO-0003TR-SX
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5S-0006aH-1c
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5O-0007sM-Uc
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id c133so607443wme.4
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FY8utL4BuRYo0iYGKc1d1mWLl6o5xAsuE1shmmN0tBE=;
 b=rYljLbzXCIn1OMxz2HKqwSXUZPYzBaGTmBMjCppocVx5ov25p1TQVdgmQOIzgPq+9s
 ojnS+MLn9TtFN6SVgmQv/+VYLPKFLVsz9J9pl1qsEEakYkExmH6JO7yYTSlEhLlBV7gW
 6bJJ0fBQLMO5WjZSQPN+emsRNvfHuFNpEu924S+uTmRKXwSfeJ9H+zN334Rpjm9BGs1q
 a5Nkq7RrOXMovfCacBzUc04aqzLG/16KF3bnj4QIINg4NjDDCqM5lEh/MqWRWPORumK6
 SrizRJiI3Zc9R5jkCh0K5DwbyVVqKqxQ55R2fnMHZqMpL/xaLpFH5tBWZZ+yuVWmpMvq
 DxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FY8utL4BuRYo0iYGKc1d1mWLl6o5xAsuE1shmmN0tBE=;
 b=B4Lvle3NZgdTJHwvpNUgfUHEue4cx89jljRzwAn5XqG+h/qc+OGYs8dK4cvsh263Cq
 I0B13vgWMDIYmEuaYGC0dWdUevTVttzJWv7I7CtEXO9ar9u4TcVTlVOZ8igybgBANjnb
 SE7AEgCKKtH3+AS9jAleMWSUkbhQqg+RcJ9WK8TLQrCS/KPoI6C+cfmuCrGV73Un3H5p
 VjpGTMD47nHKmpyoxyrb3WYUTl+/WmWjrXPN2buaCUOndsQWILbrQeYvYKPUxmDJ2W30
 ttNn2Rmt4n6ciCvdqFuLw1h+e2OHi9HGbcd3Zw7jjoO6rf2Y+zaF+lcq7mUHasN9GrbU
 wcoA==
X-Gm-Message-State: AOAM531dbiX22j+bkd3Mr705FE26ciiLGmwI07x7ngkSYAbuZgoClCrE
 NeMM1y/y4XIw1IbUCphvpE4bgTBEIfo=
X-Google-Smtp-Source: ABdhPJzJIzvHrCKuPQkN5VHW9V+bBtdou94beS/hCueb9r5G8JOJfGSm+T6AzPVdyBB1UuW6qswjdQ==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr774658wmi.35.1609798338727;
 Mon, 04 Jan 2021 14:12:18 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id p15sm88509150wrt.15.2021.01.04.14.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
Date: Mon,  4 Jan 2021 23:11:43 +0100
Message-Id: <20210104221154.3127610-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS 64-bit ISA is introduced with MIPS3.

Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
and the cpu_type_is_64bit() method to check if a CPU supports
this ISA (thus is 64-bit).

Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.h       | 5 +++++
 target/mips/mips-defs.h | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 4cbc31c3e8d..7c60a335f97 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1297,6 +1297,11 @@ static inline bool ase_mt_available(CPUMIPSState *env)
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
 
+static inline bool cpu_type_is_64bit(const char *cpu_type)
+{
+    return cpu_type_supports_isa(cpu_type, CPU_MIPS64);
+}
+
 void cpu_set_exception_base(int vp_index, target_ulong address);
 
 /* addr.c */
diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index 1630ae20d59..89a9a4dda31 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -13,7 +13,7 @@
  */
 #define ISA_MIPS1         0x0000000000000001ULL
 #define ISA_MIPS2         0x0000000000000002ULL
-#define ISA_MIPS3         0x0000000000000004ULL
+#define ISA_MIPS3         0x0000000000000004ULL /* 64-bit */
 #define ISA_MIPS4         0x0000000000000008ULL
 #define ISA_MIPS5         0x0000000000000010ULL
 #define ISA_MIPS32        0x0000000000000020ULL
@@ -71,6 +71,8 @@
 #define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
 #define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F | ASE_LMMI)
 
+#define CPU_MIPS64      (ISA_MIPS3)
+
 /* MIPS Technologies "Release 1" */
 #define CPU_MIPS32R1    (CPU_MIPS2 | ISA_MIPS32)
 #define CPU_MIPS64R1    (CPU_MIPS5 | CPU_MIPS32R1 | ISA_MIPS64)
-- 
2.26.2


