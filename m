Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208D5A4FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 17:07:29 +0200 (CEST)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSgMF-0004Q5-1W
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 11:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSfft-0003Pg-9o
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:23:37 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSffr-0000CP-37
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 10:23:36 -0400
Received: by mail-pg1-x530.google.com with SMTP id w13so7837023pgq.7
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 07:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=jyZf/IkO4WrlzPvo46z55iFAICGZGNhDZR8J8ixSBWU=;
 b=NkV8tAbYx0QYwkpHbPaab4/RINcWdF5xXMrK0G1XNgtws5oqcU36iyd8vQf6OLR1wI
 lWehfokEBUJREfdjS6CZQfhBq7kO7Gr2wVcavFMsgNW3Fxokgjq1+wt2EVzmhBdeF7Nh
 xj3aIuBTdbIstsUuL6190x0DpqmUouofs/HzgisEHxYs2vI4KGOwaAOVIhcU/K3zgCmU
 /KLLvE9o+O8zKLgmhirLv+Fj2nu3YuMNQJvMaSxeq8xMJa026mC9Y3l08SyXfTRUWXFI
 DwjQWwgQjBOhY38FlGbN3Y7NlYuCbqDSDoGc/azWnEEYzxRKc9eOsU8blzMqMU9JPRBg
 lBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=jyZf/IkO4WrlzPvo46z55iFAICGZGNhDZR8J8ixSBWU=;
 b=My3MhesxMkfMDL1OvhlDtQq7ZKx5K7QfLAfAi4BTWhxydL8gcTo5uTtHy8yXyhrL0T
 WvpMWVKf/9mBCIeQAevjOC3HwNDKuLBmBdmlwRJp88raE78c2tIvmTg9jAvcML499w/M
 daHBVu6OlDET6iAmW4efyunKJ83qJmJ3kX6c3iDyOJMoJgklsX7qi10FOwZOBdOWe13l
 G2Vy4SCfHVlbMTYKizeZgbq6JpdKZ1h7nCWkld2SauoFZ/Mwxn0/nFDnrk5ogKnZoF5g
 ZjaEqWTUcZS0Ppj30rTLvNLqmlF7SP1vrbBvhmPKjcHqKDXHlylBvJ2sckQfjkGTG+r5
 Q9RQ==
X-Gm-Message-State: ACgBeo0cLxfnNcy1/Q/jv2PE6SObEiW0eQqjBXWxs51p8seVlkpmylqu
 7YUjs5QshKsSBr43XWo8/IvHzaQl7CsRFw==
X-Google-Smtp-Source: AA6agR5wXTW15WCqYm4JyJUuO4EXQFWACiqf3iuAl0HTWaKT0bQ9wObpwLP7Urc2nn9gqsbXn291Jg==
X-Received: by 2002:a63:c108:0:b0:41d:6bf3:6807 with SMTP id
 w8-20020a63c108000000b0041d6bf36807mr14279584pgf.157.1661783013236; 
 Mon, 29 Aug 2022 07:23:33 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-17-78.hsd1.ca.comcast.net.
 [98.35.17.78]) by smtp.gmail.com with ESMTPSA id
 q9-20020a170902bd8900b0016f035dcd75sm7505507pls.193.2022.08.29.07.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 07:23:32 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH 1/1] target/i386: Raise #GP on unaligned m128 accesses when
 required.
Date: Mon, 29 Aug 2022 07:23:26 -0700
Message-Id: <20220829142326.39562-2-ricky@rzhou.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220829142326.39562-1-ricky@rzhou.org>
References: <20220829142326.39562-1-ricky@rzhou.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 29 Aug 2022 10:59:21 -0400
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

Many instructions which load/store 128-bit values are supposed to
raise #GP when the memory operand isn't 16-byte aligned. This includes:
 - Instructions explicitly requiring memory alignment (Exceptions Type 1
   in the "AVX and SSE Instruction Exception Specification" section of
   the SDM)
 - Legacy SSE instructions that load/store 128-bit values (Exceptions
   Types 2 and 4).

This change adds a raise_gp_if_unaligned helper which raises #GP if an
address is not properly aligned. This helper is called before 128-bit
loads/stores where appropriate.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/217
Signed-off-by: Ricky Zhou <ricky@rzhou.org>
---
 target/i386/helper.h         |  1 +
 target/i386/tcg/mem_helper.c |  8 ++++++++
 target/i386/tcg/translate.c  | 38 +++++++++++++++++++++++++++++++++---
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..17d78f2b0d 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -213,6 +213,7 @@ DEF_HELPER_1(update_mxcsr, void, env)
 DEF_HELPER_1(enter_mmx, void, env)
 DEF_HELPER_1(emms, void, env)
 DEF_HELPER_3(movq, void, env, ptr, ptr)
+DEF_HELPER_3(raise_gp_if_unaligned, void, env, tl, tl)
 
 #define SHIFT 0
 #include "ops_sse_header.h"
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index e3cdafd2d4..79259abef3 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -181,3 +181,11 @@ void helper_boundl(CPUX86State *env, target_ulong a0, int v)
         raise_exception_ra(env, EXCP05_BOUND, GETPC());
     }
 }
+
+void helper_raise_gp_if_unaligned(CPUX86State *env, target_ulong addr,
+                                  target_ulong align_mask)
+{
+    if (unlikely((addr & align_mask) != 0)) {
+        raise_exception_ra(env, EXCP0D_GPF, GETPC());
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..de13f483b6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3054,7 +3054,7 @@ static const struct SSEOpHelper_epp sse_op_table6[256] = {
     [0x25] = SSE41_OP(pmovsxdq),
     [0x28] = SSE41_OP(pmuldq),
     [0x29] = SSE41_OP(pcmpeqq),
-    [0x2a] = SSE41_SPECIAL, /* movntqda */
+    [0x2a] = SSE41_SPECIAL, /* movntdqa */
     [0x2b] = SSE41_OP(packusdw),
     [0x30] = SSE41_OP(pmovzxbw),
     [0x31] = SSE41_OP(pmovzxbd),
@@ -3194,10 +3194,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             break;
         case 0x1e7: /* movntdq */
         case 0x02b: /* movntps */
-        case 0x12b: /* movntps */
+        case 0x12b: /* movntpd */
             if (mod == 3)
                 goto illegal_op;
             gen_lea_modrm(env, s, modrm);
+            gen_helper_raise_gp_if_unaligned(cpu_env, s->A0, tcg_const_tl(0xf));
             gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             break;
         case 0x3f0: /* lddqu */
@@ -3273,6 +3274,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x26f: /* movdqu xmm, ea */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
+                /* movaps, movapd, movdqa */
+                if (b == 0x028 || b == 0x128 || b == 0x16f) {
+                    gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                     tcg_const_tl(0xf));
+                }
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -3331,6 +3337,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x212: /* movsldup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
+                if (!(s->prefix & PREFIX_VEX)) {
+                    gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                     tcg_const_tl(0xf));
+                }
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -3373,6 +3383,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x216: /* movshdup */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
+                if (!(s->prefix & PREFIX_VEX)) {
+                    gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                     tcg_const_tl(0xf));
+                }
                 gen_ldo_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -3465,6 +3479,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
         case 0x27f: /* movdqu ea, xmm */
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
+                if (b == 0x029 || b == 0x129 || b == 0x17f) {
+                    gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                     tcg_const_tl(0xf));
+                }
                 gen_sto_env_A0(s, offsetof(CPUX86State, xmm_regs[reg]));
             } else {
                 rm = (modrm & 7) | REX_B(s);
@@ -3806,10 +3824,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                         tcg_gen_st16_tl(s->tmp0, cpu_env, op2_offset +
                                         offsetof(ZMMReg, ZMM_W(0)));
                         break;
-                    case 0x2a:            /* movntqda */
+                    case 0x2a:            /* movntdqa */
+                        gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                         tcg_const_tl(0xf));
                         gen_ldo_env_A0(s, op1_offset);
                         return;
                     default:
+                        if (!(s->prefix & PREFIX_VEX)) {
+                            gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                             tcg_const_tl(0xf));
+                        }
                         gen_ldo_env_A0(s, op2_offset);
                     }
                 }
@@ -4351,6 +4375,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                 } else {
                     op2_offset = offsetof(CPUX86State,xmm_t0);
                     gen_lea_modrm(env, s, modrm);
+                    if (!(s->prefix & PREFIX_VEX)) {
+                        gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                         tcg_const_tl(0xf));
+                    }
                     gen_ldo_env_A0(s, op2_offset);
                 }
             } else {
@@ -4469,6 +4497,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
                     break;
                 default:
                     /* 128 bit access */
+                    if (!(s->prefix & PREFIX_VEX)) {
+                        gen_helper_raise_gp_if_unaligned(cpu_env, s->A0,
+                                                         tcg_const_tl(0xf));
+                    }
                     gen_ldo_env_A0(s, op2_offset);
                     break;
                 }
-- 
2.37.2


