Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5425AE6BF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:40:55 +0200 (CEST)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWwo-0001HP-If
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWj-0000EA-1M
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:53 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWh-0003bW-76
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b16so14658593wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=o67PXZOZfeYfRxDwFk1PFMJdK3CT7tgmtjey7Y6wHSM=;
 b=myVMzQI5nl6KaseLOf7PpDExurrWGhbqpla2kw1ZipfqKp9Hf35I25EZpzwYonLx7s
 KXJwIBcF9x5RALtYrnQSbG6GAY9ZwObsdZhLsTGyj+ZTGUvDSItNPcUjAltHM4Abfpgz
 aZ1AM/AEek1/CvGiUt28Qg72pDWbuqUKMAVNgLPNsB/jab3FzJ0YQCp6ZbjVSFHgyf5m
 VV8GgCV7CFgXUYfKvYqEV7d4+wzetUciMQ9Q4Oi8CDBh190qIjx/5/cno168+Qpg244H
 A1tK9QoPDxxaY9+IiHVF9aOw3z4hCy33jPehyVdeOb6ZwpMCmTJlmOWw4ZjB8F+BcSO+
 cAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o67PXZOZfeYfRxDwFk1PFMJdK3CT7tgmtjey7Y6wHSM=;
 b=z2Ov6RXC2htz96BsId8ksqbCwHLuNKBDaq0OF8lWiurA+SUkcII2LpuMftySaf/OwB
 GD1glisr7mRH32Kthvr+L9WWP6iGPLuNDwspyZJ/vR49E1SgNVcxPYAS9AqiKdEdMxUT
 71NP1KWpcdhDjUaHH4GufJYdH1y00YnarYeywJ4CYJeBUIGUCcRK2mMtO5XRepqLDoB1
 pKvBjX4MWByMlcQn+mZRidtltGwaj38sn1xnwIc3C+f+5FtrCWCPbAs0NLfUd3X8IyN8
 mgtpD1MnRxTrgdHT+oPPMgUu9fvbE8OA9hUOqYk9io9KW49BQ7jGFCt8N5f4At+AvlKK
 WVLA==
X-Gm-Message-State: ACgBeo15RenTC5gi4/wWe9oHazYQRhAcQqTtSiTZxuDFUmDMJsIA2RgA
 WxWzq+RQUWnDy3PLJ7CP3mHL4Zr665IAw7PX
X-Google-Smtp-Source: AA6agR7HLOhmRZicApKExu3jKhiLoeeXJV76jB+4pSaN7QYG18CXtDLzBJSpJQCuKzDNH1DCR7xT5g==
X-Received: by 2002:adf:e94a:0:b0:228:6aa8:432a with SMTP id
 m10-20020adfe94a000000b002286aa8432amr6059203wrn.567.1662458989888; 
 Tue, 06 Sep 2022 03:09:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 16/23] target/i386: Use DISAS_TOO_MANY to exit after
 gen_io_start
Date: Tue,  6 Sep 2022 11:09:25 +0100
Message-Id: <20220906100932.343523-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We can set is_jmp early, using only one if, and let that
be overwritten by gen_repz_* etc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 42 +++++++++----------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 527fb79895..cedc195837 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5605,14 +5605,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdrand(s->T0, cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_reg_v(s, dflag, rm, s->T0);
             set_cc_op(s, CC_OP_EFLAGS);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -6658,15 +6656,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_ins(s, ot);
-            /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
     case 0x6e: /* outsS */
@@ -6679,15 +6674,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_outs(s, ot);
-            /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
@@ -6704,13 +6696,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xe6:
     case 0xe7:
@@ -6722,14 +6712,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xec:
     case 0xed:
@@ -6741,13 +6729,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xee:
     case 0xef:
@@ -6759,14 +6745,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
 
         /************************/
@@ -7432,11 +7416,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_rdtsc(cpu_env);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
@@ -7893,11 +7875,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdtscp(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -8261,6 +8241,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (b & 2) {
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
@@ -8271,9 +8252,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
             gen_op_mov_reg_v(s, ot, rm, s->T0);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
-- 
2.34.1


