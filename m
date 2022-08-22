Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038A959CCAC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:00:57 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHLk-0001hO-26
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvZ-0006AG-5m
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007HS-80
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id y4so11315568plb.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=EZyND4NGeoU1eMvAx2PNVOo/qLZXAFJyhVnn9sXD44Q=;
 b=i9n0X2K5lB2HZxUdQ9lZb6/1QliTF84Rlec3KVda6/IlqPpp3cjt52S8482CbMb9Z5
 FqvV/l9XKf1tZaXL4tUqt+V4mvrsk1IlT6eRkP+p3E/sfHaNdipVctzoW8QFbTjClpJH
 cdH0TFtscOee1a1S6nT3oawH9RH8e3DBVd7Xa7Xif3yBfkWz+6HYgllpcz0vkvqrfScb
 Zqw2zIesabaLE8csKSm+L4FfvdQkWeOejsDMhv2vAX5CzikLTq9YDAeBWNsXa2/DLsLH
 F2brMZ193O/qzOwHNTjmh0AszmvOkMnsAPuatYOig8XAIagMQ2Tuf9ZqS0MdPBLf/MOX
 iAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=EZyND4NGeoU1eMvAx2PNVOo/qLZXAFJyhVnn9sXD44Q=;
 b=V6NtU+dobzLWPDu7JxeH3RLiLUbmBLgwwPcoL37qvFOgBr4j9Di82fJ5koNiX7t35q
 fL3J1F/P4JPGOL3WN4GNmP6bstpAxX7DGZUVBS05R7pKag0ypAu6wTenX81qtLL4f5nc
 D53tKe2txDqkBtdcbgPC6l3bi3SSHN0kyYfqckdUPxH4+SCb25kdDOoDiePK/RvnMFNI
 WyCLLE5BA/ufCkMEv8FwHVdkK8AMDEQWCiCdg8krDzC4CrFV2dCq5ONQbyy8/m5NRKcF
 zbRsDjHiSvIZ9QUgD8Jrnp6nbotNp3jL5Vtb/ukXO+dogGo060oNulF0Zpb67/gxVMxS
 7N/A==
X-Gm-Message-State: ACgBeo11ANKQREK+JHXc2EhCUGXFWOvwIG05wPnlB2rurlNTS14pqgH1
 rB/irNkBjVodtlexIcdjjQxhhZ1/2YIr0Q==
X-Google-Smtp-Source: AA6agR7J64dZxzmj3z7ILVC3JP6gruEi6SBlDNUgxW64HoGfXorIbii0WiBeO56zWgaodxQ0/HVjug==
X-Received: by 2002:a17:902:f083:b0:172:9128:c70d with SMTP id
 p3-20020a170902f08300b001729128c70dmr21929353pla.145.1661211220963; 
 Mon, 22 Aug 2022 16:33:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] target/i386: Create gen_jmp_rel
Date: Mon, 22 Aug 2022 16:33:12 -0700
Message-Id: <20220822233318.1728621-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Create a common helper for pc-relative branches.
The jmp jb insn was missing a mask for CODE32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index cacd52c50f..0a2ec85972 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -226,6 +226,7 @@ static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -1173,7 +1174,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, s->pc - s->cs_base, 1);
+    gen_jmp_rel(s, MO_32, 0, 1);
     gen_set_label(l1);
     return l2;
 }
@@ -2756,6 +2757,18 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
+{
+    target_ulong dest = s->pc - s->cs_base + diff;
+
+    if (ot == MO_16) {
+        dest &= 0xffff;
+    } else if (!CODE64(s)) {
+        dest &= 0xffffffff;
+    }
+    gen_jmp_tb(s, dest, tb_num);
+}
+
 static void gen_jmp(DisasContext *s, target_ulong eip)
 {
     gen_jmp_tb(s, eip, 0);
@@ -6703,20 +6716,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         break;
     case 0xe8: /* call im */
         {
-            if (dflag != MO_16) {
-                tval = (int32_t)insn_get(env, s, MO_32);
-            } else {
-                tval = (int16_t)insn_get(env, s, MO_16);
-            }
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            } else if (!CODE64(s)) {
-                tval &= 0xffffffff;
-            }
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
             gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
-            gen_jmp(s, tval);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x9a: /* lcall im */
@@ -6734,19 +6739,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_lcall;
     case 0xe9: /* jmp im */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        } else if (!CODE64(s)) {
-            tval &= 0xffffffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jmp(s, tval);
         break;
     case 0xea: /* ljmp im */
         {
@@ -6763,12 +6762,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         goto do_ljmp;
     case 0xeb: /* jmp Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        tval += s->pc - s->cs_base;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_jmp_rel(s, dflag, diff, 0);
         }
-        gen_jmp(s, tval);
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
         tval = (int8_t)insn_get(env, s, MO_8);
-- 
2.34.1


