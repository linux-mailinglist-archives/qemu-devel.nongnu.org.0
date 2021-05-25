Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04938F831
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:28:20 +0200 (CEST)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMnr-00087z-GF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbA-0006S5-4L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:08 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLax-0005uN-Kq
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id kr9so7802045pjb.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqEfrgTAxZRSYWJVsj3UhKlDudjDrwfnyFzuC7wZThU=;
 b=gkaMUMjjIQbaRhIuF+waM6nyriWD1Y1lKClG5hb5Gxre+jAZvSxQ7vuj8BDVGlrjo6
 PAD9oDpnbLBIVQfaYYl3a/H0GQ4q5QfI8pDYxOA/VNCR2m0XZwd0+JleVX4MlhmRyM/r
 NxyLQenJHtEC4G99ekv/IV1cc3cx8lRNr8L38RFMh+Ly6WAv/B133M0qrCm3ZJXY+xAi
 yfqBl4lTvtcrl0xujbe88fcWgMaCLoZuHkXDvc14JSxO/1NO/UBO4cxIJpKOwRUg3RP7
 mevJGaw1HV+mg5oiqzhfk47m4gYg/DE9AyfH+mDbqg3IDBFhSopd5kpqiUTbAL4u9Bpy
 wpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqEfrgTAxZRSYWJVsj3UhKlDudjDrwfnyFzuC7wZThU=;
 b=qR2FSAEjCEjBPXVoOrJOboHgVEK7fQTe66T6ZKIsaz/QYkirvqZLBT5IdzKjXHXIXf
 UcIAc/nVDrfhC+TjpuUAKrhmv2C9RxuaSp3Sc/O9HeT58Gd7AWOIGB7JdFBlj00R5m06
 gPdcsz9p5owOPVZGpL/Mj31F3P9nykrnS4KRn/3wpsreOU7USA0SS5HXAyZVB5Bak+1t
 YnFDC/Z3Kd+qoosBM48nIn24RJ6q6zuO5dZhzAhoVAvzGUv81pTbGCUDdWb8MtuV6NaN
 8ca5EfHX7iJGWgm3IHwFe6ch2aMAQHBuiQvM2xbWrK475aA2ZBmYqgcMv2oeb7vbnMhf
 G9ug==
X-Gm-Message-State: AOAM530V+mRWPgRmb4V7bfzy4deXejz0kcg8zIdz5CYsraDAGZ0DF05T
 a7LsjstRKhZ472JG8DJzZ3/6P4OXoShqfg==
X-Google-Smtp-Source: ABdhPJzM28QoD7CEcC4/yisFI75eCDz55hhzLqp4BlSp1dvOpAbIwpIDTyu/ryrlNPKMOr6Hfbjsew==
X-Received: by 2002:a17:90b:108e:: with SMTP id
 gj14mr2041542pjb.109.1621905054416; 
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 88/92] target/arm: Split decode of VSDOT and VUDOT
Date: Mon, 24 May 2021 18:03:54 -0700
Message-Id: <20210525010358.152808-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index dfa33912ab..386b42fe4b 100644
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


