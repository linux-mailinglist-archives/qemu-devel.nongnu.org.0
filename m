Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA78C581659
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:25:15 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMQs-0005XR-Ra
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMD-0006Ny-Fb
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMA-00062o-M7
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:25 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so8366862wmj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7vIR8LJZ8u7IRlc0GXx+4QrCXzRdLBy6u8yi1hPp0UE=;
 b=MHm2Y9BGb19f84rVZb2skA/p8PswnjpAKEcDm/HX3MphLgTjxwtr3Z6rKpbTrZBjOw
 ez3wTBKUYBw2V55USDgxApOBj9CoC3yzH2iEBN5GgN+ZDCFvq4SsM0PoHwho5KWjShCj
 S2ek+Qp0H4zmLB4MAI83R9lMu8Ou8JeRQ3K2PIO1Wz+D1ckPHSUI25RwI4FFe5BNRQ2W
 oTkVZAHvjnecN20wlVy7Rn+zdWJ3m4Yc16KsTb3tbndXoLg9GRuzXCJ+pVDc52R+6iRo
 eAxtq5THi7gWBwqcrNZ//MHxCfcIuZjzwe11SYzLcrdGdKBGzqNhtoAdP7JWOvVkoAXi
 docA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7vIR8LJZ8u7IRlc0GXx+4QrCXzRdLBy6u8yi1hPp0UE=;
 b=S971ALgK/6BPzDuPrPsf8G7ZkKMnX+/l2l442cStq4aM8burI9TNln3X0usUzgvamQ
 QIwjA01QSKV2u4OcJHi4ELgn6V1V3G+IN3IWoNtRo5kZSuyKwLtbM3XHAkWc8j2QM6A7
 Is0bSVONUPn+lfcXbIGYqBcE9CYPUpGoX2JtL2yJT1h6vLpkiLpJe8kkuf+HedZ48TSW
 9jsv/Q8Crwx+qXX5xdcRAjG9FHaLtXdK4nV8r+MgzVuyPiaoeFCgxoGEyb47SFXiRMAs
 /VuG46MJnH1nx8fZCan+uk3yAwiMYQRli4QlrtJuqJfE9BLtpJQ4n9FIvhOQn2d6fZJh
 +9Og==
X-Gm-Message-State: AJIora8BbZIlDtVmPpoyqBIDkvaWVaUKPxOiwZbYFjQRawUNqGOuKlPR
 6OakzkY1R/+Rvb+40ZUdpATE1jLzxq3/Jw==
X-Google-Smtp-Source: AGRyM1ugZn7CyZsRutXAk8ekjSJg0bUm9sKeD+JoABvIKaKkdm3aDH7/3//BfreIBhXPwHSpNXUjnQ==
X-Received: by 2002:a05:600c:154a:b0:3a3:2fae:9bae with SMTP id
 f10-20020a05600c154a00b003a32fae9baemr13072029wmg.23.1658848818355; 
 Tue, 26 Jul 2022 08:20:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] target/arm: Add MO_128 entry to pred_esz_masks[]
Date: Tue, 26 Jul 2022 16:20:06 +0100
Message-Id: <20220726152012.1631158-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In commit 7390e0e9ab8475, we added support for SME loads and stores.
Unlike SVE loads and stores, these include handling of 128-bit
elements.  The SME load/store functions call down into the existing
sve_cont_ldst_elements() function, which uses the element size MO_*
value as an index into the pred_esz_masks[] array.  Because this code
path now has to handle MO_128, we need to add an extra element to the
array.

This bug was spotted by Coverity because it meant we were reading off
the end of the array.

Resolves: Coverity CID 1490539, 1490541, 1490543, 1490544, 1490545,
 1490546, 1490548, 1490549, 1490550, 1490551, 1490555, 1490557,
 1490558, 1490560, 1490561, 1490563
Fixes: 7390e0e9ab8475 ("target/arm: Implement SME LD1, ST1")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220718100144.3248052-1-peter.maydell@linaro.org
---
 target/arm/cpu.h           | 2 +-
 target/arm/translate-sve.c | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e890ee074d3..5168e3d837e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3387,7 +3387,7 @@ static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)
 }
 
 /* Shared between translate-sve.c and sve_helper.c.  */
-extern const uint64_t pred_esz_masks[4];
+extern const uint64_t pred_esz_masks[5];
 
 /* Helper for the macros below, validating the argument type. */
 static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 41f8b12259e..621a2abb22f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -529,9 +529,10 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 }
 
 /* For each element size, the bits within a predicate word that are active.  */
-const uint64_t pred_esz_masks[4] = {
+const uint64_t pred_esz_masks[5] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
-    0x1111111111111111ull, 0x0101010101010101ull
+    0x1111111111111111ull, 0x0101010101010101ull,
+    0x0001000100010001ull,
 };
 
 static bool trans_INVALID(DisasContext *s, arg_INVALID *a)
-- 
2.25.1


