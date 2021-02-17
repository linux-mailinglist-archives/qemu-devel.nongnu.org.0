Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8F31E35E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:03:51 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWnN-0002j8-2u
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS3-0001BE-JA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:50 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRu-0004tP-Rt
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:47 -0500
Received: by mail-pl1-x62a.google.com with SMTP id e9so213460plh.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBwUcmkwQvfre4JuFgSFF6OMjobUWB5hLAO/aWmrkOE=;
 b=jruEYfhCBbeooGWlbHuP/OBob2Utdsrxijbulg2ZU/SlQHTLdTzrK754SFv52pNnbO
 evn7AlwPybLcRfOQXlwCiiRVRFWBJ56+BaRTVA3QPBRAkwIrswlSEkyYY1D75aquBykP
 mdVw2AwLtFly+D3Jx9Z4wN+5PL3qyrdHQPW7kvSIn9la8hD58HfOnObysRZHgk9fwjkO
 9JwpfenxPky7VHW/qx/AXPpxVGAgOID9vASW+5xWC2zR3EEF6Bq9azVq3rzrJp8hsnvo
 NWWZe+OCmfshRaaSysZhcBouNsx8inVmCi4Fr6G+U5w/st+F9xpld1WWBP+ZKKytvmTC
 FKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBwUcmkwQvfre4JuFgSFF6OMjobUWB5hLAO/aWmrkOE=;
 b=CNKgU5joi+eNstEffRgkIndSUWzr1xxFpThVoABgMtXDi3hEFfN6XR/X41t8+w4qAP
 kh7/ZOo3z58ny/y3QiEN5zPDBIlmxR9DuctmycnT4zgN8n6FtdMpS5d7UB/cSJVgKS1L
 ccM86J9lcaFB/4vmpNqus7/Sb+8g0RaIZphrWbkBBCyEpKRtmTpVbTNrvJ1/sUU0Sc/b
 gc/aSbB/eRBlqcSP6Pk5L6ELrz4hX5EPeni/mWlIZI4YqM9d3EKhLbD6mHZ6JW4zTrN/
 s2DKUfrcJNPcw5xd5tMBzRwzyE7AUU6O0khNw4KEBVAxVUOXm5VlL2Jh81BJ9YaK8IVH
 Rp+w==
X-Gm-Message-State: AOAM531KgQqeYUJH1exBHKMyz1j0+3iWVZaXoffCkRqEMpyOcBitnLFu
 l35nmspcbgw/dhnuxKmRGyJSNfHeXke2Aw==
X-Google-Smtp-Source: ABdhPJyRcDwXNy9hvJn7L7vyybvk9OGOWL0lhwFtcrptNVq55PaPqviotyvptdEmzVedeDLNyv6W2g==
X-Received: by 2002:a17:90b:4d07:: with SMTP id
 mw7mr1204212pjb.172.1613605293070; 
 Wed, 17 Feb 2021 15:41:33 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/35] Hexagon (target/hexagon) TCG for floating point
 instructions
Date: Wed, 17 Feb 2021 15:40:17 -0800
Message-Id: <20210217234023.1742406-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

The imported code uses host floating point.  We override them
to use qemu softfloat

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-29-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h | 121 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
index a8d9321b42..e044deaff2 100644
--- a/target/hexagon/gen_tcg.h
+++ b/target/hexagon/gen_tcg.h
@@ -195,4 +195,125 @@
 #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
     do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
 
+/* Floating point */
+#define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
+    gen_helper_conv_sf2df(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_df2sf(SHORTCODE) \
+    gen_helper_conv_df2sf(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_uw2sf(SHORTCODE) \
+    gen_helper_conv_uw2sf(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_uw2df(SHORTCODE) \
+    gen_helper_conv_uw2df(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_w2sf(SHORTCODE) \
+    gen_helper_conv_w2sf(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_w2df(SHORTCODE) \
+    gen_helper_conv_w2df(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_ud2sf(SHORTCODE) \
+    gen_helper_conv_ud2sf(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_ud2df(SHORTCODE) \
+    gen_helper_conv_ud2df(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_d2sf(SHORTCODE) \
+    gen_helper_conv_d2sf(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_d2df(SHORTCODE) \
+    gen_helper_conv_d2df(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_sf2uw(SHORTCODE) \
+    gen_helper_conv_sf2uw(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2w(SHORTCODE) \
+    gen_helper_conv_sf2w(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2ud(SHORTCODE) \
+    gen_helper_conv_sf2ud(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2d(SHORTCODE) \
+    gen_helper_conv_sf2d(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_df2uw(SHORTCODE) \
+    gen_helper_conv_df2uw(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2w(SHORTCODE) \
+    gen_helper_conv_df2w(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2ud(SHORTCODE) \
+    gen_helper_conv_df2ud(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2d(SHORTCODE) \
+    gen_helper_conv_df2d(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_sf2uw_chop(SHORTCODE) \
+    gen_helper_conv_sf2uw_chop(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2w_chop(SHORTCODE) \
+    gen_helper_conv_sf2w_chop(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2ud_chop(SHORTCODE) \
+    gen_helper_conv_sf2ud_chop(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_sf2d_chop(SHORTCODE) \
+    gen_helper_conv_sf2d_chop(RddV, cpu_env, RsV)
+#define fGEN_TCG_F2_conv_df2uw_chop(SHORTCODE) \
+    gen_helper_conv_df2uw_chop(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2w_chop(SHORTCODE) \
+    gen_helper_conv_df2w_chop(RdV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2ud_chop(SHORTCODE) \
+    gen_helper_conv_df2ud_chop(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_conv_df2d_chop(SHORTCODE) \
+    gen_helper_conv_df2d_chop(RddV, cpu_env, RssV)
+#define fGEN_TCG_F2_sfadd(SHORTCODE) \
+    gen_helper_sfadd(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfsub(SHORTCODE) \
+    gen_helper_sfsub(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfcmpeq(SHORTCODE) \
+    gen_helper_sfcmpeq(PdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfcmpgt(SHORTCODE) \
+    gen_helper_sfcmpgt(PdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfcmpge(SHORTCODE) \
+    gen_helper_sfcmpge(PdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfcmpuo(SHORTCODE) \
+    gen_helper_sfcmpuo(PdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfmax(SHORTCODE) \
+    gen_helper_sfmax(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfmin(SHORTCODE) \
+    gen_helper_sfmin(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sfclass(SHORTCODE) \
+    do { \
+        TCGv imm = tcg_const_tl(uiV); \
+        gen_helper_sfclass(PdV, cpu_env, RsV, imm); \
+        tcg_temp_free(imm); \
+    } while (0)
+#define fGEN_TCG_F2_sffixupn(SHORTCODE) \
+    gen_helper_sffixupn(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sffixupd(SHORTCODE) \
+    gen_helper_sffixupd(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sffixupr(SHORTCODE) \
+    gen_helper_sffixupr(RdV, cpu_env, RsV)
+#define fGEN_TCG_F2_dfadd(SHORTCODE) \
+    gen_helper_dfadd(RddV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfsub(SHORTCODE) \
+    gen_helper_dfsub(RddV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfmax(SHORTCODE) \
+    gen_helper_dfmax(RddV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfmin(SHORTCODE) \
+    gen_helper_dfmin(RddV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfcmpeq(SHORTCODE) \
+    gen_helper_dfcmpeq(PdV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfcmpgt(SHORTCODE) \
+    gen_helper_dfcmpgt(PdV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfcmpge(SHORTCODE) \
+    gen_helper_dfcmpge(PdV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfcmpuo(SHORTCODE) \
+    gen_helper_dfcmpuo(PdV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfclass(SHORTCODE) \
+    do { \
+        TCGv imm = tcg_const_tl(uiV); \
+        gen_helper_dfclass(PdV, cpu_env, RssV, imm); \
+        tcg_temp_free(imm); \
+    } while (0)
+#define fGEN_TCG_F2_sfmpy(SHORTCODE) \
+    gen_helper_sfmpy(RdV, cpu_env, RsV, RtV)
+#define fGEN_TCG_F2_sffma(SHORTCODE) \
+    gen_helper_sffma(RxV, cpu_env, RxV, RsV, RtV)
+#define fGEN_TCG_F2_sffma_sc(SHORTCODE) \
+    gen_helper_sffma_sc(RxV, cpu_env, RxV, RsV, RtV, PuV)
+#define fGEN_TCG_F2_sffms(SHORTCODE) \
+    gen_helper_sffms(RxV, cpu_env, RxV, RsV, RtV)
+#define fGEN_TCG_F2_sffma_lib(SHORTCODE) \
+    gen_helper_sffma_lib(RxV, cpu_env, RxV, RsV, RtV)
+#define fGEN_TCG_F2_sffms_lib(SHORTCODE) \
+    gen_helper_sffms_lib(RxV, cpu_env, RxV, RsV, RtV)
+
+#define fGEN_TCG_F2_dfmpyfix(SHORTCODE) \
+    gen_helper_dfmpyfix(RddV, cpu_env, RssV, RttV)
+#define fGEN_TCG_F2_dfmpyhh(SHORTCODE) \
+    gen_helper_dfmpyhh(RxxV, cpu_env, RxxV, RssV, RttV)
+
 #endif
-- 
2.25.1


