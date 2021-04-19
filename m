Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60030364BE8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:47:11 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYanW-0007NM-F0
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQm-0007kS-41
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:40 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:35378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQj-0002gR-E6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:39 -0400
Received: by mail-qk1-x734.google.com with SMTP id h13so18507933qka.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=QlWb2VXDM3mNobkMRUQa5D/bLNODCJp3ZWa8T0QbIgrlvjSPt6wEKS7MzyNeUmQl5L
 DBzG1kdDFl8v/rnMPSz1DXTIMM375cAOJQiAI39z5tzRhglAE+S699S4ePJdRexw6Y2P
 2v9KhYqzcS8P1bupwgJHuctMUgCquw/6PoVebXOML3m2L2BBXKgGYZjAUz3NKKNLfbmx
 9WYNGMSDZGZD+o0eUQgbeCDddd6Fs5Mn82+6UbDQl5r/dady4KPRTOBoFNxAV5+3pNWJ
 kOVyRONCHtLwuvapWoSqs5vX5nehx2dplZc+wSh+a3Y6UQJfucwkbJAHlhYrbEuNXIXS
 fsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=jcRWBbABJHBAP4LmZ3gf2RrPt7t5J5R+YQ/1ysIxRFZsWPBAsbm/WBCfL0RScBT1yN
 JOHZYsSAlTOdCEbBJ62YrQgDidptuzxLvK6FMp0wn6xCqZgQP7X2spRp8nT/MfQ46h3i
 VZzuRKD5jFXsihjPp1Fd8/6GIBSZwvpsZMGaKrc3u8RvIgqSDMl+5cA/cgl8nm722nfs
 nHshNTEOJa1W1sE8GHZ4FvgqqzSh7bZ52ExJfXO0lNaWDn3w7rWO5c2lXOwMDSe48WfR
 H/Wx8LOG68j8IUCD+Xdzc781HLzlZMqCanHj29zdZcsTtMxcx67qrQHQ2qawx0WedMka
 aWyQ==
X-Gm-Message-State: AOAM532Izz92viMWX/lWaWKqW+VXUbFlBntECZm+dYcKCXSK7FqVcqOt
 6eCEKBD12c1rJqyESE7tkDIel3NChOI4Htuo
X-Google-Smtp-Source: ABdhPJxWbQjci5Clb9O4+TI3oKKAlJKRbBnDoJP85McDmjdjpUuovpliQ3O/FLYdyEWsqbmARmoe9Q==
X-Received: by 2002:a05:620a:386:: with SMTP id
 q6mr1949054qkm.438.1618863816539; 
 Mon, 19 Apr 2021 13:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/31] target/arm: Enforce alignment for VLDM/VSTM
Date: Mon, 19 Apr 2021 13:22:46 -0700
Message-Id: <20210419202257.161730-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c..f50afb23e7 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1503,12 +1503,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1586,12 +1586,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1


