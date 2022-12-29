Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2788658E50
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:25:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAulW-0001TR-WD; Thu, 29 Dec 2022 10:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulU-0001MS-Gy
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:24:16 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulT-000800-3k
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:24:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso6844780wms.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0IR45+1k3KGq6akeAAYqfenh8SpGHNSxj9mXYNisiA=;
 b=gY1UHiIOTezzuKxOHGwrjy4/sPHP5UwkD45Y4v8JkZnsbSOVLcv1UGS8hDsQtj/n9e
 3rVJiWXabt3HjcdQlbA9kE0oJoJ9+r+nJHNNj7caQgNTk+XsTjwTTKQynoRWFSOKBd3d
 kJe/KQK0BLvMdkEpNnrC4y6Y9sHieuGz2lc26fUFjMwCbbYc1JQptfUA60hh7j5PqfFp
 /9CDMSyqUALg5FzopukQ462tiv69gvvCgkCTOJZupFwZZpgbjqAmEm/wOM/aOrxW8x16
 yVsIvg+d0BD0vHKVOz1Frxwd9XvLixoWrMd2uBRzEPsiQ8YpGSpzVKYU3nhZSdv2DlVA
 bbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0IR45+1k3KGq6akeAAYqfenh8SpGHNSxj9mXYNisiA=;
 b=Fa2z6XC45CVaMGsoODZ3JEaF1Sx81F7D7n03IWrSyu2yls8df4aO5BRNCWqWLJVCf0
 p5PPFCecAMrN4KSoOLiFToR/QgijLu/A2fR5d+hYbH1Mm1SOEezkQBLCmUWaZMqCOMHB
 NwfZH9SY4WnyCe7DrDOeaAkJoASmjnPd3bY+6+MeunZQCpS9NOdV6xD5vgmgUsROdadX
 cBWmraN3qtOTKU9GFULz9DRARDhECi2qLAZ4nLVkCsm4k0QSxoc0cPzSR1welYKT+Mng
 VH51fHD7qxIL6anq90lhYowqIKHiylyT/LVYpIvdJ9xfjvXlRaiqlNYXvK/bNPWEZwHS
 m33w==
X-Gm-Message-State: AFqh2kppmdndD7oZrqkelNbg7qm6ERerdQJZ7BKKCEMpLOeRCD23BUiK
 WwGSyJYNfjVO8/9BV2V1n1x4W3VHKZqVLlYD
X-Google-Smtp-Source: AMrXdXsQdPsAb8zn+TH99Q8WlHpyYLE/NByojLROhCh0TEuOxl9ZGRklKvPj6NXHoFTMNcsTD3jP3A==
X-Received: by 2002:a05:600c:538b:b0:3d9:72c1:62b7 with SMTP id
 hg11-20020a05600c538b00b003d972c162b7mr13091743wmb.7.1672327453689; 
 Thu, 29 Dec 2022 07:24:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b003d998412db6sm4185679wmn.28.2022.12.29.07.24.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:24:13 -0800 (PST)
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
Subject: [PATCH 8/9] hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
Date: Thu, 29 Dec 2022 16:23:24 +0100
Message-Id: <20221229152325.32041-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 02636705b6..788827ca9d 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 768 * KiB;
     sc->secsram_size = 9 * KiB;
-- 
2.38.1


