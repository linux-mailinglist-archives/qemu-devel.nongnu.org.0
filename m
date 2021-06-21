Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B5E3AF06A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:48:41 +0200 (CEST)
Received: from localhost ([::1]:34622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN6G-0002ie-PX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnO-0007ML-Ou
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnH-0007dm-Sb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id h11so2898777wrx.5
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0G6pDoaYj6/Zs49KHqk/gWYWRlTEzShUy9Lv9pNK2Rg=;
 b=qSCoZfJ24CJq/34vmwcjnTqA5NMV2jZJfQUDnL5o6hSAV1AjJKspO6NLugV4Fiqxc6
 sadQNN2aRGdEgQQne/H5SwDXM1iKL1EFij+yFC/3lWv5kjWqzzDcV0/2RNpcOac2AHgX
 2Aa20rrRl2PJg5j9jZ/If2+IicTr337Khwl11Tqm3VZIIQp0GLhfC88rlSzzIS0sOf8X
 0Ew6mKQNYrrc7QnaC0jn2xqygZu13MzAEO4stXDT1F9YbWzjt/WqY8vZO7zm5m1cwakT
 1dQcdF6BLBuAwaNR1ftou8xEvoI3lhUii/TmYJL1Ym/WkIdMs/wIjXYY/n13w/rcW4Gj
 qwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0G6pDoaYj6/Zs49KHqk/gWYWRlTEzShUy9Lv9pNK2Rg=;
 b=OzpoWfoqBcu/E/GjBBFcYsSDsCeN60DGWHlstxZWhB+dcNIK+J6kS5OCoSBish7X8K
 FvSjz4fdaETllJHK9lQlouctSVt5dBXlAy8MnOvSR8YDXxpI8hxTlTUXv8sc8hMv5qUp
 wkWdRoNwap7c89XhHnDwGnYf31oNyJ3ZJd3zugJMqFSH/3LHOJpt4tdvlV+xujhkKZCM
 VvDL3M6Nfye7BJIvIhXRYj+nuKGSCulK+zayK4OVfDCBHpk/xooDa2Uzw4EHeZ00qToL
 L37hcIY+g8aTH2kls3ZPTzVul/iixGOpUuwW15PAe81FmrjnvHMwZukyxkus9r/IBnj/
 DK+w==
X-Gm-Message-State: AOAM533clT7v4QmpnAT9Roqh1hphdzxBIJEXzPmedDOVa3NpUQfX2U9i
 HB8Hpc8q2/PBEEFjOyNEkpfCvBc+JnnzFvKk
X-Google-Smtp-Source: ABdhPJxvjkXySBs5Rd6Uy5w0jFixY2qBxhF6MTL8DbFcX9W+3/2csiBf1GCvFnTORWISwnQ/A/Xkqw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr29174132wri.60.1624292942597; 
 Mon, 21 Jun 2021 09:29:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/57] target/arm: Implement MVE VMULL
Date: Mon, 21 Jun 2021 17:28:05 +0100
Message-Id: <20210621162833.32535-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMULL insn, which multiplies two single
width integer elements to produce a double width result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-19-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 57 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 02bef53ed41..9bbeb7ec49d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -130,3 +130,17 @@ DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmullbsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullbuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmulltsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 241d1c44c19..5a480d61cd6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -101,6 +101,11 @@ VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
 VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 
+VMULL_BS         111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 835832fdf69..a3d09db83b3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -349,6 +349,26 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
     DO_2OP(OP##h, 2, int16_t, FN)               \
     DO_2OP(OP##w, 4, int32_t, FN)
 
+/*
+ * "Long" operations where two half-sized inputs (taken from either the
+ * top or the bottom of the input vector) produce a double-width result.
+ * Here ESIZE, TYPE are for the input, and LESIZE, LTYPE for the output.
+ */
+#define DO_2OP_L(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)               \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            LTYPE r = FN((LTYPE)n[H##ESIZE(le * 2 + TOP)],              \
+                         m[H##ESIZE(le * 2 + TOP)]);                    \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -369,6 +389,20 @@ DO_2OP_U(vadd, DO_ADD)
 DO_2OP_U(vsub, DO_SUB)
 DO_2OP_U(vmul, DO_MUL)
 
+DO_2OP_L(vmullbsb, 0, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmullbsh, 0, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmullbsw, 0, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmullbub, 0, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmullbuh, 0, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmullbuw, 0, 4, uint32_t, 8, uint64_t, DO_MUL)
+
+DO_2OP_L(vmulltsb, 1, 1, int8_t, 2, int16_t, DO_MUL)
+DO_2OP_L(vmulltsh, 1, 2, int16_t, 4, int32_t, DO_MUL)
+DO_2OP_L(vmulltsw, 1, 4, int32_t, 8, int64_t, DO_MUL)
+DO_2OP_L(vmulltub, 1, 1, uint8_t, 2, uint16_t, DO_MUL)
+DO_2OP_L(vmulltuh, 1, 2, uint16_t, 4, uint32_t, DO_MUL)
+DO_2OP_L(vmulltuw, 1, 4, uint32_t, 8, uint64_t, DO_MUL)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f593d3693b9..1cadc3b04da 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -361,3 +361,7 @@ DO_2OP(VHADD_S, vhadds)
 DO_2OP(VHADD_U, vhaddu)
 DO_2OP(VHSUB_S, vhsubs)
 DO_2OP(VHSUB_U, vhsubu)
+DO_2OP(VMULL_BS, vmullbs)
+DO_2OP(VMULL_BU, vmullbu)
+DO_2OP(VMULL_TS, vmullts)
+DO_2OP(VMULL_TU, vmulltu)
-- 
2.20.1


