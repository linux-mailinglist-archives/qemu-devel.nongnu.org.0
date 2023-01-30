Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1ED681910
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqU-0001Fk-TL; Mon, 30 Jan 2023 13:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqP-0001CQ-UP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:30 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqL-0008R5-AC
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:29 -0500
Received: by mail-wr1-x431.google.com with SMTP id m7so11984239wru.8
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Vj+8R3eAUWvoTvt+rtdp3a8e8+qsFowbhWMk+Fsc6nE=;
 b=JRELcrA3NnnBuZvuy/RVQCm1kH2JcvOT5mju9FW6IjVjmBBUd1PPDPDd8E28Prp3sL
 82ruCcn6Yx/WTuCIbNVMdd9oStM8ehSCkyP6uZkxsfBmPj7L5a8l3BrC+1eXoxQYOgjc
 VjDmUddULcDPwjgdXhBPjHs0nOItDUo8kEoSka71ZvxnO86ccvm0Xyq6jaCRzWepy1E/
 DCrcCEYMXSC0n3buqUaP7ykrcXLa5H5UphbuLUXaJFavgcwR+gXyTe1KJ0xDxBTX4znq
 2LXp5U0ebIiu/v213y1B4DcJvFJdsOvf7WtL/PUtwhi8pY4FscesA253oamxqM3Agd97
 Tl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vj+8R3eAUWvoTvt+rtdp3a8e8+qsFowbhWMk+Fsc6nE=;
 b=T4G0fnBUv+hZyFK7liQqJdDeFQjGYGyB7iwlpAseqkIBsQ1aG8hu2EPjWb5O+4cXRY
 kulXyJSOPftBGv1C+gc1UCnn/4wSa1p7ZJYhod4JPy4e7TJcuO6iqS4F4ghE+LHvaWnJ
 tA/bAzFIJLSqFMIMC1oA0PLh7gO+i6DQjy7De5P2E6HArO/LQybDsQhZOdTxPIGz5kjD
 XyD9eawZqIlJE7/jP07TKNfzUJSePEqf3hbzkY26+7pYnCYaD/eb3F9LpiAqmTO5qnXS
 y+9VfUt9b1cdjwXNR9kDqgY3RvnCuMJrdBTArxVZPfA7oQXQ8Qt/NR0LSlzAOIUWkTkg
 hmeQ==
X-Gm-Message-State: AO0yUKWQ/pRaazU6ALhFB0OIL4NA1RcaPMrpfShqBOBJU9y13eZtjxSO
 98+xn3S9cbX+BxSXzWgO0B+YZmKnbn4ykVyR
X-Google-Smtp-Source: AK7set8Cc7yrPBQCx55/jMfF9PP+Zx+5/mp7kHpISYM2ZspW8O4yl0Sv0HH9gFTxPHlGEcTOmxTzig==
X-Received: by 2002:adf:f14a:0:b0:2bf:cd9f:37f9 with SMTP id
 y10-20020adff14a000000b002bfcd9f37f9mr11830193wro.4.1675103124529; 
 Mon, 30 Jan 2023 10:25:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/23] target/arm: Enable FEAT_FGT on '-cpu max'
Date: Mon, 30 Jan 2023 18:24:59 +0000
Message-Id: <20230130182459.3309057-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update the ID registers for TCG's '-cpu max' to report the
presence of FEAT_FGT Fine-Grained Traps support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-24-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b33d7c28dc1..c76555f51a7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -28,6 +28,7 @@ the following architecture extensions:
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
+- FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FRINTTS (Floating-point to integer instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb5..4066950da15 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1224,6 +1224,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
     t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, FGT, 1);       /* FEAT_FGT */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.34.1


