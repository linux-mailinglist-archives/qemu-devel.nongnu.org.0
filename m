Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC476597CA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:38:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDfj-0006IN-QC; Fri, 30 Dec 2022 06:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfh-0006HO-4G
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDff-0003sH-0f
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso15042340wmb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI/G5H9E5YA8omUhdoABDbtm2oFm0oJUgcY9rScXwCA=;
 b=SVFtgJ2Lg7daTov8oRsCo8y6i6JXBNA/M9JMe3S2O6ZzuMgbewoJwL/YsXhNCRLRBi
 KKXXOaLsZULNgFFep8vSZTWSHsmJVQ8V3UtYiSGVLs1LTvPby1KdwlQXWyduTPq9u85g
 awmupWGCwtduWRDUm+/GtcG7WYXoDWfuspQNyS0A+7s2yDcwyxOC3+z0WcXwXK3Gf0yI
 +uLZbsyw5HiZTr33I9IyN1tZd1d8m8eCgDVgIYfxcvBoPaPEJijTtMUc1JFBpE5GCvfT
 cuJiXsYlAjd6wH6b5ttARo6VWoSnUa21MXrsTke2ChPCSLw9ywdUnMXi2f8l5ueY2c0S
 NGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YI/G5H9E5YA8omUhdoABDbtm2oFm0oJUgcY9rScXwCA=;
 b=JPnCmlKyUB6TY6P2XSkwSYG4seT7AnGmh3yC74/0BTc2HnhZs85zpEJqT4byvTrTRx
 +5NZDmfe8wGxCvWkPpq/EXMjqPsRaCkLZtWXfPPbf6ncPAId47om0VKtChgoAzJZlCEg
 w8tqYU4fh3q3DXr98jYRECw9gXHyT6HDpUZ1vzyKQxc61/4OvRf32bE9NOgvMONhwNAb
 zraQnd675SvS7T7RJvJitHQYYNRw8K3kcwyZfS6FPQ1zqD0A04ldP6QbH28k3jarOw2Q
 Y62eRajPVE53LXzBrXWl6lcHq2+5c3RWFZpYMREf23Z5QaS3UWEx/sgfhzcA+IYy6UHa
 J26A==
X-Gm-Message-State: AFqh2kpHcVOR0yaFAuQFtPwb7Puz5/+67BvJlTjtUAm6m1671zlC3eCi
 n81hRJ0ut6OmHa+g+zPyAoapErnRFar0zwvw
X-Google-Smtp-Source: AMrXdXvgxxK3iN5R+by4vWOcpswzxiemrfEnWa9mbBO4yGPqFM+fB+C6BK9d8TntxPkP4ER6wS2kgA==
X-Received: by 2002:a7b:c3d2:0:b0:3c6:e62e:2e72 with SMTP id
 t18-20020a7bc3d2000000b003c6e62e2e72mr22841825wmj.13.1672400129276; 
 Fri, 30 Dec 2022 03:35:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c2d0700b003c6c3fb3cf6sm26627128wmf.18.2022.12.30.03.35.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 04/11] hw/arm/aspeed: Use the IEC binary prefix definitions
Date: Fri, 30 Dec 2022 12:34:57 +0100
Message-Id: <20221230113504.37032-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 3 ++-
 hw/arm/aspeed_ast2600.c | 3 ++-
 hw/arm/aspeed_soc.c     | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 122b3fd3f3..3500294df7 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
@@ -348,7 +349,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->name = "ast1030-a1";
     sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
     sc->silicon_rev = AST1030_A1_SILICON_REV;
-    sc->sram_size = 0xc0000;
+    sc->sram_size = 768 * KiB;
     sc->spis_num = 2;
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a79e05ddbd..72df72a540 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
@@ -619,7 +620,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2600-a3";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
     sc->silicon_rev  = AST2600_A3_SILICON_REV;
-    sc->sram_size    = 0x16400;
+    sc->sram_size    = 89 * KiB;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 4;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2c0924d311..677342c9ed 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -517,7 +517,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2400-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm926");
     sc->silicon_rev  = AST2400_A1_SILICON_REV;
-    sc->sram_size    = 0x8000;
+    sc->sram_size    = 32 * KiB;
     sc->spis_num     = 1;
     sc->ehcis_num    = 1;
     sc->wdts_num     = 2;
@@ -544,7 +544,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
     sc->name         = "ast2500-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("arm1176");
     sc->silicon_rev  = AST2500_A1_SILICON_REV;
-    sc->sram_size    = 0x9000;
+    sc->sram_size    = 36 * KiB;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 3;
-- 
2.38.1


