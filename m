Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8673702FE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:32:47 +0200 (CEST)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcakg-0003Eg-Q1
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmw-00057j-6G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:02 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007ov-H6
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:01 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so2367029pju.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QZBm0ZbmeHWM8+kmZROLRH67189ZahrRUX3tXQtOLs=;
 b=L6EBd6svZU7a1AGWporDcn5T9zOKueKfe1gG6ZJR7JfzLeV9hQc7SQ8cdchctd9ItP
 KgnPxbeLBYPBaN8Jgnh0ixDQPwWyprqDGwCZMIR8YqCD5CNdHFzeWuNOlx+wlrhqBerR
 HxnJGJoVNz1zvt2lvmPpsKjCboKpdVSKHY9qy/Upin3p41/iSxtvOAMfDaumclqKwJkH
 oG4b7MDn9FEaAtXWs8B1TTQ+aY/mfUDgjZ/DJoEFSUyv90W0eV2i43mPxfHryn+457RL
 4Ch8H5KFfKNGcRhYT42WH7npS+4TlKU/r0AwRWEeN4PatL4d4FWxrS5m+JwC/V2KBqFq
 4Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QZBm0ZbmeHWM8+kmZROLRH67189ZahrRUX3tXQtOLs=;
 b=LFBuZ0OnFCLJYMX3Cqj9jkBB9TUHmonoz15CSKt9KzL0rFo42MO3o2is7ymlblLIgc
 S3ML1TRxd7ZvB5+WsrS1eyDofphk/w3XSUxTbsKVXPe7jjx6Zw2IGv03UnbNiY8Hj6U6
 UmrL8VoFX4hN54GmjSl5itj42m7RbUTc542ENQQUTGjL/9HLP9YcVnzZOTSxnaW1jkoq
 RwhWlzwFQnEM5GTbYfGJep50oBYu6FN+hTT6rK8vR77fZBXB2HUgOjqXvS1ncycrgmPF
 LcbUBY8VsqqNASAK6Z4U47HZhsDokNKAiHsrVzn4AZJVZvhh+urTgEREB93jAP09P2LK
 AC+A==
X-Gm-Message-State: AOAM532zbhsEqwp+RJ19E1vGHJI+gnArwf5wE/ddynzWuzL54MWWHP+R
 I5cDtEizVy7M1hT7pIh6ybeqnsoPEwt/4A==
X-Google-Smtp-Source: ABdhPJwaeaeBGXdUmR2oYCBVsttc00mkEygtP4n0MKHEEGKOZyehMoZ4lF36kHvVcMam1AJhVmYgCQ==
X-Received: by 2002:a17:90a:e649:: with SMTP id
 ep9mr15423267pjb.8.1619814599705; 
 Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 78/82] target/arm: Split decode of VSDOT and VUDOT
Date: Fri, 30 Apr 2021 13:26:06 -0700
Message-Id: <20210430202610.1136687-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-shared.decode |  9 ++++++---
 target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index facb621450..2d94369750 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -46,8 +46,9 @@ VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
 VCADD          1111 110 rot:1 1 . 0 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
 
-# VUDOT and VSDOT
-VDOT           1111 110 00 . 10 .... .... 1101 . q:1 . u:1 .... \
+VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
@@ -61,7 +62,9 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 52b75ff76f..194e329b6c 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -269,15 +269,22 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     return true;
 }
 
-static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
+static bool trans_VSDOT(DisasContext *s, arg_VSDOT *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        a->u
-                        ? gen_helper_gvec_udot_b
-                        : gen_helper_gvec_sdot_b);
+                        gen_helper_gvec_sdot_b);
+}
+
+static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_udot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -329,15 +336,22 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
                              FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
-static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
+static bool trans_VSDOT_scalar(DisasContext *s, arg_VSDOT_scalar *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        a->u
-                        ? gen_helper_gvec_udot_idx_b
-                        : gen_helper_gvec_sdot_idx_b);
+                        gen_helper_gvec_sdot_idx_b);
+}
+
+static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_udot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.25.1


