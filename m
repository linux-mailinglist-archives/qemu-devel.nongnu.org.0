Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6C5905D5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:26:45 +0200 (CEST)
Received: from localhost ([::1]:56034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBxE-0001wB-6l
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnH-0006m1-4A
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:27 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000tk-Ct
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:16:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id n4so20286704wrp.10
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=uwBdsBVOiqHy9AjYw9A5odDA4xVS3sjfOA/XRmbIZCE=;
 b=rEJMdqsnNliLGyfMkICr/W2ZAH/nxPja8LLc0i1FlkAaZ9nzUiXa7JPe+vKOkYMpo3
 Xus2pLl7avB5dESdr0e9i2mZOg2wL8XqUgiLy5wAd/KolVfkL85csUE97WP1GE26j8Ws
 T2+M2mmaLjmMx+ih0g1y4TWsPNw6S7iwYns+6xjzcmkjS58IxS9T1VJs2dVqPdr2x45n
 yrO81dsBSJ8FBDMVSnuArVhyU6EIMvuhtI//DSK21Ui8h5058Ly2FbfBWBZ2epjuzOYu
 YZ3+iQ9yy+4Na/2elu7k+DsY51bkt/banKLIWMxTxH9Vg8DkVjdKYoLx54AMF50T/urD
 VjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=uwBdsBVOiqHy9AjYw9A5odDA4xVS3sjfOA/XRmbIZCE=;
 b=daKxvMVaFSP1PYer4k55NuRMnG5MV8lZT7tjmSkD+J9N/FuBOdFimV6W8yhWwtVeql
 LEbC4K7sfF/rtLmiCNv9pM4R0HOe03NpRJD8i5HIa5yM20t+zA96TJgQ9DAPaZwtY+tE
 WjjCx4dY7eqt4vmsVvWFqEhnclYGA5QzU0nyVbXfDSIwBgkIH3h1yalnG7+tgZFZL7vA
 IRjviYMREFKSyrnuXNWfQ1OzVBjeJhf6fygPfgSRMG+cjEYP12K+LCoYERAu1mYMki4K
 uwZagORpH8EzFLSeh0V6mbp72N+Cn/W8NePCvDj4mud1WI6D3zdUR/G5xL61NLZ7dpch
 Kxcw==
X-Gm-Message-State: ACgBeo38m11VQgkEdUoUP4rfF8Rz8sL6oRwPTxB2AeOfJ3ItDrQoXL3H
 j8UxVDoeVo5rupt98V7zbp3u3w==
X-Google-Smtp-Source: AA6agR4t9IdGR/rDRxKz1hEtph1M4tona/essKf9cFL+tQauURXThs0Xhi8GgBgTd0eLYHdEYZ+Hgg==
X-Received: by 2002:a05:6000:993:b0:222:d509:4b5b with SMTP id
 by19-20020a056000099300b00222d5094b5bmr42242wrb.52.1660238182759; 
 Thu, 11 Aug 2022 10:16:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/10] target/arm: Correct value returned by pmu_counter_mask()
Date: Thu, 11 Aug 2022 18:16:11 +0100
Message-Id: <20220811171619.1154755-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

pmu_counter_mask() accidentally returns a value with bits [63:32]
set, because the expression it returns is evaluated as a signed value
that gets sign-extended to 64 bits.  Force the whole expression to be
evaluated with 64-bit arithmetic with ULL suffixes.

The main effect of this bug was that a guest could write to the bits
in the high half of registers like PMCNTENSET_EL0 that are supposed
to be RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b8fefdff675..83526166de0 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 static inline uint64_t pmu_counter_mask(CPUARMState *env)
 {
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1


