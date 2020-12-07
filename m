Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E12D1EB7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:01:10 +0100 (CET)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmQRJ-00009T-Gv
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:01:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMY-0004Rr-UF
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:14 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmQMJ-00049t-0I
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:56:13 -0500
Received: by mail-ej1-x641.google.com with SMTP id jx16so22029212ejb.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yk+4p5NVLbhbYdTmBYgtuSNG/soGvYd4+FvnWCldyIo=;
 b=Gg/Y8+1rtb3xwKY9CB5z0cBk5KutL9CyL00CS0c8blZC0aVFyaP+WgKtxqS3pGaB3H
 X1kTkQfQuKz2LtdQW9xD1pcmwAc76nK3twBAgg0X35NNq9kV9sdzLnpypLSa82DYTRIJ
 DFbBWXCdHkhXXTCPfTRn9V4RAXCbIM8Z3hrudAUHM/cGkGs5tv2zaADMEl1S+didzkrJ
 iDnzWEqAPU9/RlUBBdupPdjUmgTHbuGrCEN3On1sk7wrMVTtlCQxSdRSOggIRu1MX7+0
 wVxU4+8an/Rqh8DkSPQVQuawjZ++eyJxN/vyO0slz4Yxl6vNZ10lxJmoQ3Z082jF/JUC
 tnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yk+4p5NVLbhbYdTmBYgtuSNG/soGvYd4+FvnWCldyIo=;
 b=oTAFw9QZOxrtoXZgrZatWdtBh7lZ3Wb7WB+rBkATAva6yJEunJ1u3cBUZTpcjZlkAx
 gI9eqUI/olWBDpB/9l4tAHw7ROqhb2nTBm6x0SnH1CuUczOTPDH03Dw0PmvixQApEzr1
 Eqexs75nZrl/eO73gGAkgBdEYwO/foOmaiFyVeaxFhoVjHm/qaFUeU1iIY8Tz8F55JRI
 EXGjfgTr+otqWQAODBwm9nXIe23FIfd+K2hzkEGeLaCtEZCf8KUf7kOfjlgX8uPgHNOS
 QQgc/QrlXBa0TQZZRulXen9o+VpZiDBIRfBRWlDhQ3CbAXgjPMnx4jRxP74RJ1ukfipm
 IWcg==
X-Gm-Message-State: AOAM530HNp53GRN2LymPUuwmdcWA4POEWjoCG8rT/e1MwQGighAaqFvA
 C3s8oJ8l4/dNllNnN9eTrGxxQeYcgNA=
X-Google-Smtp-Source: ABdhPJzGo39RgOyatmYdrC5PJJBlDjUjAhkacEaMqiF2vblIZIij08por5k4fKlPDv3V9jwDqmJnCQ==
X-Received: by 2002:a17:906:81ca:: with SMTP id
 e10mr20829350ejx.449.1607385357466; 
 Mon, 07 Dec 2020 15:55:57 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k2sm14013964ejp.6.2020.12.07.15.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:55:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] target/mips: Use FloatRoundMode enum for FCR31 modes
 conversion
Date: Tue,  8 Dec 2020 00:55:35 +0100
Message-Id: <20201207235539.4070364-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207235539.4070364-1-f4bug@amsat.org>
References: <20201207235539.4070364-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the FloatRoundMode enum type introduced in commit 3dede407cc6
("softfloat: Name rounding mode enum") instead of 'unsigned int'.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201123204448.3260804-2-f4bug@amsat.org>
---
 target/mips/internal.h   | 3 ++-
 target/mips/fpu_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index d290c1afe30..5d8a8a1838e 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -226,7 +226,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 uint32_t float_class_s(uint32_t arg, float_status *fst);
 uint64_t float_class_d(uint64_t arg, float_status *fst);
 
-extern unsigned int ieee_rm[];
+extern const FloatRoundMode ieee_rm[4];
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 static inline void restore_rounding_mode(CPUMIPSState *env)
diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 020b768e87b..501bd401a16 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -42,7 +42,7 @@
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
 
 /* convert MIPS rounding mode in FCR31 to IEEE library */
-unsigned int ieee_rm[] = {
+const FloatRoundMode ieee_rm[4] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_up,
-- 
2.26.2


