Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243060D931
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:20:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVv4-0005ie-ED; Tue, 25 Oct 2022 22:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVv2-0005iR-IT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:24 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVv1-0001NO-3c
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:24 -0400
Received: by mail-qv1-xf35.google.com with SMTP id c8so9670581qvn.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htRWvpv+4dNFXsMhSbNK8JieGtJ3hejF/Z+2w9zO94g=;
 b=F3kaZFccNWQ2sTBckSe+FVfa4k13L+539ljlF0Lr/KbPT8qYPC/gGWYm7SzgMzG0Af
 W3u0A1cDoxWFUKxnZTxApiWwHZRIVgDbn9uy72OcOZ+cl4Y+s08C/l1m84vfKgQwmieK
 p7pbToP+nNWt2yhM7h9LYpEnuthcibReEE1F3GWq9vrxgHdD0z/0dbcY41KmM9fduue/
 fNmp89eL0GlRYRP1ZCT3nRS9tgD+j6b7+8ggvGAGhpupkvXlyzKrs8PMNkrtPbGmRNU1
 2aTrxLJT3squrSgbR26yfFiDWoHCaMmf2voGLmLSrZ7/DgPTq731s069VPzCLGOirXJ4
 I5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htRWvpv+4dNFXsMhSbNK8JieGtJ3hejF/Z+2w9zO94g=;
 b=vI00IP22I186M1e+H9NtytV5OkjBEIIXLuaWQAlu/vUZqsEhlVn7J4IX9eTAKWH0ZV
 3l2g5n/wrk8r6Oq2u7oPffZzS36sY3OBs0bVYU22U0Xjmeup7PE016UfHFelTyU8U+FS
 FiQ+EFibDiRbJIWitXBzmyMxj/AmvQhdrn/+vIANsQgMmGboDHCKMW+NlG5qFUcMhIi9
 2Ya8k0DLYCcBTKeNIWAB8AA9eCBcKKr2Yokjjf3Q+3AVOzSKntSC4rMLMRNIOcUY87C9
 aNmWvJgR2xm2NzMOV6BQ0TVTtZ14nUqU5MYvScMxNP4ze9qBsG0eeJoWBvO1bitnumAU
 68dA==
X-Gm-Message-State: ACrzQf2/e3M/2N9PRkvJVFQi22C4NAPdy42DIpcmg5JVD6vrEyVH4lX9
 EFUlmLZQPNaFM/ZU5Um0lx9+wTiGRoHQvKbh
X-Google-Smtp-Source: AMsMyM5qSr6cxHx2mFfF0BfwQwdMlEt1NkJS99md0Iwn/NOYwjnZVlX4/zk6/Ne5UtdexAv0hqJ0ng==
X-Received: by 2002:a05:6a00:ac6:b0:530:3197:48b6 with SMTP id
 c6-20020a056a000ac600b00530319748b6mr41227288pfl.80.1666750391089; 
 Tue, 25 Oct 2022 19:13:11 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:13:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 39/47] target/ppc: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:08 +1000
Message-Id: <20221026021116.1988449-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu_init.c  | 10 ++++++++++
 target/ppc/translate.c |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 763a8431be..335351c226 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7221,6 +7221,15 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
     return cpu->env.nip;
 }
 
+static void ppc_restore_state_to_opc(CPUState *cs,
+                                     const TranslationBlock *tb,
+                                     const uint64_t *data)
+{
+    PowerPCCPU *cpu = POWERPC_CPU(cs);
+
+    cpu->env.nip = data[0];
+}
+
 static bool ppc_cpu_has_work(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -7446,6 +7455,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
 
 static const struct TCGCPUOps ppc_tcg_ops = {
   .initialize = ppc_translate_init,
+  .restore_state_to_opc = ppc_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
   .record_sigsegv = ppc_cpu_record_sigsegv,
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e810842925..7228857e23 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7739,9 +7739,3 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
 
     translator_loop(cs, tb, max_insns, pc, host_pc, &ppc_tr_ops, &ctx.base);
 }
-
-void restore_state_to_opc(CPUPPCState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->nip = data[0];
-}
-- 
2.34.1


