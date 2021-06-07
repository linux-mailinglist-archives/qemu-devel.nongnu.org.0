Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C161039E5F8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:55:29 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJTE-0004rH-RU
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbP-0000Qz-SV
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:52 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIag-00087i-GH
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so126875wmk.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2oJrX54+hHuJxkwNX+ULxYMNiVeTFery1qUjoDjgSmg=;
 b=uliYyc0urce3GNKzw8b7WmAfbZjYNj3o+fRRdI0WkiSRgZKHwnlceOjApEH+qn+B5I
 TLY8M1yVhTpF9gx1qZ78Jmu0qJFg9Yo0wAATBVqZIiIELYVWMO8RR0YW8AswcJZq5znr
 OZkVmh99Fw/RQssVgm/WWs7ERPagI/tMuEnZE1yOMdRjBY5axQhD/IDaQtUE7zHJx11m
 1lefekegqupng0w9I8igyhr4CJsq/bNf3zCqzbugET4hjGIWeDBuxwlrE0C5NaIAzvGf
 SRg4sXfXrQvMHQ8BdqEpJ3125BVQoBuDwdbFsTSn9ePB82Uf/TVcPAMZU+VD5RhcPp9f
 XOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2oJrX54+hHuJxkwNX+ULxYMNiVeTFery1qUjoDjgSmg=;
 b=D3zzPL6qhjhIRi4hqnDZ74xKVX6cPdmFirU7Njc2nzmk6aqYqdZBnP81XdMTJejhcZ
 HybCD5SuisSUYK2ShBNwNA60KQYqV+eqpn2ImyMZs8iw9Lw2UGl4fnexyLagkoFKE9dY
 2p6GOqbAUuJS/mTbBMFeiJFIVA6Q8Gk14NnWpgzz6FquTY8npoTQIyPgC6Of9AMFgByo
 egs1fZzZcg6H0OZkuUSy2MxUpZeZ3bnIzlTuJqdvmjhSWP0dqzBxDYIS7+FgCrU+1XxH
 RQV8NS0RlKfnkpgU8Trj/D+XoqO0FMI27G66i6uvmcou0/Yatn7Pc10X3KWzGu4R79rx
 b5bQ==
X-Gm-Message-State: AOAM533vKIw843HR91+4XiJlSQQ8w8tf8TjR5uQ+ZIqS2+K/Da2Qppf4
 xd9UjL6H1/ibHGAG6YmdUBWpSQ==
X-Google-Smtp-Source: ABdhPJz0ZEHgWD3LoF55JaTgoCy01U6qHHHDNGHHUZDX4OIBx2y3VSV6wwancGcBba3EJXwGrx5Z1Q==
X-Received: by 2002:a05:600c:2284:: with SMTP id
 4mr17791680wmf.146.1623085144615; 
 Mon, 07 Jun 2021 09:59:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 52/55] target/arm: Implement MVE VCADD
Date: Mon,  7 Jun 2021 17:58:18 +0100
Message-Id: <20210607165821.9892-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Implement the MVE VCADD insn, which performs a complex add with
rotate.  Note that the size=0b11 encoding is VSBC.

The architecture grants some leeway for the "destination and Vm
source overlap" case for the size MO_32 case, but we choose not to
make use of it, instead always calculating all 16 bytes worth of
results before setting the destination register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  7 ++++++-
 target/arm/mve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  7 +++++++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 686e5d9a39b..6e345470cbb 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -251,6 +251,14 @@ DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_5(mve_vadc, TCG_CALL_NO_WG, i32, env, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(mve_vsbc, TCG_CALL_NO_WG, i32, env, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6a4aae7a1fc..c0979f3941b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -164,7 +164,12 @@ VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
 VADC             1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
-VSBC             1111 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+
+{
+  VCADD90        1111 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VCADD270       1111 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+  VSBC           1111 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+}
 
 # Vector miscellaneous
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e07f12c8389..2c8ef25b208 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -610,6 +610,37 @@ DO_2OP_U(vrhaddu, DO_RHADD_U)
 DO_VADC(vadc, )
 DO_VADC(vsbc, DO_NOT)
 
+#define DO_VCADD(OP, ESIZE, TYPE, H, FN0, FN1)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE r[16 / ESIZE];                                             \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H(e)], m[H(e + 1)]);                       \
+            } else {                                                    \
+                r[e] = FN1(n[H(e)], m[H(e - 1)]);                       \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r[e] & bytemask);                               \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCADD_ALL(OP, FN0, FN1)              \
+    DO_VCADD(OP##b, 1, int8_t, H1, FN0, FN1)    \
+    DO_VCADD(OP##h, 2, int16_t, H1, FN0, FN1)   \
+    DO_VCADD(OP##w, 4, int32_t, H1, FN0, FN1)
+
+DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
+DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2ed499a6de2..8e3989b0176 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -440,6 +440,13 @@ DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 DO_2OP(VRHADD_S, vrhadds)
 DO_2OP(VRHADD_U, vrhaddu)
+/*
+ * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
+ * so we can reuse the DO_2OP macro. (Our implementation calculates the
+ * "expected" results in this case.)
+ */
+DO_2OP(VCADD90, vcadd90)
+DO_2OP(VCADD270, vcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


