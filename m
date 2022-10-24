Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123860ABD7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:58:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTC-0003ZR-Qe; Mon, 24 Oct 2022 09:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSp-0003QJ-EP
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSn-00043h-EO
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id n7so8454763plp.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CqMi6AgcSdGr/g7gG0+oR8p7CnhkH9erJLU5T1v9TNs=;
 b=Z5Sda1i+Uy9aEo+iiYzQpNKQR0Mi0hWTZB3xZTArj/SOq3XBS2uwzo9CVWd/usUz/s
 J6GTHDKjEBi3nsqYLZmtjxEVm8l4luUhxVISpycPvrSRJUgRdcIw0R7GgrPhOOMxVjYz
 oG9QhL1g8Ehp8EwP46CeX3fvUnBf1gjS4cjLrA7A5OBKr7c53WWGXhp8zKdqVu7XCIin
 uOUaWPHFI2Hgl08iLLWVlzZuuM2zq3BYJzSTer5nvsFMN6KqjSFTnmEwrdLSxuASuh+w
 HQkgGDe2TBKCkIJlhW4QVxtRqCaow3V3fhMuRCFhnG/uE4mjAOdxhSgLY+1njDLny0GJ
 Hmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqMi6AgcSdGr/g7gG0+oR8p7CnhkH9erJLU5T1v9TNs=;
 b=X+rUFXh7zgEQGvXZoTOgeC2e9v3EOdU1X5YPIrVi7Yl6S67AW17PfrrfvPBPpHtIDZ
 wejhYXZCNw1WA8B+Ok6yEqKanVw9lgEkYyxYZoXmr4vwtlrQSOxJNuajUZ7MxEnWmKZh
 caeqfTk8pJzIgm4MVQ/0okbcJbRx4eOWmlB6OL8SkbLSa023GjZ7OGrNsmN55t5UBgON
 jV0NYUR49JBQraY8fe+mXgy6E0gk4A/3hwWLORdZ6o2xokorqaNQLGkD47KOw4xfunt1
 d+D5E5XJ/jBqElja1Ta0kvuXmsZE8gA1VqMIk6hPMHMNBEgwtASqAYlWWQPYmjRVI270
 eRlg==
X-Gm-Message-State: ACrzQf2SxZZYIQUZz67u3CKp+iLENK1eO88RY+3ifKN4Uxe2nvWN3Iwc
 9IJCUKR4HdGcTzzRIXyGfcz3Eiyx7wW1+g==
X-Google-Smtp-Source: AMsMyM4XkfVXHBGMIk0CQUaUHyxm8xyCUMyDsFQcWWFszavRn2vAbCSvBT5oToNOVMvtaslWyQMlvg==
X-Received: by 2002:a17:902:e88b:b0:17f:93a4:e31b with SMTP id
 w11-20020a170902e88b00b0017f93a4e31bmr33936953plg.51.1666617955807; 
 Mon, 24 Oct 2022 06:25:55 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/29] target/s390x: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:48 +1000
Message-Id: <20221024132459.3229709-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/s390x/s390x-internal.h | 4 +++-
 target/s390x/cpu.c            | 1 +
 target/s390x/tcg/translate.c  | 7 +++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index b5ae0ae364..5d4361d35b 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -398,7 +398,9 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3,
 
 /* translate.c */
 void s390x_translate_init(void);
-
+void s390x_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data);
 
 /* sigp.c */
 int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1, uint64_t r3);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index df00040e95..96562c516d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -272,6 +272,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
+    .restore_state_to_opc = s390x_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = s390_cpu_record_sigsegv,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..5798928473 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6691,9 +6691,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     translator_loop(cs, tb, max_insns, pc, host_pc, &s390x_tr_ops, &dc.base);
 }
 
-void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
-                          target_ulong *data)
+void s390x_restore_state_to_opc(CPUState *cs,
+                                const TranslationBlock *tb,
+                                const uint64_t *data)
 {
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
     int cc_op = data[1];
 
     env->psw.addr = data[0];
-- 
2.34.1


