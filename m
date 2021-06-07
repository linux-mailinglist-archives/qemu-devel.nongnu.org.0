Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F0739E53D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:23:28 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIyF-0000Z3-4I
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIah-0007bi-PL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaH-0007yh-Q0
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:07 -0400
Received: by mail-wm1-x331.google.com with SMTP id l9so107809wms.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P1dhj6mrnoek8Fce40UwWHHwtE6XODzzwCB8ycxcBbg=;
 b=QVfQOlTwm4rA6hD6vAbxVqCtwullJMPeLMd52YnJ+1q4nqatMGRlgNcshmtyaOvrnq
 MPUcZn3rz1PwFgClPVcLn/dLCdyLfXTa5D8rThB8AdgryFkDkDziCiUDvG9/I2npPLdT
 hw3ukrLgzkHj2JTO9p8h23BuWulsENniNlKHdsGsvx44EvEghJXoNS/RT8oxhLM1G6m+
 HAF90RS84MGhvTFKxh5w4ujgFGUJr1Cdvib63g0JJtKw10AT6Rqek0DijY6J4pxETBeU
 1CAuk+noH+Y3dtcxpbESR8r7oPumaRZysVZ0KeLwc6s82TZ0powFvEVjR6WJuYT8kbMb
 NpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P1dhj6mrnoek8Fce40UwWHHwtE6XODzzwCB8ycxcBbg=;
 b=n2hAs35/0jvwLzZwy9m5dz4kv+vTbQ8hkEROT3fhkPkRxtoIGb3yUyLD61ggbmzQ3Z
 9QHMUULUZ0tg1IXKhqrb3lGvV6HFlXBpFl3Wz/PdPkIyJzxJjM5Hz9+6KIRHE4PCwTF9
 2WOapZCQekX3B48TITINnoeYBcfibSbvFwDuldQXmKwUBKeWv0ABaMH5RZep2lw/qtKA
 ifV5x4uGIzHEN7EcYDfoJoJYnLJrTB2tOQ30WcjL9r/PMr3VkVyyD8mIreqs1ww4D7h4
 w30C8H+EZBRSVehNt1Bw0QQy8MbrclIkUvkW9zj0hyZHyYy3X8SzuLYtqj00gDopxr2N
 9j+g==
X-Gm-Message-State: AOAM5314VcWBFtFiKVExhGzO5jtqEtkwdivOz7Sr0cXkYTdZQH9ylaNR
 RI/JDwW5CSEr5ZI8INfXxohjUw==
X-Google-Smtp-Source: ABdhPJxnA8oe0t4M3sFBu6zaafwnZ+bHp8KEgK9upsDRcdyKw6gJsjI2IZAExF1NVs3catY0DfpiZg==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr102405wmh.8.1623085119905;
 Mon, 07 Jun 2021 09:58:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/55] target/arm: Implement MVE VDUP
Date: Mon,  7 Jun 2021 17:57:46 +0100
Message-Id: <20210607165821.9892-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VDUP insn, which duplicates a value from
a general-purpose register into every lane of a vector
register (subject to predication).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      | 10 +++++++++
 target/arm/mve_helper.c    | 18 ++++++++++++++++
 target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 733a54d2e3c..ece9c481367 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -33,6 +33,10 @@ DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vdupb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vduph, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vdupw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vclsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vclsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 82cc0abcb82..09849917f5a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -21,6 +21,7 @@
 
 %qd 22:1 13:3
 %qm 5:1 1:3
+%qn 7:1 17:3
 
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
@@ -82,3 +83,12 @@ VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
 VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
 VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
+
+&vdup qd rt size
+# Qd is in the fields usually named Qn
+@vdup            .... .... . . .. ... . rt:4 .... . . . . .... qd=%qn &vdup
+
+# B and E bits encode size, which we decode here to the usual size values
+VDUP             1110 1110 1 1 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=0
+VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 1 1 0000 @vdup size=1
+VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b14826c05a7..a5ed4e01e33 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -229,6 +229,24 @@ static uint64_t mask_to_bytemask8(uint16_t mask)
         ((uint64_t)mask_to_bytemask4(mask >> 4) << 32);
 }
 
+#define DO_VDUP(OP, ESIZE, TYPE, H)                                     \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t val)     \
+    {                                                                   \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (val & bytemask);                                \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VDUP(vdupb, 1, uint8_t, H1)
+DO_VDUP(vduph, 2, uint16_t, H2)
+DO_VDUP(vdupw, 4, uint32_t, H4)
+
 #define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
     {                                                                   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 086cac9f0cd..b4fc4054fe1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -169,6 +169,49 @@ DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
 
+static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
+{
+    TCGv_ptr qd;
+    TCGv_i32 rt;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->qd > 7) {
+        return false;
+    }
+    if (a->rt == 13 || a->rt == 15) {
+        /* UNPREDICTABLE; we choose to UNDEF */
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    rt = load_reg(s, a->rt);
+    switch (a->size) {
+    case 0:
+        gen_helper_mve_vdupb(cpu_env, qd, rt);
+        break;
+    case 1:
+        gen_helper_mve_vduph(cpu_env, qd, rt);
+        break;
+    case 2:
+        gen_helper_mve_vdupw(cpu_env, qd, rt);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_i32(rt);
+    mve_update_eci(s);
+    return true;
+}
+
 static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 {
     TCGv_ptr qd, qm;
-- 
2.20.1


