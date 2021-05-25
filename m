Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5638F7C6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:57:27 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMJs-0004k2-PQ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYd-0001H9-95
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXv-0004AS-Pu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id s4so13951620plg.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5FmN3ljyVtwKizj7nbiiY/9sTfclXpJZqQxvrlA2g1E=;
 b=nZKK77L2IkMofhLcj9FoT/KCWJW6GW83HrwvjTBFlRXGVWJ3fwT4JV3uMmxaQCrkPl
 giSOvMnplUYleJJXGxVHoBx2jfhwUw1om6SyFeGW69EDYuIoVzwGp2Hifw/8mGSkvGkE
 r9986kpzSFaY7FO4DOPipxhf4lKdwi54cZXMQGCGkJMdTT/jFTCPXUJBrogajdr7hiEw
 ujbUCSPo/xF/Va53VwHsX9IL4nJ3qn299p2fumVHsE5pVeBpMZB99NK5os956Ced4U2i
 REzTpal0fVVWrZDFWfBxxC/A/8MXzQ4KUAlxPwPzPuMqiQQ+XGj1b/kUB/G0ZpPtv+GN
 Bq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5FmN3ljyVtwKizj7nbiiY/9sTfclXpJZqQxvrlA2g1E=;
 b=FMu+1agGk5+plovE92iBOzy9C+Jr30thy09cGb7/YlkTnWPJT3I0NCTZveivA5HfRl
 I5CiRIgx6PSRitg6YTnO5ZBEwow8xaNQlATAFMoZXAi1BnUkIjHQr2HECverUQ15Pa5y
 7p4GJdKvEE79p+lau9PrEJzy71Aq9DHjkekikZBU+sfK9/rvgyfCF1RA0K/IDm7rMxGb
 lVA/y3f7RWAgHDO4plBxIxcUSIuiwRbt8MTwBWQJbcchzqpThgeTMCVRerp1K8Vi7NXM
 9717bildiX81Jp2UbaWaVobRR/Wfpl1eafwEdaLGWztgR2lHeOw//A53f/vR6y9Y5jEk
 q39A==
X-Gm-Message-State: AOAM530nA9254OiIxbT/nWfP2yVPpc3pcdWBNpM3BoAYcfKfI/0KlOa+
 qK+dUjvwvjED1sOglypmr4dSylv7/FsQRQ==
X-Google-Smtp-Source: ABdhPJwb4jCqh4IrjuX1sdynqSR+knpQA3CUYNYtypi89PGVTWHEhxcJAWeiRPF/jCKvKleE7IVzOw==
X-Received: by 2002:a17:902:c407:b029:f8:c1e2:e0bf with SMTP id
 k7-20020a170902c407b02900f8c1e2e0bfmr12541074plk.69.1621904866245; 
 Mon, 24 May 2021 18:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 76/92] target/arm: Share table of sve load functions
Date: Mon, 24 May 2021 18:03:42 -0700
Message-Id: <20210525010358.152808-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

The table used by do_ldrq is a subset of the table used by do_ld_zpa;
we can share them by passing dtype instead of msz to do_ldrq.

The lack of MTE handling in do_ldrq was a bug, fixed by this change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 254 ++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 128 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3ea51a73d3..54c50349ab 100644
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
2.25.1


