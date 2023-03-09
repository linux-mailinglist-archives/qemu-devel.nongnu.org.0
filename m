Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573846B2E77
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:19:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMeL-0001eY-3a; Thu, 09 Mar 2023 15:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdl-0000XX-Gv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:31 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMdb-0002Gu-B0
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:13:22 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so7449108pjh.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAXtgCYMBwE2AiaiYre3aQe11+04XcAC1AIIbpJrYvc=;
 b=RhXPHQxK9/TFlPdIP0jwZifo0lyHXoyFNLKTCOHZkuDWb87dUlBtXu1093QjK7mtu+
 KGvsJrg9rSye/qLWpmF9Fosk3a/hSTeNrwpYGkTfhoVdh7XekwoeG0206G0oo5nI4SYm
 NMcHwpTYUrMqppJoCO14+gCue/lNtBzOQ2bm5tWljXC5NBxYielsZwzdFBLfNX/NPDGg
 Rq9+pAxWITdyjhOXDIyZc61SPVSTUfkcuQgImKMYH919nSQokExbC+jCunWoo4bfif1A
 QRQC8q7GPZHt5Hl3cDtsL/J62nu1RZJv4Ntp8OTOGtHhGk6sx4IkRULL2caSDjvjRP34
 8y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392785;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAXtgCYMBwE2AiaiYre3aQe11+04XcAC1AIIbpJrYvc=;
 b=oYKBUnOKLoXaIEj6hoU1/OWba1HiMEot0BSzfEYMVPGZVuM4uO/MWuW6cO56yePpzX
 7BjXH6Py+9jxaDHfDJHfQp7SHHkv+WVdO6LSKEsmbU98CqlmQF5NotxRdjcOcuSmu+mi
 Uy1E0YmOIwigPOJSAVi52NBrBXsyYoWJsOcq+QCxjYr6rJOFM1uBorkpwM5ipK1ACytK
 HPQWoJkwHShuejPTboOb6cmRJrEhCJb2fqG8yxiCZjsphxk7OyJnBCxnpDL3UMDT7tAe
 UEk681lY5VcS645Tb4MZoc2yEJLG4rEpnFmLnPdeirVxT96vkaP+h5/XFbdKM6S8v6U4
 gQxw==
X-Gm-Message-State: AO0yUKXxWlOVWBDkT8SAjvcwVX0x1QmYHYymzvGEPu29fJVrA3QVuaiV
 +8F1j0mciUnLYoYmgDvgQeBD8cU52zGbJHUVj88=
X-Google-Smtp-Source: AK7set9I2pWzTBUODxwkz9zzsAhKsPtGTJLjTH5XKGkcHWuDpj5m7it0rkHFunkuxUA26sDPaLZGsQ==
X-Received: by 2002:a05:6a20:4290:b0:d0:3b46:3cf8 with SMTP id
 o16-20020a056a20429000b000d03b463cf8mr11942682pzj.30.1678392785514; 
 Thu, 09 Mar 2023 12:13:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a62a50f000000b005b02ddd852dsm11867744pfm.142.2023.03.09.12.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:13:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 81/91] target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
Date: Thu,  9 Mar 2023 12:05:40 -0800
Message-Id: <20230309200550.3878088-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

All remaining uses are strictly read-only.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ca27c11d87..112233b541 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1624,7 +1624,7 @@ static void glue(gen_, name)(DisasContext *ctx)                         \
             gen_exception(ctx, POWERPC_EXCP_VPU);                       \
             return;                                                     \
         }                                                               \
-        uimm = tcg_const_i32(UIMM5(ctx->opcode));                       \
+        uimm = tcg_constant_i32(UIMM5(ctx->opcode));                    \
         rb = gen_avr_ptr(rB(ctx->opcode));                              \
         rd = gen_avr_ptr(rD(ctx->opcode));                              \
         gen_helper_##name(cpu_env, rd, rb, uimm);                       \
@@ -1965,7 +1965,7 @@ static void gen_vsldoi(DisasContext *ctx)
     ra = gen_avr_ptr(rA(ctx->opcode));
     rb = gen_avr_ptr(rB(ctx->opcode));
     rd = gen_avr_ptr(rD(ctx->opcode));
-    sh = tcg_const_i32(VSH(ctx->opcode));
+    sh = tcg_constant_i32(VSH(ctx->opcode));
     gen_helper_vsldoi(rd, ra, rb, sh);
 }
 
@@ -2575,7 +2575,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, ra, rb, ps);    \
 }
@@ -2594,7 +2594,7 @@ static void gen_##op(DisasContext *ctx)             \
     rb = gen_avr_ptr(rB(ctx->opcode));              \
     rd = gen_avr_ptr(rD(ctx->opcode));              \
                                                     \
-    ps = tcg_const_i32((ctx->opcode & 0x200) != 0); \
+    ps = tcg_constant_i32((ctx->opcode & 0x200) != 0); \
                                                     \
     gen_helper_##op(cpu_crf[6], rd, rb, ps);        \
 }
@@ -2726,7 +2726,7 @@ static void gen_##op(DisasContext *ctx)       \
     }                                         \
     ra = gen_avr_ptr(rA(ctx->opcode));        \
     rd = gen_avr_ptr(rD(ctx->opcode));        \
-    st_six = tcg_const_i32(rB(ctx->opcode));  \
+    st_six = tcg_constant_i32(rB(ctx->opcode));  \
     gen_helper_##op(rd, ra, st_six);          \
 }
 
-- 
2.34.1


