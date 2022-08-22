Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E559CC76
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:48:47 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQH9y-00015X-4e
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvE-0005xS-5U
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:32 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvC-0007FY-2y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:31 -0400
Received: by mail-pf1-x436.google.com with SMTP id y141so11832382pfb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=jKb8loPtKw8T5KNmqMg72+z1tROhcSAfpg6d4iTJR78=;
 b=huNmScgEN4h6o3cb1PeeakLwBKJYxg4jSv1tqRaHMqjQHL0+4chtqHaXN0AvTGy03P
 Tw2n0p1ric/6yBsFHEPBittE2PYDOvvnVRL4wUDkuwcrRRT/GsCRhancBaOqEI7POUUh
 R8ayIt44NXin7RTtazlFWLWJ3fyHR97DcOB8ALQVuXEmBKzn3ZFWx2tI7cePkWUOHL64
 QCw9dWHYJEBVbkCqQWhOlKQyD0M3Xb2xy7oAImPWJy7ZHprYpMdwjgqCW3xcdX2F4SnF
 27DepMZnHstADKDbi45Gr/lwSzq7Jl0y6Kpk3nbYRWicknlvxe42hFHskQTymePlJ5Mn
 AUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=jKb8loPtKw8T5KNmqMg72+z1tROhcSAfpg6d4iTJR78=;
 b=fjbRi+YUiTGE3QzpXYgX6R+flRnUAuRtojbRRxFLmpXQdIh2dncy9VEzjiezz88GcV
 2SP6qMy4Qr7/vsQHG7M2vLOIRxv44yayL06pLy4Jv3U10OjZ93KAYD8Ycnyd340LymJy
 T1fS0NUo6WORDgO1woEqikz8hR+nry3UhZkJYdxIdutWof976ytW8kZR7zHaRBr/cvg3
 BayADHL/J/04r6ANqpiU1l/Do407B0kccNvt0xIzLd1VBIC9e2XfsNx5EY0UwyCPBgm3
 HPt8+PZTcs0RloqrB4hgrrVjgrW1OGQvoegklNgLR9ohXAXhfgs7y5R8hpNaWoJvGdJJ
 BvjA==
X-Gm-Message-State: ACgBeo0lEi9cUORvqN0FbkaG6GbH5n70EYRjx/0nrJqGAhEO3bqcN5cB
 hl03kAZBbGp7kAAM/RVOSDIG/9YkQsa5mQ==
X-Google-Smtp-Source: AA6agR5LXa53p7C2g/0Ld9Ld+begvJ3/13D5W9wUcXWylQsm+d5RqllbooXiak7+8iyGoTngfMmPJw==
X-Received: by 2002:a63:4d65:0:b0:419:d6ae:27df with SMTP id
 n37-20020a634d65000000b00419d6ae27dfmr18993339pgl.179.1661211208827; 
 Mon, 22 Aug 2022 16:33:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/22] target/i386: Use DISAS_EOB* in gen_movl_seg_T0
Date: Mon, 22 Aug 2022 16:33:03 -0700
Message-Id: <20220822233318.1728621-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
index 579ba37e76..4dc8f4c1f8 100644
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
@@ -5569,26 +5571,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5635,16 +5623,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5843,10 +5821,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


