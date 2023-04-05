Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B336D8302
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:07:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5dp-0006F8-4x; Wed, 05 Apr 2023 12:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5db-00063q-5r
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5dX-0007lc-SW
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:05:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id he13so1573634wmb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680710727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
 b=hnCYq5Dzl/7iLI0rQYbkc9CUi17FFpKYPMxOnHcemCexKvxTdFYuaru2TQEImK5o9e
 jTn4K6Pp9zXxdmmJsMb8gD9S2GQ92Q72Ifh8L6RxwgBOR83AYlvxa/V/6Fh3hPXQBoiV
 z9gKOGSH8bAn5zRrapQGO1yAInmO8o8qVZTpVMRyYOG1CV9m59KTFXQeJKBj8sjGVuru
 vuCXHX5KYhKDn13HSZVsP5Lq2Qz50f1zC2IoyROHSYrzPF6xJDEsucHmTbgNlZ1jt64p
 EjINJfxYuBjgAhCrq5BfDf3e2GoiGGEqH9e7WYG8IshZ6uH7iubAr54kkd/PnEXO2Hgf
 kVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2hst+C2Hubq09FNgBe92GHruUqjFSuaPIAbKjAIoI8=;
 b=Q29OO8tCXMtmqog7IN0eE/V5HU0HCFJ5T5rxTkZobQcI9sMKqS+09qf3p9wvrZCuNs
 1D+jZ4K5AX3CwzLWplf7Cr5afsmN5xu6OsldwA2XRZ3TjyibZVet9osCnVHUCsDyLgM6
 tguF9oysjBlKQ3A8t7Ii2U8FTc73npVx4U+40053JeOpW7xD3ariE0BVVxIV9SCtoMJT
 YxQK5Jw4y5qwiH8f0Uxy/B2ri7OFbgR2pzq9Zp1ZHZLsIROAO3edCOjW55ZXr4L3VcSO
 r6tL7MkAnLinKnX3/t0ErAZmMU0JTBiL25/NiA7p3VLl2+2XQDHy+Vx6lyjFIbxQIHMj
 HoUw==
X-Gm-Message-State: AAQBX9dfB/0BQuDH4ERMZdecZihcFGsvermoY/6ETmIb4aYR7zKrDoV5
 +PwYKCM/IPjninSb0LV/mQEcQCPXXdSdgXQHldY=
X-Google-Smtp-Source: AKy350ZJ+dZx4arE1dDvn+93xqmfAgQekaQ5sdLBd5m5/mFFyw1t5hipklNUBAa6v3f8yS67ujRRZg==
X-Received: by 2002:a05:600c:253:b0:3eb:3f2d:f237 with SMTP id
 19-20020a05600c025300b003eb3f2df237mr5280415wmj.6.1680710726924; 
 Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a1c4b09000000b003edf2dc7ca3sm2586415wma.34.2023.04.05.09.05.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:05:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Subject: [PATCH 05/10] hw/arm/sbsa-ref: Include missing 'sysemu/kvm.h' header
Date: Wed,  5 Apr 2023 18:04:49 +0200
Message-Id: <20230405160454.97436-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

"sysemu/kvm.h" is indirectly pulled in. Explicit its
inclusion to avoid when refactoring include/:

  hw/arm/sbsa-ref.c:693:9: error: implicit declaration of function 'kvm_enabled' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    if (kvm_enabled()) {
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 0b93558dde..7df4d7b712 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -26,6 +26,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
-- 
2.38.1


