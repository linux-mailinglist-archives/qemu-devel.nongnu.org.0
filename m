Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA85339E57D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:31:18 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ5p-0007NS-N3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb3-0007xF-TO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-000824-ST
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id a20so18492003wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4u5O/+URPY2YX5g4RVQ1o01+GIgpzy68B0lmOEsuVk=;
 b=tVFFxt7IwfqTA0Ji2z1XWjZZHWW9NUL3K6tUSAwjVw6WdTJzeBz2+rqT/xluaszq3T
 a/ew5g/TGk+Eyani2+zdgrYExBH9tlnmBDGNzhxDceXWs1xpV5ZmBxqOpL2U7t8o50Ks
 njmUkPqfPykMdIlWmvpFn8us5d+aosYa/kTU52pRDkja0TwA8qsLZ1atigPmWWTmgDg2
 sXKGFCAdHqUqcbwIb99D7CK9m1cJcVTD+/xqGmPCsbD1KZDa4C8v+p7QWfEq2ko+9Bl4
 HiO9HWNRlzxSQhW/pv0QrF3yaCSo9mWiu4fQN27KtamHlCzfUfPwhG7qoMeG1NaGqpI0
 ZB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4u5O/+URPY2YX5g4RVQ1o01+GIgpzy68B0lmOEsuVk=;
 b=uApxZKHTa6sv4Y5WtfaLbET5mZii14WZUABm2trnqgKivgRMDdXE57XzBqSqianvtQ
 BDa8LZ8Ss8w0TJlQlFDyElY6wxtNjo0LmwDolkfdyJAxNp/oA4f7hLtALNuIrxeSXgMm
 R8YvAXIeOKyFQQK/2fu/fDmSLYBJAFDj8yoiaB/6xltYafNwym949dspBZW9oJMSMqJl
 op6BR/+GXciqsENxusAdBitYjsvZ1QGU2ShkTZxMyqnb5YQc9o05mpZGJMDOfbERalsj
 vcsydYlWV+BxWQ1p862jHMaQiMgg0Am6ACETY7hUBrk93jTmCQet9HNvzwrY7arLaWba
 QwNQ==
X-Gm-Message-State: AOAM533zktaR9IPlX6UgJbVegF4fTXO9DsWBI23YcYnkPDRjMxlb0Wkt
 Hg9AkB2fvObFa6gWo3oTOQFj1Q==
X-Google-Smtp-Source: ABdhPJyTpS7l8CFUIRhRE5VGNVkq8oI5r1AjrEZKdxvypZ0ixOeFy0HJPxeTp5ovHr/T+3endfBVVw==
X-Received: by 2002:a05:6000:1acd:: with SMTP id
 i13mr9834582wry.327.1623085130572; 
 Mon, 07 Jun 2021 09:58:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 34/55] target/arm: Implement MVE VSUB, VMUL (scalar)
Date: Mon,  7 Jun 2021 17:58:00 +0100
Message-Id: <20210607165821.9892-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 2 ++
 target/arm/mve_helper.c    | 2 ++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index d2626810aaf..4d39527e201 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -151,6 +151,14 @@ DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index 8d9811c5473..8892a713287 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -502,6 +502,8 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##w, 4, uint32_t, H4, FN)
 
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
+DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
 
 /*
  * Multiply add long dual accumulate ops.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 89e5aa50284..c03528d1973 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -463,6 +463,8 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     }
 
 DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+DO_2OP_SCALAR(VSUB_scalar, vsub_scalar)
+DO_2OP_SCALAR(VMUL_scalar, vmul_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


