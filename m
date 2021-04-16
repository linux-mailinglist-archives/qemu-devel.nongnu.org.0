Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E347C362A60
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 23:34:49 +0200 (CEST)
Received: from localhost ([::1]:49136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXW6y-00012f-76
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 17:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdQ-0005iz-Qm
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:35354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdA-0001fb-HA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:14 -0400
Received: by mail-pg1-x530.google.com with SMTP id q10so20003735pgj.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YeuSP/ptzfHqZ3An7U1oQpcltldWGviyBgnte7gB4CU=;
 b=oxaAt5DNDxc78gDOzI35zRmEU7g/oip8KPTQVVvugOBSabmRDiuMCh3G55Wg10V3al
 wnAtiAFK/RBceJGk0CUECybhuXUHeJAbLoercVAJWG/npAYd1GF3qoj1YyagZz9xgO+9
 GrHyG02eSTJST556rLl424hg5tPy0k3T2+pOvoFtIDpc2FbZTG/0ZmWhjt8H3xhtupbM
 Er2uj412Uxk7vqQPGtLVvS2rLFMX+HZjthZSH2wvn2MHAzvmtl9y/lLuAt4jFJcpXYT9
 77fkdQqvgmmqRmwd6qkUDVZDCLIeYt3i2P3wcp9rebBg1adIjvi/Iq0ckET07hNZEk3C
 xj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YeuSP/ptzfHqZ3An7U1oQpcltldWGviyBgnte7gB4CU=;
 b=CnvEYIodxI8xwq9/jn38g+lzgeoZGxF2g9/jvzr3KAQ0CJIn1O8zw5bDMLleXCxhCd
 VUKNjkkQlpwO3SBPMAW7hQ5RVfhRaKoe/EDPqtIasF/jp2pffgEkYPtriwe/liuvWduc
 3Nf2B9dXAGnAeMDzuCMRAGXLbxrSE4lVYdIqHVdR0CPTOqZVT6fjzmN9BTlOIIFXm0fQ
 SrQdQFhBugegRdawEc+d+Q8Et/4EGbuWqSxgQhvJED1dfvUtWJsjlzPgPRRumu/PLQJg
 0H5nvjd9B/0R8eCZNT9ht1lxbpI0tFBnatBKk/4VjDXcasERaGgPRsImE23ebWXkXYqY
 7Vag==
X-Gm-Message-State: AOAM531NG+BO9TdPD1M6dUQ2zv/znFVWSA6O+dqwXR1/f+nt7+QDO7lc
 AQDPkRd2R0LTwy5YqwP4ay1gwHrhye/Ujg==
X-Google-Smtp-Source: ABdhPJwChkXu71TBIYWwzAQh48vvSIv8wxezcunClMW5fAJp9pHidMZMzRupZ++vAdp558lnPhEYbg==
X-Received: by 2002:a62:7907:0:b029:23e:9010:3844 with SMTP id
 u7-20020a6279070000b029023e90103844mr9620148pfc.58.1618607039232; 
 Fri, 16 Apr 2021 14:03:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 47/81] target/arm: Implement SVE2 SPLICE, EXT
Date: Fri, 16 Apr 2021 14:02:06 -0700
Message-Id: <20210416210240.1591291-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
index 0afae9646f..e9feb05da3 100644
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


