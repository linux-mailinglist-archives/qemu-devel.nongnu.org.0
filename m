Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B7397E76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 04:08:14 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loGIn-0004Gs-EB
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 22:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loGI2-0003Q1-Ch
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 22:07:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loGI0-00047M-EM
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 22:07:25 -0400
Received: by mail-pl1-x630.google.com with SMTP id e7so295881plj.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 19:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6soOheKeKBX/bO55GWtKn6aDK79/Oblvy0sX9/aDio=;
 b=mZ2XfhAO+KAi4hDX/hgWo3fjbZO7Mk7vCBIc5MZxXqi4PWBHahNvbLQpW9uWMrupO2
 k9TSsScCejxoB57pA8r4b465Ldk/zLTNRppLTGFImoXbLsqPJMCRcahfuOEigKEH+Qjh
 RI+FVJZp5gNqzmCIEdwJmG35k2U4B3SgrAEiXnDo4QnswpTyhZkHqF5KTwdZ1ZQ5NSi4
 w3w5UzSzodVI6dAE/bRfKW7dsEdePRzxqYE69q0ZAZP8qNLio+eKQzDDX7dvzJaS7toq
 V4BuP9jvrOow/+vAcJque24bp1WHwjd7jMZgVL7jno65vhdlSWwJfB2jB6dtsManc6ot
 nTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6soOheKeKBX/bO55GWtKn6aDK79/Oblvy0sX9/aDio=;
 b=ewW8SdVQNRWr5XWVwCJ1/jstUETlthdDzPfAHh4car+Iw7JHtld2KXfT/9tVxAPcEB
 DfbQ+lyk4lj17h5v46puFIumvn6CD/3RN3a8AVu2ACne1L2NR9G6Lz12lVrsqghAAUa1
 APidAmcQgwEttU40SNPpxj1afxUi701y2FmKiDUQlTw/VqKYQ7/I02UoNEGe8PeRfsQo
 P8oQNLjhKD0fcfKD+bvYSP87hJkqxHof/msJmPbRWT+5i9WPLCchEEaXBPNQklr5Ydga
 DdANBR1Y9b+R23lUm3pa23pZ/OZxxdPyWDiOfRUaHbmjSsFgHoo1NdujEv98/0Lk8V8x
 Bo1A==
X-Gm-Message-State: AOAM530puNanrUiq1cwjS98oZIfsdu2cblBOJSB2CzywWE7EckzwD1tI
 7PCXpoakYtnXpfX1VTzWhFezaBWRob7LhQ==
X-Google-Smtp-Source: ABdhPJzz8iCiZI1XaRq4ulHKViODioo28vnxSGy+o85AjGiDMg6zAnpgtPg/vwW0KtklOWI3jd97pA==
X-Received: by 2002:a17:90a:ab0c:: with SMTP id
 m12mr27926281pjq.179.1622599642690; 
 Tue, 01 Jun 2021 19:07:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g3sm5309879pfk.188.2021.06.01.19.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 19:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Mark LDS{MIN,MAX} as signed operations
Date: Tue,  1 Jun 2021 19:07:20 -0700
Message-Id: <20210602020720.47679-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The operands to tcg_gen_atomic_fetch_s{min,max}_i64 must
be signed, so that the inputs are properly extended.
Zero extend the result afterward, as needed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/364
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ceac0ee2bd..d6906d9012 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3355,8 +3355,9 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     int o3_opc = extract32(insn, 12, 4);
     bool r = extract32(insn, 22, 1);
     bool a = extract32(insn, 23, 1);
-    TCGv_i64 tcg_rs, clean_addr;
+    TCGv_i64 tcg_rs, tcg_rt, clean_addr;
     AtomicThreeOpFn *fn = NULL;
+    MemOp mop = s->be_data | size | MO_ALIGN;
 
     if (is_vector || !dc_isar_feature(aa64_atomics, s)) {
         unallocated_encoding(s);
@@ -3377,9 +3378,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
         break;
     case 004: /* LDSMAX */
         fn = tcg_gen_atomic_fetch_smax_i64;
+        mop |= MO_SIGN;
         break;
     case 005: /* LDSMIN */
         fn = tcg_gen_atomic_fetch_smin_i64;
+        mop |= MO_SIGN;
         break;
     case 006: /* LDUMAX */
         fn = tcg_gen_atomic_fetch_umax_i64;
@@ -3422,6 +3425,7 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     }
 
     tcg_rs = read_cpu_reg(s, rs, true);
+    tcg_rt = cpu_reg(s, rt);
 
     if (o3_opc == 1) { /* LDCLR */
         tcg_gen_not_i64(tcg_rs, tcg_rs);
@@ -3430,8 +3434,11 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
     /* The tcg atomic primitives are all full barriers.  Therefore we
      * can ignore the Acquire and Release bits of this instruction.
      */
-    fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
-       s->be_data | size | MO_ALIGN);
+    fn(tcg_rt, clean_addr, tcg_rs, get_mem_index(s), mop);
+
+    if ((mop & MO_SIGN) && size != MO_64) {
+        tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
+    }
 }
 
 /*
-- 
2.25.1


