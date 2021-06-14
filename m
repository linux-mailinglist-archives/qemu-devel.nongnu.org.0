Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8A3A6A9A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:38:08 +0200 (CEST)
Received: from localhost ([::1]:45518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsof9-0006Ru-N8
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEr-0001sK-07
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEb-0000Uy-7M
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so181456wmg.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KNKYWkSFxnJMi7dmW4LhnFCflLRP8zuEFbqt/58Zh1Y=;
 b=XME4qZiq4yPWHOir8ZPKEH35BpIlaf3kjsvwX0KyS0Es/TsR1Zc2R+9DcNJwTOgyKu
 hiM/2cytXU+q9bopLcVT+hAg20q58UuL8XMfTtIRWg+Mt4il5XXa8D+0JOr5IPQq5vmk
 hfmlwS6SfF10RJAxlGc8GQ4iPxfc4U1AYie/zaa7IcAV7N+Ao8L0egDuzBMOc2aM8xxS
 1D9jsJ4VtlcZDjviJNMyLHmdpgIwMevp+FdxDbJNCw+RbuVjkJkmrlC8O+l2GxVODJ4N
 rNp17xYddhy5NadNS9Xq+6u7L2wontAEkfBLkah28UOj/eSTxka67xdlbFfMBxZYSKrf
 P3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KNKYWkSFxnJMi7dmW4LhnFCflLRP8zuEFbqt/58Zh1Y=;
 b=nJ0p3QffzbZPW9bvDsSjE7I0+WF6n3+isvzjHr//EVhGDiFaBW+UKYkAlTHUBU/MKV
 rWcgA8jCTT0t8snDWClXM/HFPF3IKadALxajOF2hsgQ9Yp7MFimImkKPUHlt4N1H0mqw
 OeV2cvfrBwXEkFPDZxe9Wud5dh7wC4P1SuX+sjDhrrA6wM4edGLrw0z5Hv+MRLhD5eeG
 1UnTGMxcXXGFf6il+dHF2OqkuSBChMhf4s3zzpaPXE1i7CjSoAZDdDZ6QGQFVBm5Ng+9
 R7Yvsv8V7ypgKuF5T6DcZyqpvh4VUlz2Xr/7Z9GOwdY+Ku3cIIWMj6qDuenGdg5qbnyR
 DF2g==
X-Gm-Message-State: AOAM531BUZGrubdjoJ3W22342voa84by+qm4r7ek99C3+9lqSa/zeFBh
 Jcx2RMty/YMg5IPpIbmM/MqTbx/LBe1J6w==
X-Google-Smtp-Source: ABdhPJy/f04JzRKt8ZWwqTwf4WmBVsFHmX/sd0laRh6FkKlVRpoqH+C0CEamavIC/fwsUNIzsm65Mw==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr17007211wmq.164.1623683439924; 
 Mon, 14 Jun 2021 08:10:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 36/57] target/arm: Implement MVE VSUB, VMUL (scalar)
Date: Mon, 14 Jun 2021 16:09:46 +0100
Message-Id: <20210614151007.4545-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
index 32e85e72679..14b268a15b6 100644
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
index 97ce0f2ff40..5c72299e985 100644
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


