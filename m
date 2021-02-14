Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE68E31B202
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:31:03 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMAg-0006y3-LF
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiP-0000fS-1E
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiM-0004dg-Fc
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id a16so3371753wmm.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w8KBiau7pxpcFArtHKInYNOJC++ctebYYHvQWPSfPYU=;
 b=HFdo+YCVCeJ/csdY//CBARPlfmAksJ1IKm2NJZifRVqfWyruj2TJ9kwxnMoTNB9HHi
 UakyMFbl+3cr1hjhKAF+mcj6W+K4BVGRc95ylg1HAARrzwjujNm5VoYB5pDcgco8j816
 cC8svLcDPDPV5jPJ90YO6KhAbb7aBMkLYrJzPKXgpDPvEqWVBGTcbubvu8r3rUPALBQf
 elkDo9UaZvikzKnFEqzpEXrxrZyc7VQNMJhxdk/l8mPPz6+8/r4aq+bKqFK9cQSGtqQC
 gSN5jdj36O3L+Msu+G1FI1YdimVQ749/TnRxFkmt9skbLb/401kD4MKWa9eGoIYvnq/N
 3hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w8KBiau7pxpcFArtHKInYNOJC++ctebYYHvQWPSfPYU=;
 b=K+124jnFva2YXujJP4Vi/Wrw8knVnutHBsEANiKWyPv9pdqm0E3b7H6NCmNtblfMXQ
 /0d+g+62BEXLLMeJAlSezEHHzyy8ExcSVy+QaJaQLvm22Mf/Jx/W/Ka9ijRchsn2rOqL
 eeI6+RskNErd484LqTuixGsOCsmSw7MwpB1WSWgVRtVjSfaUgWwMChA7U1Z/ivJlWMXD
 hZwQkkUH/C1Q80d/FT9oIH3vPluyqZTDOW7RFkV4Zd6TQxN6lqRkRTvncI424Z3v+rd0
 WUHj2F92Mv2ZB1iMwFx0MxQ08BFxSq09DEVLqzMXhA04o32dH165wYms5mHfUfATkrqL
 XYOQ==
X-Gm-Message-State: AOAM5302Bmg9zE51LV2WOJQpJQdasD8scpdCTtXTBasuyx/bIFY3/phH
 pxeKrKoMyQgS2nH0gkpS5/8AewIlsJQ=
X-Google-Smtp-Source: ABdhPJxQJdlN7FbDv8GKNWVb5qfez/7eV3JRoX5jnu0HHpAr4+3zZSIfv7ZprKR5KiwDXqwISbGiHQ==
X-Received: by 2002:a05:600c:33a7:: with SMTP id
 o39mr11131253wmp.10.1613325705039; 
 Sun, 14 Feb 2021 10:01:45 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z63sm22397684wme.8.2021.02.14.10.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 30/42] target/mips: Reintroduce the R5900 CPU
Date: Sun, 14 Feb 2021 18:59:00 +0100
Message-Id: <20210214175912.732946-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have the minimum prerequisites to support the
R5900 CPU, we can reintroduce it.

While we are reverting commit 823f2897bdd ("Disable R5900
support"), we effectively cherry-pick commit ed4f49ba9bb
("target/mips: Define the R5900 CPU").

This reverts commit 823f2897bdd78185f3ba33292a25105ba8bad1b5.

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


