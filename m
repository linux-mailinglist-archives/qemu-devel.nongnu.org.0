Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598A332AD7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:45:22 +0100 (CET)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeXx-0003PP-8F
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:45:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdow-0006BZ-P9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:50 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdov-00031H-AD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:50 -0500
Received: by mail-ed1-x532.google.com with SMTP id w9so20633120edt.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3h2ByVuiQYLkvSCliAgbNV57VpJyk3eWoocPDwDsdg8=;
 b=WMgFyNRI8F55jyD5CEONfpd5j2lKSzvGxrBtoOOeSsD4pdbHnwf0P6TCVo5KTsUCfI
 Atj7pm9MXY2FFk0XP8onKVt7isdUjE4/KirtBH65TslU2wUhv9yYTWkniTK9WZcBDdqY
 iKK0afIJOq4f0TtVlL4W4r/kFwSNbZCm95Vfmmut0itIDcoX8zaczBaxy4+ENDocXZDY
 JpDdxo3DBIryERgv3KE10wZPPUoFs8VrHnO4MC1qkAPxKBSYn2FzO+AYVmqtoUzrOb5l
 nwJ97UGhSMExOTZN6L1oHG27v6s96q8JXJ17NE2kIUuZhjE+st17Fb89zB95mpFl+FO0
 iWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3h2ByVuiQYLkvSCliAgbNV57VpJyk3eWoocPDwDsdg8=;
 b=cmvWUdAAt4DF/HQC1C/15RBGAAIjDDrqMtJgPbNogUdmOFA2mgycdGVXj9SzeXEeIG
 pmdwsgD6c/WOFjy9yFn+2Q/2rvWPWTbSucJwzzzX2DmGYQtTL6GhzkhJEC8r0Jh8kiLn
 g6oDaiFSbiZ5Fts+Af4GgOI/PgS8cJKLsj/rulzt1D9G/xT3fQzx8c9CwCOLSydgohP0
 NzUJkZkgY9navT9erO0Tt5zFbDtkihfP+tp2BEiZEh/V55edKRf+gWMx0WosvFf66i73
 qQ1bTKFt+QtPbTAo4CyZ1E9uReIKSwLNhD0ebbDusiwwG1Jdxe5TcmFHNm9MydK50dpG
 gTvA==
X-Gm-Message-State: AOAM530KqXrBE/M2w67YTg2j/vUqBawHlXslR6h+h5JM8ysKUdV1XWB1
 4sTfa7nmphxDZb8eGcFgZi9EoGnv05w=
X-Google-Smtp-Source: ABdhPJxRAoG07U3axtmUjYethmyf7yWtTSVEMr2VIG0GMeTEq+3awAlntFDuLQlk600XueskmvzRJA==
X-Received: by 2002:aa7:df84:: with SMTP id b4mr4516787edy.240.1615301927879; 
 Tue, 09 Mar 2021 06:58:47 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s9sm3182962edd.16.2021.03.09.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 22/22] target/mips: Reintroduce the R5900 CPU
Date: Tue,  9 Mar 2021 15:56:53 +0100
Message-Id: <20210309145653.743937-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have the minimum prerequisites to support the
R5900 CPU, we can reintroduce it.

While we are reverting commit 823f2897bdd ("Disable R5900
support"), we effectively cherry-pick commit ed4f49ba9bb
("target/mips: Define the R5900 CPU").

This reverts commit 823f2897bdd78185f3ba33292a25105ba8bad1b5.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-31-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index e03b2a998cd..1a73b5409f0 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -411,6 +411,65 @@ const mips_def_t mips_defs[] =
         .insn_flags = CPU_MIPS32R5,
         .mmu_type = MMU_TYPE_R4000,
     },
+    {
+        /*
+         * The Toshiba TX System RISC TX79 Core Architecture manual
+         *
+         * https://wiki.qemu.org/File:C790.pdf
+         *
+         * describes the C790 processor that is a follow-up to the R5900.
+         * There are a few notable differences in that the R5900 FPU
+         *
+         * - is not IEEE 754-1985 compliant,
+         * - does not implement double format, and
+         * - its machine code is nonstandard.
+         */
+        .name = "R5900",
+        .CP0_PRid = 0x00002E00,
+        /* No L2 cache, icache size 32k, dcache size 32k, uncached coherency. */
+        .CP0_Config0 = (0x3 << 9) | (0x3 << 6) | (0x2 << CP0C0_K0),
+        .CP0_Status_rw_bitmask = 0xF4C79C1F,
+#ifdef CONFIG_USER_ONLY
+        /*
+         * R5900 hardware traps to the Linux kernel for IEEE 754-1985 and LL/SC
+         * emulation. For user only, QEMU is the kernel, so we emulate the traps
+         * by simply emulating the instructions directly.
+         *
+         * Note: Config1 is only used internally, the R5900 has only Config0.
+         */
+        .CP0_Config1 = (1 << CP0C1_FP) | (47 << CP0C1_MMU),
+        .CP0_LLAddr_rw_bitmask = 0xFFFFFFFF,
+        .CP0_LLAddr_shift = 4,
+        .CP1_fcr0 = (0x38 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 = 0,
+        .CP1_fcr31_rw_bitmask = 0x0183FFFF,
+#else
+        /*
+         * The R5900 COP1 FPU implements single-precision floating-point
+         * operations but is not entirely IEEE 754-1985 compatible. In
+         * particular,
+         *
+         * - NaN (not a number) and +/- infinities are not supported;
+         * - exception mechanisms are not fully supported;
+         * - denormalized numbers are not supported;
+         * - rounding towards nearest and +/- infinities are not supported;
+         * - computed results usually differs in the least significant bit;
+         * - saturations can differ more than the least significant bit.
+         *
+         * Since only rounding towards zero is supported, the two least
+         * significant bits of FCR31 are hardwired to 01.
+         *
+         * FPU emulation is disabled here until it is implemented.
+         *
+         * Note: Config1 is only used internally, the R5900 has only Config0.
+         */
+        .CP0_Config1 = (47 << CP0C1_MMU),
+#endif /* !CONFIG_USER_ONLY */
+        .SEGBITS = 32,
+        .PABITS = 32,
+        .insn_flags = CPU_MIPS3 | INSN_R5900 | ASE_MMI,
+        .mmu_type = MMU_TYPE_R4000,
+    },
     {
         /* A generic CPU supporting MIPS32 Release 6 ISA.
            FIXME: Support IEEE 754-2008 FP.
-- 
2.26.2


