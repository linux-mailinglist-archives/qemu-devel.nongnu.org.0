Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBB36F8E7
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:03:24 +0200 (CEST)
Received: from localhost ([::1]:40948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQvb-0004Xj-HJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUJ-0007pk-0E
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU6-0001LE-9a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t18so12415887wry.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6S+nDjof/vi/mR5kh+7cKDsMYJD8jrm8Sa+giQo6P9U=;
 b=iG3HSNFsJXgNtTMcnFd1jD380i6GzyXvt+tRRwSC7eYrQfXkhmcaeqlfZWwh/WKNG/
 sRpKZ4JtJb0oyYn4KbEyIgrOV4sqQ5fVQoPyoIb3Wy9Tm/gQeV8IZ79O/NrQLaqTRZTF
 Js5yz/0kN3Po7XLTEtRQxpJcGA/7DEBUMtX9Ny5oBtMU94nnDdguZg27644pgYVGNH/K
 EqzRl8s0nRXi+AZ2Zf365ogfiFDsDtzxu45reAAr6dPICnO7KUf97/pScNMra1RR4yR1
 eOPIWsOy4iRIq2JtWhwjIBgTadXIUyKy5VDFfdBZ3RTyL5Lnz73lbYvpMNrhpp92rgr3
 XJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S+nDjof/vi/mR5kh+7cKDsMYJD8jrm8Sa+giQo6P9U=;
 b=siDZA3Ol4736Wl9wVYSjx1lTaqX21auX8FSLB3W4pqWhW+0Ts0JKPH6zISaJ8eZenB
 pIZMPV6H5CVSzeGdhTFrpNclOjVFKIJTNcIXp1KGubtg5IQ5VNt8sOc2yaWoL2ASHhHC
 ZhaYXBjNPaivezzlzpjY62zMTC3SOhQFBnFFNBd9/YkSejofrSvmMTBCDPwKWniKRFcs
 MHoQ4OctVIEJo7EzGzAcZb2k2vpcH7SQL4Gd6MM0mDrySls5HmQLwKvBKnjUUealOiaZ
 RT+B2IRsBeh7sRpJVpad6WmMIerYxQvL6rDH7Uh2i3ClGz4bLOlZ8ZCZAKCqN5k6bMPH
 wavQ==
X-Gm-Message-State: AOAM532f4pN/G2HjA3OdC20hNA8JIQs++JjnE+mNR230Lq59e3Hw0iML
 6YNXBR7CZsL1KPkdidxRnfh6jHns0YQ9o2Oj
X-Google-Smtp-Source: ABdhPJwr9Emuma2sQJf4iDWCSFjopehhyKHjzz+3jNS/xDKF8uiAWEaCWl/iYSVSr7kFKI98kaQRyw==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr5940168wrm.392.1619778897058; 
 Fri, 30 Apr 2021 03:34:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/43] target/arm: Fix SCTLR_B test for TCGv_i64 load/store
Date: Fri, 30 Apr 2021 11:34:17 +0100
Message-Id: <20210430103437.4140-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Just because operating on a TCGv_i64 temporary does not
mean that we're performing a 64-bit operation.  Restrict
the frobbing to actual 64-bit operations.

This bug is not currently visible because all current
users of these two functions always pass MO_64.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2f2a6d76b40..e99c0ab5cb9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -982,7 +982,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         tcg_gen_rotri_i64(val, val, 32);
     }
 
@@ -1001,7 +1001,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
-    if (!IS_USER_ONLY && s->sctlr_b) {
+    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
         TCGv_i64 tmp = tcg_temp_new_i64();
         tcg_gen_rotri_i64(tmp, val, 32);
         tcg_gen_qemu_st_i64(tmp, addr, index, opc);
-- 
2.20.1


