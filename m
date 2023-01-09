Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF09B661C1A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhBi-0000kW-1O; Sun, 08 Jan 2023 20:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBg-0000ju-4m
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:56 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhBe-0001Vs-Ew
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:42:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c4so7967163plc.5
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XzwUZnyRNwzrgTXbl3ZOKS8AhOqGhEQmhJu+6+SsqQQ=;
 b=jeYoNc5jBiI8f7dIkdMlZJdP6bT8b+41TmKQ6r0iIIPR8g+9yZt7rOoYxPShyMP1Hy
 7xnYwACXffbsMk+zwZOr4qHG9WFBHTBNUCqpoIaLz4fo6Nqr3Aw4hSHYCZuPei4+b5Yg
 BLyzikHztYIQxbaDgKuYEbm+PghGlBAgVRjXh6xYli+tGQIov9BG8By6ik6IeAsVgq69
 AdE0knaxFYNMhGOahbAYZlewHI5eUxinS0iOqof1xyGtjRIfIMaB8ZpsiJIgr71X2vwy
 Bq+oldyfx2VzEB9ZUOSLyAvDS4t8+Pu8RUGnWBqjhMN/ROdkScit+lLqlTpcdIdRp+v+
 IaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XzwUZnyRNwzrgTXbl3ZOKS8AhOqGhEQmhJu+6+SsqQQ=;
 b=FajnX2lGITo6+2f1ZLX7t0meDkHIK1uF+zfPDzGJHeqpDB9WMHWhcdqNYPw5glkIWH
 uZjyPJcB02QLjNptqMiKuPcd0p0XpaBU2fLMz5mMHlI4+V6IiZA6rr2FbrGGKCsy6lPF
 pURJHo0wQJUsQQ1TnFhKkoxqK5q0OjeoVTPTkcwpVCLBuzJuxbVBpwRUbp2VX0o8XtzW
 qH8p8OrDzrC4HJ7KI8E04ISDL9WFx3t+72ytEgGy+hDVEfKyQ+uSJVMU3KvD0bQUxtJ5
 SFxTc6cfyReso+6gvi6jzJ4pbv/I19KoHTJcUbty0RsmZ0LSB6lb4Jrpsh/eXQXDV65z
 84IA==
X-Gm-Message-State: AFqh2koavfGEv50vofwR3aDz2v7BKXc2RWY33LQANBPylCz1CuEmReU6
 WumAf266/RF3cD+jlirudVur1vfhT9D74jrR
X-Google-Smtp-Source: AMrXdXuA6QJUkp4yPTXXP65otWr/XGJ0ElzGzP6X3VBWehFjXqoHlbKm+iGsPXz8RMT5v8rGpTsj/Q==
X-Received: by 2002:a17:902:d4ca:b0:191:1f16:efa3 with SMTP id
 o10-20020a170902d4ca00b001911f16efa3mr69451943plg.65.1673228573150; 
 Sun, 08 Jan 2023 17:42:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902ca0d00b00178b77b7e71sm4743617pld.188.2023.01.08.17.42.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 17:42:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] tcg/ppc: Remove unused goto_tb code for indirect jump
Date: Sun,  8 Jan 2023 17:42:29 -0800
Message-Id: <20230109014248.2894281-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109014248.2894281-1-richard.henderson@linaro.org>
References: <20230109014248.2894281-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index a95e4001d3..b72e266990 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2630,27 +2630,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* Direct jump. */
-            if (TCG_TARGET_REG_BITS == 64) {
-                /* Ensure the next insns are 8 or 16-byte aligned. */
-                while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-                    tcg_out32(s, NOP);
-                }
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-                tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-            } else {
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, B);
-                s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
-                break;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (TCG_TARGET_REG_BITS == 64) {
+            /* Ensure the next insns are 8 or 16-byte aligned. */
+            while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
+                tcg_out32(s, NOP);
             }
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
         } else {
-            /* Indirect jump. */
-            tcg_debug_assert(s->tb_jmp_insn_offset == NULL);
-            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, 0,
-                       (intptr_t)(s->tb_jmp_insn_offset + args[0]));
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, B);
+            s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
+            break;
         }
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
         tcg_out32(s, BCCTR | BO_ALWAYS);
-- 
2.34.1


