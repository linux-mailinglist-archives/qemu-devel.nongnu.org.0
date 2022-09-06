Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F125AE601
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:55:54 +0200 (CEST)
Received: from localhost ([::1]:60378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWFE-0006Ky-OL
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWa-0000AL-Qf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWZ-0003ZW-7r
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t14so7376935wrx.8
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pstCvedhP85R8a4eYJRnMyGD8r8ruJDFqMM28CjwXss=;
 b=wpVKiuOUdI8S3iKZUVvK/AtW2n2MwE+kHP/pz6XYU87YPoI9siPsmqnGQvVjvU6uU6
 0LtyXr14pvgbWBAWAE2FUSKJ8WHJeMaZn2kZ/amZLNDkIVVVEQcLWywv5uUeWnCyt+gL
 +NQhxacKbowQ9pkHIqfJIlzEI/xUEvacak3FsUAeoPZiePrdbwZOxSx+GZHMU+5owP1D
 FmWObJBvWmX2ZLHSPg0d+EooFSxPJGAzPiPdANQuE5sXzyOs9QAtUh00sw/F+80pseaj
 0Aae+cNWdjBeNvUrQ2BvHN99HznxZk2YErTIKHUAMqSGeXak1hxEeV/rMjEDchjqtML9
 Dfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pstCvedhP85R8a4eYJRnMyGD8r8ruJDFqMM28CjwXss=;
 b=CH9+xqdWfKww2jngzuexgUT/Fu9dcS78VRk14kKsscWBeewhlOy4rhsVWtlfTRltfE
 R/5WxIBQi0zQYO3c3d5L+wf7JInx+Hr50aNVMa8rKrP2Obi9kzPpzDXqhiMdOxUodFO7
 N3kALxLgeHsM7cEG64hXsQLW96KRvwiW0SQ+j1JkDNERTt2uYrZv2vswOT94iG6Uc1nw
 RfOE/IQViLS7OfFhzZjVdjN54BFC+mDJeakhijhKnVsGk5qZBK5ozFKtTSvbowLQ4dbf
 +zIXTm+qZxGwtwncZosVRm/qtO6nKPzDJDiW9jvzjVkqxfkyhiyr7/p99fBXDYCkxMAq
 VSyw==
X-Gm-Message-State: ACgBeo0/M2JTSkL67xSbL3azsYOBvWugAZ1ZW5xQTnQjNsgkwO9RQyHp
 TOLE1cu2oC1mlmLrxtSK27+rWAwhunAuLH3d
X-Google-Smtp-Source: AA6agR62ME0MclxQUJMPRw7DqykbnXkWi8eIOtThuRGTtGxtr1rOX6jUpJDDSHC6XR7ALm5isc3tVg==
X-Received: by 2002:a05:6000:2c5:b0:225:618e:1708 with SMTP id
 o5-20020a05600002c500b00225618e1708mr28128838wry.510.1662458981979; 
 Tue, 06 Sep 2022 03:09:41 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 08/23] target/i386: Use DISAS_EOB* in gen_movl_seg_T0
Date: Tue,  6 Sep 2022 11:09:17 +0100
Message-Id: <20220906100932.343523-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

Set is_jmp properly in gen_movl_seg_T0, so that the callers
need to nothing special.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 778ee4ed4c..ea35d3e9b4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2432,13 +2432,15 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
            because ss32 may change. For R_SS, translation must always
            stop as a special handling must be done to disable hardware
            interrupts for the next instruction */
-        if (seg_reg == R_SS || (CODE32(s) && seg_reg < R_FS)) {
-            s->base.is_jmp = DISAS_TOO_MANY;
+        if (seg_reg == R_SS) {
+            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
+        } else if (CODE32(s) && seg_reg < R_FS) {
+            s->base.is_jmp = DISAS_EOB_NEXT;
         }
     } else {
         gen_op_movl_seg_T0_vm(s, seg_reg);
         if (seg_reg == R_SS) {
-            s->base.is_jmp = DISAS_TOO_MANY;
+            s->base.is_jmp = DISAS_EOB_INHIBIT_IRQ;
         }
     }
 }
@@ -5682,26 +5684,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, reg);
         gen_pop_update(s, ot);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
         break;
     case 0x1a1: /* pop fs */
     case 0x1a9: /* pop gs */
         ot = gen_pop_T0(s);
         gen_movl_seg_T0(s, (b >> 3) & 7);
         gen_pop_update(s, ot);
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            gen_eob(s);
-        }
         break;
 
         /**************************/
@@ -5748,16 +5736,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_ldst_modrm(env, s, modrm, MO_16, OR_TMP0, 0);
         gen_movl_seg_T0(s, reg);
-        /* Note that reg == R_SS in gen_movl_seg_T0 always sets is_jmp.  */
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            if (reg == R_SS) {
-                s->flags &= ~HF_TF_MASK;
-                gen_eob_inhibit_irq(s, true);
-            } else {
-                gen_eob(s);
-            }
-        }
         break;
     case 0x8c: /* mov Gv, seg */
         modrm = x86_ldub_code(env, s);
@@ -5956,10 +5934,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_movl_seg_T0(s, op);
         /* then put the data */
         gen_op_mov_reg_v(s, ot, reg, s->T1);
-        if (s->base.is_jmp) {
-            gen_update_eip_next(s);
-            gen_eob(s);
-        }
         break;
 
         /************************/
-- 
2.34.1


