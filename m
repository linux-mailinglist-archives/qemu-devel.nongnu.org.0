Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0624514A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Aug 2020 17:36:37 +0200 (CEST)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6yEW-0005RT-Hp
	for lists+qemu-devel@lfdr.de; Sat, 15 Aug 2020 11:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6yD6-0003ba-Mv
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:35:08 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6yD4-0005Ax-Tj
 for qemu-devel@nongnu.org; Sat, 15 Aug 2020 11:35:08 -0400
Received: by mail-oi1-x242.google.com with SMTP id l84so10859090oig.10
 for <qemu-devel@nongnu.org>; Sat, 15 Aug 2020 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/VNIRE45vthmnotX1ygL9JJ9jQ4MS1MvprbVVBA5VY=;
 b=gvH5QVMbEqOryeyl9dG5muTYrPA1X2ec1UBGAhHofCPrkxEnLB55P0VmV3lO1s7Dz6
 5YUqrqkk8aPxtJ5reUm2bYEjkLjopYVbu6zY9rHkn5XpDoemaYNWhi3M3ENIvQVS7mlJ
 edLQWGaSawykGX1hDuSifoX/pm2ML0IxlxR46maSiafZIl3TAs9goZu9tx54n7bIsZbE
 Zm2fZSkf2VaHsmwWSn0tFP8WSzU8OLpyFUSb3iE/qOovcwe2AN8bcD0Z6tfNp6nON3SL
 rxfKDgZjqahjtzITSDdHb2zrrp1qhnV1taJNMVwdbTgaoSTajeE2xyiOIslEaairMxsq
 HoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/VNIRE45vthmnotX1ygL9JJ9jQ4MS1MvprbVVBA5VY=;
 b=rvfxWqYk3TGWQ5nqDciYmWmUXUdLYjLcR6ih03VEM8xKWMWeRw5Tg5cqIJ2O5wT2cV
 rs1xqoQl7PW2T8bz+n6vITlZLc7C3XmH3A0cE8CDAlzZoBZdpUtyTo3OwydFa0FmfpT0
 a5fCxhmRChxOl2JjjqDhW0/iARwKGOWwu0YUEiOo+Aq0AHQqeiuGcgyCAM0VDe2UHXvh
 8xjaREmUgbc9bOLYYzesGxkLg2gPzWp8F5KtFnZB7Hk69hWLhpSEyydS2VWDCNdZvsNX
 7ik6LDki5KHZAqFlPXDOse7EbPbkN8SHWj+r+zuR5J1hUkOYh2PIP2rT76rBxoH+qcDs
 xmuQ==
X-Gm-Message-State: AOAM532W+9kJTNJ3gnIQjAKhNIBqYGn/pYATaJMl1YKgEwXIQ3PF+0i8
 leeR1yAwg6PuFbMLy2ss3yZBydOFpiBtIA==
X-Google-Smtp-Source: ABdhPJySv50x1QxBT4mu+TV9tHdyiXiuqZyQuymUycLkNm60wpseryU4gRmkc0iHsn7wwJNsi+Fwuw==
X-Received: by 2002:a17:90a:ac0b:: with SMTP id
 o11mr4547374pjq.191.1597455117508; 
 Fri, 14 Aug 2020 18:31:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y196sm10625528pfc.202.2020.08.14.18.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 18:31:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] target/arm: Use tcg_gen_gvec_bitsel for trans_SEL_pppp
Date: Fri, 14 Aug 2020 18:31:32 -0700
Message-Id: <20200815013145.539409-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200815013145.539409-1-richard.henderson@linaro.org>
References: <20200815013145.539409-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The gvec operation was added after the initial implementation
of the SEL instruction and was missed in the conversion.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 13a0194d59..aa7ed070e3 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1188,34 +1188,19 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
     return do_pppp_flags(s, a, &op);
 }
 
-static void gen_sel_pg_i64(TCGv_i64 pd, TCGv_i64 pn, TCGv_i64 pm, TCGv_i64 pg)
-{
-    tcg_gen_and_i64(pn, pn, pg);
-    tcg_gen_andc_i64(pm, pm, pg);
-    tcg_gen_or_i64(pd, pn, pm);
-}
-
-static void gen_sel_pg_vec(unsigned vece, TCGv_vec pd, TCGv_vec pn,
-                           TCGv_vec pm, TCGv_vec pg)
-{
-    tcg_gen_and_vec(vece, pn, pn, pg);
-    tcg_gen_andc_vec(vece, pm, pm, pg);
-    tcg_gen_or_vec(vece, pd, pn, pm);
-}
-
 static bool trans_SEL_pppp(DisasContext *s, arg_rprr_s *a)
 {
-    static const GVecGen4 op = {
-        .fni8 = gen_sel_pg_i64,
-        .fniv = gen_sel_pg_vec,
-        .fno = gen_helper_sve_sel_pppp,
-        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-    };
-
     if (a->s) {
         return false;
     }
-    return do_pppp_flags(s, a, &op);
+    if (sve_access_check(s)) {
+        unsigned psz = pred_gvec_reg_size(s);
+        tcg_gen_gvec_bitsel(MO_8, pred_full_reg_offset(s, a->rd),
+                            pred_full_reg_offset(s, a->pg),
+                            pred_full_reg_offset(s, a->rn),
+                            pred_full_reg_offset(s, a->rm), psz, psz);
+    }
+    return true;
 }
 
 static void gen_orr_pg_i64(TCGv_i64 pd, TCGv_i64 pn, TCGv_i64 pm, TCGv_i64 pg)
-- 
2.25.1


