Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC08360B002
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:00:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTF-0003c4-Ox; Mon, 24 Oct 2022 09:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSs-0003RD-7k
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:02 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSq-00044I-IC
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:01 -0400
Received: by mail-pf1-x431.google.com with SMTP id g62so4933362pfb.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qyxkF9rav08pAN066OMHtqVcS93bmJM30Eii8isiVIE=;
 b=kxx19Bi3JxnHIkdixfbFVeHn2cjovhsKLGnaDOfrESyGnlT/laelcVDHOSKSDKcfS1
 G64bneLc6+ymKdkDimoclafmoSibO7Hjrw76uSC14uHS5PsVF5OwxTyY3HnZ+pS3owQH
 h/0IUofI+MQKir9KrEUSx8b+fg60Oh6gG1Av81a9RmNC1OWovObwHlaIjFswUQIA3aVS
 EKCqbnmlvI2isMDA2EFI3ocGIvh7usQHA0aJKWfn3o2HDwvlH3JyVyrOHU/Q4plAxqac
 vZhQ9StrTf90Xjf8RfFbVSTMVx5/N741Iy7btn9X/w6xAMm8IMboGMWNXu+ko3Fyx438
 zvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qyxkF9rav08pAN066OMHtqVcS93bmJM30Eii8isiVIE=;
 b=us43t+FtCk7JerMxxkahFhDIb3MIw3+/nw8rnlqV46NjyncJHAVC47Of1J01/wXBQr
 AuA3qoum0LU6D9W/+/OIONeyU20GfTK70zHTyXD+xlmvoqGwP3en2stKbIbh+Kowy2Dk
 ZukL6uQSS8xOf+qX/vWzPUK1S7KKyd99tgAvedRib1D5NRM/1Mt+Zgy3dPk5Y7RSp4y+
 eQzdCKzLcS1zJ5RGmvkVYWP+miKfo2Xp/RBV6Q2yLMX5zTaHiC88L1MuFeAolzyMJaD9
 WUgfkD+yfmgO01hgwmh+cIRChG7LluUxXs8gW1b8wbh/8DvXjokwKmLSOoIuKIgAeydR
 LgHQ==
X-Gm-Message-State: ACrzQf24Ra4LN/nbDWgUW98jzS+C6YzkCDG2X2wXpeSL2Pcpd3OJZXO6
 2ZdaUL42wuNb55LAlx/F9lbSjXpP7BV/VQ==
X-Google-Smtp-Source: AMsMyM5F6TgB+m9JMRajWE0IynVR36TShb9lo69M6zLE6lgv8UrGHiYNxIWouamfO7j9o5XgbFENEw==
X-Received: by 2002:a05:6a00:238d:b0:563:b212:9257 with SMTP id
 f13-20020a056a00238d00b00563b2129257mr33370542pfc.21.1666617948828; 
 Mon, 24 Oct 2022 06:25:48 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/29] target/ppc: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:45 +1000
Message-Id: <20221024132459.3229709-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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


