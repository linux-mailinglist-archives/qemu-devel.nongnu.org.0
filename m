Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A139E52E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:20:11 +0200 (CEST)
Received: from localhost ([::1]:37928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIv4-0003wc-Ev
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIap-0007fT-0r
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaR-00081l-Pr
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f2so18391713wri.11
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uRhRiYsk/oV1HZWvgmDQagAPohNvG21ydMlcZh3lyY=;
 b=j5CViCGoU27XFw57vNeW6osWidwWV22HlGM1jItUjAHTMTL5kF0rguwOl2VDJQvAiR
 zP4xxPvMaJcy1jDbAb+2QTcTDO38zDNRdE1uIBpG7h16dply2GwlsMV+XsXuvaGgTpaD
 t5DxyN/v7dqzoqn3cLsMRziGQFDys2R2+HtxuzLIqO+DQjD4ZB1opblEqZ8cvLK5HGVU
 LvG82cS5of5geTdLwi6nEDj7bZUGMmCPPSYBQs4QiV0l7cqr5ry2V2OWDtPM6JaWzAEa
 u7QFfmVWF0cpAtePhkRmXzB+AG7OtdeAF9C6FAiEeRCBERuCpyK1rMtqpzHhFect8iss
 AXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2uRhRiYsk/oV1HZWvgmDQagAPohNvG21ydMlcZh3lyY=;
 b=pg9Kdm1B++txJwHiDRn1msyq+Ufmz94Ibkp238WmLLMXNLhwN6fK71fI+OJehqX4Og
 KenTqPSPcrEgPjrk9Zo6EjEVBFfPjtAwFRgEhpps8GI04oNPsxTUW7WwhQPpgk55b+Db
 PhnUglhFipw02tQzhfO569Sj1FtnRuFft3kA+SAnLYqdE6wVHoEwrH6Mzm6cFsP9Wz1Y
 3TxjN+0syaEaQEFcCrVMN4HFlVZqQ7XiccA0CUh9+taDH2at9NJh9q2JBgklqWYz9ptX
 vopT/e3fhIj0DITARHqVvrcZMKgMRGS+b3bszjPw1L4+U1IKpprU62fp6zrbD757wgE/
 Xhow==
X-Gm-Message-State: AOAM531y4RP3xZdApdrKSfkLI8Er/FQb7giI1UjBZvYTacbA+GJbR99g
 MJLd7uzpUtNG4Dh82MpuY3THH0FvmTocU9cv
X-Google-Smtp-Source: ABdhPJxDRR7tJdea6+pl4buOw0orYmug1bYpRb70fuZTgbCE4ANYJ/uFJJ5ZfCYq/Q/y10OAIoYOkg==
X-Received: by 2002:a5d:484b:: with SMTP id n11mr11451588wrs.34.1623085128978; 
 Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/55] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
Date: Mon,  7 Jun 2021 17:57:58 +0100
Message-Id: <20210607165821.9892-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VRMLALDAVH and VRMLSLDAVH insns, which accumulate
the results of a rounded multiply of pairs of elements into a 72-bit
accumulator, returning the top 64 bits in a pair of general purpose
registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  7 +++++++
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 24 ++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 7789da1986b..723bef4a83a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -159,3 +159,11 @@ DEF_HELPER_FLAGS_4(mve_vmlsldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlsldavxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlaldavhuw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
+DEF_HELPER_FLAGS_4(mve_vrmlsldavhxsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 1be2d6b270f..ac68f072bbe 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -143,7 +143,14 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 @vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
+@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+                 qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
 VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
 
 VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1c22e2777d9..b22a7535308 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "cpu.h"
 #include "internals.h"
 #include "exec/helper-proto.h"
@@ -512,3 +513,37 @@ DO_LDAV(vmlsldavsh, 2, int16_t, H2, false, +=, -=)
 DO_LDAV(vmlsldavxsh, 2, int16_t, H2, true, +=, -=)
 DO_LDAV(vmlsldavsw, 4, int32_t, H4, false, +=, -=)
 DO_LDAV(vmlsldavxsw, 4, int32_t, H4, true, +=, -=)
+
+/*
+ * Rounding multiply add long dual accumulate high: we must keep
+ * a 72-bit internal accumulator value and return the top 64 bits.
+ */
+#define DO_LDAVH(OP, ESIZE, TYPE, H, XCHG, EVENACC, ODDACC, TO128)      \
+    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
+                                    void *vm, uint64_t a)               \
+    {                                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        TYPE *n = vn, *m = vm;                                          \
+        Int128 acc = TO128(a);                                          \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if (mask & 1) {                                             \
+                if (e & 1) {                                            \
+                    acc = ODDACC(acc, TO128(n[H(e - 1 * XCHG)] * m[H(e)])); \
+                } else {                                                \
+                    acc = EVENACC(acc, TO128(n[H(e + 1 * XCHG)] * m[H(e)])); \
+                }                                                       \
+                acc = int128_add(acc, 1 << 7);                          \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+        return int128_getlo(int128_rshift(acc, 8));                     \
+    }
+
+DO_LDAVH(vrmlaldavhsw, 4, int32_t, H4, false, int128_add, int128_add, int128_makes64)
+DO_LDAVH(vrmlaldavhxsw, 4, int32_t, H4, true, int128_add, int128_add, int128_makes64)
+
+DO_LDAVH(vrmlaldavhuw, 4, uint32_t, H4, false, int128_add, int128_add, int128_make64)
+
+DO_LDAVH(vrmlsldavhsw, 4, int32_t, H4, false, int128_add, int128_sub, int128_makes64)
+DO_LDAVH(vrmlsldavhxsw, 4, int32_t, H4, true, int128_add, int128_sub, int128_makes64)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 66d713a24e2..6792fca798d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -508,3 +508,27 @@ static bool trans_VMLSLDAV(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->size][a->x]);
 }
+
+static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
+{
+    MVEGenDualAccOpFn *fns[] = {
+        gen_helper_mve_vrmlaldavhsw, gen_helper_mve_vrmlaldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLALDAVH_U(DisasContext *s, arg_vmlaldav *a)
+{
+    MVEGenDualAccOpFn *fns[] = {
+        gen_helper_mve_vrmlaldavhuw, NULL,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
+
+static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
+{
+    MVEGenDualAccOpFn *fns[] = {
+        gen_helper_mve_vrmlsldavhsw, gen_helper_mve_vrmlsldavhxsw,
+    };
+    return do_long_dual_acc(s, a, fns[a->x]);
+}
-- 
2.20.1


