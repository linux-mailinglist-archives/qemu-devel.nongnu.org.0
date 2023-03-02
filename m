Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046FB6A8B28
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNd-0000lZ-KK; Thu, 02 Mar 2023 16:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNc-0000lB-9T
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:24 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNa-0002Q9-RS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:24 -0500
Received: by mail-ed1-x533.google.com with SMTP id d30so2513617eda.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XF7DTM74fQWpIJe9B7uEqXjfqBgwkhC/Uiwzy7Em4Nw=;
 b=D8p0NJd1qcc3Pgf0pjbXHhl9ksA7jcVb5wzvFnBrGT1tAfkBziDFxry6PexkPBwouH
 46irisoY/p7ZVdIj1uiEuWnBhRU9aOCYjSLsVoip8jOBcQFuZrQ3l8hodhCM+RWIxquD
 csJ9LfNRPYquS4vDfNp442qEBOpR6jkyp7ZxrY4mVFLaopiU5S+VNBWEpHOsOsDYj2pX
 9Ggjv3sN2bvILSBBhGtZcCRL8Si9at6uWqcjnAuPRBqWR4qxZEycY5AykuTyCsMrGp0w
 ADhBUSSrIlzPJkKC/JTK1EL9r8JRZG8lZEeLtdgh2uU8ov0ULO46Oh6mNCYQkhsdflLn
 ybcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XF7DTM74fQWpIJe9B7uEqXjfqBgwkhC/Uiwzy7Em4Nw=;
 b=bI3HBFYIdIHggUZBaBmUd3DNaRUYlsUN7A/OPh/AfQ9h0HuQkwV7Ev5PbKwSKhntMC
 kYTUAcssxLcs0dDGQBowu7CQbdUj8qft7EEvgaV1WU2XmQJZVZW3EkvVj54ifYf4mU6C
 q0FkKMkQ0KYsg21kAIUZFn/QS+PR0WySpJkXwOWmsukTC06RTuwLOPBqMqRn3MhZ10m9
 z5v4WvF1n0mMNGtO9dE4H8+/OD/SNm4GZyRE8HOOEL5bh3pZiBCxIOExB9FXC6PKbaxC
 0MSnlGIBmtic6qM2ZXsY5kPJ9KqFBeUuJ4xk7yqiW43XmOBi36oBbe64SFNk4cW/a6hC
 LNMA==
X-Gm-Message-State: AO0yUKVdpuVPZGKIGyWImIUD+O7InV5FPXsMyg2P2hqgvoQK8ueKesA6
 j8QP5crSEwT+URNhqMJZJdcxp9ECfMQ=
X-Google-Smtp-Source: AK7set8lIy1AaLPsK4BGiEwpi4n+ppdvpcj/5PnJG1INQC4iXmuwCSUPDshA41cHpYZGqY+7L/oFPQ==
X-Received: by 2002:aa7:d94c:0:b0:4ad:5276:8ea4 with SMTP id
 l12-20020aa7d94c000000b004ad52768ea4mr11247957eds.20.1677792141942; 
 Thu, 02 Mar 2023 13:22:21 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 11/23] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Thu,  2 Mar 2023 22:21:49 +0100
Message-Id: <20230302212201.224360-12-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-23-shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e11742ce42..15f0105240 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -145,7 +145,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(DeviceState *dev)
+static void piix_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
@@ -385,7 +385,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.39.2


