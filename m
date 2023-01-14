Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA566AD36
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 19:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGkuy-0002NS-6Z; Sat, 14 Jan 2023 13:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGkuw-0002NA-6E
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 13:06:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGkur-0007It-KW
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 13:06:09 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k12so4397689plk.0
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 10:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nFbBXMq+qFXOVArTZvtfx/YDBnADZbgBp8Zmt787zJw=;
 b=jmGr6Obs/TcYe1oOo4xJ0EukP+5sOtT+I8qQyC84DP34Bz6R5qdD3qcGpzfmBKhet1
 T4ZUr4CoLeaKsnZO5x3pFMtDF6gNeXXI/URBMu5Y9y2iKErN+BaNshXduQf+aJJQXaFY
 I0VGYXE+7zOAcGFde0c+siOyw8gNOr+nqLnGjXz0eb5lWNg8XnILbnf+OZPqudX0UER0
 oF8mtK+VdNh0n9r1LPWsoQ/m5hDYuFhNOm2gPtOTFEr0vsku8EjoS0rjXA3aS4mKXEqo
 Jnz2h8p4LoRfpq5FbXh7M4Nk/c1WMsgeTUQpPWV93xZb/VIFdXAMwFw5lDkWYanuwMRS
 Iq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFbBXMq+qFXOVArTZvtfx/YDBnADZbgBp8Zmt787zJw=;
 b=bw6R0r20RC0fmRALN9yUAvGf1j/+Y6jLMwvDxceX0M0XXjU8Qm9/OWtapg3TpwRXYg
 HwWcXpLmJDgrFHH7h/+AgTHCxOl6vwWrWq7SLGJF0R3wH6Z4MvDITlMNZCv5/9AhsUbO
 vtP4RwXG1jLEACmUqv5msVGAV9qS2/khB0rmmII8/QDAN4Y3/p9k3v8jAygveA15lJDk
 UFecFfmkC8vCI2M/1ESCl7V98l2xJX8z5MKJCZdmRK3XH6EipTORZ2HkbA1VJp0osNxG
 enPmSgc5Y10s75xKR6MjmYR/ztCl/ByLYzHOULYSvYB1wI4R/rzNyqgu6yef3edBINuU
 k38g==
X-Gm-Message-State: AFqh2kqhADxY0Z0AIR7kG2pr8TToNU4QDzaJa9fztRTw8FCSLs16FOMY
 xaGNvZKMUlFihdJvgv5fwiw7Ij/XIs9rKwSO
X-Google-Smtp-Source: AMrXdXvRtWFLFZUzbAQcqaMfltBrbZgmy86EDu2mjjCkZ6VEjdeX5vxnH6hRZ5sSmk9CrCmVSLk+vg==
X-Received: by 2002:a05:6a20:6988:b0:b5:dc64:87c with SMTP id
 t8-20020a056a20698800b000b5dc64087cmr29308083pzk.26.1673719564057; 
 Sat, 14 Jan 2023 10:06:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a6540cb000000b0046ff3634a78sm13292854pgp.71.2023.01.14.10.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 10:06:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH] target/i386: Fix C flag for BLSI, BLSMSK, BLSR
Date: Sat, 14 Jan 2023 08:06:01 -1000
Message-Id: <20230114180601.2993644-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

We forgot to set cc_src, which is used for computing C.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1370
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/emit.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 7037ff91c6..9d610de8c2 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1111,6 +1111,7 @@ static void gen_BLSI(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_neg_tl(s->T1, s->T0);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1121,6 +1122,7 @@ static void gen_BLSMSK(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_xor_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
@@ -1131,6 +1133,7 @@ static void gen_BLSR(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
 {
     MemOp ot = decode->op[0].ot;
 
+    tcg_gen_mov_tl(cpu_cc_src, s->T0);
     tcg_gen_subi_tl(s->T1, s->T0, 1);
     tcg_gen_and_tl(s->T0, s->T0, s->T1);
     tcg_gen_mov_tl(cpu_cc_dst, s->T0);
-- 
2.34.1


