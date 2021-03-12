Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26A338F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:04:09 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiOe-0000PZ-Qo
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD0-0002ti-4B
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCo-0001yB-UP
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id g8so3857031wmd.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wzLeGiuFW25/XaCiTTKOHDdt72oG68pXNfdjYn1zKoQ=;
 b=iSFVQuzohNM7N3UE+/vR4pi/TzByHLvjrrarJ1p7Cs69HCAKRZFrzcmdbxrcjDn4NL
 z2MDZfWzTYP6s/ttSnZg/86oaTeIm8YcLSV/l20OqEEQHikTfHb6wsrNz3DtyCO1VLJr
 7wcl3BwACdr2m3BqdYBmoUI5TAxIwyjBys0VHGBGanMI3w60dKmeHRMPsChuyzfxNMRm
 IkT7WrWzPtNFhT+G2aI+Wzco2UbC5TBpMwDjoL1SgFj5VS6heIBh7An++fetbCb4qo6A
 J9o5/jAkK7BO9Z/hiNSrezhk3taOtlzpNuwN/qf749blgVu3cxjFUSGBp5Cx9O9xL0fj
 c0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wzLeGiuFW25/XaCiTTKOHDdt72oG68pXNfdjYn1zKoQ=;
 b=UGuki6mLgka42V62J4smDb4iPWwZODEMzfL6dt09dcjBqnDFNTj+SHe0Ivx657qHKm
 Ccxw8i1KgV2ODp3YfTLOehR/3J/ttDNV14WQ4XEED+fZcLZvrB1QheOk4w+CA72iV6Zk
 1M2S76HRLeKpAb4QaAP5x0NEU1drCZkIyiPU4rtv0zhoEDh4Dlvgm3qne+gITH/2sokQ
 DDKNy9laSqf93J9TmSwa9LzCKr3AaCo87Ls+59xP+IWDgaB7Nhvmuts4OyWx+8YLuSLB
 wVY3OX6kAehB5BRXvd+K8D4sj39PChgxT2vEUlx63bNxnfncM5XuLr9zxT+u+sdljPnw
 xLAA==
X-Gm-Message-State: AOAM530rbHAyJ9VJaeSHJko5raWT5UE6rcTXQuEj7yd2NbzZV/2Wratb
 9NXf3fB5rtr6BwFOSJ68uObC044Y1yBK9Dq8
X-Google-Smtp-Source: ABdhPJzoRuW03kUZp12GZhUjnVrwkBRk3MeIFs8Rtk1XXux7565hVp+6RqQBW99KbEmi5lIN7QOJ3Q==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr13388912wmf.174.1615557112827; 
 Fri, 12 Mar 2021 05:51:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/39] target/arm: Update CNTP for PREDDESC
Date: Fri, 12 Mar 2021 13:51:16 +0000
Message-Id: <20210312135140.1099-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-7-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8e0a5d30a53..a95bbece4f3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2836,12 +2836,12 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
     intptr_t i;
 
-    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+    for (i = 0; i < words; ++i) {
         uint64_t t = n[i] & g[i] & mask;
         sum += ctpop64(t);
     }
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0212e6b08a..722805cf99e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2967,11 +2967,11 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
     } else {
         TCGv_ptr t_pn = tcg_temp_new_ptr();
         TCGv_ptr t_pg = tcg_temp_new_ptr();
-        unsigned desc;
+        unsigned desc = 0;
         TCGv_i32 t_desc;
 
-        desc = psz - 2;
-        desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+        desc = FIELD_DP32(desc, PREDDESC, OPRSZ, psz);
+        desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
         tcg_gen_addi_ptr(t_pn, cpu_env, pred_full_reg_offset(s, pn));
         tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-- 
2.20.1


