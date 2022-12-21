Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987D65348B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Sz-0002nT-R4; Wed, 21 Dec 2022 12:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sa-0002ly-HE; Wed, 21 Dec 2022 12:00:52 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SY-0008Bi-OM; Wed, 21 Dec 2022 12:00:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id fc4so38187091ejc.12;
 Wed, 21 Dec 2022 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHtHVYo4NVUXU56/alQ0bH+UtHEiwYpVK/P9pel6Axs=;
 b=A7mlrkZ+8JH4o5MojQBoo/ZjKtYyRxDBViFMHDczrvDAd6W/pctQUv96oJUemh0e9D
 2r46gHFolry1vZ0EoTgfZyv/ybzgB8X3kr40K0HX1/Kh+IEJCe7lF8P+hH0TIQk1Umjn
 32jzCEBXZzgHNI/JwjZn4IjMHy31E18MZ5ihZXOkfmTD4/1SyIPT9nccDUxrF+uw5EI3
 vAczdfyxI/PkXB/2Fd1rBnKKnaoGmczKPt0LJHqOid2tAJAAbJALt8EEpGHy9cgmueYA
 36cGIEV3qYrMkTJvfmQDx6uDnxzP+Z+bwyKgUByPxhzzyFkgrKStzZpsbGJHNcolt2bn
 sizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHtHVYo4NVUXU56/alQ0bH+UtHEiwYpVK/P9pel6Axs=;
 b=43JGzEFr5hyHvrP0enQCvRgJLyIaT55UFbZDJfDlSQYZLSYkW+ayEJhrBk1sRk6tr0
 PmMXA0wx7dqWO5dDFsLR6Ecx8gbrU/k6rHESL4bE0dMDsK5CbjxOjZWgGSKSnC3JMmaw
 IhB/W7lHiDM7K4U6hQOPQcr/N9FJS4yE3VhxfC4xpIUOW7Ukk0WS8fIHuo6dfQh+ZWwl
 mmXlq8z48DkquPO/I3mH0igYVmAkmSDT8BOEEReH5fNYLXq2A48igjSCTA41hnU8XTmB
 IEK5ViYnAoZ/PQJdzeI6oQHkpQkr61N+DiCS/mmV5kFQ2nmmCXV/6sHXjkmmzz2433LW
 R4Ug==
X-Gm-Message-State: AFqh2kqlUZpkJXZtT7DztT0JI4OEjOCelpxG1W2nlbVxtOtEXRTLLP+M
 7CeXGLaDje8wvJqktuP5UBVvmL1tw5s=
X-Google-Smtp-Source: AMrXdXspYuGne4A/qc5mGEpNvoAw0wxq1JEoVugCSTE85lTIGyqPsUCuECDDdbypa0OQ7MknFZs30A==
X-Received: by 2002:a17:907:9877:b0:81e:8dd4:4ea6 with SMTP id
 ko23-20020a170907987700b0081e8dd44ea6mr1770296ejc.74.1671642048724; 
 Wed, 21 Dec 2022 09:00:48 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 03/30] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Wed, 21 Dec 2022 17:59:36 +0100
Message-Id: <20221221170003.2929-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221027204720.33611-4-philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index eca96fb8f0..6e9434129d 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -91,10 +91,10 @@ static void piix4_isa_reset(DeviceState *dev)
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
2.39.0


