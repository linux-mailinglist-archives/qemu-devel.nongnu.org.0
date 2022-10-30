Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3926E612D8C
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGtn-000050-1T; Sun, 30 Oct 2022 18:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGs4-0003W6-RP
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGs3-0000Fb-8g
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:33:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id bk15so13631859wrb.13
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92o+6CBAVgkiKf8oTcJaZlQEwbuXO48JKqQmwQlE4NM=;
 b=lEKBuZdJcEluQ+wWzBveOuvCz93WdsS4nwYT4dU5R+pxAAdps5ie5t0HkRLckFkxbo
 RWMLn0GXpuRLBX95YPIpkbgQfDF4YTqxSRl6WirvNNcrJ08H9MqSMbXvufW3jcx9n7X0
 BlWwkYrAerSYmysqbPFFagyZyX0Jh/IrPpLgJI41sdL11xRbGK5J5+fJlmtdWoJIboHN
 MgwDA+dbWCjhD1Sv6PLY8sTjaEg92thxu4Mh0SAaQVRTtzD0qbyTYImSfQcrjtMTyKHs
 MHKIC6FYzayafiuIBxX1W5TClLSVfbbS3UrpGI+X+iFGZE0fL2ST5P3yLLNOyq6fWnSW
 5Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92o+6CBAVgkiKf8oTcJaZlQEwbuXO48JKqQmwQlE4NM=;
 b=3vbwQkCwlHYdCLVFYDt3bmS+ZR/qpCOQ15/5wb3kvW+OVJW0+uYo4cmZ5O+exkiLGK
 ZPLnuGWMt+olzzeZH59oQg8j6Q/h6ADVK1ybVV6eZ9d685TqGFHeo5Z616pqcUVSc9e5
 hP5LxU+EpqVn/URkj6cJIpA1JWAQgur55uh1SMh8MBFqEZeAeXJ/P1mKpE4jUIoSQZqT
 0/ex3F5mNL5bZBLi1HI2gfdt/o2vbbWYrJ+ArCbhEuJ3oI937EZ3YcIHBD6immHZVJev
 QKPCxgPBTA3RPg1Wxs8U0hrO7R4KDGdiBVoYXeweYcSmXODhRilFt/kLsarHMUW0nq/k
 a0Gw==
X-Gm-Message-State: ACrzQf0HkYo8/eBX9im5N8RuIO1qaDzZnwJqQvhf0hCz+jr2I+GYA7K3
 xa+V7jRu0w18Z8eoqAgxK43DNKbu4Kanag==
X-Google-Smtp-Source: AMsMyM6nRdwRkspsrkevPTaA7g+OMpdcEm5vaGy9rylb8r6/YfuEMArA2H0j6+9X3qwjW5GaMOVbag==
X-Received: by 2002:adf:aa8c:0:b0:236:6e59:99ff with SMTP id
 h12-20020adfaa8c000000b002366e5999ffmr5789416wrc.688.1667169213872; 
 Sun, 30 Oct 2022 15:33:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b003c6f1732f65sm2964076wmq.38.2022.10.30.15.33.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:33:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 44/55] hw/isa/piix3: Prefer pci_address_space() over
 get_system_memory()
Date: Sun, 30 Oct 2022 23:28:30 +0100
Message-Id: <20221030222841.42377-45-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

get_system_memory() accesses global state while pci_address_space() uses
whatever has been passed to the device instance, so avoid the global.
Moreover, PIIX4 uses pci_address_space() here as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221022150508.26830-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 723ad0a896..0bea4aefe7 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -301,7 +301,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     ISABus *isa_bus;
 
-    isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
+    isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
     if (!isa_bus) {
         return;
-- 
2.37.3


