Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C293906E5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:49:41 +0200 (CEST)
Received: from localhost ([::1]:58492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaFQ-0003BP-F5
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:49:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYjf-0007mK-Bj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:12:47 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:52761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYjc-0001gR-O8
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:12:47 -0400
Received: by mail-wm1-f47.google.com with SMTP id z130so16951677wmg.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+CM+nYf1OxCGXxc9qQjgXmkHVCB0vReuGQbH7Pt5wZk=;
 b=K4eP/jrjrq3QQRnTEtu3x9R0sBmlxHGDOxoEOHEgNmdIc6yt50AwAl3M1U8gqzkH3M
 hmXfU5JBo+TPKhPgzKJlX3hPtvMlHM06lFLeKEJShzPEK5LwBJYtpDHgJJkywaEdujOD
 RH0Gq5gufDW46y78+bBLXdSa07jq6/68HBOpjSY4m8srUtX46TPRtHuHun11cSZRkYzX
 EOnrTnpdZIpbyy5rAMag5dSmK/wHGw83yDSkdl1qldR8RxIC9oGhXTKCIcxVDoCWVHnq
 AL2eDNiRPu0S82cM7a1RhT0Vv4sYllY1tGlpVnfVH6nn89qiD7K9W1uA4/powSiQWzs2
 Zzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CM+nYf1OxCGXxc9qQjgXmkHVCB0vReuGQbH7Pt5wZk=;
 b=rc3fR7VcZXbUjr1f7810ftL4O+25z8G3zacOeU9O3UmzFw43pFRz1P1GS77831Bu2w
 aSRtfRiHjmRK/qxQqARXAj/sG4s0QNkkcwbee2P/XgwADW17buDXKbXxwLt2ml7t/lCm
 tjSSx0JX7Jy3eYHG3FdhJtMZSgIdLbsA0aUaxCkeEr8pz9cR/ZAXY1Ld9yCGbZ36cjol
 ON1o5ERFFBikHk8j02ENQnS0PyLBVXaAUAHAgj8hSdJPuRtdPL5j+s2sY8UfxuNsmhOO
 X+7/165KmK4rKEzvN7wG/RnrPaSv9+GfJI+ksJpnymyG/3xc5Y6WBqkeZIvL3LNmuweH
 qPJA==
X-Gm-Message-State: AOAM532nGIPqI453+EVAi0zGcfQ5JGL4pl8Xe5TZYNQnktc93voxgaZG
 azbL9+K4KH9dokPgv/sOPxIo0NS+HoESF4JI
X-Google-Smtp-Source: ABdhPJxJxrCYFP+a77F85hSUHR41moTSEpnInziOD6miyUFBQal4ccMrq5zSdj00IaaUkFzutI51mw==
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr4292556wmq.63.1621955262995; 
 Tue, 25 May 2021 08:07:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 098/114] target/arm: Share table of sve load functions
Date: Tue, 25 May 2021 16:07:20 +0100
Message-Id: <20210525150736.32695-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.47;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-f47.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The table used by do_ldrq is a subset of the table used by do_ld_zpa;
we can share them by passing dtype instead of msz to do_ldrq.

The lack of MTE handling in do_ldrq was a bug, fixed by this change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-77-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 254 ++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 128 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ea51a73d36..54c50349aba 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5215,128 +5215,130 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     tcg_temp_free_i32(t_desc);
 }
 
+/* Indexed by [mte][be][dtype][nreg] */
+static gen_helper_gvec_mem * const ldr_fns[2][2][16][4] = {
+    { /* mte inactive, little-endian */
+      { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+          gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+        { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
+          gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
+        { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
+          gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
+        { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
+          gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
+
+      /* mte inactive, big-endian */
+      { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
+          gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
+        { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
+          gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
+        { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
+          gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
+        { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
+          gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
+
+    { /* mte active, little-endian */
+      { { gen_helper_sve_ld1bb_r_mte,
+          gen_helper_sve_ld2bb_r_mte,
+          gen_helper_sve_ld3bb_r_mte,
+          gen_helper_sve_ld4bb_r_mte },
+        { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_le_r_mte,
+          gen_helper_sve_ld2hh_le_r_mte,
+          gen_helper_sve_ld3hh_le_r_mte,
+          gen_helper_sve_ld4hh_le_r_mte },
+        { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_le_r_mte,
+          gen_helper_sve_ld2ss_le_r_mte,
+          gen_helper_sve_ld3ss_le_r_mte,
+          gen_helper_sve_ld4ss_le_r_mte },
+        { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_le_r_mte,
+          gen_helper_sve_ld2dd_le_r_mte,
+          gen_helper_sve_ld3dd_le_r_mte,
+          gen_helper_sve_ld4dd_le_r_mte } },
+
+      /* mte active, big-endian */
+      { { gen_helper_sve_ld1bb_r_mte,
+          gen_helper_sve_ld2bb_r_mte,
+          gen_helper_sve_ld3bb_r_mte,
+          gen_helper_sve_ld4bb_r_mte },
+        { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hh_be_r_mte,
+          gen_helper_sve_ld2hh_be_r_mte,
+          gen_helper_sve_ld3hh_be_r_mte,
+          gen_helper_sve_ld4hh_be_r_mte },
+        { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1ss_be_r_mte,
+          gen_helper_sve_ld2ss_be_r_mte,
+          gen_helper_sve_ld3ss_be_r_mte,
+          gen_helper_sve_ld4ss_be_r_mte },
+        { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
+
+        { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
+        { gen_helper_sve_ld1dd_be_r_mte,
+          gen_helper_sve_ld2dd_be_r_mte,
+          gen_helper_sve_ld3dd_be_r_mte,
+          gen_helper_sve_ld4dd_be_r_mte } } },
+};
+
 static void do_ld_zpa(DisasContext *s, int zt, int pg,
                       TCGv_i64 addr, int dtype, int nreg)
 {
-    static gen_helper_gvec_mem * const fns[2][2][16][4] = {
-        { /* mte inactive, little-endian */
-          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-            gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_le_r, gen_helper_sve_ld2hh_le_r,
-              gen_helper_sve_ld3hh_le_r, gen_helper_sve_ld4hh_le_r },
-            { gen_helper_sve_ld1hsu_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_le_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_le_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld2ss_le_r,
-              gen_helper_sve_ld3ss_le_r, gen_helper_sve_ld4ss_le_r },
-            { gen_helper_sve_ld1sdu_le_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_le_r, gen_helper_sve_ld2dd_le_r,
-              gen_helper_sve_ld3dd_le_r, gen_helper_sve_ld4dd_le_r } },
-
-          /* mte inactive, big-endian */
-          { { gen_helper_sve_ld1bb_r, gen_helper_sve_ld2bb_r,
-              gen_helper_sve_ld3bb_r, gen_helper_sve_ld4bb_r },
-            { gen_helper_sve_ld1bhu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_be_r, gen_helper_sve_ld2hh_be_r,
-              gen_helper_sve_ld3hh_be_r, gen_helper_sve_ld4hh_be_r },
-            { gen_helper_sve_ld1hsu_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_be_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_be_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld2ss_be_r,
-              gen_helper_sve_ld3ss_be_r, gen_helper_sve_ld4ss_be_r },
-            { gen_helper_sve_ld1sdu_be_r, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_be_r, gen_helper_sve_ld2dd_be_r,
-              gen_helper_sve_ld3dd_be_r, gen_helper_sve_ld4dd_be_r } } },
-
-        { /* mte active, little-endian */
-          { { gen_helper_sve_ld1bb_r_mte,
-              gen_helper_sve_ld2bb_r_mte,
-              gen_helper_sve_ld3bb_r_mte,
-              gen_helper_sve_ld4bb_r_mte },
-            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_le_r_mte,
-              gen_helper_sve_ld2hh_le_r_mte,
-              gen_helper_sve_ld3hh_le_r_mte,
-              gen_helper_sve_ld4hh_le_r_mte },
-            { gen_helper_sve_ld1hsu_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_le_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_le_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_le_r_mte,
-              gen_helper_sve_ld2ss_le_r_mte,
-              gen_helper_sve_ld3ss_le_r_mte,
-              gen_helper_sve_ld4ss_le_r_mte },
-            { gen_helper_sve_ld1sdu_le_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_le_r_mte,
-              gen_helper_sve_ld2dd_le_r_mte,
-              gen_helper_sve_ld3dd_le_r_mte,
-              gen_helper_sve_ld4dd_le_r_mte } },
-
-          /* mte active, big-endian */
-          { { gen_helper_sve_ld1bb_r_mte,
-              gen_helper_sve_ld2bb_r_mte,
-              gen_helper_sve_ld3bb_r_mte,
-              gen_helper_sve_ld4bb_r_mte },
-            { gen_helper_sve_ld1bhu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bsu_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bdu_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1sds_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hh_be_r_mte,
-              gen_helper_sve_ld2hh_be_r_mte,
-              gen_helper_sve_ld3hh_be_r_mte,
-              gen_helper_sve_ld4hh_be_r_mte },
-            { gen_helper_sve_ld1hsu_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hdu_be_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1hds_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1hss_be_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1ss_be_r_mte,
-              gen_helper_sve_ld2ss_be_r_mte,
-              gen_helper_sve_ld3ss_be_r_mte,
-              gen_helper_sve_ld4ss_be_r_mte },
-            { gen_helper_sve_ld1sdu_be_r_mte, NULL, NULL, NULL },
-
-            { gen_helper_sve_ld1bds_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bss_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1bhs_r_mte, NULL, NULL, NULL },
-            { gen_helper_sve_ld1dd_be_r_mte,
-              gen_helper_sve_ld2dd_be_r_mte,
-              gen_helper_sve_ld3dd_be_r_mte,
-              gen_helper_sve_ld4dd_be_r_mte } } },
-    };
     gen_helper_gvec_mem *fn
-        = fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][nreg];
 
     /*
      * While there are holes in the table, they are not
@@ -5574,14 +5576,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
     return true;
 }
 
-static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
+static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 {
-    static gen_helper_gvec_mem * const fns[2][4] = {
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_le_r,
-          gen_helper_sve_ld1ss_le_r, gen_helper_sve_ld1dd_le_r },
-        { gen_helper_sve_ld1bb_r,    gen_helper_sve_ld1hh_be_r,
-          gen_helper_sve_ld1ss_be_r, gen_helper_sve_ld1dd_be_r },
-    };
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
     TCGv_i32 t_desc;
@@ -5613,7 +5609,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     t_pg = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_pg, cpu_env, poff);
 
-    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
 
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_i32(t_desc);
@@ -5635,7 +5633,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_ldrq(s, a->rd, a->pg, addr, msz);
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
@@ -5645,7 +5643,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
-        do_ldrq(s, a->rd, a->pg, addr, dtype_msz(a->dtype));
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
-- 
2.20.1


