Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1276F6AB412
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyyY-0004tV-Mt; Sun, 05 Mar 2023 19:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxn-000302-0c
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:27 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyxi-0007HV-NX
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:44:25 -0500
Received: by mail-pg1-x535.google.com with SMTP id s18so4566795pgq.1
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EfH2DcSHcvy40colhOJL1T76EQ7m2RNJogelT3xw+qc=;
 b=yi7cvP8cHsfQnidqlYI8H551BqksZbi0tWsiX8mSzu9jxJLssUX9WnNXzR2v7N4CAs
 rXwFhNoHHgj2m2QAJTdDYyBOnG+tZStvEfwYPgb1Y3JyZ/++I8julXCb8tipyB8yVYgG
 mTXPe+72z4y5j9SukqmvkBDG+qXWE84dqjce3NF85VET5v+cH9OPjgRN3lrsg86qUjL5
 MpwaVYzN0mKpzWHD/zwq/KpJl3EFjc5Z936nvIDy87ZjZ+g/NFfIWF5xuBqZSn9eIVp9
 wSTVmcsc6k/dKpY9l+jFANefY6Ysd95ePMeLMhyETQmDoGI1seopf2J/UTO2t7EMY/ru
 YE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EfH2DcSHcvy40colhOJL1T76EQ7m2RNJogelT3xw+qc=;
 b=1xvgS6SI3AVIUmP8rLIqLSPfj95tAJj8+37B1YsAiGb39coG1spKsb+sAVgiL/oxPa
 +hwKVui7Ib7JEKuG3XvLKT4PdppFgq+GXcBN8O5PIlRWoQhEWU6furUNxVp2T9HTA9ON
 9Rh39lXvogO4gvtXdGR2pGmFwXHmgzyuSEZmTvX3rje8guot8MmdCpOp4fPkzLMcWdw3
 urxxXNji28tGP8TIPpDNe/qNgoKzTD4vqQB/RpcWmeF5XDl5ll/gjafyf3o/zZr5GFD5
 6Ky7QtnzF4C/nO0HYMFISjiJivPot+hOylyOrhwY3Ib3Ru2fcnO/NP2Fiee3o7YrEGrb
 hIDQ==
X-Gm-Message-State: AO0yUKXvDn9LbpINqxZX49vXJKt88EzjNaAH4NNZx9xa2ecu1v0Fy6JK
 7JK9QTaAh78kVoJQGKJT19ZzpnVdt7BO033QGRflHw==
X-Google-Smtp-Source: AK7set92f7S1AwQKVSKMAVuyNoN2GuccZWgL768bgVBpd1vVOW5ZsJVY11bc/JnvcKxKW9CFNN5vfA==
X-Received: by 2002:aa7:9f81:0:b0:60b:81ae:c6d2 with SMTP id
 z1-20020aa79f81000000b0060b81aec6d2mr8901458pfr.27.1678063461943; 
 Sun, 05 Mar 2023 16:44:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 x52-20020a056a000bf400b005895f9657ebsm5045726pfu.70.2023.03.05.16.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:44:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 74/84] target/i386: Simplify POPF
Date: Sun,  5 Mar 2023 16:39:44 -0800
Message-Id: <20230306003954.1866998-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Compute the eflags write mask separately, leaving one call
to the helper.  Use tcg_constant_i32.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 55 ++++++++-----------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 2f3842663d..fa422ebd0b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5226,52 +5226,19 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9d: /* popf */
         gen_svm_check_intercept(s, SVM_EXIT_POPF);
         if (check_vm86_iopl(s)) {
-            ot = gen_pop_T0(s);
+            int mask = TF_MASK | AC_MASK | ID_MASK | NT_MASK;
+
             if (CPL(s) == 0) {
-                if (dflag != MO_16) {
-                    gen_helper_write_eflags(cpu_env, s->T0,
-                                            tcg_const_i32((TF_MASK | AC_MASK |
-                                                           ID_MASK | NT_MASK |
-                                                           IF_MASK |
-                                                           IOPL_MASK)));
-                } else {
-                    gen_helper_write_eflags(cpu_env, s->T0,
-                                            tcg_const_i32((TF_MASK | AC_MASK |
-                                                           ID_MASK | NT_MASK |
-                                                           IF_MASK | IOPL_MASK)
-                                                          & 0xffff));
-                }
-            } else {
-                if (CPL(s) <= IOPL(s)) {
-                    if (dflag != MO_16) {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                                tcg_const_i32((TF_MASK |
-                                                               AC_MASK |
-                                                               ID_MASK |
-                                                               NT_MASK |
-                                                               IF_MASK)));
-                    } else {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                                tcg_const_i32((TF_MASK |
-                                                               AC_MASK |
-                                                               ID_MASK |
-                                                               NT_MASK |
-                                                               IF_MASK)
-                                                              & 0xffff));
-                    }
-                } else {
-                    if (dflag != MO_16) {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                           tcg_const_i32((TF_MASK | AC_MASK |
-                                                          ID_MASK | NT_MASK)));
-                    } else {
-                        gen_helper_write_eflags(cpu_env, s->T0,
-                                           tcg_const_i32((TF_MASK | AC_MASK |
-                                                          ID_MASK | NT_MASK)
-                                                         & 0xffff));
-                    }
-                }
+                mask |= IF_MASK | IOPL_MASK;
+            } else if (CPL(s) <= IOPL(s)) {
+                mask |= IF_MASK;
             }
+            if (dflag == MO_16) {
+                mask &= 0xffff;
+            }
+
+            ot = gen_pop_T0(s);
+            gen_helper_write_eflags(cpu_env, s->T0, tcg_constant_i32(mask));
             gen_pop_update(s, ot);
             set_cc_op(s, CC_OP_EFLAGS);
             /* abort translation because TF/AC flag may change */
-- 
2.34.1


