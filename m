Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96735AF259
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 19:24:53 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVcJf-0004Cm-Pd
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 13:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVcI8-0002ZK-Lw
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 13:23:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVcI7-0002Zd-1v
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 13:23:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id bp20so16009583wrb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=WDkpvIkbzjHzfAeFRpYWMbLOj1xKc5WDtqfzvZ/DNrY=;
 b=R6cM4RWKU1ITlzs8h5nxoNJ5Jq+Tp7e7wFYGHkjCS73aR0FcIpPAQrxmSGJALAoqh8
 NLz3+Y8zNaHVVi85uuxPckVEDQY/Sy37GKM3qoS3PqR2cmMyzCyq4pHLFr1Q8WnGjLJg
 IT5UQ6+1U5SXOOf81Iehj7TdfSUjp+P1UbWvo5lXZVlivitlMrOcG7YIEtWUkB+2n5Bc
 pYgFGVYd7CpE2UVubp5SYZB1lSKKd5ww57j+CSggapjz4UPh7ZfSKA/QUnDmID0VizkY
 fF3+OhX12wiaD3nDCtEC7PkUtTp8Lp6xDDuyXhfE0//JU8IZyyZ1TfDJq2KJLKxHhMKy
 9NAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=WDkpvIkbzjHzfAeFRpYWMbLOj1xKc5WDtqfzvZ/DNrY=;
 b=mt7tgjMNuDnxQ+nioYO+xsBEnS2ZCSowrkUrhkerQ3Jdpc2/7+v+OUg9t+cm0ly4RG
 ouVyMzV2LjbHD+PHYxkGBd8flLtLy57yR8Cwrk9OA+i7U/SlheOibEj9OnY2WD6H2Imn
 p8zKaV+E8GzQdBTzMuatXYyAjouCiSsN87LOQXJ7X5YNzCHJp54zjBiHFMCfZObgotrj
 bzNRtjValilccmLWSHdPaVWjUJ4Tb+0pAuiXYl0btWNCPuvRH17y2VZtUanWUzF0rEmt
 Qzh6PpkcRLfH7KBZzVgBNSsQqa2aqZ3YQ/BTkGpQ2fw5+k5pTnZwL+d3Wqokvn7XzZ3+
 86Hw==
X-Gm-Message-State: ACgBeo37/3QWh89iYNEbVlqg+8/ZwjM+XGu0fXTabgZF9uNLKomzh2ed
 ntSGUJaz3k1yy52eqisScreDJw==
X-Google-Smtp-Source: AA6agR5rP/oSJov1/76AnuEk9B1bKvcJuER0VTc98knKdP9A87yGX2FbQruZIo0YqJBf0Dz3cA7VUw==
X-Received: by 2002:a5d:6987:0:b0:228:623e:2dc5 with SMTP id
 g7-20020a5d6987000000b00228623e2dc5mr9142379wru.574.1662484992847; 
 Tue, 06 Sep 2022 10:23:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c4f8600b003a54d610e5fsm23435275wmq.26.2022.09.06.10.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:23:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89C7F1FFB7;
 Tue,  6 Sep 2022 18:23:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Arnd Bergmann <arnd@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
Date: Tue,  6 Sep 2022 18:22:57 +0100
Message-Id: <20220906172257.2776521-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

QEMU doesn't model micro-architectural details which includes most
chip errata. The ARM_ERRATA_798181 work around in the Linux
kernel (see erratum_a15_798181_init) currently detects QEMU's
cortex-a15 as broken and triggers additional expensive TLB flushes as
a result.

Change the MIDR to report what the latest silicon would (r4p0) as well
as setting the IMPDEF revidr bit to indicate these flushes are not
needed. This cuts about 5s from my Debian kernel boot with the latest
6.0rc1 kernel (29s->24s).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 target/arm/cpu_tcg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32..59d5278868 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
+    /* r4p0 cpu, not requiring expensive tlb flush errata */
+    cpu->midr = 0x414fc0f0;
+    cpu->revidr = 0x200;
     cpu->reset_fpsid = 0x410430f0;
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x11111111;
-- 
2.34.1


