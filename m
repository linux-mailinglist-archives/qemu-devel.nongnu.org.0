Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34165EEF1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:40:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJH-0002q8-5s; Thu, 05 Jan 2023 09:33:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ8-0002kh-Gf; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIt-0006tZ-QQ; Thu, 05 Jan 2023 09:33:13 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s9so4301256wru.13;
 Thu, 05 Jan 2023 06:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHtHVYo4NVUXU56/alQ0bH+UtHEiwYpVK/P9pel6Axs=;
 b=aEY0wMTD3YdxwZa42PTEvDVFsEWtmp3JmLE71V6hJX/g79gJjLAJiDlMBvVORvBye/
 HqovYHDFSroGOaU82x23Kze0Kh2pe1BAbJwgWAwZaJESl4UAIta/z+czdJT2yPRBkjCK
 0MoS+AZzaQDcmAmTVjql9dLTKx/9+ZOu8uKGAyWi498OSsJvO837WMpd68gM9IvFJvH/
 rsYE97uOnVmtw8O9sYiN8fdYwzDfhachGYEwnJhCbSLDNnNI0beuRNtPpdvp5Dnn/3wF
 rc2z8rg/EHRoz2qDFKCx6dmMFifht/2Nk63dZFumKmm+z6AKyPC9/tLhDYjh72Ku3iYx
 L/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHtHVYo4NVUXU56/alQ0bH+UtHEiwYpVK/P9pel6Axs=;
 b=qVcoOlRj0FzQIFXfAnhMvf1w780fLAPd+AwdBqYEwDDAkXNojhBRa1ZSa1L8iFngXZ
 lNP/c7nL3tpmZYnMRjbt7gmIJx0odEqSQ2xvRylBIjEDtodsv/bXRWNvdjMlbhn7PPuV
 v+4hQ8JyNrE740oiI0pOdrXc1gxPXimWzLxqdSYrduC4GsPXR2QgaYp5txgl4d7xWpbg
 WZ8bR9+pocBNBl/w4G4F1wpOxkwQHRXWPBAtiDncA30TdXR6HWFukPdgTK73QYz9f0Hg
 ZF6rH45I1vIyCmevtY2fbh1/3CRDv71UK8r/2cNQ6optptIhzmHkOBxqK1uP6SmTGJgk
 qqtw==
X-Gm-Message-State: AFqh2krj3iI3E41vSPGNgV9b6RlgspVGfrjpKQgn8OMF0r3t3CRvGrFw
 yrQmegJcugUJ0CZYZ0szA53W9fGzi7QWNA==
X-Google-Smtp-Source: AMrXdXvhAA7EIT652OsLA2N4ls3es4J3UNE75oGE7XrwZ845BQLeHxrRuGmcYuKaGF5P5ueInkqC+w==
X-Received: by 2002:a5d:58e6:0:b0:26f:aaff:e98c with SMTP id
 f6-20020a5d58e6000000b0026faaffe98cmr27427553wrd.27.1672929189308; 
 Thu, 05 Jan 2023 06:33:09 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 03/31] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Thu,  5 Jan 2023 15:32:00 +0100
Message-Id: <20230105143228.244965-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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


