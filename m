Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC0F2D1F5B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:50:28 +0100 (CET)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRD1-0004AR-HI
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0f-0003pd-CK
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:42 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0c-0001FE-OO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:37:40 -0500
Received: by mail-ej1-x644.google.com with SMTP id n26so22156400eju.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QCW46ctbFpbEr1flyhvkcp2iVdNnukjjxtvYS//elDE=;
 b=hRTzVOiwtLffpf/RB7ghUL25ihR0Uvam5D62dW66XbHPy0j5iT/gmx2TYpCtUUV8RV
 /8RnWh30kChkM+V6dKTLQ0SSo1d2seXpsn91guMlLd92p4TSPrFgA+bz/pynqzI2/MeL
 tWYAIuZUZZ5BLUpojkZcT6VBLgt2037KKcNenD6inTqK8dpOTn+z8qdti54qIvEdKEcG
 y/u6tgRwPl28LvACxoLiNg1LN+PAKhGQeyPfKG3+Yoa91TvXsk5Tuu9CXU/HlGiN6FNQ
 P2YOIYFAQRu6Sia4QBJfqia35WObvqtb0c6/+ncGgPrOGfzgvZXmEbDlE1AIQ0UKdEP4
 4kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QCW46ctbFpbEr1flyhvkcp2iVdNnukjjxtvYS//elDE=;
 b=qaqHYocS+4pAbeLqUc+AANg7Oji8X2vSSX1yIAXYUIj1MxDEw/oSKtVzy86/LVO6dh
 8BvQTtbuFH4FmdUsGOHlg9TRWKZRQ9GKPh9wtljMMy/CSnj58KDqbEkD/heESQIYjnSh
 ZfONVRf5Z0hFMNM4juBfeict64J8TRpBSLTOG2OK8hX75srClfysmGEngehcIPpJ8z+d
 84TS1ea3bVMUb553tXvhZKmGBfYKSuIBxMO+4EHkImtED0AWgKkoZKP2GwtrD4Pm2UCi
 7JlaYOAIBTyrzgAuEKvS0tuDBrxQAuvPHVuQl2SuygZHOCGTy7Ml9od3V8fY7YVAAwWw
 BINw==
X-Gm-Message-State: AOAM533gmrAXNH8xRBLfDzmSMXD7EZx9X+DWueRrfJcOmzQn1YRZdesb
 beM7C8+uJCgfIk0DWLa5nv4cDJyYrPs=
X-Google-Smtp-Source: ABdhPJxWDv5KOtm3SwbxMT5bDcGrNzprFe9keLmkkknepOZtlOGbFAoR/ZG9joxns8mGd53tXugD0Q==
X-Received: by 2002:a17:906:17d1:: with SMTP id
 u17mr21748427eje.229.1607387856511; 
 Mon, 07 Dec 2020 16:37:36 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n16sm15448302edq.62.2020.12.07.16.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] target/mips: Alias MSA vector registers on FPU scalar
 registers
Date: Tue,  8 Dec 2020 01:36:51 +0100
Message-Id: <20201208003702.4088927-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commits 863f264d10f ("add msa_reset(), global msa register") and
cb269f273fd ("fix multiple TCG registers covering same data")
removed the FPU scalar registers and replaced them by aliases to
the MSA vector registers.
While this might be the case for CPU implementing MSA, this makes
QEMU code incoherent for CPU not implementing it. It is simpler
to inverse the logic and alias the MSA vector registers on the
FPU scalar ones.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index da0cb98df09..95d07e837c0 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31561,16 +31561,20 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
-
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-        msa_wr_d[i * 2] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
+
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
+    }
+    /* MSA */
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
         /*
-         * The scalar floating-point unit (FPU) registers are mapped on
-         * the MSA vector registers.
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
          */
-        fpu_f64[i] = msa_wr_d[i * 2];
+        msa_wr_d[i * 2] = fpu_f64[i];
         off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
         msa_wr_d[i * 2 + 1] =
                 tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-- 
2.26.2


