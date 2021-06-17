Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B13AB3B5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:37:18 +0200 (CEST)
Received: from localhost ([::1]:52760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrGn-0004Sl-8y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxB-0001qB-HC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwz-00075c-PX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so6523797wrt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmYMdNKQ/fmq8FzTGquJwU5Ggbt0DZTC4PwEGNqJox0=;
 b=fGRDOuvVedbMt9TPBwajWvoJUWB42q+bhCCS/uwW+RvZ8dZYk/GXt7TET6FsxYLUVh
 I9fDRYMSRP6ruXN7sz9YsIu5ua0F6QUKkAQXgoCgGdJ3ziIdiaDs+kNBxkwMWSO9/ld3
 kpC5N3zowpNZ5E4ah0mIenmqXoogHhLOKrY9dyA75uLknmij7gft+7OtEX568purjGiG
 cpz+ycVIpSb6rKB4l7yvbCjT6OJoBa9esFDl+zSCnpGOK4HzdoKzb7Ej/b9D9MpQUQW7
 PVTEafw2ldUeGGwBKTjvsWUs01yTf5Kfx9HxwYjjuCPHG1lGtoz4EZXgtqFXBYpObM6e
 DEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmYMdNKQ/fmq8FzTGquJwU5Ggbt0DZTC4PwEGNqJox0=;
 b=KrqFsvqNU7kKVo8wVbCxIKtsEfe2vhUcnvS4qehbQPa+VvEWui7Ga6fUoOI2eU6P/V
 5E+J626DgWUxLmtf7Iq645n17Eb/xtDeezavjhuOnadSTjJD+gRGin+eb3K3Zff89jAP
 7DULr4ghGtWhonl3rt2YprSQD/6BPz49ZC6PhHjbY2UXoJd1MVZ2UVgqlPbGqrJn4izS
 xj6orNg6z+z2n5FBcjgNwt9LSTlQdLSdsWZ4IvfRkBtFltPjnTMiejEC2yxuxW3IIeiC
 uweUZVWvBvzIPvIXiApMlnG0h/nRzwK3tHegj6J0FiE/TM1qJVVI3vEGgIRGhiMjA+zl
 CSPA==
X-Gm-Message-State: AOAM531rRpEd+3ISCrkQN88oZ9JOjVUnBID7X7xdz+4QpKK36fGs64Zn
 ExmD0qHC9lliTl06AkpMFk44YuP2LTCi3A==
X-Google-Smtp-Source: ABdhPJwrNSBrJZKgaITEix7dpxOMcyhvX+LiulOJk3mQwcTEzznc2KbYhf3YnM1PgrWkpoENDvu1NA==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr5347370wrm.326.1623932208331; 
 Thu, 17 Jun 2021 05:16:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 23/44] target/arm: Implement MVE VSUB, VMUL (scalar)
Date: Thu, 17 Jun 2021 13:16:07 +0100
Message-Id: <20210617121628.20116-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the scalar forms of the MVE VSUB and VMUL insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 2 ++
 target/arm/mve_helper.c    | 2 ++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 16b974a4270..912505d0152 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -149,6 +149,14 @@ DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vsub_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsub_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsub_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vmul_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmul_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 0ee7a727081..af5fba78ce2 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -161,3 +161,5 @@ VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_no
 # Scalar operations
 
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
+VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
+VMUL_scalar      1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 19cd1964f86..5fbe44745d3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -527,6 +527,8 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
 
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
+DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
 
 /*
  * Multiply add long dual accumulate ops.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 388848b4ff0..3c059ad91cd 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -427,6 +427,8 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     }
 
 DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+DO_2OP_SCALAR(VSUB_scalar, vsub_scalar)
+DO_2OP_SCALAR(VMUL_scalar, vmul_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


