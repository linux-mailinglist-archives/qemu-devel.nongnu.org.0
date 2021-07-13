Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF13C716E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:47:19 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Iko-0008Mz-E8
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbY-0008Vm-Pe
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbS-0003f3-Kv
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:44 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so30500949wri.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y6eRE0yqDQuLemB38skVeadaDqHqEErxb2Y9Ypfy/IQ=;
 b=hOIsDVWu027+lFYTYm8XvhP6hdesGR/s5tB9JxAf5SlF7Aq/eu9X0wWZVGb5s3RoOz
 hE3AOkBEz3HL7IFL0eNJvpM5gmipbRz5bnFYqareYcSwjtDSm3bnVreQJT/RpueZz32Q
 5TxA7m2jiRYZRzyxUfWUXCKm1WQCkmUV6YwB2j1ONq8+m0WVFUnzExWS4LkA96sYarJC
 aGAzwq20U6TNlrYzHZCk6AHHOcxXWjlrUbSIMlFvLWubhw/iEUE5tzSL7gVoAt3xVSjE
 SI4WFw032YvpbCNZ7rb+JHNDnjIJiig69A9UoNIzXTM2wa4IsN7vB2jCWsn211xDyCOs
 418A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6eRE0yqDQuLemB38skVeadaDqHqEErxb2Y9Ypfy/IQ=;
 b=YTbo35o1jHE+y2LzVJpgJ66D7gLmw7C98B4qroCKXV5jE05VqoU4gnXsYZyP3li6cx
 YnORpSdKiNgfYFIyUszYWB3kzPd3dinVpWNMKP+GMuOkR7OQd2ZM6x/2hp3pT3kBgQHN
 LA0XK/2Ut2BUGJRRA0/U8UKQ+f1+KRnUy9nab0QlaSij2Xq+FJiZYDF9iNmbAWhZDfSu
 KVDBpboHWUGYh97sJoGoOHttM0x8gXNVT9Bi+OdZvJyW47jADETuhkpdDAwk9ycdmIbp
 VcmGkN2fP+nbymEKI1ilFkf5/4gs7Ypk+qbARKpYAuYeof/Cs5zgCpMSqPLf0hGfdpxk
 62EQ==
X-Gm-Message-State: AOAM5322rt962fzXeLaxE0Ag1dpdm0DDKr0GAurt0f1WjpeiGIPEg0uV
 e/oDpzJfG0eLi1bOVEkyUbbtRg==
X-Google-Smtp-Source: ABdhPJzn5BlqVXM2BeReYBxdysQ+f8Rc5dDoin/j45/SKsKrQyWJYL9ke9daZ3s1zak/k/4NVonz5Q==
X-Received: by 2002:adf:de84:: with SMTP id w4mr5877473wrl.104.1626183457246; 
 Tue, 13 Jul 2021 06:37:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/34] target/arm: Implement MVE VMULL (polynomial)
Date: Tue, 13 Jul 2021 14:37:03 +0100
Message-Id: <20210713133726.26842-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Implement the MVE VMULL (polynomial) insn.  Unlike Neon, this comes
in two flavours: 8x8->16 and a 16x16->32.  Also unlike Neon, the
inputs are in either the low or the high half of each double-width
element.

The assembler for this insn indicates the size with "P8" or "P16",
encoded into bit 28 as size = 0 or 1. We choose to follow the
same encoding as VQDMULL and decode this into a->size as MO_16
or MO_32 indicating the size of the result elements. This then
carries through to the helper function names where it then
matches up with the existing pmull_h() which does an 8x8->16
operation and a new pmull_w() which does the 16x16->32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/vec_internal.h  | 11 +++++++++++
 target/arm/mve.decode      | 14 ++++++++++----
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c | 28 ++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 14 +++++++++++++-
 6 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 56e40844ad9..84adfb21517 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,11 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vmullpbh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullpth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullpbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullptw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 865d2139447..2a335582906 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -206,4 +206,15 @@ int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
 int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
 int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 
+/*
+ * 8 x 8 -> 16 vector polynomial multiply where the inputs are
+ * in the low 8 bits of each 16-bit element
+*/
+uint64_t pmull_h(uint64_t op1, uint64_t op2);
+/*
+ * 16 x 16 -> 32 vector polynomial multiply where the inputs are
+ * in the low 16 bits of each 32-bit element
+ */
+uint64_t pmull_w(uint64_t op1, uint64_t op2);
+
 #endif /* TARGET_ARM_VEC_INTERNALS_H */
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index fa9d921f933..de079ec517d 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -173,10 +173,16 @@ VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
 VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 
-VMULL_BS         111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
-VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
-VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
-VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+{
+  VMULLP_B       111 . 1110 0 . 11 ... 1 ... 0 1110 . 0 . 0 ... 0 @2op_sz28
+  VMULL_BS       111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+  VMULL_BU       111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+}
+{
+  VMULLP_T       111 . 1110 0 . 11 ... 1 ... 1 1110 . 0 . 0 ... 0 @2op_sz28
+  VMULL_TS       111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+  VMULL_TU       111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+}
 
 VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index f78228f70c1..db5ec9266d1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -488,6 +488,22 @@ DO_2OP_L(vmulltub, 1, 1, uint8_t, 2, uint16_t, DO_MUL)
 DO_2OP_L(vmulltuh, 1, 2, uint16_t, 4, uint32_t, DO_MUL)
 DO_2OP_L(vmulltuw, 1, 4, uint32_t, 8, uint64_t, DO_MUL)
 
+/*
+ * Polynomial multiply. We can always do this generating 64 bits
+ * of the result at a time, so we don't need to use DO_2OP_L.
+ */
+#define VMULLPH_MASK 0x00ff00ff00ff00ffULL
+#define VMULLPW_MASK 0x0000ffff0000ffffULL
+#define DO_VMULLPBH(N, M) pmull_h((N) & VMULLPH_MASK, (M) & VMULLPH_MASK)
+#define DO_VMULLPTH(N, M) DO_VMULLPBH((N) >> 8, (M) >> 8)
+#define DO_VMULLPBW(N, M) pmull_w((N) & VMULLPW_MASK, (M) & VMULLPW_MASK)
+#define DO_VMULLPTW(N, M) DO_VMULLPBW((N) >> 16, (M) >> 16)
+
+DO_2OP(vmullpbh, 8, uint64_t, DO_VMULLPBH)
+DO_2OP(vmullpth, 8, uint64_t, DO_VMULLPTH)
+DO_2OP(vmullpbw, 8, uint64_t, DO_VMULLPBW)
+DO_2OP(vmullptw, 8, uint64_t, DO_VMULLPTW)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a2a45036a0b..d318f34b2bc 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -464,6 +464,34 @@ static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
     return do_2op(s, a, fns[a->size]);
 }
 
+static bool trans_VMULLP_B(DisasContext *s, arg_2op *a)
+{
+    /*
+     * Note that a->size indicates the output size, ie VMULL.P8
+     * is the 8x8->16 operation and a->size is MO_16; VMULL.P16
+     * is the 16x16->32 operation and a->size is MO_32.
+     */
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vmullpbh,
+        gen_helper_mve_vmullpbw,
+        NULL,
+    };
+    return do_2op(s, a, fns[a->size]);
+}
+
+static bool trans_VMULLP_T(DisasContext *s, arg_2op *a)
+{
+    /* a->size is as for trans_VMULLP_B */
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vmullpth,
+        gen_helper_mve_vmullptw,
+        NULL,
+    };
+    return do_2op(s, a, fns[a->size]);
+}
+
 /*
  * VADC and VSBC: these perform an add-with-carry or subtract-with-carry
  * of the 32-bit elements in each lane of the input vectors, where the
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 034f6b84f78..17fb1583622 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2028,11 +2028,23 @@ static uint64_t expand_byte_to_half(uint64_t x)
          | ((x & 0xff000000) << 24);
 }
 
-static uint64_t pmull_h(uint64_t op1, uint64_t op2)
+uint64_t pmull_w(uint64_t op1, uint64_t op2)
 {
     uint64_t result = 0;
     int i;
+    for (i = 0; i < 16; ++i) {
+        uint64_t mask = (op1 & 0x0000000100000001ull) * 0xffffffff;
+        result ^= op2 & mask;
+        op1 >>= 1;
+        op2 <<= 1;
+    }
+    return result;
+}
 
+uint64_t pmull_h(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
     for (i = 0; i < 8; ++i) {
         uint64_t mask = (op1 & 0x0001000100010001ull) * 0xffff;
         result ^= op2 & mask;
-- 
2.20.1


