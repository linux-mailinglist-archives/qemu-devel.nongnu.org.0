Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A1689BFD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:37:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4j-0006tn-6K; Fri, 03 Feb 2023 09:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-0006hi-L2
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Q-00055e-Ky
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:47 -0500
Received: by mail-wm1-x329.google.com with SMTP id q8so3999859wmo.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vEB5hK/P/E0Hi1gXCAfQiABUckdVC9FZuTnsRmpcDkM=;
 b=IHm8AL62XXf9/K1Iz4qp8f9mZWq1GzrGp4pOcSlPYF6xj4wxPeUhvouyb5O7AV//Wm
 QpL9qdH1cTjzwvCzUhQHjXbKQCPEZVcB542h3dAfa3Y8CiDVCzxXVAJ0K1ELv2X1Muih
 BKtYT2zwM+OnQasHF5OkfSCsc6Uwz+XDGNEqR/maOHyAXfEcHaAhVsxKORxsuzU0HwzT
 G5uhEEUXDgfOtBWOpgWc7wlFNgxZil1qZBJvxgbGJVzKBA4OT3k5xaRJTRp2501GE24f
 RI5BnUxSmN5vZjhHmN1PdG8mZw1diOSgSDCTWnqPf6SUK9CWVjg7+aFweZfoVkaOt0m4
 Ch5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vEB5hK/P/E0Hi1gXCAfQiABUckdVC9FZuTnsRmpcDkM=;
 b=Lh0VstW72dSZTM12AckiYV4UANbRIaHyAOUlSP+dDc4ZBGTbQiufOAUj490172nPD2
 UsFas9v6O6Jq3iy+JaZfsCMMQOreVnMJqhJAWGOMCfYK0NSsw1sKRqviJoiZy4CHtq0+
 chFGHU3M69rDdd9bb41k6u5OykKFGfIZey+p7Yh7WTvkIWihSD7SRroB9SRwC687WJ8V
 Z8kqottPjfV+Ma2vEn1J9JQzfEvsftDuDwFzXABhM8Fp/dBCXBcbSM4srbciWu2FhTYg
 ET3TyFYPtoS760oQRR7KPxC70TAfygjLRuVOU4E7x5Nao+cPRXCJG0OLJbk/KOoOJ285
 fvgw==
X-Gm-Message-State: AO0yUKXB6cosBEt/GL5iDrF+FrG58Y/A2M4DktoJa5oX19ojDW9DBfsP
 YFjZrozKDLYow8JV53mwkpCoYsfEFqGwWUu6
X-Google-Smtp-Source: AK7set/QfZL7Jb7+Sp3FlWxdERj2O3xPFEMqRof+zyHI7Jz/RK/94ZNuif1QbQE1WEMJzOkLkoPOxg==
X-Received: by 2002:a05:600c:3d90:b0:3df:eedf:df32 with SMTP id
 bi16-20020a05600c3d9000b003dfeedfdf32mr162829wmb.17.1675434578414; 
 Fri, 03 Feb 2023 06:29:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/33] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
Date: Fri,  3 Feb 2023 14:29:05 +0000
Message-Id: <20230203142927.834793-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
them AT S1E1R and AT S1E1W (which are entirely different
instructions).  Fix the names.

(This has no guest-visible effect as the names are for debug purposes
only.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-2-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-2-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 72b37b7cf17..ccb7d1e1712 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const ARMCPRegInfo ats1e1_reginfo[] = {
-    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
+    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
       .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
       .writefn = ats_write64 },
-- 
2.34.1


