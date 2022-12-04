Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CCD641F3C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:20:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKn-0001kv-KV; Sun, 04 Dec 2022 14:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKl-0001jU-9x; Sun, 04 Dec 2022 14:07:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKj-0001aW-TB; Sun, 04 Dec 2022 14:07:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id m19so13032970edj.8;
 Sun, 04 Dec 2022 11:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UICViTJnHcQeaPYE3gN3Gm3w5DqlM81wlE2s7yBTyiA=;
 b=LLJLigkdA/HS2uZKgchUv31zw7VCEVYbolRx2Pr9Wns9YcYRn3nnqGo2IRatvDfCPq
 mxrGhlxmT81/xrFM78nO2UhNUK6owZKrzm7WII659nh4/B+TsvJCom0ulTjz+/kLSGlU
 82W+fLOSaWSOjQ4ZBnHcDyfbr09TYRph7TSir7MUvRl8n+a0QcXXO7Wo/oy6PlJM4bm8
 QwKGl0CiH3No7PZhfyigOm54lvSWZ0CLxDrUU+53A2q0fohpaxDu+DGbVAvNcimbo5Tn
 LJQ1i/5yhQ8QuDWXcbR9hOVrhG/YzWuCIj1A3oAyk2111O8X149N94Qh47GwC/O4nize
 PRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UICViTJnHcQeaPYE3gN3Gm3w5DqlM81wlE2s7yBTyiA=;
 b=xNa/6r6ol1ZMqPKaaO9sgw6w87IW8cf9hHgYegt3gwQu3jkmMyT6wMF+VStw445Kms
 csMark9n3jzQzHA1erWXMGKDaJQmcfOkjQ8C6+85U5wWRtc0tia2fQKF+ahXw6UdyQWq
 6DNOznJoaOtIVp2sBUNDeuhFlan/ofVSJcBZVPhSbkian4EZs5GCXf9YUPdsY0x3wQ0n
 EppwIn3DEg/699THDa2HhDnjdBMuXbeWIh6FpD3jMAYMtDBynAkE0MfMvlK4BRtzD4HU
 CThOK5L2JJp3iUyp7h8YC/BlrbvIId6hgoxDNQiLL6URsyhaauqUjaNe8a9GF/pntBLv
 3z7A==
X-Gm-Message-State: ANoB5pn3QYPl4HxBHm9scSVL1QrPkOwbMTHyhhCZiJFmxfvNQFLZ4QK5
 alsk6OhHT+7a7J3qrugOGTbzEjFB4I8=
X-Google-Smtp-Source: AA0mqf5lpmEafSc5J5puKhkpUJFggHIIAdjVWGGBwF54i3b8eaPxQsbqdAUaqGAo/0SRglPhTCrzvA==
X-Received: by 2002:a05:6402:d6:b0:458:b42e:46e6 with SMTP id
 i22-20020a05640200d600b00458b42e46e6mr71724753edu.375.1670180843449; 
 Sun, 04 Dec 2022 11:07:23 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 03/32] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Sun,  4 Dec 2022 20:05:24 +0100
Message-Id: <20221204190553.3274-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
index 8fc1db6dc9..0d23e11a39 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -116,10 +116,10 @@ static void piix4_isa_reset(DeviceState *dev)
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
2.38.1


