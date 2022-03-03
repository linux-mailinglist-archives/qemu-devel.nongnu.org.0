Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351FF4CB568
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:27:37 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc7s-0008U2-A2
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc39-0004YL-AY; Wed, 02 Mar 2022 22:22:43 -0500
Received: from [2607:f8b0:4864:20::729] (port=34474
 helo=mail-qk1-x729.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc34-0006kD-Qx; Wed, 02 Mar 2022 22:22:42 -0500
Received: by mail-qk1-x729.google.com with SMTP id 185so3025829qkh.1;
 Wed, 02 Mar 2022 19:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5Q/eaLy8QwkzrkijRnN1KR/DBvVWFrZ0up4b6p5xIY=;
 b=O5pzPU0uDUVxVKx+Gxfx8UqTv+vLlC4sLstRj33idfMgxhfKNbZqiyvHreltlcpjke
 4wESFgQlnrbpslX2H0079XvqTvHhO17buufxoDuH1T03b+oqHpBU8raEvmxIsjhUDPs1
 6oU+IVR+emdsxcgIWIogroBYgrB+IiVSp/NgnPilie3nq1chTJfGPH9BO8eTX5rKtFoG
 lfzk+BWW7d3M/e6+dJJ6ebsGud8Kve60mDcHJJccdZgGVeHVnwA1wAN+m7/ZZVeU8SkT
 hTqTn71ugXugHQaIi0PCEI7wTdJj+Tnv5I8aIv/8+3ESeRE6jQk+BauzT25e8JK5uCAM
 TZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5Q/eaLy8QwkzrkijRnN1KR/DBvVWFrZ0up4b6p5xIY=;
 b=WIX9OznfJb9wkxFDj+IlPGa67kRr+AdlFZnDZFhbeg0OV6HMHP8symGZCOMacF+3Xz
 aoJUn8GdlYBv2maIUjiLAZCoyint8oHl1h22Hq+o4NNjdNfCjYrQ2EMAZgiY7pmeo2LE
 0ToofwPaBWuEq96502C4SsdGKwIZJK8rAWhPcoOFXksjUvRuuAAXvhd+cFbQfiKFMGpN
 DBOwVcJBbHAi67rS7tyN0QvJeVGcWtUryApduyDPw2mRLRb0BMru2y3pWsJJs44REzXr
 d946cfEWWlqoDFmjmbMt21icT9+cbwDRcgXkzlbXG1xvJBY+QbIjLSRG0WwjTgdo36Js
 8xbQ==
X-Gm-Message-State: AOAM530svKYc6uUzP1h4991t8YCMNFgBWMPWo0vmGGFmkpFOM81aq/WW
 r9brrUVrIiXGm+0oiw1v23olfm+5/xqI/YVTSH4=
X-Google-Smtp-Source: ABdhPJyBTAAKeum0H5Jt/qnmNCMrrh+ga3p3NJMS+iOJwnTsICbiKe93tnTMaM2Gi8b+LCPModlzTg==
X-Received: by 2002:a37:713:0:b0:49b:7d7a:60cd with SMTP id
 19-20020a370713000000b0049b7d7a60cdmr18216702qkh.28.1646277755659; 
 Wed, 02 Mar 2022 19:22:35 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 x15-20020a05622a000f00b002de2da5e5cdsm682213qtw.3.2022.03.02.19.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:22:35 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility 2
 for s390x
Date: Wed,  2 Mar 2022 22:22:18 -0500
Message-Id: <20220303032219.17631-2-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220303032219.17631-1-dmiller423@gmail.com>
References: <20220303032219.17631-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::729
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

resolves: https://gitlab.com/qemu-project/qemu/-/issues/738

implements:
VECTOR LOAD ELEMENTS REVERSED               (VLER)
VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE (VLBRREP)
VECTOR STORE ELEMENTS REVERSED              (VSTER)
VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
VECTOR STRING SEARCH                        (VSTRS)

modifies:
VECTOR FP CONVERT FROM FIXED                (VCFPS)
VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
VECTOR FP CONVERT TO FIXED                  (VCSFP)
VECTOR FP CONVERT TO LOGICAL                (VCLFP)
VECTOR SHIFT LEFT                           (VSL)
VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
VECTOR SHIFT RIGHT LOGICAL                  (VSRL)

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 include/qemu/bitops.h                |  26 ++
 target/s390x/gen-features.c          |   2 +-
 target/s390x/helper.h                |  12 +-
 target/s390x/tcg/insn-data.def       |  30 ++-
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/translate_vx.c.inc  | 377 ++++++++++++++++++++++++---
 target/s390x/tcg/vec.h               |  30 +++
 target/s390x/tcg/vec_fpu_helper.c    |  33 +++
 target/s390x/tcg/vec_helper.c        |  33 +++
 target/s390x/tcg/vec_int_helper.c    |  59 +++++
 target/s390x/tcg/vec_string_helper.c |  65 +++++
 11 files changed, 626 insertions(+), 44 deletions(-)

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 03213ce952..9a955fc2f4 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -446,6 +446,32 @@ static inline int64_t sextract64(uint64_t value, int start, int length)
     return ((int64_t)(value << (64 - length - start))) >> (64 - length);
 }
 
+/**
+ * deposit8:
+ * @value: initial value to insert bit field into
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ * @fieldval: the value to insert into the bit field
+ *
+ * Deposit @fieldval into the 8 bit @value at the bit field specified
+ * by the @start and @length parameters, and return the modified
+ * @value. Bits of @value outside the bit field are not modified.
+ * Bits of @fieldval above the least significant @length bits are
+ * ignored. The bit field must lie entirely within the 8 bit byte.
+ * It is valid to request that all 8 bits are modified (ie @length
+ * 8 and @start 0).
+ *
+ * Returns: the modified @value.
+ */
+static inline uint8_t deposit8(uint8_t value, int start, int length,
+                               uint8_t fieldval)
+{
+    uint8_t mask;
+    assert(start >= 0 && length > 0 && length <= 8 - start);
+    mask = (~0ULL >> (8 - length)) << start;
+    return (value & ~mask) | ((fieldval << start) & mask);
+}
+
 /**
  * deposit32:
  * @value: initial value to insert bit field into
diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 22846121c4..633891d59f 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -740,13 +740,13 @@ static uint16_t qemu_V6_2[] = {
 
 static uint16_t qemu_LATEST[] = {
     S390_FEAT_MISC_INSTRUCTION_EXT3,
+    S390_FEAT_VECTOR_ENH2,
 };
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
     /* generates a dependency warning, leave it out for now */
     S390_FEAT_MSA_EXT_5,
 };
-
 /****** END FEATURE DEFS ******/
 
 #define _YEARS  "2016"
diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 69f69cf718..dbafdba62d 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -129,6 +129,9 @@ DEF_HELPER_FLAGS_3(probe_write_access, TCG_CALL_NO_WG, void, env, i64, i64)
 /* === Vector Support Instructions === */
 DEF_HELPER_FLAGS_4(gvec_vbperm, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(vll, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
+DEF_HELPER_FLAGS_4(vstl, TCG_CALL_NO_WG, void, env, cptr, i64, i64)
+DEF_HELPER_FLAGS_4(vler, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
+DEF_HELPER_FLAGS_4(vster, TCG_CALL_NO_WG, void, env, ptr, i64, i64)
 DEF_HELPER_FLAGS_4(gvec_vpk16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vpk32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vpk64, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
@@ -145,7 +148,6 @@ DEF_HELPER_5(gvec_vpkls_cc16, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vpkls_cc32, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vpkls_cc64, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vperm, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, cptr, i32)
-DEF_HELPER_FLAGS_4(vstl, TCG_CALL_NO_WG, void, env, cptr, i64, i64)
 
 /* === Vector Integer Instructions === */
 DEF_HELPER_FLAGS_4(gvec_vavg8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
@@ -203,8 +205,11 @@ DEF_HELPER_FLAGS_3(gvec_vpopct16, TCG_CALL_NO_RWG, void, ptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_verim8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_verim16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsra, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsra_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vsrl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsrl_ve2, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vscbi8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_vscbi16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i32)
 DEF_HELPER_4(gvec_vtm, void, ptr, cptr, env, i32)
@@ -246,6 +251,7 @@ DEF_HELPER_6(gvec_vstrc_cc32, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt8, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt16, void, ptr, cptr, cptr, cptr, env, i32)
 DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cptr, cptr, env, i32)
+DEF_HELPER_6(vstrs, void, ptr, cptr, cptr, ptr, env, i32)
 
 /* === Vector Floating-Point Instructions */
 DEF_HELPER_FLAGS_5(gvec_vfa32, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
@@ -275,6 +281,10 @@ DEF_HELPER_FLAGS_5(gvec_vfche64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfche128, TCG_CALL_NO_WG, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche128_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcdg32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcdlg32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcgd32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vclgd32, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcdlg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vcgd64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32)
diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.def
index 35e55d454e..5e5e2656f0 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.def
@@ -1027,6 +1027,20 @@
     F(0xe756, VLR,     VRR_a, V,   0, 0, 0, 0, vlr, 0, IF_VEC)
 /* VECTOR LOAD AND REPLICATE */
     F(0xe705, VLREP,   VRX,   V,   la2, 0, 0, 0, vlrep, 0, IF_VEC)
+
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+    F(0xe601, VLEBRH,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+    F(0xe603, VLEBRF,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+    F(0xe602, VLEBRG,  VRX,   VE2, la2, 0, 0, 0, vlebr, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE */
+    F(0xe605, VLBRREP, VRX,   VE2, la2, 0, 0, 0, vlbrrep, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
+    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
+/* VECTOR LOAD BYTE REVERSED ELEMENTS */
+	F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
+/* VECTOR LOAD ELEMENTS REVERSED */
+	F(0xe607, VLER,    VRX,   VE2, la2, 0, 0, 0, vler, 0, IF_VEC)
+
 /* VECTOR LOAD ELEMENT */
     E(0xe700, VLEB,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_8, IF_VEC)
     E(0xe701, VLEH,    VRX,   V,   la2, 0, 0, 0, vle, 0, ES_16, IF_VEC)
@@ -1077,11 +1091,19 @@
     F(0xe75f, VSEG,    VRR_a, V,   0, 0, 0, 0, vseg, 0, IF_VEC)
 /* VECTOR STORE */
     F(0xe70e, VST,     VRX,   V,   la2, 0, 0, 0, vst, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENT */
+    F(0xe609, VSTEBRH,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+    F(0xe60b, VSTEBRF,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+    F(0xe60a, VSTEBRG,  VRX,   VE2, la2, 0, 0, 0, vsteb, 0, IF_VEC)
+/* VECTOR STORE BYTE REVERSED ELEMENTS */
+	F(0xe60e, VSTBR,    VRX,   VE2, la2, 0, 0, 0, vstbr, 0, IF_VEC)
 /* VECTOR STORE ELEMENT */
     E(0xe708, VSTEB,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_8, IF_VEC)
     E(0xe709, VSTEH,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_16, IF_VEC)
     E(0xe70b, VSTEF,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_32, IF_VEC)
     E(0xe70a, VSTEG,   VRX,   V,   la2, 0, 0, 0, vste, 0, ES_64, IF_VEC)
+/* VECTOR STORE ELEMENTS REVERSED */
+	F(0xe60f, VSTER,    VRX,   VE2, la2, 0, 0, 0, vster, 0, IF_VEC)
 /* VECTOR STORE MULTIPLE */
     F(0xe73e, VSTM,    VRS_a, V,   la2, 0, 0, 0, vstm, 0, IF_VEC)
 /* VECTOR STORE WITH LENGTH */
@@ -1207,12 +1229,16 @@
     F(0xe774, VSL,     VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
 /* VECTOR SHIFT LEFT BY BYTE */
     F(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
+/* VECTOR SHIFT LEFT DOUBLE BY BIT */
+	F(0xe786, VSLD,    VRI_d, VE2, 0, 0, 0, 0, vsld, 0, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
-    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
+    F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsld, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC */
     F(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
     F(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
+/* VECTOR SHIFT RIGHT DOUBLE BY BIT */
+	F(0xe787, VSRD,    VRI_d, VE2, 0, 0, 0, 0, vsrd, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL */
     F(0xe77c, VSRL,    VRR_c, V,   0, 0, 0, 0, vsrl, 0, IF_VEC)
 /* VECTOR SHIFT RIGHT LOGICAL BY BYTE */
@@ -1246,6 +1272,8 @@
     F(0xe75c, VISTR,   VRR_a, V,   0, 0, 0, 0, vistr, 0, IF_VEC)
 /* VECTOR STRING RANGE COMPARE */
     F(0xe78a, VSTRC,   VRR_d, V,   0, 0, 0, 0, vstrc, 0, IF_VEC)
+/*	VECTOR STRING SEARCH */
+    F(0xe78b, VSTRS,   VRR_d, VE2, 0, 0, 0, 0, vstrs, 0, IF_VEC)
 
 /* === Vector Floating-Point Instructions */
 
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 92faa1b65f..f0f1f382e4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6223,7 +6223,8 @@ enum DisasInsnEnum {
 #define FAC_PCI         S390_FEAT_ZPCI /* z/PCI facility */
 #define FAC_AIS         S390_FEAT_ADAPTER_INT_SUPPRESSION
 #define FAC_V           S390_FEAT_VECTOR /* vector facility */
-#define FAC_VE          S390_FEAT_VECTOR_ENH /* vector enhancements facility 1 */
+#define FAC_VE          S390_FEAT_VECTOR_ENH  /* vector enhancements facility 1 */
+#define FAC_VE2         S390_FEAT_VECTOR_ENH2 /* vector enhancements facility 2 */
 #define FAC_MIE2        S390_FEAT_MISC_INSTRUCTION_EXT2 /* miscellaneous-instruction-extensions facility 2 */
 #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
 
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index 98eb7710a4..d8a773f67c 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -457,6 +457,9 @@ static DisasJumpType op_vlrep(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+
+
+
 static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
@@ -614,6 +617,192 @@ static DisasJumpType op_vlm(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vler(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    TCGv_ptr a0 = tcg_temp_new_ptr();
+    TCGv_i64 tes = tcg_const_i64(es & 0xf);
+
+    tcg_gen_addi_ptr(a0, cpu_env, vec_full_reg_offset(get_field(s, v1)));
+    gen_helper_vler(cpu_env, a0, o->addr1, tes);
+
+    tcg_temp_free_i64(tes);
+    tcg_temp_free_ptr(a0);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = (1 == s->fields.op2) ? 1 : (1 ^ s->fields.op2);
+    const uint8_t enr = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (es < ES_16 || es > ES_64 || !valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+
+    write_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlbrrep(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    TCGv_i64 tmp;
+
+    if (es == ES_8 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+    gen_gvec_dup_i64(es, get_field(s, v1), tmp);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vllebrz(DisasContext *s, DisasOps *o)
+{
+    const uint8_t m3 = get_field(s, m3);
+    const uint8_t es = m3 & 3;
+    const uint8_t enr = (m3 == 6) ? 0 : ((1 << (3 - es)) - 1);
+
+    TCGv_i64 tmp, zero;
+
+    if (m3 < ES_16 || (m3 > ES_64 && m3 != 6))  {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    zero = tcg_const_i64(0);
+    write_vec_element_i64(zero, get_field(s, v1), 1, ES_64);
+    write_vec_element_i64(zero, get_field(s, v1), 0, ES_64);
+
+    tmp = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * (1 << es));
+
+    write_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i64(zero);
+
+    return DISAS_NEXT;
+}
+
+static DisasJumpType op_vlbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    uint32_t dst_idx;
+
+    if (es < ES_16 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+
+    if (es >= ES_64) {
+        tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+        tcg_gen_bswap64_i64(t0, t0);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        tcg_gen_qemu_ld_i64(t1, o->addr1, get_mem_index(s), MO_TEUQ);
+        tcg_gen_bswap64_i64(t1, t1);
+        write_vec_element_i64(t0, get_field(s, v1), (es > ES_64) ? 1 : 0, ES_64);
+        write_vec_element_i64(t1, get_field(s, v1), (es > ES_64) ? 0 : 1, ES_64);
+    } else {
+        for (dst_idx = 0; dst_idx < NUM_VEC_ELEMENTS(es); dst_idx++) {
+            tcg_gen_qemu_ld_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+            tcg_gen_bswap64_i64(t0, t0);
+            write_vec_element_i64(t0, get_field(s, v1), dst_idx, es);
+            gen_addi_and_wrap_i64(s, o->addr1, o->addr1, bytes);
+        }
+    }
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    return DISAS_NEXT;
+}
+
+
+
+static DisasJumpType op_vsteb(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = (9 == s->fields.op2) ? 1 : 1 ^ (s->fields.op2 & 3);
+    const uint8_t enr = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    TCGv_i64 tmp;
+
+    if (!valid_vec_element(enr, es)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    tmp = tcg_temp_new_i64();
+    read_vec_element_i64(tmp, get_field(s, v1), enr, es);
+    tcg_gen_bswap64_i64(tmp, tmp);
+    tcg_gen_rotri_i64(tmp, tmp, 64 - 8 * bytes);
+    tcg_gen_qemu_st_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
+
+
+static DisasJumpType op_vstbr(DisasContext *s, DisasOps *o)
+{
+    const uint8_t v1 = get_field(s, v1);
+    const uint8_t es = get_field(s, m3);
+    const uint8_t bytes = 1 << es;
+    uint32_t src_idx;
+
+    if (es == ES_8 || es > ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_const_i64(16);
+    gen_helper_probe_write_access(cpu_env, o->addr1, t0);
+
+    if (es >= ES_64) {
+        read_vec_element_i64(t0, v1, (es > ES_64) ? 1 : 0, ES_64);
+        tcg_gen_bswap64_i64(t0, t0);
+        tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+        gen_addi_and_wrap_i64(s, o->addr1, o->addr1, 8);
+        read_vec_element_i64(t0, v1, (es > ES_64) ? 0 : 1, ES_64);
+        tcg_gen_bswap64_i64(t0, t0);
+        tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TEUQ);
+    } else {
+        for (src_idx = 0; src_idx < NUM_VEC_ELEMENTS(es); src_idx++) {
+            read_vec_element_i64(t0, v1, src_idx, es);
+            tcg_gen_bswap64_i64(t0, t0);
+            tcg_gen_rotri_i64(t0, t0, 64 - 8 * bytes);
+            tcg_gen_qemu_st_i64(t0, o->addr1, get_mem_index(s), MO_TE | es);
+            gen_addi_and_wrap_i64(s, o->addr1, o->addr1, bytes);
+        }
+    }
+
+    tcg_temp_free(t0);
+    return DISAS_NEXT;
+}
+
+
+
 static DisasJumpType op_vlbb(DisasContext *s, DisasOps *o)
 {
     const int64_t block_size = (1ull << (get_field(s, m3) + 6));
@@ -958,6 +1147,25 @@ static DisasJumpType op_vst(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vster(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m3);
+    if (es < ES_16 || es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    TCGv_ptr a0 = tcg_temp_new_ptr();
+    TCGv_i64 tes = tcg_const_i64(es);
+
+    tcg_gen_addi_ptr(a0, cpu_env, vec_full_reg_offset(get_field(s, v1)));
+    gen_helper_vster(cpu_env, a0, o->addr1, tes);
+
+    tcg_temp_free_i64(tes);
+    tcg_temp_free_ptr(a0);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vste(DisasContext *s, DisasOps *o)
 {
     const uint8_t es = s->insn->data;
@@ -2020,26 +2228,33 @@ static DisasJumpType op_ves(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_vsl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x74) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    const bool B = 0x75 == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0,  gen_helper_gvec_vsl_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsl);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsl);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsld(DisasContext *s, DisasOps *o)
 {
-    const uint8_t i4 = get_field(s, i4) & 0xf;
-    const int left_shift = (i4 & 7) * 8;
-    const int right_shift = 64 - left_shift;
+    const uint8_t mask = (0x86 == s->fields.op2) ? 7 : 15;
+    const uint8_t mul  = (0x86 == s->fields.op2) ? 1 : 8;
+    const uint8_t i4   = get_field(s, i4);
+    const int shift = 64 - (i4 & 7) * mul;
+
+    if (i4 & ~mask) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -2053,8 +2268,8 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
         read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
         read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
     }
-    tcg_gen_extract2_i64(t0, t1, t0, right_shift);
-    tcg_gen_extract2_i64(t1, t2, t1, right_shift);
+    tcg_gen_extract2_i64(t0, t1, t0, shift);
+    tcg_gen_extract2_i64(t1, t2, t1, shift);
     write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
     write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
 
@@ -2064,37 +2279,66 @@ static DisasJumpType op_vsldb(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
-static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+static DisasJumpType op_vsrd(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
+    const uint8_t i4 = get_field(s, i4);
+    const int left_shift = (i4 & 7);
+    if (i4 & ~7) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_i64 t1 = tcg_temp_new_i64();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    read_vec_element_i64(t0, get_field(s, v2), 1, ES_64);
+    read_vec_element_i64(t1, get_field(s, v3), 0, ES_64);
+    read_vec_element_i64(t2, get_field(s, v3), 1, ES_64);
+
+    tcg_gen_extract2_i64(t0, t1, t0, left_shift);
+    tcg_gen_extract2_i64(t1, t2, t1, left_shift);
+    write_vec_element_i64(t0, get_field(s, v1), 0, ES_64);
+    write_vec_element_i64(t1, get_field(s, v1), 1, ES_64);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return DISAS_NEXT;
+}
 
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7e) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+{
+    const bool B = 0x7f == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_helper_gvec_vsra_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsra);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsra);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
 static DisasJumpType op_vsrl(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 shift = tcg_temp_new_i64();
-
-    read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
-    if (s->fields.op2 == 0x7c) {
-        tcg_gen_andi_i64(shift, shift, 0x7);
+    const bool B = 0x7d == s->fields.op2;
+    if (!B && s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+        gen_gvec_3_ool(get_field(s, v1), get_field(s, v2),
+                       get_field(s, v3), 0, gen_helper_gvec_vsrl_ve2);
     } else {
-        tcg_gen_andi_i64(shift, shift, 0x78);
-    }
+        TCGv_i64 shift = tcg_temp_new_i64();
 
-    gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
-                    shift, 0, gen_helper_gvec_vsrl);
-    tcg_temp_free_i64(shift);
+        read_vec_element_i64(shift, get_field(s, v3), 7, ES_8);
+        tcg_gen_andi_i64(shift, shift, B ? 0x78 : 7);
+        gen_gvec_2i_ool(get_field(s, v1), get_field(s, v2),
+                        shift, 0, gen_helper_gvec_vsrl);
+        tcg_temp_free_i64(shift);
+    }
     return DISAS_NEXT;
 }
 
@@ -2497,6 +2741,23 @@ static DisasJumpType op_vstrc(DisasContext *s, DisasOps *o)
     return DISAS_NEXT;
 }
 
+static DisasJumpType op_vstrs(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es = get_field(s, m5);
+    const uint32_t D = get_field(s, m6);
+
+    if (es > ES_32) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    gen_gvec_4_ptr(get_field(s, v1), get_field(s, v2),
+                   get_field(s, v3), get_field(s, v4),
+                   cpu_env, (D << 16) | es, gen_helper_vstrs);
+
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
+
 static DisasJumpType op_vfa(DisasContext *s, DisasOps *o)
 {
     const uint8_t fpf = get_field(s, m4);
@@ -2720,23 +2981,59 @@ static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
 
     switch (s->fields.op2) {
     case 0xc3:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcdg64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcdg32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc1:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcdlg64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcdlg32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc2:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vcgd64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vcgd32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc0:
-        if (fpf == FPF_LONG) {
+        switch (fpf) {
+        case FPF_LONG:
             fn = gen_helper_gvec_vclgd64;
+            break;
+        case FPF_SHORT:
+            if (s390_has_feat(S390_FEAT_VECTOR_ENH2)) {
+                fn = gen_helper_gvec_vclgd32;
+            }
+            break;
+        default:
+            break;
         }
         break;
     case 0xc7:
diff --git a/target/s390x/tcg/vec.h b/target/s390x/tcg/vec.h
index a6e361869b..92291982ec 100644
--- a/target/s390x/tcg/vec.h
+++ b/target/s390x/tcg/vec.h
@@ -138,4 +138,34 @@ static inline void s390_vec_write_element(S390Vector *v, uint8_t enr,
     }
 }
 
+static inline void s390_vec_reverse(S390Vector *vdst,
+                                    S390Vector *vsrc, uint8_t es)
+{
+    const uint8_t elems = 1 << (4 - es);
+    uint32_t enr;
+
+    for (enr = 0; enr < elems; enr++) {
+        switch (es) {
+        case MO_8:
+            s390_vec_write_element8(vdst, enr,
+                           s390_vec_read_element8(vsrc, 15 ^ enr));
+            break;
+        case MO_16:
+            s390_vec_write_element16(vdst, enr,
+                           s390_vec_read_element16(vsrc, 7 ^ enr));
+            break;
+        case MO_32:
+            s390_vec_write_element32(vdst, enr,
+                           s390_vec_read_element32(vsrc, 3 ^ enr));
+            break;
+        case MO_64:
+            s390_vec_write_element64(vdst, enr,
+                           s390_vec_read_element64(vsrc, 1 ^ enr));
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+}
+
 #endif /* S390X_VEC_H */
diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
index 1a77993471..4183dcdb52 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -176,6 +176,31 @@ static void vop128_2(S390Vector *v1, const S390Vector *v2, CPUS390XState *env,
     *v1 = tmp;
 }
 
+static float32 vcdg32(float32 a, float_status *s)
+{
+    return int32_to_float32(a, s);
+}
+
+static float32 vcdlg32(float32 a, float_status *s)
+{
+    return uint32_to_float32(a, s);
+}
+
+static float32 vcgd32(float32 a, float_status *s)
+{
+    const float32 tmp = float32_to_int32(a, s);
+
+    return float32_is_any_nan(a) ? INT32_MIN : tmp;
+}
+
+static float32 vclgd32(float32 a, float_status *s)
+{
+    const float32 tmp = float32_to_uint32(a, s);
+
+    return float32_is_any_nan(a) ? 0 : tmp;
+}
+
+
 static float64 vcdg64(float64 a, float_status *s)
 {
     return int64_to_float64(a, s);
@@ -211,6 +236,9 @@ void HELPER(gvec_##NAME##BITS)(void *v1, const void *v2, CPUS390XState *env,   \
     vop##BITS##_2(v1, v2, env, se, XxC, erm, FN, GETPC());                     \
 }
 
+#define DEF_GVEC_VOP2_32(NAME)                                                 \
+DEF_GVEC_VOP2_FN(NAME, NAME##32, 32)
+
 #define DEF_GVEC_VOP2_64(NAME)                                                 \
 DEF_GVEC_VOP2_FN(NAME, NAME##64, 64)
 
@@ -219,6 +247,11 @@ DEF_GVEC_VOP2_FN(NAME, float32_##OP, 32)                                       \
 DEF_GVEC_VOP2_FN(NAME, float64_##OP, 64)                                       \
 DEF_GVEC_VOP2_FN(NAME, float128_##OP, 128)
 
+DEF_GVEC_VOP2_32(vcdg)
+DEF_GVEC_VOP2_32(vcdlg)
+DEF_GVEC_VOP2_32(vcgd)
+DEF_GVEC_VOP2_32(vclgd)
+
 DEF_GVEC_VOP2_64(vcdg)
 DEF_GVEC_VOP2_64(vcdlg)
 DEF_GVEC_VOP2_64(vcgd)
diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..bc04005e10 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -212,3 +212,36 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         *(S390Vector *)v1 = tmp;
     }
 }
+
+
+void HELPER(vler)(CPUS390XState *env, void *v1, uint64_t addr, uint64_t es)
+{
+    uint64_t t0, t1;
+    t0 = cpu_ldq_data_ra(env, addr, GETPC());
+    addr = wrap_address(env, addr + 8);
+    t1 = cpu_ldq_data_ra(env, addr, GETPC());
+
+    if (MO_64 == es) {
+        s390_vec_write_element64(v1, 1, t0);
+        s390_vec_write_element64(v1, 0, t1);
+    } else {
+        S390Vector tmp = {};
+        s390_vec_write_element64(&tmp, 0, t0);
+        s390_vec_write_element64(&tmp, 1, t1);
+        s390_vec_reverse(v1, &tmp, (uint8_t)es);
+    }
+}
+
+
+void HELPER(vster)(CPUS390XState *env, void *v1, uint64_t addr, uint64_t es)
+{
+    S390Vector tmp = {};
+    /* Probe write access before actually modifying memory */
+    probe_write_access(env, addr, 16, GETPC());
+
+    s390_vec_reverse(&tmp, v1, (uint8_t)es);
+
+    cpu_stq_data_ra(env, addr, tmp.doubleword[0], GETPC());
+    addr = wrap_address(env, addr + 8);
+    cpu_stq_data_ra(env, addr, tmp.doubleword[1], GETPC());
+}
diff --git a/target/s390x/tcg/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
index 5561b3ed90..1823fd060d 100644
--- a/target/s390x/tcg/vec_int_helper.c
+++ b/target/s390x/tcg/vec_int_helper.c
@@ -540,18 +540,77 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint64_t count,
     s390_vec_shl(v1, v2, count);
 }
 
+
+void HELPER(gvec_vsl_ve2)(void *v1, const void *v2, const void *v3,
+                          uint32_t desc)
+{
+    uint8_t i, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i);
+
+        if (shift) {
+            v <<= shift;
+            if (i < 15) {
+                v |= extract8(s390_vec_read_element8(v2, i + 1),
+                              8 - shift, shift);
+            }
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 void HELPER(gvec_vsra)(void *v1, const void *v2, uint64_t count,
                        uint32_t desc)
 {
     s390_vec_sar(v1, v2, count);
 }
 
+void HELPER(gvec_vsra_ve2)(void *v1, const void *v2, const void *v3,
+                           uint32_t desc)
+{
+    int i;
+    uint8_t t, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i);
+        if (shift) {
+            t = i > 0 ? s390_vec_read_element8(v2, i - 1)
+                    : ((v & 0x80) ? ~0 : 0);
+            v = deposit8(v >> shift, 8 - shift, shift, t);
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 void HELPER(gvec_vsrl)(void *v1, const void *v2, uint64_t count,
                        uint32_t desc)
 {
     s390_vec_shr(v1, v2, count);
 }
 
+void HELPER(gvec_vsrl_ve2)(void *v1, const void *v2, const void *v3,
+                           uint32_t desc)
+{
+    int i;
+    uint8_t t, v;
+    S390Vector tmp = {};
+    for (i = 0; i < 16; i++) {
+        const uint8_t shift = s390_vec_read_element8(v3, i) & 7;
+        v = s390_vec_read_element8(v2, i) >> shift;
+        if (shift) {
+            t = (0 == i ? 0 : s390_vec_read_element8(v2, i - 1));
+            v = deposit8(v, 8 - shift, shift, t);
+        }
+        s390_vec_write_element8(&tmp, i, v);
+    }
+    *(S390Vector *)v1 = tmp;
+}
+
 #define DEF_VSCBI(BITS)                                                        \
 void HELPER(gvec_vscbi##BITS)(void *v1, const void *v2, const void *v3,        \
                               uint32_t desc)                                   \
diff --git a/target/s390x/tcg/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
index ac315eb095..22c14c6925 100644
--- a/target/s390x/tcg/vec_string_helper.c
+++ b/target/s390x/tcg/vec_string_helper.c
@@ -471,3 +471,68 @@ void HELPER(gvec_vstrc_cc_rt##BITS)(void *v1, const void *v2, const void *v3,  \
 DEF_VSTRC_CC_RT_HELPER(8)
 DEF_VSTRC_CC_RT_HELPER(16)
 DEF_VSTRC_CC_RT_HELPER(32)
+
+void HELPER(vstrs)(void *v1, const void *v2, const void *v3, void *v4,
+                   CPUS390XState *env, uint32_t desc) {
+    const bool zs = (desc >> 16);
+    const uint8_t es = desc & 16;
+    const uint8_t char_size = 1 << es;
+
+    uint32_t str_len = 0, eos = 0;
+    uint32_t i = 0, j = 0, k = 0, cc = 0;
+    uint32_t substr_len = ((uint8_t *)v4)[H1(7)] & 31;
+
+    for (i = 0; i < 16; i += char_size) {
+        if (0 == es && !((uint8_t  *)v3)[H1(i >> es)]) { break; }
+        if (1 == es && !((uint16_t *)v3)[H2(i >> es)]) { break; }
+        if (2 == es && !((uint32_t *)v3)[H4(i >> es)]) { break; }
+    }
+    if (i < substr_len) {
+        substr_len = i;
+    }
+    if (substr_len) {
+        if (zs) {
+            for (k = 0; k < 16; k += char_size) {
+                if (0 == es && !((uint8_t  *)v2)[H1(k >> es)]) { break; }
+                if (1 == es && !((uint16_t *)v2)[H2(k >> es)]) { break; }
+                if (2 == es && !((uint32_t *)v2)[H4(k >> es)]) { break; }
+            }
+            eos = (16 != k);
+            str_len = k;
+        } else {
+            str_len = 16;
+        }
+
+        for (k = 0; k < str_len; k += char_size) {
+            if (0 == es && ((uint8_t  *)v3)[H1(0)]
+                        == ((uint8_t  *)v2)[H1(k >> es)]) { break; }
+            if (1 == es && ((uint16_t *)v3)[H2(0)]
+                        == ((uint16_t *)v2)[H2(k >> es)]) { break; }
+            if (2 == es && ((uint32_t *)v3)[H4(0)]
+                        == ((uint32_t *)v2)[H4(k >> es)]) { break; }
+        }
+
+        if (k < 16 &&  (!eos || (k + substr_len) <= str_len)) {
+            if ((k + substr_len) <= 16) {
+                for (j = 0; j < substr_len; j += char_size) {
+                    if (0 == es && ((uint8_t  *)v3)[H1(j >> es)]
+                                != ((uint8_t  *)v2)[H1((k + j) >> es)]) { break; }
+                    if (1 == es && ((uint16_t *)v3)[H2(j >> es)]
+                                != ((uint16_t *)v2)[H2((k + j) >> es)]) { break; }
+                    if (2 == es && ((uint32_t *)v3)[H4(j >> es)]
+                                != ((uint32_t *)v2)[H4((k + j) >> es)]) { break; }
+                }
+            }
+            cc = (j == substr_len) ? 2 : 3;
+        } else {
+            cc = eos ? 1 : 0;
+            k = 16;
+        }
+    } else {
+        cc = 2;
+    }
+
+    ((uint64_t *)v1)[0] = ((uint64_t *)v1)[1] = 0;
+    ((uint8_t *)v1)[H1(7)] = k;
+    env->cc_op = cc;
+}
-- 
2.34.1


