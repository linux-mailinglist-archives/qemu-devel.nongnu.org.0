Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DF59CC86
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:52:25 +0200 (CEST)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHDU-00085Y-OR
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGva-0006AL-DP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007Hb-AC
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:54 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 202so10764579pgc.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=wlQ7TubdU07QaJgJNanX9RFDjUgVlHllrag0UgF/OJg=;
 b=bi0LjhkGM7/SS28IJmPhcj5jJF2e/oI9QPsH4NtUHxsvts1p2jymigNNvyU8Xuqe96
 8VR8ViscbNMu9Fjb5BEty6k1QO7hjrrQksFOUWiVc9w5XzlqtIxcGqT5noA2GFRdbtCs
 p4F0UENNQIoJsrR8xq2J+JIJ1O0eN1vFoRjCYFf5qLp+0hVwxy2GuOf3Mv2CFRGmZt+r
 cr19ewewMqlP6AjW2pGV1SJNYd9l9it54QChD/N5Ih1tRi7R5r4EPDN7bBvE1EURvlJT
 bT3FwVHVTYwLa7IvH/IuoiYwzjapnf8+7ageKA5+zwb8uTUx+fT5nk20k9lC2RumDkfM
 6JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=wlQ7TubdU07QaJgJNanX9RFDjUgVlHllrag0UgF/OJg=;
 b=a3lYuNfnAzEzvGaQhoRfYqGStn+O4RU/Snw0q/5l5cjoNUKYLoCnhf48jpQhX9Txk6
 TYp+ku9v1Md0ar8JFLRIkFtcDfAKHbgbojj9X6OPYZ60vjzzAEAkWMOxMB3QCSsqg3+I
 Ysbs/5v7viFKeRTOarzvI3ZXp/UEJgup5EvHZpMhXYIhXXrD+C+WxQUhl88rcwC9seXV
 Kz3hNFJUoImIXJcZ/xHQ3JayVUj7C1pZVLGmhrQ8VBfmFAB5zzRfDVGDGhgFrrw2/y1K
 R/1qIy3rsT0BsbasFZdbf9eN/XT73jFg5bfBOILZpznD7n1AlJdEzXqY2I7GxiKcwUFi
 OJaA==
X-Gm-Message-State: ACgBeo1ybmEQfY4zV73dUzSJ3M4SbsLRFcX8fZOJVOUfj/Br3I5PUYjX
 7SoGq2dVWtRQmnqCz/Xcwh6ePPECo0Uh6g==
X-Google-Smtp-Source: AA6agR5c2aqo7X9HT3/ku754vRGX01nwXrsvKrxKz8wMqPAHx3R4X3UtHP0CnnaCRsFx9Fis7f4Q1g==
X-Received: by 2002:a05:6a00:15c4:b0:536:ed66:bb9d with SMTP id
 o4-20020a056a0015c400b00536ed66bb9dmr1896667pfu.75.1661211224413; 
 Mon, 22 Aug 2022 16:33:44 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/22] target/i386: Use gen_jmp_rel for gen_jcc
Date: Mon, 22 Aug 2022 16:33:14 -0700
Message-Id: <20220822233318.1728621-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 59e7596629..6d6c751c10 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2373,32 +2373,14 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     }
 }
 
-static inline void gen_jcc(DisasContext *s, int b,
-                           target_ulong val, target_ulong next_eip)
+static void gen_jcc(DisasContext *s, MemOp ot, int b, int diff)
 {
-    TCGLabel *l1, *l2;
+    TCGLabel *l1 = gen_new_label();
 
-    if (s->jmp_opt) {
-        l1 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_goto_tb(s, 0, next_eip);
-
-        gen_set_label(l1);
-        gen_goto_tb(s, 1, val);
-    } else {
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_jmp_im(s, next_eip);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        gen_jmp_im(s, val);
-        gen_set_label(l2);
-        gen_eob(s);
-    }
+    gen_jcc1(s, b, l1);
+    gen_jmp_rel(s, ot, 0, 1);
+    gen_set_label(l1);
+    gen_jmp_rel(s, ot, diff, 0);
 }
 
 static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
@@ -4608,7 +4590,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int shift;
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
-    target_ulong next_eip, tval;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
@@ -6768,22 +6749,20 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        goto do_jcc;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_bnd_jmp(s);
+            gen_jcc(s, dflag, b, diff);
+        }
+        break;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jcc(s, dflag, b, diff);
         }
-    do_jcc:
-        next_eip = s->pc - s->cs_base;
-        tval += next_eip;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jcc(s, b, tval, next_eip);
         break;
 
     case 0x190 ... 0x19f: /* setcc Gv */
-- 
2.34.1


