Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A95F1CBC
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:27:06 +0200 (CEST)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedSL-0004tR-Jj
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCO-0003JR-Uk
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:38 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCB-0004GN-94
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:36 -0400
Received: by mail-qv1-xf33.google.com with SMTP id g9so701508qvo.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Sbxg82I33kangQoaaEprEXBXR1plScSSjYL6tuL9DM4=;
 b=Q0/4Lmz1KefSV3rYj/lTor+PoylS5e5Xj1w30YQK5cGfb0heL0R33kEHiE+OohOf8u
 rvWGt7jRRezoNU/5z9oxJMiW6GBiVAXf7IUHD7dZB5m9Xf7AtL+8jVKX8tCX6/s+a7Ft
 sWXaV2gK8wPCya/GFW3nplMMxm3xI67tqIKw321qPr+Cw+xrnKRXNv8TyomsPcTkA3aO
 xV1fM2r1EfQCjXSphK0o+6I1SftgKZpJbNnUb4EeMbVdh12Krp68Ar0OkPUPAZxbNv83
 AAkVhoPDvVUQ0pJ8xAKkGOun8ewy2WI6ZSl9qEEvrCRVWrOZsHH7Qtr08JemInMoIvwb
 yYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Sbxg82I33kangQoaaEprEXBXR1plScSSjYL6tuL9DM4=;
 b=sHdA/QNgbuNrih0OVU7QW7xKa2oru6tg6E8CIg+6s7D4WX34NSY3XBdWlAddSiAbv5
 bKh6OVZZXyCUc/o4RblUCGdP0T408pkbOA1/CQnVqgvrGAL7Zy3aMfH1p3umZHueTbE3
 kBZw98AfA/UQlQMsSyFCVCnB7d1OSFEuyjh6aAqx3dhu/Qf5LpRJ7j//lxhfWwOix4hK
 mhQUkmCe/jPDtWkQ3v0GICMr0gh1aRVcVZ0TqwzclZVC1lElzy7FaYXywBMW6+s1eyfF
 br06u/lUM7BGdw5thFbZFC/v65K/KFmH4BPClxjkrqwauivlP5wqg/M1qgfsv0IpkZCk
 UxQA==
X-Gm-Message-State: ACrzQf20gmVWPyy+5M99sL/zQx8o9H/xwNO9EHhPhS4ge2AoPZ9eVB/c
 r0PEhB0UP8TshHrfDydh+Pe90ItFqOiR6xyu
X-Google-Smtp-Source: AMsMyM43nCFCMwWsaZFZVfMJ2tiUk8mLnIqkKgTl6NifD5Kj5+eKFwxGzxDzXddT56BPF34HE3sfLw==
X-Received: by 2002:ad4:5d4d:0:b0:4af:9a4f:af5b with SMTP id
 jk13-20020ad45d4d000000b004af9a4faf5bmr10994206qvb.95.1664633422107; 
 Sat, 01 Oct 2022 07:10:22 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 17/26] target/i386: Create gen_jmp_rel
Date: Sat,  1 Oct 2022 07:09:26 -0700
Message-Id: <20221001140935.465607-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Create a common helper for pc-relative branches.  The jmp jb insn
was missing a mask for CODE32.  In all cases the CODE64 check was
incorrectly placed, allowing PREFIX_DATA to truncate %rip to 16 bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 58 ++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 11aaba8a65..ba1bd7c707 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -226,6 +226,7 @@ static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -2792,6 +2793,21 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
+{
+    target_ulong dest = s->pc - s->cs_base + diff;
+
+    /* In 64-bit mode, operand size is fixed at 64 bits. */
+    if (!CODE64(s)) {
+        if (ot == MO_16) {
+            dest &= 0xffff;
+        } else {
+            dest &= 0xffffffff;
+        }
+    }
+    gen_jmp_tb(s, dest, tb_num);
+}
+
 static void gen_jmp(DisasContext *s, target_ulong eip)
 {
     gen_jmp_tb(s, eip, 0);
@@ -6862,20 +6878,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6893,19 +6901,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6922,12 +6924,10 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


