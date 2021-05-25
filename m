Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D21390608
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:58:55 +0200 (CEST)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZSI-0002fW-Fg
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbw-0004F3-Un
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbp-0004m1-Fz
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:48 -0400
Received: by mail-wr1-x436.google.com with SMTP id n4so6683351wrw.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FRc0lOSxHV/qeYNQj46tysxqDsPmdv7fzb6jEQXATOM=;
 b=Gn4qoxs6i+jy3E1rpEEi3MPAZG2GUEMEkKYKwwVRvBzSoyZNrkw68eLwb8Y2n+DJij
 UPOnfh8kYe/xqn8i24gL0+I5AGFAinyPd2mowCAl1+r0RSPiM6LVsypuPOgEfVoSCufk
 hsfGgXNrXoUQ9oZoiTPlBHUeq6304J3ugX6Sz/7qYHDQKDP2VuuX5YOQtsSvElQ3AMVf
 IIUwl5WVHOo6ceiz3bofSbLuiefebh1VOKdjSGtoY8C/AVSIaQcUErymxs4S9yrYPyv2
 4eGhgI4kglCTngTxKY4DSMLK6mzt3gTOj/f0yZ1Ixp2i4wtdOxEWi8GsDuCB/iVPJJhR
 1feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FRc0lOSxHV/qeYNQj46tysxqDsPmdv7fzb6jEQXATOM=;
 b=I6kPfExNiWjQfYch5TF0u0pUVKgTPy65WbmA71IgmltDQyT1jXeEYLyjD3J9pCTm6w
 ha5Lz6IGSF6hg5tJS0ayzxmGpyF2tGIyT+GCGWnXlaLe3KeLnFfZgekFgA8pj0GQQMp/
 RPAZVtG6ypzm+opxelJE1jcL7JcnscQLaGKyb2rg7xcr8jTklq756UOH7BXVwvIA1Cc1
 BJ1qCFqC1yetTA3DrO9kqZUCYa4HoDvVdJJK7akQCDSzGQ943ikrmlmSzCWZVlyxVUj3
 3YgjPvDdSqlxFOrSVuH9YOTs7XF/AG5sCT1TJq/WEs3b1oeXTcAbfTgs30o+tsxUTuhA
 OmmQ==
X-Gm-Message-State: AOAM533GnYoYt/g5mlcVnxVHzvVuvIyS1crkIb+qPvua2lXaprtz9K0k
 brHCahRjJWBQf5PuocYkI4ZxueY+LnEsqBT6
X-Google-Smtp-Source: ABdhPJwpIX52ElTxUzR9n2Rb9KixDCNK7kCC1nWPK4jWZNGjplVWqZdQZ5RZnZyPR93w8o958wtO1Q==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr28041921wrn.368.1621955080184; 
 Tue, 25 May 2021 08:04:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 076/114] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Tue, 25 May 2021 16:02:46 +0100
Message-Id: <20210525150324.32370-77-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-55-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a22067..9bfaf737b7f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dbab067a53e..39a6839de41 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,37 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
+                              int data, gen_helper_gvec_4 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra, a->index, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.20.1


