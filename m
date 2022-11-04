Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66290619570
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquzC-0001NU-Pf; Fri, 04 Nov 2022 07:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquz8-0001NC-44
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquys-00087O-Lu
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id o4so6667669wrq.6
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TK36xDI/Bedr+1cIQUf9pmiyP0CsOopzktqKeVg1tdc=;
 b=CwgSab0DFfsNtlJTI3tyOh6Q2Yt3Hycy0QO1Gk9H2QplJOUjDyll6ASKg54J+JedCN
 Ygo0meKrsfqZt16gg+X00/JRwCLNFB0E+VqgY6P0SQrnP8B4SBGz0sN0exiZUgIDpsjB
 mY4gjQ4Ou4tcOdCOpQb4q70vri9KlDIdokoQdDLY1Y6pslYNWZFLoWE1b5+MYbnsrpBI
 85ahl9x+IQPDqHOwQFBG0Nt2FPNrPg4XG3sjoinlmP+0GXl2yTbaYtVcTai5eKb3oRLh
 6jQo2G4mPz/o+LLKCHag7KxOG4VP9MgBjq2L0KClJRmPZPK0nYsGUNKgcJvSdrM3N/xf
 Gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TK36xDI/Bedr+1cIQUf9pmiyP0CsOopzktqKeVg1tdc=;
 b=b4yWSCJSTcJJB9MbMwCYZAS0q5Ufb0krLcCLopku8fEWGwV13zXiTqvsSa/0Ax+KjX
 H3d+YpS+UNHtfk53ibLqmgI8w9Bew3tb7CXGwwRPCz6VyvKglr9ZwVkoZ1V1durgIzPK
 BapzLJToa+9B1gcFrteSflyK3taiCXE3fs1jnGPZ6GBY1V1HjryBCz2XgR5QnfrIVV2V
 VoGg0y2qEAb++QuKJgHIWYAtI+haByOMI0UUihlyq87f6XZoan/UHnTW+4gGUrt8bxRY
 o1t2hAb5QyC5D8XZK1BhE+bnOXiAzgJx48ZHFz5LrEolZRUNWmuITdtZ0UUg+cmpN/Gg
 +8Kg==
X-Gm-Message-State: ACrzQf3f63VdeUC91ilWui6M7HVEFc1+jquDAcixdVpI9peek3jJF3fT
 TETItsn9c3jeD/1nXAX0V9OG3Ex0e4H3Ew==
X-Google-Smtp-Source: AMsMyM4Iyu4dLZ9Gjv1j1Sk/w9Qq7sQ/r8ubxFpHj/znyRef8wgKapl+AJMEPEfvYub9P5/W4wcmhg==
X-Received: by 2002:a5d:45d0:0:b0:236:8201:1cb7 with SMTP id
 b16-20020a5d45d0000000b0023682011cb7mr21817787wrs.417.1667561725365; 
 Fri, 04 Nov 2022 04:35:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] target/arm: Two fixes for secure ptw
Date: Fri,  4 Nov 2022 11:35:15 +0000
Message-Id: <20221104113515.2278508-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104113515.2278508-1-peter.maydell@linaro.org>
References: <20221104113515.2278508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Reversed the sense of non-secure in get_phys_addr_lpae,
and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.

Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e04dccff44f..3745ac97234 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1381,7 +1381,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (!nstable) {
+    if (nstable) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert that the non-secure idx are even, and relative order.
@@ -2695,6 +2695,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     bool is_secure = ptw->in_secure;
     ARMMMUIdx s1_mmu_idx;
 
+    /*
+     * The page table entries may downgrade secure to non-secure, but
+     * cannot upgrade an non-secure translation regime's attributes
+     * to secure.
+     */
+    result->f.attrs.secure = is_secure;
+
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
@@ -2736,12 +2743,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    /*
-     * The page table entries may downgrade secure to non-secure, but
-     * cannot upgrade an non-secure translation regime's attributes
-     * to secure.
-     */
-    result->f.attrs.secure = is_secure;
     result->f.attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.25.1


