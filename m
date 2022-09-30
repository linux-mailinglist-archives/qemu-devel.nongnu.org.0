Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34585F0CCB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:53:37 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGSO-0006Ph-Kl
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAp-0000HS-6q
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:27 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeGAl-0006WR-Sa
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:35:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j7so1512148wrr.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=NhqIrzhBpcl574rWKiDGts78z115WmBNREKOX97NyXE=;
 b=xYIhCA1lDFNWkEalEw6EWIGnRJMJNdPQFwGza0I9HnF+tEJs/UClkxTrE4kbWXljx8
 o17nqeKFXFhXUAGas13qsh9n8OFQTLSNpCRJvQJPOxPqLq+DLwr34NCCuSoyD/qQ4Q0H
 AlBFhrS4G25BrNTxy3y6bkOmtCkZPpQl7ljtc3gBKhaR6xr1q/UQBUv0s8WRr7JnG0sN
 EMjM7MLomQRAevsKlfYQ1uWrM2bFwG/91vVN9SNh0zfLffI81rcVBCzYnRw2c5JhFytx
 E6bR97eAWR7D+RlUn+k/gOrfPBoLlQFxHAUvt1YqDQG0sxVQaJvUGApL/5DmndLZth5t
 JBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NhqIrzhBpcl574rWKiDGts78z115WmBNREKOX97NyXE=;
 b=DSt/CfoRc6Vadciz6ooYUIre/kit6paq324Nq5Wmdh1/qzd5kh2y0Vy11laynxfdXu
 PZBARsxgLnCJh0NkzTS2qxltRl/6fJAMTSZ3yUqSxkAOtsNyl2/Iam6vSGeG5fUC9RS7
 G0SrlscIOpWPPtgX49+9719UXeA2/x8vF6bKTDLT+uYEHPByyDkIyvLcCWEad7BJqt+p
 d015SkVOVKIsYqjeCzXcEsqUGaWHPTHVME+i/IvPp4M16proTLCBEWblOhdf929OdxvV
 e7jOr0h9Stx36Jgdh3v8Cyk/VkkFXdlNP1DWLtE+u5srTu2ImS3upkFbynOk3MkJCZnq
 5lTw==
X-Gm-Message-State: ACrzQf2/iW3w16H2KpFypFukFBAKlQDuT/GULeSaEGdWDPCeGxqDhoQc
 gXtGZGj1H4JY/2uz0mXvYSIakvRqfzRhVQ==
X-Google-Smtp-Source: AMsMyM7Oh5IYSfARUm4xRrfwvr8VuQ5EqEAW6dltwOjPcnLSIVNY7kOgChvTAD+S00D/evozETJvFg==
X-Received: by 2002:a05:6000:1881:b0:22b:262f:ee2a with SMTP id
 a1-20020a056000188100b0022b262fee2amr5811470wri.432.1664544921851; 
 Fri, 30 Sep 2022 06:35:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0021e4829d359sm1982551wrj.39.2022.09.30.06.35.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 06:35:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
Date: Fri, 30 Sep 2022 14:35:11 +0100
Message-Id: <20220930133511.2112734-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930133511.2112734-1-peter.maydell@linaro.org>
References: <20220930133511.2112734-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

From: Jerome Forissier <jerome.forissier@linaro.org>

SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
it with ARM_CP_EL3_NO_EL2_KEEP.

Cc: qemu-stable@nongnu.org
Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220927120058.670901-1-jerome.forissier@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 24c592ffef8..db3b1ea72da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5088,7 +5088,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
     { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS,
+      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
     { .name = "SPSel", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
-- 
2.25.1


