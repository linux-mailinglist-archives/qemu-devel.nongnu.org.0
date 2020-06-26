Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B5820B4CE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:39:01 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqRQ-00034d-8I
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4d-0003Dj-WE
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:28 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq4c-0006iN-2k
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:15:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id f139so9706871wmf.5
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qPzOdwE4cv3nwdVXN9HVPQEkRI8ozq0YCJ+N3H/cuSI=;
 b=fGAtze8jPQOzSUf6uxc/9ud7o7AxRSYNxvZii2QZ1VKwRibji3rFB3PY8feC+uzjly
 j/ic5LfU/I9uTCDZ55Aga5XgFaLIz7DgeCuRKzqnOWlaXDA9wygdMmaoWwHjvhzHJEug
 ZJQuECdw0Qm0Sn2Dj1IN6HIp5K2b1ofBDyPUMVK/qJNThy0bhf3CLAgg8cDexPgqFuk2
 Ukwa5EFXrgT/UeruddrU5OngPr+bwj29BuKdTwCdat/h5/KVlhR8WXMgln10BYiecagK
 87Zp50UYomeLKe9/uOCEMpbVKZlrDcR7oWJ0N3EfaGlyDGyWEM9EQ9ONjRx4HSKQAtUf
 tbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPzOdwE4cv3nwdVXN9HVPQEkRI8ozq0YCJ+N3H/cuSI=;
 b=GkBR3+dlDr6ct+JcCd5aooh2k+r/6KsJmj+7JpK3/K+8uE0v/foL/hkiP2PXk11APF
 rshZfGI/pGOVb2WFCSNHgUGMm1+Ox1jDHOGNwiNQ+zFQOcpwQmufiy+3y/3jo7DjFB+Z
 iliANOgYjXi92xE+e+c/3FK+Oj2eSWuT2WdIp5T5XuHVe4t2IMqnqWujy7RXcfaRJFwk
 ODubopBEU1MPm3Wd+jGK55E1ZG2eP1XTFq4HkA4cegWzPBsdi0YpaKBpm/lrf4j8/Jt3
 9t1MdcfPf9nvFTcB6MXc18Rre4WM1rsfY9x1NiXhPAL2CG95WwG+LJo0v2wMoghpS0pR
 RWRQ==
X-Gm-Message-State: AOAM5335VVWiEk7aEiIG62bsXrrzYAPzoVxCpJRB/RU50WZ2FuHCD9Wc
 PUYlnW1705bqQsI4ljmLvUvPwP3BZuHyKw==
X-Google-Smtp-Source: ABdhPJzFnkQRABOZt+RdsU+IubbHIykb4ACR//AvArx5uzSQxrcvTSX2begQj2yNVthzMYUlniD3YQ==
X-Received: by 2002:a1c:2d83:: with SMTP id t125mr4029737wmt.187.1593184523784; 
 Fri, 26 Jun 2020 08:15:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.15.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:15:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/57] target/arm: Handle TBI for sve scalar + int memory ops
Date: Fri, 26 Jun 2020 16:14:15 +0100
Message-Id: <20200626151424.30117-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

We still need to handle tbi for user-only when mte is inactive.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-37-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h | 1 +
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 781c4413999..49e4865918d 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,7 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7a3774bfda7..e46c4a49e00 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -215,7 +215,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * of the write-back address.
  */
 
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e4fbe484930..04eda9a1264 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4587,9 +4587,8 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
      * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
-     * TODO: mte_n check here while callers are updated.
      */
-    if (mte_n && s->mte_active[0]) {
+    if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
@@ -4599,7 +4598,10 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
         desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
         desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
     }
+
     desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
-- 
2.20.1


