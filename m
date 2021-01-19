Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63242FBB2C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:30:40 +0100 (CET)
Received: from localhost ([::1]:47808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sxq-0005kI-L7
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfJ-0007mE-91
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:29 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfF-0001IE-VQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:28 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 6so12801781wri.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1rxun7tZ3kJ4Dvylgy+YDnPk94fcv8bTRbJuvvfQpAk=;
 b=rUySkXCASzuGhph9ET2Olm6Vpcipdfk3nZSfTOY4cy/rhrnBoFhWsz+DHpG00PYwOR
 p8zT9lizDdnj3RPYsIpsKmCJd/FWcdDvp/0u4ecQLyP7ifYmjvlb/tCr24AJcNCHPGbm
 e3GQCZhgukBXty/RRu6DB9tlUGtPPLRrodlbEPo02wKsQEkjBozYG/B/Ex3P5YwqmF2B
 AqkC7Tykc1oK7zx+QRNmGNVeBF/nA/y68hfauMiY7z+bRZPTCU1Std1CnOPODiWMx8OV
 Fa2x6Q3l/MNnAZEWO8Qh64eQ55wub7w2SPL7TtI/I4Ha8xOyZ3VGbevziKjlsoB4JfDa
 sBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1rxun7tZ3kJ4Dvylgy+YDnPk94fcv8bTRbJuvvfQpAk=;
 b=Ok0aeKz49U0eiBdhJ6iixVJ20D/c9Y8X9rWRflv64sNy/ZIFsqiS0UuneFFA8ajF/z
 l4kGlPyZeAPAbPF+84k2yzDMsju31dkn17iGYOHUL1pIB2bmiRkdCBv2WMViblGxCFzz
 gfPKz85buZjO1SI8nYvpnuLGvbmsToWZFX3HcQRnWlFKPWnJGxIZkxq68g8JFC4JvjHJ
 x3eERwKzhGKXFTw1M+gzepjmXklkG05uyG8ZJp4F2XHPunM18SlX901A0KWVpg+CKNCH
 V0v1/KP1P3DjL0jnXthE6eo4V4tn8aJ3VhL2wJVRLWkK6gdz66iWoSfC1BZZJeU1c5+X
 H92w==
X-Gm-Message-State: AOAM530mFy9vDXEUp21SaUToCnEKbh/pYB2j8Cwl5QIdi4z4A68ML63r
 Uj8a8m/D57LjNSmJGCRMfjoKDpfsvlMnGA==
X-Google-Smtp-Source: ABdhPJxXrxUSGb+st2AFtLgiF5z00VgF+aksvK/xsVh0LiVZg/e6YTDOiSxhoPJNfRa88MfN046xUQ==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr4826207wrw.157.1611069084696; 
 Tue, 19 Jan 2021 07:11:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/33] target/arm: refactor vae1_tlbmask()
Date: Tue, 19 Jan 2021 15:10:53 +0000
Message-Id: <20210119151104.16264-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-19-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f3ee6d98080..d2ead3fcbdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4470,26 +4470,23 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
-        return mask;
-    } else if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
     } else {
-        return ARMMMUIdxBit_E10_1 |
+        mask = ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mask >>= ARM_MMU_IDX_A_NS;
+    }
+
+    return mask;
 }
 
 /* Return 56 if TBI is enabled, 64 otherwise. */
-- 
2.20.1


