Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A93702DD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:17:47 +0200 (CEST)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaWA-0002Le-JT
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmH-0004NY-35
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:21 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007hl-3s
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 f6-20020a17090a6546b029015088cf4a1eso2378808pjs.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=biS3JWPtxwuQ9jQo1R+HoActsqUh9fYZHGmqJRkFZnM=;
 b=FNVF2WGgEyLNxNc0c7TCUOPS6FRGucXIxnyUwCctUxmVhJewwCvMPDNVtyMcWA4diA
 5sLTf/28P5dvmWLykTO5xVnYaO5Md4+ds/bHmDJMAM2w1s5FwGilDymywptJPVCavpan
 5E9QqYvaPRQtLuWdv6UvRMBGEYAVdxp91uDx4hxuIoikh8vqFpbOcqyubYtSBrWHGBv4
 sQ16ZhH2QB6GQPLQ6w/DVy/QvH43QLepIQ/YqnKwuRXSxlg1qDE9GU8fTnUqXoGimRY8
 BRWeHbfAMf18q5NdqbvPN0hFA446n/WkRaZbpYt0Vz30wxv818qBtYRyIh05dk9RMsNl
 /N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=biS3JWPtxwuQ9jQo1R+HoActsqUh9fYZHGmqJRkFZnM=;
 b=e9skJepunT3WN5PoV1ki9kxdFRdeSYvNzeUUj1mj2nqOG3hEn8d7g4XQeNCLWcSf0C
 fzu1JuCom/INrx6AeX/KPcgnUTiezO7frfs03TIT8Wf0NX5+Web61HKWwaGPvRo8vkqX
 g5vrNFiefHXohac0frq4SZ6Rr77FuJYV/T1oNWDY1MvQbfhifbwDUnElg9sgLyKKdBvt
 x38bmwX5/zI4QLUI3CV0Wf+DkFWMPtVdEa1yJlfzD021HZfCKZ7luJDz192Uv4ECxVa0
 GRrbjTfJWPPVodxUQYO29OMVp7zsw5lQIMRKy2eOQydtIofFjJDhX0rOL2E+Igyo/UFF
 RwHw==
X-Gm-Message-State: AOAM53117VeTf17n95AdGfTAPbwZC9fQhnTHzs422MTuFLNA4un8nxQZ
 l6izOmXlMBbB83hbO9LIzFLPa783ym7gXQ==
X-Google-Smtp-Source: ABdhPJxrqrKFHxoZRegN4ddEvUZYEONXdoYPQpoFpHUgWXkc5t1D0hxR644b2i5fG2qx50sUTxFKLw==
X-Received: by 2002:a17:90a:c903:: with SMTP id
 v3mr16899148pjt.13.1619814580670; 
 Fri, 30 Apr 2021 13:29:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 47/82] target/arm: Implement SVE2 SPLICE, EXT
Date: Fri, 30 Apr 2021 13:25:35 -0700
Message-Id: <20210430202610.1136687-48-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200423180347.9403-1-steplong@quicinc.com>
[rth: Rename the trans_* functions to *_sve2.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 11 +++++++++--
 target/arm/translate-sve.c | 35 ++++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cb2ee86228..67b6466a1e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -494,10 +494,14 @@ CPY_z_i         00000101 .. 01 .... 00 . ........ .....   @rdn_pg4 imm=%sh8_i8s
 
 ### SVE Permute - Extract Group
 
-# SVE extract vector (immediate offset)
+# SVE extract vector (destructive)
 EXT             00000101 001 ..... 000 ... rm:5 rd:5 \
                 &rrri rn=%reg_movprfx imm=%imm8_16_10
 
+# SVE2 extract vector (constructive)
+EXT_sve2        00000101 011 ..... 000 ... rn:5 rd:5 \
+                &rri imm=%imm8_16_10
+
 ### SVE Permute - Unpredicated Group
 
 # SVE broadcast general register
@@ -588,9 +592,12 @@ REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
 
-# SVE vector splice (predicated)
+# SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
 
+# SVE2 vector splice (predicated, constructive)
+SPLICE_sve2     00000101 .. 101 101 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Select Vectors Group
 
 # SVE select vector elements (predicated)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d455c4db6..3de14e3af9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2266,18 +2266,18 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
  *** SVE Permute Extract Group
  */
 
-static bool trans_EXT(DisasContext *s, arg_EXT *a)
+static bool do_EXT(DisasContext *s, int rd, int rn, int rm, int imm)
 {
     if (!sve_access_check(s)) {
         return true;
     }
 
     unsigned vsz = vec_full_reg_size(s);
-    unsigned n_ofs = a->imm >= vsz ? 0 : a->imm;
+    unsigned n_ofs = imm >= vsz ? 0 : imm;
     unsigned n_siz = vsz - n_ofs;
-    unsigned d = vec_full_reg_offset(s, a->rd);
-    unsigned n = vec_full_reg_offset(s, a->rn);
-    unsigned m = vec_full_reg_offset(s, a->rm);
+    unsigned d = vec_full_reg_offset(s, rd);
+    unsigned n = vec_full_reg_offset(s, rn);
+    unsigned m = vec_full_reg_offset(s, rm);
 
     /* Use host vector move insns if we have appropriate sizes
      * and no unfortunate overlap.
@@ -2296,6 +2296,19 @@ static bool trans_EXT(DisasContext *s, arg_EXT *a)
     return true;
 }
 
+static bool trans_EXT(DisasContext *s, arg_EXT *a)
+{
+    return do_EXT(s, a->rd, a->rn, a->rm, a->imm);
+}
+
+static bool trans_EXT_sve2(DisasContext *s, arg_rri *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_EXT(s, a->rd, a->rn, (a->rn + 1) % 32, a->imm);
+}
+
 /*
  *** SVE Permute - Unpredicated Group
  */
@@ -3013,6 +3026,18 @@ static bool trans_SPLICE(DisasContext *s, arg_rprr_esz *a)
     return true;
 }
 
+static bool trans_SPLICE_sve2(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzp(s, gen_helper_sve_splice,
+                          a->rd, a->rn, (a->rn + 1) % 32, a->pg, a->esz);
+    }
+    return true;
+}
+
 /*
  *** SVE Integer Compare - Vectors Group
  */
-- 
2.25.1


