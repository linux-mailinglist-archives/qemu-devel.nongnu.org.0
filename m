Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2786A8C22
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcA-00074V-DT; Thu, 02 Mar 2023 17:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrc7-00073y-Um
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:27 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrc6-0008Ni-D0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:27 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q16so619608wrw.2
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBU+8jdhjCYbSlld/hmcA7nJYY2utc4DYNvGGjyLRLg=;
 b=n0/7lUwEOFQu4z7Uz/XunGZ/aSRMTUgk6d35oeLKW+f7siuafmKtyGvOZYBcdMzPZp
 PddLv2zeG/pRLQSJynI114jC/FN6Xt3hjyRSi0xK4fXFO4KK+n9MwgKMb8CxFOhao+P0
 gHnVQcuGXJohuWxfNjvN5aWMvwEM3DgRIX2U6I1pFnFR9rX7GyMr6aEcO7otPIoeE07x
 PPN5d/a/Dx3mCroJzs35ZfyhdNzRDEpQFbZEzPuKsc2/AWC/x77BOamjI00gfeRss53c
 w2RZjxXPpFhdrwL2vnD45ADQDpN5/wSwWzg+wFolxowCWcAdwXuf2oGi245DQPjwmVHX
 KAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBU+8jdhjCYbSlld/hmcA7nJYY2utc4DYNvGGjyLRLg=;
 b=cfH4lAJTDDuMYCjean1eV/DAI5Fz/jfEvj90BKv7LAAlsFUG23j1sTVlAAye7qDhUm
 mK8R1kUauNONVm2tDqfBTsGSBphcAORSOypDPbggGkMDIIZv29Jo61uFGju7FWxqggQa
 3pNyb5np3Tr8YmtF1ehjADV42TrItpfjDBDPmHfkbzD9Yxxmo170+Fp8et+PlXou5Mx0
 Tu7saJS3WAy9GIm8sDFL+KdVBNQL8lty1iurdedZtYjE+EEKa/p4M9bAuaJUAB7MGs0P
 6GuA1PmEi6irbm4tDQH1ixhNHPjCSNRpBTGrrrTUFz/3zRGE1hvuQBcdxQ+bT0n+Hy1G
 UTyw==
X-Gm-Message-State: AO0yUKVskC8B7VVZuhgheOZgCSoyJYphL/fr3dx43TQGxdFXZPDVmTjc
 zFEh225Q3OTMQTLlV71MrWZUl6UcXuWKstKj
X-Google-Smtp-Source: AK7set/jAHe9MIJ8MxkrxDtuqjOugi5d05k1ZtGm3TrKR/JfXo8iKB6uB7Yyztas2/BEbal/p+t2cw==
X-Received: by 2002:adf:f9c5:0:b0:2cb:eef2:daff with SMTP id
 w5-20020adff9c5000000b002cbeef2daffmr8803089wrr.22.1677796885442; 
 Thu, 02 Mar 2023 14:41:25 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 o14-20020a5d408e000000b002bfd524255esm497315wrp.43.2023.03.02.14.41.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 03/18] hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA
 bus IRQs 14/15
Date: Thu,  2 Mar 2023 23:40:43 +0100
Message-Id: <20230302224058.43315-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Since pc_init1() has access to the ISABus*, retrieve the
ISA IRQs with isa_bus_get_irq().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 126b6c11df..1e90b9ff0d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PIIX3_IDE);
+        dev = pci_new_multifunction(piix3_devfn + 1, false, TYPE_PIIX3_IDE);
+        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
+                                    isa_bus_get_irq(isa_bus, 14));
+        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
+                                    isa_bus_get_irq(isa_bus, 15));
+        pci_realize_and_unref(dev, pci_bus, &error_fatal);
+
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
-- 
2.38.1


