Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47DB59C19B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 16:28:59 +0200 (CEST)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ8QE-0003Qp-CI
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 10:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PS-0005s7-4Q
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PQ-0001e1-GY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n7so13207099wrv.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6876aucf7V//qP9FMCQSiTLY5Lo8nlXr95EXwywYwmM=;
 b=hmp1kUo1DEBShuQMVFNeOqYPCUGGpHyJ4O5vqoau1rHR1XqfL3Lo1cZbkhFmPP4Ief
 w9mWytI8QPceKENwe6qRHLok5zw1QRvA3iDR1Tw1NnpGtN6qm43EdLPmQ7ZXQdu3T8ez
 95t5XZ72Os4DuGPqpv07SJFtmiIWH/SacE6pKY71pfY3SwR5TyWyaUCLmBPTgAf+I8bg
 T7sSY5mSMJZsqddTxTTQLSp3AT0Jq0tyEgvM/VbAV175lLco9jHczsvU65VBn7IwelYf
 7dOeo4Nq8sNa0dWmOfdgTlJ+MCTlVNAxd1FuEStFQ9GwuhWmZVvjspA+6CipL7WMYwTf
 24SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6876aucf7V//qP9FMCQSiTLY5Lo8nlXr95EXwywYwmM=;
 b=dI8Mk9oMCeEs6mEPOPhtNhiBL4TgrvgLMyajkEi2uofxd/rT+rfaiKddKtyjLWTZoz
 ElOmmEgGAGyaxyj+Qoc0wivKjYuHn4Ocp0iPN93kBR6sIhYzF2bl8ywCk/z3YQoBjmQX
 /YefiV41jXN/JrK3UHhe2gk5aLaDF3Lo3TyTE830GL9GK9Q466Jfsumee/ZccIx7SWal
 +EBnwPzknlbdmG+ogSz2q2UFhRZo12HyeJxN6ZL6IAq1RkE0RH0XWVK0qCQWqvIVNpQZ
 I3LdMcTS33uDvfvcZ/hePZJB0Ky+jJv/PHGps9QZZjDYFHxH1tvyiJLXqEE1LP9xe68l
 HVzg==
X-Gm-Message-State: ACgBeo2PGuG6GpYQ6fiNB0E6BQD9qXo202YkAoROsRDwaCp6Vep/WFxF
 CvjB9+VRbMs3FT9vhomtefzMhQ==
X-Google-Smtp-Source: AA6agR4yFQbzq9Yobh06cW9LEigRWphpYIdXxoaOBhHVKytZYnlSmW7t84vcnRAc2DnPjfPs0lxQtw==
X-Received: by 2002:a5d:4ad2:0:b0:225:285e:3ec1 with SMTP id
 y18-20020a5d4ad2000000b00225285e3ec1mr10865744wrs.24.1661174642608; 
 Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 02/10] target/arm: Correct value returned by
 pmu_counter_mask()
Date: Mon, 22 Aug 2022 14:23:50 +0100
Message-Id: <20220822132358.3524971-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


