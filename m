Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A086A3AE5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:52:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWJ9-000664-Cb; Mon, 27 Feb 2023 00:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIg-000537-PU
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:50 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWId-00059b-FF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:43:50 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso8866692pjb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OtbuoqOQ8NxPiPIk6/AH0BDSmN9UcvckTcgcCxtjS0=;
 b=ZNCFj5UwFDFpOW28acWfYsKaWRMDl7NQoNlJYpDJiDbDKKB7EIrsasA0AaOm4S7iU4
 f/PSYVL2G5Jxxxj01iRT7DYQRp+imf1rzIap68eNwadN6YWpBpFlEwb0thOOz91MTpGj
 EtdQfu63SUvUvl0TK+JxzZrIlGVZ08cJFW3h+zsy8mw0P9ggavpIjd/ceTv/ofGVDjfa
 GMvNS/+GpaFk4pWMj2MRdam9aueMW4BVRW/ZsT4Baz9xJOwkdbDh9wVoc3fnm7Jplp51
 MlWm50H9Ojz02Gp8HNUieQDFbbDSZW49tOd7zzXCFXqBhl27s3e/QB3cssTuK5t0li+6
 Xzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OtbuoqOQ8NxPiPIk6/AH0BDSmN9UcvckTcgcCxtjS0=;
 b=MHt5eEzmgrQ85ELqVOHRbejCBypx6/ZPih7oH0jinXzB46HGTaNLscF2oVYJtAIESS
 4WyBxqPtv2vFWyPjVf5JL0OfzcJ+UZ3cZXniZ5xtGuplMzx/6nBLT55vmBOPeR7GMmrq
 Pig84kEhXoVMdDCPViOkp6XzBX741YTtRJseDPVlnnj4AA02Qdr1c3ST/9x0cwol8TF9
 MWvo2K9a7JXHo0XMBPN6AEWDgR+89idUKZNJvTmc2HOoAWdDUiuXQmpwI010udlYVLmT
 c5XdlfiBJrsp35+sUtIUVDbSyU3FOGPKBc7S6j3X84mKulwmaO/CmkAuPzH2bZspHCrS
 OOpA==
X-Gm-Message-State: AO0yUKXFalPWhhZ7MMGbbtfo13F2IP5RbHsjbYQQPSVIoP0lrIcFJuwf
 CtTwcgknw7BVNvV9mCbNo0HLRpFRYPWi1zWnf+4=
X-Google-Smtp-Source: AK7set/04MlcirWE/n+uJaPbs9CivcuqJlE/T0Bfpf3Rl0LFiKVUVTtnPTteAPPcssIxCIehXgJu6w==
X-Received: by 2002:a05:6a20:918a:b0:cc:85ff:1810 with SMTP id
 v10-20020a056a20918a00b000cc85ff1810mr10207651pzd.60.1677476623072; 
 Sun, 26 Feb 2023 21:43:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 22/70] target/i386: Simplify POPF
Date: Sun, 26 Feb 2023 19:41:45 -1000
Message-Id: <20230227054233.390271-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 55 ++++++++-----------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 692f0c63a8..5d1fcc4b15 100644
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


