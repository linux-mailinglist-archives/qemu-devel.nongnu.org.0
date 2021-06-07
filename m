Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A259F39E598
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:37:43 +0200 (CEST)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJC0-00041T-3t
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbB-00089L-Qb
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaZ-00085i-SE
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so51620wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fWwPQAC4aq9xoHiTtby2IWMhKyN2zKoRtXbTKjUTOA=;
 b=jaHvWyFhn8vjP7YmpkL86PzOnN82P831HLaqqlYvcToeAkokxFfN9187uC7zNygzN3
 jXigS7YBEJj1fPddtyXbqD8pgWai+/+JSJy/uytnpq4loSbmzVDVlElaz1dTNcz2xzvp
 48gf6zkIH+9CT8BTj7uPD3T+Z3gmuvFwSNS7FYJMsAIqhC3Nwbazz9iE5h6yI4jf5QTA
 2Ps82nQ9ugdyzktzzLn0cQGFYQS1h2//ss2O5OWCSB3uLTksYDJnekr4m0QFgDa8Uwff
 AzbauzbJciFKPJAM2htsSj05Njx5x1ofRzV86ur3qzA10I9xHSuFl8NvhyQCejL2ikLY
 kLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fWwPQAC4aq9xoHiTtby2IWMhKyN2zKoRtXbTKjUTOA=;
 b=DsdszL4gf71QEVV/RHQY57lnpnEQ9KDx+uLXmT6D3/7FV7Tz0+V16NKNw3GphnlMRz
 FBMWsPDWCezUZccdXzNtOCod+z18WfxFN6c2oaqG8UNiDrIsBu22clR5+48JIdsuWkIn
 YUPg/Aw3/oEAkUJCVBhJvRadXZC22aWdrSea+HoLyno0hhUF9v4Pdo6ZbPic1xQK5EbT
 eYrIOh3jRZVYicURiWwyMEXb51gWFV6SnYYN4neErRKi7320gXSZulqr9LnY6qYELbT8
 i2EQ7TkQRxHer/AXyol5UiR07YpoTF3qU5J1tsmBIC/QMHMPTxFS3L7yahmjM/TuSWUv
 TN5A==
X-Gm-Message-State: AOAM533T6yJqOdxX6FOe1upErY+k/Gpy0EGpbjy6KFHQ3S068pXF7Dbm
 Jm/zeDYonqKy6npS/swLBdKN4A==
X-Google-Smtp-Source: ABdhPJxJcm6dUtQZMROfHOaGTlQZ7aP8zefJQLQV8hcN7QGkcWuOl8bs/ZDnhuUdWfJ2lkzc5kQy1g==
X-Received: by 2002:a05:600c:1ca2:: with SMTP id
 k34mr9729184wms.145.1623085138404; 
 Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 44/55] target/arm: Implement MVE VQRSHL
Date: Mon,  7 Jun 2021 17:58:10 +0100
Message-Id: <20210607165821.9892-45-peter.maydell@linaro.org>
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

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |   8 +++
 target/arm/mve.decode      |   3 +
 target/arm/mve_helper.c    | 127 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |   2 +
 4 files changed, 140 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 352b6a46a5e..a2f9916b24e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -179,6 +179,14 @@ DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2c37e265765..e78eab6d659 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
+VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7ac41cb1460..b7f9af4067b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -637,6 +637,133 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, H4, DO_SQSUB_W)
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
 
+#define DO_UQRSHL_OP(src1, src2, satp)                  \
+    ({                                                  \
+        int8_t tmp;                                     \
+        typeof(src1) dest;                              \
+        tmp = (int8_t)src2;                             \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {         \
+            if (src1) {                                 \
+                *satp = true;                           \
+                dest = ~0;                              \
+            } else {                                    \
+                dest = 0;                               \
+            }                                           \
+        } else if (tmp < -(ssize_t)sizeof(src1) * 8) {  \
+            dest = 0;                                   \
+        } else if (tmp == -(ssize_t)sizeof(src1) * 8) { \
+            dest = src1 >> (sizeof(src1) * 8 - 1);      \
+        } else if (tmp < 0) {                           \
+            dest = (src1 + (1 << (-1 - tmp))) >> -tmp;  \
+        } else {                                        \
+            dest = src1 << tmp;                         \
+            if ((dest >> tmp) != src1) {                \
+                *satp = true;                           \
+                dest = ~0;                              \
+            }                                           \
+        }                                               \
+        dest;                                           \
+    })
+
+/*
+ * The addition of the rounding constant may overflow, so we use an
+ * intermediate 64 bit accumulator for the 32-bit version.
+ */
+#define DO_UQRSHL32_OP(src1, src2, satp)                                \
+    ({                                                                  \
+        uint32_t dest;                                                  \
+        uint32_t val = src1;                                            \
+        int8_t shift = (int8_t)src2;                                    \
+        if (shift >= 32) {                                              \
+            if (val) {                                                  \
+                *satp = true;                                           \
+                dest = ~0;                                              \
+            } else {                                                    \
+                dest = 0;                                               \
+            }                                                           \
+        } else if (shift < -32) {                                       \
+            dest = 0;                                                   \
+        } else if (shift == -32) {                                      \
+            dest = val >> 31;                                           \
+        } else if (shift < 0) {                                         \
+            uint64_t big_dest = ((uint64_t)val + (1 << (-1 - shift)));  \
+            dest = big_dest >> -shift;                                  \
+        } else {                                                        \
+            dest = val << shift;                                        \
+            if ((dest >> shift) != val) {                               \
+                *satp = true;                                           \
+                dest = ~0;                                              \
+            }                                                           \
+        }                                                               \
+        dest;                                                           \
+    })
+
+#define DO_SQRSHL_OP(src1, src2, satp)                                  \
+    ({                                                                  \
+        int8_t tmp;                                                     \
+        typeof(src1) dest;                                              \
+        tmp = (int8_t)src2;                                             \
+        if (tmp >= (ssize_t)sizeof(src1) * 8) {                         \
+            if (src1) {                                                 \
+                *satp = true;                                           \
+                dest = (typeof(dest))(1 << (sizeof(src1) * 8 - 1));     \
+                if (src1 > 0) {                                         \
+                    dest--;                                             \
+                }                                                       \
+            } else {                                                    \
+                dest = 0;                                               \
+            }                                                           \
+        } else if (tmp <= -(ssize_t)sizeof(src1) * 8) {                 \
+            dest = 0;                                                   \
+        } else if (tmp < 0) {                                           \
+            dest = (src1 + (1 << (-1 - tmp))) >> -tmp;                  \
+        } else {                                                        \
+            dest = src1 << tmp;                                         \
+            if ((dest >> tmp) != src1) {                                \
+                *satp = true;                                           \
+                dest = (uint32_t)(1 << (sizeof(src1) * 8 - 1));         \
+                if (src1 > 0) {                                         \
+                    dest--;                                             \
+                }                                                       \
+            }                                                           \
+        }                                                               \
+        dest;                                                           \
+    })
+
+#define DO_SQRSHL32_OP(src1, src2, satp)                                \
+    ({                                                                  \
+        int32_t dest;                                                   \
+        int32_t val = (int32_t)src1;                                    \
+        int8_t shift = (int8_t)src2;                                    \
+        if (shift >= 32) {                                              \
+            if (val) {                                                  \
+                *satp = true;                                           \
+                dest = (val >> 31) ^ ~(1U << 31);                       \
+            } else {                                                    \
+                dest = 0;                                               \
+            }                                                           \
+        } else if (shift <= -32) {                                      \
+            dest = 0;                                                   \
+        } else if (shift < 0) {                                         \
+            int64_t big_dest = ((int64_t)val + (1 << (-1 - shift)));    \
+            dest = big_dest >> -shift;                                  \
+        } else {                                                        \
+            dest = val << shift;                                        \
+            if ((dest >> shift) != val) {                               \
+                *satp = true;                                           \
+                dest = (val >> 31) ^ ~(1U << 31);                       \
+            }                                                           \
+        }                                                               \
+        dest;                                                           \
+    })
+
+DO_2OP_SAT(vqrshlub, 1, uint8_t, H1, DO_UQRSHL_OP)
+DO_2OP_SAT(vqrshluh, 2, uint16_t, H2, DO_UQRSHL_OP)
+DO_2OP_SAT(vqrshluw, 4, uint32_t, H4, DO_UQRSHL32_OP)
+DO_2OP_SAT(vqrshlsb, 1, int8_t, H1, DO_SQRSHL_OP)
+DO_2OP_SAT(vqrshlsh, 2, int16_t, H2, DO_SQRSHL_OP)
+DO_2OP_SAT(vqrshlsw, 4, int32_t, H4, DO_SQRSHL32_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 998f47fb94e..bea561726ea 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -423,6 +423,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
+DO_2OP(VQRSHL_S, vqrshls)
+DO_2OP(VQRSHL_U, vqrshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


