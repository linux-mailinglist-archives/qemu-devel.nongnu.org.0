Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0115318BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:14:26 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABnd-0003IL-PP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYo-0007lh-8P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:06 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYm-0008Jk-LK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:05 -0500
Received: by mail-wr1-x429.google.com with SMTP id m13so4038379wro.12
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=55fSBVW6bM/EwxuFa4hfg9eqTtioyVGk4PvCa+Q/Udk=;
 b=s2njYhYJA/yu5tJ+ZRCikl9HbZLFtQoBYRacBvfGQ430f++X4mtGVbHQUEVywJ0V6c
 4INainZfIQ2LsRQp81DbJRYWPMJXlSImAwDAov6bZ50zQ9b1E4W6XxKnT823pfQ4ML8u
 aKF6dF1auyGQYTAEwzqnHCEqolVT6VxLzPR17LqqijJczYYvEs0LE18JO60oEdpiOUei
 2iBgUqNsFFW1TYDIHaSctOjY2xHT1ZUrELqLVfjqOXDo9udEaQZZqpK3Ps7caTTTvf+t
 4EblbAJqFO3mWQQ1PPV2S26bFNsVbZoKlAtCfTeSJw28edB9v+qLDhiiJPW9muSYWSKF
 eXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=55fSBVW6bM/EwxuFa4hfg9eqTtioyVGk4PvCa+Q/Udk=;
 b=aAfNMb46idH5gLmeYznH/OCuy1yurMxjOCf7qkOjaTFIyGrBe6pICAnrmxTKP3mEWt
 EU5rGaFJi0hRtrPplKJ7nwqkemYe3wOeLQzPLlZiYrIbBeVorPAfpZDk4tfCYbWjXhz/
 mUhN+WnQ745s3/HKnQK0Rf2iIb/kG6AwiI0gCzdMK/S8QWAnxMhFyfyOVltgbsxVTXY8
 yq9d82Kodx1hc69R+NE1lshqnjgfUk7RbXKFjH/y8VJAP4wPLskYJlfQzm3iWhjgH96o
 NOirqratctq62PQ/riWfThaEXtV2gpW5QVCPVsAMxKMIRDPucp8336VgIn3NnJyTSRNz
 ytLw==
X-Gm-Message-State: AOAM531PBxM0RHTqwhn3OZMg1Ja8MZD74cpuf+OIfB31rws+aQ0M86VU
 Fo1ms4u0eZRJc3XLm9K0VVO2/156A3YSDg==
X-Google-Smtp-Source: ABdhPJzIkr34Dq5izHwcQwHH4Utl8gzLT5KO2yCDIGLEa2utq7wzMnHj2VF+e124/U/sugoWO0CVaQ==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr689068wrw.325.1613048343414;
 Thu, 11 Feb 2021 04:59:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/45] target/arm: Don't migrate CPUARMState.features
Date: Thu, 11 Feb 2021 12:58:16 +0000
Message-Id: <20210211125900.22777-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Aaron Lindsay <aaron@os.amperecomputing.com>

As feature flags are added or removed, the meanings of bits in the
`features` field can change between QEMU versions, causing migration
failures. Additionally, migrating the field is not useful because it is
a constant function of the CPU being used.

Fixes: LP:1914696
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 581852bc53b..6ad1d306b12 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -810,7 +810,7 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
-        VMSTATE_UINT64(env.features, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
-- 
2.20.1


