Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3EC2CC5D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:50:38 +0100 (CET)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkXD3-000451-Aw
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:50:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7a-0005ZO-Rq
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:58 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkX7Z-0002dQ-Eg
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 13:44:58 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so5945063ejj.5
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 10:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g86VgmSNy4f4zzNJeVPl770oLi4Jhzj+nbmAAlUIF60=;
 b=Oi1mz7FptywDHxL4wFFotazbFkvsdN+8GtFfpfUzmHCiPc/x2VxgbGdYABGUrTFIbU
 5Hmko5FGjblPU29p6aui0qp6lJMZsFt92u1DXkyHFhFVxQNCQyXUaxO1CRI/M8hlioKF
 z8NaUrdaS0ptFNJ96W+aVYOn5EOkM4DBCzMrpZ112PWuQL6BS1jdFvt3UGE+hkXf2mL8
 DveDDsY4P6Yp1kXA0meLFC8kNo2Zm+ZO8yb257XDpNMHd0ieSMxfTKQHdwc43X+FNJmh
 jykwuofme+rQ2v8HYxmRURyGMbJjTCkqpgjCfRkljDq3OmfTpfzmMUSHVSoxmcVDsvH+
 ucGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g86VgmSNy4f4zzNJeVPl770oLi4Jhzj+nbmAAlUIF60=;
 b=uGepQ37WnnnKaOvh/zfRspv0tSwoAoueEJFgGUgnMSf0IaVxJsJIk0fa64PMyRICpN
 5XdzShun0JnZnSxiewgsa09VmV9WvDQBBf2UY6uKKk8oqOtd/R4CDKGcS/pTrDhPnex6
 lL14JOzk3avujmeVxOpVPhwcPXh9ySxfrdKd1vqSKRdZH8D/cjro13Isha2TI2Ec/wq2
 J6+2O2djqv2zq+xHAVrBbltI39T79EFGwFrig/bxaXh6rba2uGJwwU39adrE1VhIhi1o
 x1cf8jSj5EtzJOmROB+oIM54/X6T7VWbOJdL2cgWWjaYZmlu0eST2qBnxrjzN5jLJp+5
 VXGg==
X-Gm-Message-State: AOAM531MYpIq2VZYL7EQHD8b0g8EcWchyg9YT5NeIbY9wM5QQ70DOQmK
 wnyyi4CanvgQNlQhOw5kburU+ID7TQI=
X-Google-Smtp-Source: ABdhPJwjeCuvpeuBnGWFwyPDgCk9BaHv5eStq6XWq+D3+5rh2254O9WeuxjHg+qB3zX5zSHBorSF5A==
X-Received: by 2002:a17:906:6713:: with SMTP id
 a19mr1164126ejp.468.1606934695848; 
 Wed, 02 Dec 2020 10:44:55 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id d7sm575737edv.17.2020.12.02.10.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 10:44:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/mips: Extract msa_translate_init() from
 mips_tcg_init()
Date: Wed,  2 Dec 2020 19:44:13 +0100
Message-Id: <20201202184415.1434484-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202184415.1434484-1-f4bug@amsat.org>
References: <20201202184415.1434484-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
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

Extract the logic initialization of the MSA registers from
the generic initialization.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 41880f21abd..a5112acc351 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -31672,6 +31672,24 @@ void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
+static void msa_translate_init(void)
+{
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
+
+        /*
+         * The MSA vector registers are mapped on the
+         * scalar floating-point unit (FPU) registers.
+         */
+        msa_wr_d[i * 2] = fpu_f64[i];
+        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
+        msa_wr_d[i * 2 + 1] =
+                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
+    }
+}
+
 void mips_tcg_init(void)
 {
     int i;
@@ -31685,22 +31703,9 @@ void mips_tcg_init(void)
     for (i = 0; i < 32; i++) {
         int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
 
-        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2]);
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
     }
-    /* MSA */
-    for (i = 0; i < 32; i++) {
-        int off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[0]);
-
-        /*
-         * The MSA vector registers are mapped on the
-         * scalar floating-point unit (FPU) registers.
-         */
-        msa_wr_d[i * 2] = fpu_f64[i];
-        off = offsetof(CPUMIPSState, active_fpu.fpr[i].wr.d[1]);
-        msa_wr_d[i * 2 + 1] =
-                tcg_global_mem_new_i64(cpu_env, off, msaregnames[i * 2 + 1]);
-    }
-
+    msa_translate_init();
     cpu_PC = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUMIPSState, active_tc.PC), "PC");
     for (i = 0; i < MIPS_DSP_ACC; i++) {
-- 
2.26.2


