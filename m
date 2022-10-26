Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6060E990
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:49:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmMc-0003et-Dx; Wed, 26 Oct 2022 15:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmME-0002Tn-1i
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onmMA-00072H-7P
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 15:46:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a14so25425445wru.5
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74DDUYUGfeWypaCG02ItfjGfd6cxkR71vlmSf2VE7U4=;
 b=nsApW0arGsOqF+SyXpo1/yhstAHOOGWB2zIzfF6pre6KDDaWba3M/ktfZZjTgkcYyy
 nEqSf9HVYh7CPpDazizcEAZmGRUb/iff+cqut2SYWF70MfrJ52dD98WJ18WSF5ffZQT7
 IzleLgsgTJimQL8VokjSd2BavlbZM1eUFYC7qsF0NgmUnQuSiINxXiA9vqonHru1oIoY
 oJHmhGCqsW5dR6wTAy7CQ6b8qqjpsAbslMfgE+8bniFCa1VzJq6FH+bnesWMLB67dl9g
 7Q3W6tl2iHilBhnLUtavWEY+lvbDLKbKlVpOxTHA6V+IGa9oEro3EoOxElJ3Od1z60pv
 mkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74DDUYUGfeWypaCG02ItfjGfd6cxkR71vlmSf2VE7U4=;
 b=RuEkicnkHdWjx4BBssrHEgfKxVt1pQtsreNLVg55UnolhqDlqOfGsOUuGW2sZ5qu84
 jOwJzX8IX6VvI2E1gQ+jCwRHutPkhP1iH4JdO2tPIy1LfSn8h3fdduBoXIPpCWkOXr6L
 6SiQeh7D+6+Ua8L2GQds9jvBPy+wWVCuSOYVRfgf81eq8EL5/GkSlI8Ti2upvWmE3Eyn
 SwZ71eFK+S53POcWU/ogH5J/Cgk0b+/CVGuqC352JP4B8DAf4jviOl7OptQD2Z0DAhYI
 hbvd8m6Ra+v/XJIR9Wu4b7flf0fnMEzftWYM+rWcRGA5WSlGOYZWL/3elBa4NBScixdS
 q8ew==
X-Gm-Message-State: ACrzQf0mSPXnViY5OvmMj5HhQ9GDZRvqldonB2VGw0D1JtVeHmfa3Psd
 +2sUAsM2IZgtRI5RBHji9U1Dpw==
X-Google-Smtp-Source: AMsMyM7H4oSSp1lIVvYWf3obnSCosyel39KH6qEx+AbWLUgPXTAu1fCkBVbdgHa3Rr/x3lo4uJgq9Q==
X-Received: by 2002:a05:6000:1864:b0:22e:5e05:b1f7 with SMTP id
 d4-20020a056000186400b0022e5e05b1f7mr29630127wri.226.1666813588094; 
 Wed, 26 Oct 2022 12:46:28 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b003b47e8a5d22sm3058441wmq.23.2022.10.26.12.46.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 26 Oct 2022 12:46:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
Date: Wed, 26 Oct 2022 21:46:17 +0200
Message-Id: <20221026194619.28880-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026194619.28880-1-philmd@linaro.org>
References: <20221026194619.28880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

The PIIX4 PCI-ISA bridge function is always located at 10:0.
Since we want to re-use its address, add the PIIX4_PCI_DEVFN
definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 272d93eea7..df0f448b67 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -72,6 +72,8 @@
 
 #define MAX_IDE_BUS         2
 
+#define PIIX4_PCI_DEVFN     PCI_DEVFN(10, 0)
+
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
@@ -1377,7 +1379,7 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
                                             TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-- 
2.37.3


