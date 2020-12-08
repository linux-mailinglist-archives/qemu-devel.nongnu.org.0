Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD32D3204
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:21:54 +0100 (CET)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhcX-0000U7-Em
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ4-0007oL-Of
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:46 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ3-0006OF-0M
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:46 -0500
Received: by mail-oi1-x243.google.com with SMTP id s2so10842448oij.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywn1xFxnrreGuCNq6h+Wr2lOdbd/pesbHQZ1k8i3mW8=;
 b=xk/ClVEC9xTJ7WgicriCb5qe3NEdBJb9ZfB8IfOlo49aGrbQgI5pghb1xBhjk5zetv
 S+1LsDC4TzaLRj9sv0ninXVEjVgbnGbkd/4dxXrqrzkf5eXRRz5GrCu/wi74i7U1zpB8
 7DG38s60a3rSNUQ3Klkxps3NGbYeDA12b4975G4FHY0wyectPAePx0zpuIoGkuvYolnu
 c7dR22UiQsnOL9hDgzhJIRyHktQE2AoBa7QFyXNVhNDIaVD7gzA1HZJ9bqtMydoI+nHi
 khEtj5IA5CJCviFRIYNYLMonYaPOqgmgLW0NtcMVxH4Ipg5Jp6MbmPyA1gXpTAbRedVG
 RIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywn1xFxnrreGuCNq6h+Wr2lOdbd/pesbHQZ1k8i3mW8=;
 b=eepXnoHd7xb0bbiPCrvlP4EN5UR44Ixzmo14H95ktysk5/YfJmoOxcrvN5F+5BW2d9
 l001kdJnBT5HbI0P+lLjCbY0LrVkhvSwOOPqIT21c5QMZ1JIl+00rTJm7dJfLt1IkLa6
 9wnqYKILOm6Tytb0VhEAx1ruN4Jtet60jK2zrOT9gADK1fQomPQWc4qw+HQJuckRyiZg
 /+yA+ylg64mDo/KTCL776zoh5nh7vgZHuslqr6HMm8+L4lMAitgbwyGzvOI2f4mkXISd
 t8mnG61PNKPcFYzlz+VIHRAzhEg0zXarkCVpABBlT60fPdLMfzjH61CXvH7qeyZDJlNo
 CNuw==
X-Gm-Message-State: AOAM532dG2y1Li+p7Uxm7OHVS/hc9chtO9LjHZ0CC+kaM2tYegdA1Jaj
 M/NzmL5+ZVYKgZhRBQKU9hh4tsQec+HcdPus
X-Google-Smtp-Source: ABdhPJzyoPoE2Nrcz9mnGgiEq/BeapZ0lwgGFmM6ksrvBtk7N+jwJK3rRTd/Qb1QiVEciW5XYqNIhg==
X-Received: by 2002:aca:c4c2:: with SMTP id u185mr3487753oif.177.1607450502615; 
 Tue, 08 Dec 2020 10:01:42 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] target/arm: Enforce alignment for VLDR/VSTR
Date: Tue,  8 Dec 2020 12:01:07 -0600
Message-Id: <20201208180118.157911-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 98e4ae30eb..122e409f39 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -926,11 +926,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -960,11 +960,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1001,11 +1001,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.25.1


