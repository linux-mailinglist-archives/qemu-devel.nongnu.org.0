Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F7C2CC5D3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:50:19 +0100 (CET)
Received: from localhost ([::1]:56986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXCk-0003rA-4k
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7V-0005NU-EG
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:53 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7U-0002dG-1O
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:53 -0500
Received: by mail-ed1-x543.google.com with SMTP id ck29so5085436edb.8
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0Gmy5kVHrWtz2x/frWgI7xbHwcEYiFbHswDBnArJKk=;
 b=Cy9L94FFo4sSHWJnhtRu1Ih4nCtDWyS9sjq2wZBOV77ZLvh8BUlgDknPH9FR1PoIzt
 Dw/0hHJ6B8ugGuyL2qEKrB6fF0GkTonB76CuDVUCU0vB4vRRjLiGquMiky7KCDI7iNEz
 n7laZwqSDybgcWtezsBFArsIEiTm+MSRfw+BTblAKpR9IUR9iuopeoqdkjlOkqU7NlHJ
 Mzc7B1uzoCREAVxXMpWU8gtXQA22fbdepHUyBbMB3jCp17yDkAyUC8K1sbNiaOkcioZU
 yb7HtSCUwL+s4z3yrJgdENlNCi+0Yctgf5pLZ3rawYbNHDPVlYlMzLsvP135t+7JS9Xs
 mUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O0Gmy5kVHrWtz2x/frWgI7xbHwcEYiFbHswDBnArJKk=;
 b=OJNUfPXldbpe0nPxJ3JQSKpJoGKgG9T8e2NOjqa4hIXYtCxchu2K6osWW+ug2GSlca
 Zo9EHmgNjSN76ec/2gGRHcKOqkhldKXF2IVz6d/WFQ8oPQkBgWRiZZXp/Ewdg6koBq8i
 cxXWurh8jn/GbXbuIOagcfn8Lpd1wX4aSUzWgMm2oiVo4I1FOSyIrtUMRZzMTZgOz9b4
 ZH3OQPaMzOEGHKJ7+qQ76l+9NSPdKkGds35felC5vfiQR/HXvGspshXs1DmowjQiSHgi
 7wW2hSkHTp75NMPh2a3i+BcCfJ7bVK1onqVdgaSbTb5xs9xp4F91siFCqyohQt8F1sYd
 KowQ==
X-Gm-Message-State: AOAM5310+SGVWLhAe80LUM55+ThCbEjBUVmTUUm0TDnuyraMMety2oEx
 fFUfKiTvpr8NpcWF0eoFQ7zSYN5CEPY=
X-Google-Smtp-Source: ABdhPJzH0s/mvRJGBWMPJEUdTKPTxukUS8ZrESWtCMCmpvq+4sQLddwuyMLZaTIeUkLh/3YtQrq5zw==
X-Received: by 2002:a50:ff0c:: with SMTP id a12mr1312530edu.79.1606934690471; 
 Wed, 02 Dec 2020 10:44:50 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e12sm570657edm.48.2020.12.02.10.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/mips: Alias MSA vector registers on FPU scalar
 registers
Date: Wed,  2 Dec 2020 19:44:12 +0100
Message-Id: <20201202184415.1434484-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a05c25e50b8..41880f21abd 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31682,16 +31682,20 @@ void mips_tcg_init(void)
                                         offsetof(CPUMIPSState,
                                                  active_tc.gpr[i]),
                                         regnames[i]);
-
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-        msa_wr_d[i * 2] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
+
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
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


