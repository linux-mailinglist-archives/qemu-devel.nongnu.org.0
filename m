Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83CD6D3E4A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp6-0001ip-NE; Mon, 03 Apr 2023 03:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEoz-0001fh-4E
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEox-0006eN-Jr
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso19164236wmb.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfruqCTvdLb6qQjpwkCpa8vgF1IvHI8+CFma9+fgJv8=;
 b=EAQ6n7WWQXPUjZaBzzBlO5S8qeAHPTlk8U7zS3dcf+8IIdkYRF+t76elBK5JMC6VvR
 MlevLDBVnopzGlcluD5E3paMkO9gGmS9AiWXwbBxrmfV6aY677J1hA7sEoOMZsusRhCO
 WtNuC4TBrqU9huTBhT4qaoJ3hKFDLVLwR3Q492RbdYmNN96sEoQRc05zQjYNBPUaYgFS
 wlTsF3d6qB4+ivcvqD/tRWrRuT7ASZ49jVudbsUe4HaCkTh0Jf88+s+oA9GGmu4u4jN4
 MYC4GsrKHzZxdgEsprYEQvYQ9+pe1/Pfl0wcjSFYsZgQhf3t0h8B31q//5p9hTJOJ1Gu
 dYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfruqCTvdLb6qQjpwkCpa8vgF1IvHI8+CFma9+fgJv8=;
 b=QO2sAfZG1z1E1UinGD5mX1LSlHe7rZs+D3WIQCPAbCMWXsh5qrq0AADjg4134Emkog
 m4T4eRX0uBRd2sqVZ1754HQI4vtsZaLo5ewuUoKUMMtrtHEVtdqfD6tO0i4F5HsNeXZj
 SOKnPCFLmoLNFQFpSo0ALMv4i1BEgYvgLk0tq1bwpaeLqbwHF6U6z5aMPUHxSoySROBY
 TcTNrctISAhVEQeZC96rIB8mwyAM1sxXGjtTNKkYHFeqFWfV/o/6e89gj7a/SluBwhqk
 Uk/2BWJf0hZxGcJuZgpfdzMrQmAO8M2pQscWdnmZnzjknQSaJ34Jrybaz4ptZH7+7Gno
 AdOw==
X-Gm-Message-State: AO0yUKXrYu88BVhuUVWqfx7rG2oABLzXA39s3c8lsfrTMP9e/a8dQYQN
 KCzeb+6NoHZ8Jr9BZH5/zw3jpsDtEl6oPg==
X-Google-Smtp-Source: AK7set9rrvyB0aTyq/IlC7IjQSr4MJ3b4hfbs5XNaEHQCEylCJMqyaqqp21kfc6RgszwCmJPmkED8Q==
X-Received: by 2002:a1c:770c:0:b0:3ed:454d:36ab with SMTP id
 t12-20020a1c770c000000b003ed454d36abmr25688857wmi.16.1680507701818; 
 Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 6/7] hw/isa/piix3: Resolve redundant k->config_write
 assignments
Date: Mon,  3 Apr 2023 09:41:23 +0200
Message-Id: <20230403074124.3925-7-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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

The previous patch unified handling of piix3_write_config() accross the
PIIX3 device models which allows for assigning k->config_write once in the
base class.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-6-shentey@gmail.com>
---
 hw/isa/piix3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 737f5c6a5d..418940139d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -308,6 +308,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
+    k->config_write = piix3_write_config;
     dc->reset       = piix3_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
@@ -356,7 +357,6 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
@@ -370,7 +370,6 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.40.0


