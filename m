Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0118560AB4B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:49:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSp-0003QD-S0; Mon, 24 Oct 2022 09:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSa-0003KV-Au
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:44 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSY-0003s1-Dh
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:43 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f9so4280088pgj.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DK4/O2C0sfOBd7+ywuOteLd4t53XP/cXeHPWduy8lpE=;
 b=LehLBKiXLtytRYkTP8XMH9jqYNEMeo4DkdKRvP2o6OHM85DFhnKXpi+iMBJd9Vm9j+
 YeofwcN5uA5S8rjd84sibxkccNWaYTuc400JzPpU/sJYu/8ChMvlft805yHJjhRint53
 1lA5F860G//ervBn9s1AyR+RD8Twhl3eXH4V5fZeN6sQD6mj0yby123bt2XatDkabcOQ
 zCGF5ugQ3JsdH1m3IGEMjRal2ZLtMpDLjOd843w5gQYJ3u1Hs/Ykw0YKAH/7tspznIvZ
 2e7kAkrRdHwvQQWj09REwXIZobJiuEzwiqpwfuLl0d0RpllZT4bxqo4vwxq7yO9dwOrg
 QWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DK4/O2C0sfOBd7+ywuOteLd4t53XP/cXeHPWduy8lpE=;
 b=pgIui8m2nMauRNyQmVarmRQi7hxbozFy/hmrYVCudn9uK1RTg4P4g1hUrZxShJQjIw
 9s2IMjSwHTb3LCUXnyGR5MA8HQs5sQZpneNt4DxxVTcRfdaseuHLYJU/AigfTYIXwQM7
 gb9ciV9f7iGb4MVTIjgDMhw6C63ivBt7D6pPM2+mx4dFPhvuKwv+bp2D4zufHjyDodo6
 AW86ZjKUfI5D7rcSilRQ2KsMgWmg6I3Q9N2uV1pynXZKamhlVZ5d2CLPvgo2MfJ3S3DQ
 PzjZIokcRbF8lFBR/Fn4ZKmC32h4NktPS08rHoM0jDb5q/R9Z5wNsnCCxXX1TsRyi6XW
 SUIA==
X-Gm-Message-State: ACrzQf1c7WgOCf05j0xffmVILhddRegXUe3utHWzrmV92vs0kM13TAuF
 zEje8ZQ+27czR0FBIyH+LgFLuLScZuwESg==
X-Google-Smtp-Source: AMsMyM7ljtRaoBey3Op9qe4h1wsgqReAl1/XIgCkeIJY0U7I+buVDzFA5me78uSHqEfBDJ/70iv+dg==
X-Received: by 2002:a62:1a97:0:b0:562:5587:12d6 with SMTP id
 a145-20020a621a97000000b00562558712d6mr33008278pfa.37.1666617941583; 
 Mon, 24 Oct 2022 06:25:41 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/29] target/mips: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:42 +1000
Message-Id: <20221024132459.3229709-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/tcg-internal.h | 3 +++
 target/mips/cpu.c              | 1 +
 target/mips/tcg/translate.c    | 8 ++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 1d27fa2ff9..aef032c48d 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -21,6 +21,9 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
                                              MMUAccessType access_type, int mmu_idx,
                                              uintptr_t retaddr);
+void mips_restore_state_to_opc(CPUState *cs,
+                               const TranslationBlock *tb,
+                               const uint64_t *data);
 
 const char *mips_exception_name(int32_t exception);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index da58eb8892..e997c1b9cb 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -538,6 +538,7 @@ static const struct SysemuCPUOps mips_sysemu_ops = {
 static const struct TCGCPUOps mips_tcg_ops = {
     .initialize = mips_tcg_init,
     .synchronize_from_tb = mips_cpu_synchronize_from_tb,
+    .restore_state_to_opc = mips_restore_state_to_opc,
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = mips_cpu_tlb_fill,
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c3f92ea652..2f2d707a12 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16229,9 +16229,13 @@ void mips_tcg_init(void)
     }
 }
 
-void restore_state_to_opc(CPUMIPSState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void mips_restore_state_to_opc(CPUState *cs,
+                               const TranslationBlock *tb,
+                               const uint64_t *data)
 {
+    MIPSCPU *cpu = MIPS_CPU(cs);
+    CPUMIPSState *env = &cpu->env;
+
     env->active_tc.PC = data[0];
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= data[1];
-- 
2.34.1


