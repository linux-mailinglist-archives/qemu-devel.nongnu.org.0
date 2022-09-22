Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81255E6A00
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:55:07 +0200 (CEST)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQPi-0005EI-O5
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB2-0002Bp-BU
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB0-0005QC-Hx
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so4078660wmr.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=CrKz6cgBD504H1V9Pxtox14yL/5f8r5NQpbBSzrvaPw=;
 b=GuYQW+VN/YTYTmck61sTXiu2xeFGx1A5YgohV6HCWmIjblBjv+w7gQxV3ypOMLI97i
 Ln5jDnlhKeB7bzuZgll8VMtzbfKSg9QCCim4ScbjsfRuuHgGniJ44nSABUPnoWxtyOq1
 VVXsgtUjBX8n8eDEQ+Jn44hYY5dXVlq/IAlVHSISffYJkKJwFhUKsAJMhuPshibu59YQ
 +i1dNDkaJ0PsEFq9BUOtNyKZuInXaFW4JFeTyJhD/p59sq6Y8Lfif1hyasDNJPqU9Vic
 gkhpBbDcrq7fY89WEO51Y1/LI0Z+zgMgyDz4i00dgle5xOr0l+aTw4wErW02xVvwLX/c
 pTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CrKz6cgBD504H1V9Pxtox14yL/5f8r5NQpbBSzrvaPw=;
 b=bsd8rWMVYE3z/rEH5zU9ihqjt1Am5UyifvWWww4vKg/0tVFWduuCXP2OPBrO2ZJsly
 bxe/ARscemCRQbQ0f+eLfTdwj0uG4Wx5YtshAgAQOMx1rZc+7XtCW/vs3F3fa+wOCASk
 hEb0Rp5aWQct5OwN+9hUAceDOrSKA4E/Lsves3uPvSc79tuTot/70nbFpE8WpbbV/V+V
 Q/rrYt1rGaRIICo5t0RUhY2fuW60EZDTiKOR8q7AJQD5WxoWB5ZTIJrJ7PUMWFLTcgSK
 YQ3EQs9oqTp3bJXrbiqX3eyWS9m1B0vUAUxzzp9ARwBPb1Ih/QGL2Q46kDdBJR9JJ5EL
 x4Wg==
X-Gm-Message-State: ACrzQf1fi2ny0e6egxIq7ddan1h/NNQK9UXCdFF2weWFAeGa6GiONcbD
 2lmkO4B/C5DmAZC+spHzI5FDVYVISUO3Dg==
X-Google-Smtp-Source: AMsMyM4de2AjFy0Gp8cyFBbWDx2M392IRNeZ2q4ath8Rtpi18DPfvOhInUKPXAl2PhzlTc1H5oI3fg==
X-Received: by 2002:a05:600c:2142:b0:3b4:92b6:73ba with SMTP id
 v2-20020a05600c214200b003b492b673bamr10409755wml.139.1663864549302; 
 Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/39] target/arm: Add secure parameter to get_phys_addr_pmsav8
Date: Thu, 22 Sep 2022 17:35:13 +0100
Message-Id: <20220922163536.1096175-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Mailman-Version: 2.1.29
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

Remove the use of regime_is_secure from get_phys_addr_pmsav8.
Since we already had a local variable named secure, use that.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-16-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8f0810a1968..6a73f16e092 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1964,10 +1964,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
 
@@ -2415,7 +2414,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.25.1


