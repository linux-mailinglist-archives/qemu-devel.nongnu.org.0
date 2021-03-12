Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9D338F46
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:59:26 +0100 (CET)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiK5-0004Ja-4v
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCz-0002rp-C4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCo-0001xx-O4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z2so1818568wrl.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gHhH0oC34XDRQ67z50q6f3yLDcstY1QG62tp62hpTuI=;
 b=fZnrWDDIyA/b/e+Kj/hVAMWvzrg8s4TqVwQFJrhAfInHPf2UnUFo6Hwmevdb4Wc/Qm
 YHo9VwqoGaNw5/oUWgfmQMp8XqIm+IwnRnHTZBZvEUeNaIVgJMphMmNeMzmCw0GsN6H6
 95Z/P1MuvABZkg+97Bn4X2Y+Iw3GYLPazBnh0v2IF2xWNodzvS9BJ0zf/KEGODm5FHuv
 b7VnjOa5vpGiZts0kXOeGMitd6+/S/oXQz49JIMigUGQhOUFJ8eBST/s+LxqHW+WbYzS
 95v4b0nZDU2i5QuozxlSPrMNlepGU8obOsKm4/6Qv6P5/1vjK52jTVnJSe8zy4O1qB7+
 BXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gHhH0oC34XDRQ67z50q6f3yLDcstY1QG62tp62hpTuI=;
 b=Y4hEuLOnn+cKcq83+/NXCkrqUTf8+ok5JzsMFpyd9hCkUd3kZw/T2cno+3sBCk9j2U
 SqH3Q92GfRCip/LPul5TNcHOWhRgANfEbyoqhux6pmO2JSCt1CGJKKq6ATCbTjwis4Ed
 yoXR8pP5B/nEkta7bmwTVaEzYozCyN1PwLEdIUCw26eT6MY+ZWCppL1Zl96DpmHqr2v6
 ubvesPbeRrFOYebl9VE7xE7t+mS6oVzqXIJuoYIm0eIe5XbvU3R6HC7L1w3wMUsrNkB5
 Dzg60fbw+qm5evP8OHC8v4pFeXPOxyjk+LfZV3XmItbkeu5StbMCT6lytj3CxwUgOMHC
 MBpQ==
X-Gm-Message-State: AOAM532BVpWN+Hi/Hu6kg82SsRpcswGqYmzvE9G8CsgJeKBVJzC/DwFs
 c0jySuUtsLLqjR2O0AoYKhCqPutCqTyKAqtG
X-Google-Smtp-Source: ABdhPJwWnNlpfACsuB0DF//IgBUoQtkdWbYw8J8CkvBB8l0kfuCtlQ+bj3pwwPQfkDJb9saZ1JGZMw==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr14016692wrb.52.1615557111374; 
 Fri, 12 Mar 2021 05:51:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/39] target/arm: Update find_last_active for PREDDESC
Date: Fri, 12 Mar 2021 13:51:14 +0000
Message-Id: <20210312135140.1099-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-id: 20210309155305.11301-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 981895a17c6..224c767944c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2237,10 +2237,10 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
  */
 int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
 
-    return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
+    return last_active_element(vg, words, esz);
 }
 
 void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27402af23c0..cac8082156a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2302,11 +2302,10 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
      */
     TCGv_ptr t_p = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    unsigned vsz = pred_full_reg_size(s);
-    unsigned desc;
+    unsigned desc = 0;
 
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
     tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
     t_desc = tcg_const_i32(desc);
-- 
2.20.1


