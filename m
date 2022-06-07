Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8A53F44D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:08:42 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPaD-0006Jb-IU
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG7-0007EG-Cl
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG4-0000NI-EF
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:55 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o6so8581834plg.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ek6PL1aZJ6QfF3jqkeBuGSpjxRGu0Fp0N+Z+wPmIoE=;
 b=nmS6EnzY7A7b2UlbQcSL3YdbbctjWmW2MQYoo8ahBHDemu28b/eVZnPz4S6AzoKWeE
 +FkGAvIbWki1DzdScYp3H7S60UlOLFO77igZsha9ewT3EQC2FipBqjE10U1fb/+EB7BM
 S2MCTzZNIaJg9ZYauYn5aS6Ou0KfGK+Q0D0eJKCkUAJp7DyM869h0TEzOt66vFkrNDr8
 5sCDDP0elmBYtyf75P1GUYNDi3LQNMyZQPGa2vyxygnOr3ImhMKKJHVbWlEk3PCLoGBU
 ZH9EC75jHyBQP4SEVyo7lqR2uCMxPTDdMS3RCpHkdCgzlv+k0t1wZ5x7Q3OViwH6MbN7
 Vfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ek6PL1aZJ6QfF3jqkeBuGSpjxRGu0Fp0N+Z+wPmIoE=;
 b=3clD5OAkvWi53MzVtdfNsF3jqkmfaYUXjet2I9jvSwoJyO2BHb6t74y/SU9c1I1cGm
 Awop8T7B1SoC/d8nohjcI8KYqUOmnVG3AcshJ8ZQjRP+kcKwpt47uzqd/BSch5mFQ/gp
 meBqLszygL9Am7/Zl7DVC9Za6y6mHqUe65l44+7YSzqY3L9iZrPDUEQlRb+bGGOmWpTm
 iUEyyrHCCXtNCwJP6Ip2Ueyfj9885OZqxDvn5ymYp3tkMZw2690s4J6aeQiKrGtrGejd
 P1FBwwTkAHkwdxoGla1kPUtYiOqGvExpwtW46HakbztODz+7NCI38WW/PUZjOGyDD5LW
 ELvA==
X-Gm-Message-State: AOAM533wus5/wLyvkg9NLbbgL2O4MEz8sGb369gE446TYz4FmlGeP6Qf
 5OejKI65GGEWuklmMUnCE3Z9SYMoP43I+A==
X-Google-Smtp-Source: ABdhPJw+Bi4vqj5ZzYYe2W2QD6EXSi/fJbXIcVDAZ4jCwDuzXZva+9+x0sXUeQLd7aRkG+5bzdMUGQ==
X-Received: by 2002:a17:90b:1d08:b0:1e3:2a4f:6935 with SMTP id
 on8-20020a17090b1d0800b001e32a4f6935mr42556887pjb.174.1654570071071; 
 Mon, 06 Jun 2022 19:47:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 18/25] target/arm: Introduce gen_exception
Date: Mon,  6 Jun 2022 19:47:27 -0700
Message-Id: <20220607024734.541321-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a new wrapper function that passes the default
exception target to gen_exception_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index edb7d3f394..5a48937ede 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1093,6 +1093,11 @@ static void gen_exception_el(int excp, uint32_t syndrome, uint32_t target_el)
                                           tcg_constant_i32(target_el));
 }
 
+static void gen_exception(DisasContext *s, int excp, uint32_t syndrome)
+{
+    gen_exception_el(excp, syndrome, default_exception_el(s));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
@@ -9758,8 +9763,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         switch (dc->base.is_jmp) {
         case DISAS_SWI:
             gen_ss_advance(dc);
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_ss_advance(dc);
@@ -9828,8 +9832,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_SWI:
-            gen_exception_el(EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb),
-                             default_exception_el(dc));
+            gen_exception(dc, EXCP_SWI, syn_aa32_svc(dc->svc_imm, dc->thumb));
             break;
         case DISAS_HVC:
             gen_exception_el(EXCP_HVC, syn_aa32_hvc(dc->svc_imm), 2);
-- 
2.34.1


