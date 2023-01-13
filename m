Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4138C669D1C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:03:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHz-0002kM-2x; Fri, 13 Jan 2023 10:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHw-0002jI-7q
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHu-0006US-NP
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:15 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so2140240wrs.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIm4MVJ8aUOwKK7xBJBOGuVSBH/I4+feZNPHpy6igyQ=;
 b=ARMoEgehhuc7B+LJ7woHqqRzoi+Af9HPdk7PY/h91/RY6bQ83N1t1Oq/nOQKKyeUO7
 qnQvLsNRRE/0A4Lv/or7Byi0JofykhjdYulGH27efuwddu4oE6Vgx9Bawo/SsGD+J7v9
 P3abHaIy+h4gQpeMunkDiGEGzvue1wJGxewsiLHrdIPWXNUVv8sUPps/C789EoxpUh2J
 a9b0CiPtA/iWOX+702/kEBTCZhnan9H0H9uNxBvmod9/Idjbh4LGkCytK2+c9soJ1/EO
 J/FzXYmyGNLm4OJj+cBkARHbRZ/GzBpeLzCjzi+AJrLRUIRek7jUgVz8c7GRJi+CCw/N
 itDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nIm4MVJ8aUOwKK7xBJBOGuVSBH/I4+feZNPHpy6igyQ=;
 b=SGYsXMcRba6R7qiQCIzyH7kgXNIHwzSbEa8oocy3lx09FraMTZlPUEesFv8fi/JuA2
 8+CCukbASTv6pq/dm+iP4v6DSBaANyIROEMiz5g5OAaWeb/SkxTI/EIggrgXwQkezVaX
 oNhD7kqmgCnqPxC1bMtZvotgPp2EBIPLk75sv0LaJ6eDr0pgC32b+HWsbJyJ9SvC7wlW
 /+MLafStaqWeTz+suN2X8aDDrQ079gv8Ml3iPIDG8Lu4KHzjZQUHxVrzorFfO5GoxnlQ
 LMjaSLFJ7XOLSuZUzJpYjdpQcAi95UofNOhYMDiar2H20BhMJNCDr31VkfXxS5LFpsCs
 iSrg==
X-Gm-Message-State: AFqh2kpA2Bjdq7OS8z/t96VXdjL3sOWP4w2p1sSMnhSopfDYzZj02QcO
 N+aHjJfwbf9A7F0nCUpJfCf4R/iCB7kceLP8
X-Google-Smtp-Source: AMrXdXuSv+Rzu3Vt1ganL6gTLqUWk+g4z+AQoXR00kGnzeG4UtTo4/72bjSFb14eK0zEZNFbQfcH6Q==
X-Received: by 2002:adf:eb04:0:b0:2bc:7e19:fe84 with SMTP id
 s4-20020adfeb04000000b002bc7e19fe84mr59990wrn.62.1673624893855; 
 Fri, 13 Jan 2023 07:48:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b002b8fe58d6desm19382149wrj.62.2023.01.13.07.48.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 33/46] hw/mips/Kconfig: Track Malta's PIIX dependencies via
 Kconfig
Date: Fri, 13 Jan 2023 16:45:19 +0100
Message-Id: <20230113154532.49979-34-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
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

From: Bernhard Beschow <shentey@gmail.com>

Tracking dependencies via Kconfig seems much cleaner.

Note that PIIX4 already depends on ACPI_PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20230109172347.1830-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/devices/mips-softmmu/common.mak | 2 --
 hw/mips/Kconfig                         | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index a125e74f24..7da99327a7 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -17,9 +17,7 @@ CONFIG_I8254=y
 CONFIG_PCSPK=y
 CONFIG_PCKBD=y
 CONFIG_FDC=y
-CONFIG_ACPI_PIIX4=y
 CONFIG_I8257=y
-CONFIG_PIIX4=y
 CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 7a55143f8a..da3a37e215 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -2,6 +2,7 @@ config MALTA
     bool
     select GT64120
     select ISA_SUPERIO
+    select PIIX4
 
 config MIPSSIM
     bool
-- 
2.38.1


