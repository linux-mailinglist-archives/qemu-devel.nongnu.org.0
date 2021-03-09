Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA052332E2E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:23:54 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJh1N-0002uV-KU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:23:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf8K-0000iL-0n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:58 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf80-0002sG-AY
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:22:55 -0500
Received: by mail-oi1-x22c.google.com with SMTP id f3so15498550oiw.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WetfNKkPM8tDPE/v/V+6AUBIG8HNbSZnOY/2KKUmIqc=;
 b=r+bvgRzPSnmJDuzanddzlCEXYYGsvou9+tHRdSSOxsa6kqaZGpsOk8i6L8iulFZrks
 n9MOjvwqVaJ85pHiHSDNVVbeV6znA7viSPRdGI4sduRFgjlMVuRs2ZxNUP9WFtel2uuP
 k1LHR+rmVIAJK4z+0BWDd4pYWqvAvmRBH8OMjctI9mvlULNbh5+BKCjFAgKiQ6A4BD4E
 Nx1lZZC7sUQ92gH/fsFe9mCCJqViknla8JZ1RVuOT5TIbyr7oQFKRZQCvsz4TO2LnFVC
 Yzq0Pue4qoP1/PgiTNKMp+oFVuo9yWEgMZShmwnNuxo6pGNnEgy3isRM8fm3VDAcoQjH
 sCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WetfNKkPM8tDPE/v/V+6AUBIG8HNbSZnOY/2KKUmIqc=;
 b=AgGg9YukoZUUEj7r7fM1BsgCJOIst3ygYQFfGKGPKsaa2uSe9bP9d7HfQKoDQc+hjT
 shNYl3Ky363tYSAj6xqChgz6EZ3eGv0xjkZwNCuUW9dPc/nIb5Zc3k3/8q/a9Eq6psw0
 o4vcXJs3zfTuEZOU9L+BPpkFtbRmwSS4hZMKQ882y0F+RcgqiIiXglhLCXhxJL3H9fJB
 7QXidVIJSVTW13M/naj75OwBpZbhiPMTlBwqX9Rex6mkc7JOQWdzg94l/twbeqPU6L6l
 txl13UfVgCuQCvEQNBN3LUgaN3euzKRhRoDVz4fxzLjiu8cYpAm4KT8Ar5ZmKkkoniEB
 Yhhw==
X-Gm-Message-State: AOAM530c8HCVv/4Z27lCs+sVSvVC3LXZXnGUw0rL+ixueYgMcMpTNtoe
 k7LfP/lB2gcj//a3B5c3CQt2fv+J9fW8wGiQ
X-Google-Smtp-Source: ABdhPJzUl87lzGuXoGPWGOGOfkJjtM07dAdW4VA8fFd0NnqyzHd0t7wvSX7VUad9KzcMB7PbNSRu/w==
X-Received: by 2002:aca:ea83:: with SMTP id i125mr3553595oih.18.1615306955398; 
 Tue, 09 Mar 2021 08:22:35 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:22:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 72/78] target/arm: Share table of sve load functions
Date: Tue,  9 Mar 2021 08:20:35 -0800
Message-Id: <20210309162041.23124-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The table used by do_ldrq is a subset of the table used by do_ld_zpa;
we can share them by passing dtype instead of msz to do_ldrq.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 254 ++++++++++++++++++-------------------
 1 file changed, 126 insertions(+), 128 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d7c3ad047f..130abea7a5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5204,128 +5204,130 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
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
@@ -5563,14 +5565,8 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
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
@@ -5602,7 +5598,9 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int msz)
     t_pg = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(t_pg, cpu_env, poff);
 
-    fns[s->be_data == MO_BE][msz](cpu_env, t_pg, addr, t_desc);
+    gen_helper_gvec_mem *fn
+        = ldr_fns[s->mte_active[0]][s->be_data == MO_BE][dtype][0];
+    fn(cpu_env, t_pg, addr, t_desc);
 
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_i32(t_desc);
@@ -5624,7 +5622,7 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), msz);
         tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
-        do_ldrq(s, a->rd, a->pg, addr, msz);
+        do_ldrq(s, a->rd, a->pg, addr, a->dtype);
     }
     return true;
 }
@@ -5634,7 +5632,7 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
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


