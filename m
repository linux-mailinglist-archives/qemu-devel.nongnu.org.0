Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2D60E995
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:50:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmMe-00046f-SK; Wed, 26 Oct 2022 15:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMN-0002wr-Ob
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:47 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMM-00073Y-6e
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d389c41so1416214wma.3
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FideTTwLBlaM3Uj+ggSbpikD+Db2qX3oNiUh+CsQYlw=;
 b=yu1ceNDVH81LxEyeI1nO/XErjQQL2jyh42S4582vkKFMIN9r04hTw4O1So+/kBjRMD
 5dDipl11lI01ItBtU3AXX3YDpIHXpUoe3DuQoKFxETpRzEL39E9gCUstSgILTblBUjrb
 LlLYnQV7Fun8K3QHHfZYEItGXDtxjhPFUd82UzJmwovCzQcQJb2WyBJ6qBMJtMivpyZ4
 QzeUUtJtQBiJEUB81drjvlK5DcNVkhAj8BRJyYq3Pn9IhWcbm3ux75DVJLgs5RW9Xlrt
 XRhFcMFGO+97brM5DDGx8LOsbiop90IS6yoy+GV9Lq7zjAXmyKoxrgzUS4jaqYlZpmho
 Scaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FideTTwLBlaM3Uj+ggSbpikD+Db2qX3oNiUh+CsQYlw=;
 b=GZ0SC9jMTWtmAq2+6jHTiHkMgI6OQbE1aI2D68dHLydfYBGbGHBc9gDT4a2zioP9pW
 4C1InNHm5mBuxSAv9LCRbK7oE17VKsG54lJxClx2xLHcvb+LJEd1o3psq8Fiu+W1KyCq
 h/cEtjwnmmgPQcOkcyQWzScp5sVt8xJMqOgEeCA4KvGobV6fHDjzmycuv6f5+JWhTdvx
 qyIpa9payB3ylxXOyCBHzq518/EHnAcx/dgaXhYpBA07EdgjcUac9EvrLavuglPG2zae
 N8GIoAMnKV2Oody+CDl0zAb0YFyoD7Ej4I7bNXPm6HtijL4rI9Zxrke1sa5hikSqshWA
 ICfA==
X-Gm-Message-State: ACrzQf2G8LZGsGymTgeJvXbqHoUmPCIhJO7eTkyw0oG+sA0Uym+iIjqO
 hYZnXxrkkSPhH3h9YmJ9YO6iqA==
X-Google-Smtp-Source: AMsMyM6Q38d8s9NFSUAYxIWn49V6Plbc6NoM71jdnUVe4gKryVNqawYUtqkuK53DX/akeRPy82aCEA==
X-Received: by 2002:a05:600c:3b97:b0:3c7:14f0:f8d2 with SMTP id
 n23-20020a05600c3b9700b003c714f0f8d2mr3634432wms.159.1666813598434; 
 Wed, 26 Oct 2022 12:46:38 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a5d490d000000b00236674840e9sm5908156wrq.59.2022.10.26.12.46.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:46:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Wed, 26 Oct 2022 21:46:19 +0200
Message-Id: <20221026194619.28880-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026194619.28880-1-philmd@linaro.org>
References: <20221026194619.28880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..a2165c6a49 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[0x60] = 0x80;
+    pci_conf[0x61] = 0x80;
+    pci_conf[0x62] = 0x80;
+    pci_conf[0x63] = 0x80;
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
-- 
2.37.3


