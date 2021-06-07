Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE1539E556
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:27:42 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ2L-0008Bj-3u
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb1-0007r5-4i
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-00082p-QL
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id c9so9746329wrt.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yIO+GTjjJFTfowgWAGdpZDjVj4UT+8w5uZyCGycr9fY=;
 b=Wkj+sKHHq5bWGaInTflCFuQzdIoV8qb5b9gEhttXqCrcF0/U7wSqh3HlOdDYIx1Rsp
 /xEOF5YdLtw/y/yw5o1CaQb+AuICWwjDPy99KI9eKqNllxsvXSXo2eOH/tVpLLazdsrM
 KbvyiRVaFedAq/t34DtT0AIywxI3qYzCnNR2QlJubYlPgVO/Oon7AINkUpgoZ84hJehV
 kStqW5dsevZr8v1WT+FLmqUW0o2iRpg757hyOv+1Eis7VczcqhhLV9i5AKnb1Q4ZzVX1
 dSPpUgZh3AOfAoB+dkAodrmbNHx20tWM5iAJ00sRGAuAaml5rUzm/nBbjOZliLQC3/vI
 il0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIO+GTjjJFTfowgWAGdpZDjVj4UT+8w5uZyCGycr9fY=;
 b=Ky99BpfYfZMQ8PtOoxqkxM5aJCdILnM4W97FrpO/QajMIqc+H/+Fuqsu6auADiNJJ7
 37vZdufPYf2OUrGVCzzb9c3jaC/Aic4ZMuuFxdxoMlCZwKUp6NEMurqQEUwoRskhjgZ9
 d4wwqVZWJELgJS3M463xDIowfwpFOSAZHBJ9NLMHbbT9A8ajV948wf4NX2NKKjQB+Erg
 s+V6/6SSCuMVJlvD5nmZOlNW5FyAaYLjMAoM6WS9QE34+woQDkXeTEC55HBm4F53V5Y0
 5mtx440Kr26lcre8V1M8uryscWXPWmJ6UVK2Bwto6XG4/VfeCHGk8xrbqXspoYGbjfO5
 l3bw==
X-Gm-Message-State: AOAM533KGfeaZW27BnHV0RUl20GIfvKW4Qi1BuFE0V5Y7K9NKofJZSPW
 sSguxNBNDR0YezLovyf3Od6C+Q==
X-Google-Smtp-Source: ABdhPJxK8pMAatqwfLWC9wRtNiLVVTy2URXH45imniF3mLGC7UHANbKcVmM6E9tbE3GPWrcnuRphEA==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr18889190wru.338.1623085132944; 
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/55] target/arm: Implement MVE VPST
Date: Mon,  7 Jun 2021 17:58:03 +0100
Message-Id: <20210607165821.9892-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the MVE VPST insn, which sets the predicate mask
fields in the VPR to the immediate value encoded in the insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve.decode      |  4 +++
 target/arm/translate-mve.c | 59 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a3dbdb72a5c..e189e2de648 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -168,3 +168,7 @@ VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+
+# Predicate operations
+%mask_22_13      22:1 13:3
+VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b7bf7d0960f..45a71a22853 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -588,3 +588,62 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     };
     return do_long_dual_acc(s, a, fns[a->x]);
 }
+
+static bool trans_VPST(DisasContext *s, arg_VPST *a)
+{
+    TCGv_i32 vpr, mask;
+
+    /* mask == 0 is a "related encoding" */
+    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
+        return false;
+    }
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+    /*
+     * Set the VPR mask fields. We take advantage of MASK01 and MASK23
+     * being adjacent fields in the register.
+     *
+     * This insn is not predicated, but it is subject to beat-wise
+     * execution, and the mask is updated on the odd-numbered beats.
+     * So if PSR.ECI says we should skip beat 1, we mustn't update the
+     * 01 mask field.
+     */
+    vpr = load_cpu_field(v7m.vpr);
+    switch (s->eci) {
+    case ECI_NONE:
+    case ECI_A0:
+        /* Update both 01 and 23 fields */
+        mask = tcg_const_i32(a->mask | (a->mask << 4));
+        tcg_gen_deposit_i32(vpr, vpr, mask, R_V7M_VPR_MASK01_SHIFT,
+                            R_V7M_VPR_MASK01_LENGTH + R_V7M_VPR_MASK23_LENGTH);
+        break;
+    case ECI_A0A1:
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        /* Update only the 23 mask field */
+        mask = tcg_const_i32(a->mask);
+        tcg_gen_deposit_i32(vpr, vpr, mask, R_V7M_VPR_MASK23_SHIFT,
+                            R_V7M_VPR_MASK23_LENGTH);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    store_cpu_field(vpr, v7m.vpr);
+    tcg_temp_free_i32(mask);
+
+    if (s->eci) {
+        TCGv_i32 eci;
+        mve_update_eci(s);
+        /*
+         * Update ECI in CPUState (since we didn't call a helper
+         * that will call mve_advance_vpt()).
+         */
+        eci = tcg_const_i32(s->eci << 4);
+        store_cpu_field(eci, condexec_bits);
+    }
+    return true;
+}
-- 
2.20.1


