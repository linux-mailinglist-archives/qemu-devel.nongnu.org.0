Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F55F1CB5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:26:06 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedRK-00032w-S1
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBu-0002cE-9z
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:38642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-00040K-Sb
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:05 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id de14so4386229qvb.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=a/xQsKyfDAJVBnWrdlFFbEpL92rK/XhCYn8netaVPz4=;
 b=bwWIBlwgWeIVsR74BXv0tM96nFp8L4K1Wnih4l6ey9eUl8StLaslAC37jXe99UJyVp
 QXwcm7MTMEpKLGvgStlvNh1LeVrKvYmUJviSiWihWflMHt+L06O8MsBaDq6PsNp+5cVw
 WQ8u2y9LmPqXjmFQ4gUdIB12HX+b4djC8zti7su7LCVd3swrNzUaKHi3545Jrk9hBT1M
 YQuSaYzHUQYoSi1TbKkOEAz4+DUzmQ/L9LljKIM2F/qhPDbcy/kC5KyBktwxUBgEZO6B
 5dbo/khDbZzVwdEJu1Df+jrGaHI0vK4GjUnFM15ExhZ6xCyq0tuTV9TI6OQ2ZmjN4pBl
 VPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=a/xQsKyfDAJVBnWrdlFFbEpL92rK/XhCYn8netaVPz4=;
 b=dAjvZOg0RQ3yMcDGxZcEDHIntNHSC1+82kUwhAYkNWTrIxQUSaNeMzJSib+BsPlYvs
 xRaVpo/qulNLBgZ/GTQcNU4vGHycgBbctPbacIGuYXt1YDqUKtcUXcQi/R6Bf3gjeKdp
 1ym0EGbB83vcAVeBmwtjO3TmTh4UbcoNh02OGWXcFlpzUYoAW3uf61TU6iwlDryBuV6t
 5ebEqYUBQPLbi2PTh7XdalLj2R6UhDn/CuAkcab2aP9Yn3JMQSNlfRuvrE7Bg+Do9gQv
 eMjsGZ/rhsrIinXwirziBWqzDrlACgON2Fy9pcogOobOC8vWFLFNHR7ZMowEZrLIbFI3
 RI2Q==
X-Gm-Message-State: ACrzQf0JYWOFwjU+lMDtv1TFMVHSuVCWvrDMf4dZpi40ToapMcb1dfV1
 UOPBoK8sBECm6BQXLl40cLCMuYxkHxdCeSak
X-Google-Smtp-Source: AMsMyM7SXuKsCBxhBxfJ50UxFoggJ8DDKVms1xAAWis9VYr5xDQ+ETh23ETss2PH8QhheJCqHgWXaA==
X-Received: by 2002:a05:6214:29e7:b0:4af:487d:c049 with SMTP id
 jv7-20020a05621429e700b004af487dc049mr11175054qvb.96.1664633400009; 
 Sat, 01 Oct 2022 07:10:00 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 08/26] target/i386: Use DISAS_EOB* in gen_movl_seg_T0
Date: Sat,  1 Oct 2022 07:09:17 -0700
Message-Id: <20221001140935.465607-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set is_jmp properly in gen_movl_seg_T0, so that the callers
need to nothing special.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index caa22af5a7..8c0ef0f212 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2457,13 +2457,15 @@ static void gen_movl_seg_T0(DisasContext *s, X86Seg seg_reg)
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
@@ -5726,26 +5728,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5792,16 +5780,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5991,10 +5969,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


