Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815AE658E4E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAuky-0001EZ-PV; Thu, 29 Dec 2022 10:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukw-0001Do-Ok
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:42 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAukv-0007qp-7e
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so17638919wrz.12
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QdQ1jhSiAeTlE9odBywW4XFvZU5ijZarJfBTLLFf7vU=;
 b=HXSpfGpy1aFSVbilt9b4Olo6JiuHd8pS9IuiqUDKHj8nlHDfOwPiASwRCSWFlS3AIF
 Dp/eF5Six5956/LAi++jBk418gD3mSHnxdpj0SVGp6pW1q/44+Th9bgDyizN9mAllFur
 bAnkGBhUXs4npphtYW+nzfqipE9YW6yXjqdMmTI3mxqBjzqpvKaQF6b9yhsUceqZpC5/
 AfoXU/4P9kW/5ZdfizBM1XGZYJuaw68/owlHWESEynidHipNYjrF7E1Z+hPsvxzkZtIu
 JVbbvIk7j0CkxP1xYxtsoIRzLRuOfng+vuwizLlXNTckLs0+sQ4OFiRG02+p+12u+QsT
 73cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QdQ1jhSiAeTlE9odBywW4XFvZU5ijZarJfBTLLFf7vU=;
 b=bhlDEc8b8lL+dPaGDKralQ6eGTFtIbvY7kAqyJjvlcbZQrBui4G4knHPXsTcXE0FE1
 356xikxBuAwaN+DZhlwrSYrCbbrLCzHC4SK0KeKRIdJE2syBqi8lRrfa49Hds9enoB83
 3jKcT7G07b0KJgU8QtaHzw2/Gsk6tagU4tTToJsRx4H4RiDY3vQgraUGck9akLkDBi64
 12CVwKPo6szUjRviRgl0UVZDY+pt9VY9yDonMnV6tzXm4oDxTl8u21kQt9q+34Oj63pW
 tA8zYdDb5dVlknw0L4qZN28qOiOgjwJGFWDSRBM3LQXb3ZtH/u2zuKglR4R7Ti8U54YS
 XNag==
X-Gm-Message-State: AFqh2kq6oKBNgkLeX/M5I5AiuiHIWujCfwEWRpah1icOgNlO+30579Zk
 MjNybA8DobtvPTKBviRwd6ZPowXJ+dFYG0pp
X-Google-Smtp-Source: AMrXdXuij9BxMmwmWNs7jJgUt3a+BLGCgPaX8oq+WhvHrOFkeFJvATH61esoJ9Z/MwY+cuuB2h77Yg==
X-Received: by 2002:a5d:4008:0:b0:242:17d3:a9fc with SMTP id
 n8-20020a5d4008000000b0024217d3a9fcmr17708689wrp.30.1672327419544; 
 Thu, 29 Dec 2022 07:23:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056000023100b00241fab5a296sm18123222wrz.40.2022.12.29.07.23.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 2/9] hw/arm/aspeed: Use the IEC binary prefix definitions
Date: Thu, 29 Dec 2022 16:23:18 +0100
Message-Id: <20221229152325.32041-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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


