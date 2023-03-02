Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCB46A8C13
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcu-0007nF-1m; Thu, 02 Mar 2023 17:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcq-0007fg-Ah
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:12 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrco-00006N-KZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id v16so661070wrn.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H5itDKkjjwbFDWZM5dfCKNestHYP2geb5DKzbrDRTD4=;
 b=PAVWdoThX6qssLgvIeIXrd8xehaHHU8GzYhQJpTra3qrcajjrG2kbnzHyXnVE/5hCX
 s1++DlVlg7ThRO/dfTlDYDNhcUpABbIRkbsBig1rbNe9ZNbk3LKMtqN+fm/3z0pN9tH4
 Q1HvfC7B4exa8BptZ49b0OPsGc9mZaX9vYEFxKbSwYblrT0JzAPG/otw5kKsNCw0YBM6
 Qb5CUe3jpI/NcW/5GDoKOklqwe//Z/3i8dQgl6pvq87RcotLvnCaKnOEJJbBh20stWZM
 AeM0J61wMeL3F1tKPZOljMeXGnQF0hadKQARCN5bNm2/Hxb3c84gqFHw/wJPOTfL55gI
 f6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5itDKkjjwbFDWZM5dfCKNestHYP2geb5DKzbrDRTD4=;
 b=AtwP7caMjKTaABQHlPyg29QC5J6jyegwS0YGpAOtLVJGV2rBPysk85S3vvxwZkcF5t
 wBwsvGeJT8oZSa5n7hmUvFWwH9lVO2SXRlLULQQ0EdBD/8B2/J/SXnI7tBwOVTqAxfbT
 btUjtZP2ZJ0Ip6nKhwijfI0m3r3w5/lv8OV20XBOX9B6kyTqcHVYSJfQvKw7kimzr2XO
 SmPSBkB8k/udbtLCykQ00M+21KnWP7rbQboRJTREFouVysd47NzxCUwxAzHQT3AVuQFZ
 lukV/kjRDqOeu7VQSwmL2xh2vmNLbRQv33xitHrOEo0xCtV7M4E+nGa1jeWdIikxQQ8b
 VrEA==
X-Gm-Message-State: AO0yUKV/idhatNvC3bfhAo+tqFj1gjNFIDwb3VQ4eeOWIBthCGPelmqw
 xn6Dvb1nWRGtgHj/ExEv437LFiajgOCqYflg
X-Google-Smtp-Source: AK7set8aUpYmZiiff4/AJuQlo0g5YPDCTYDKU8A1XYvLyrsz6NK8lsm4jN3WtAkt+u7TFZqWo5dq0Q==
X-Received: by 2002:a5d:4fc6:0:b0:2c7:1e3b:2d46 with SMTP id
 h6-20020a5d4fc6000000b002c71e3b2d46mr7575295wrw.17.1677796929195; 
 Thu, 02 Mar 2023 14:42:09 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm475179wru.75.2023.03.02.14.42.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org
Subject: [PATCH v3 09/18] hw/ide/piix: Use generic ide_bus_init_ioport()
Date: Thu,  2 Mar 2023 23:40:49 +0100
Message-Id: <20230302224058.43315-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

TYPE_PIIX3_IDE is a PCI function inheriting from QOM
TYPE_PCI_DEVICE. To be able to call the ISA specific
ide_init_ioport_isa(), we call this function passing
a NULL ISADevice argument. Remove this hack by calling
the recently added generic ide_init_ioport(), which
doesn't expect any ISADevice.

Inspired-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 91424e5249..2136895401 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -138,7 +138,6 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
         {0x1f0, 0x3f6},
         {0x170, 0x376},
     };
-    int ret;
 
     if (!d->isa_irq[i]) {
         error_setg(errp, "output IDE IRQ %u not connected", i);
@@ -146,13 +145,9 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
     }
 
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
-                                  port_info[i].iobase2);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Failed to realize %s port %u",
-                         object_get_typename(OBJECT(d)), i);
-        return false;
-    }
+    ide_bus_init_ioport(&d->bus[i], OBJECT(d),
+                        pci_address_space_io(PCI_DEVICE(d)),
+                        port_info[i].iobase, port_info[i].iobase2);
     ide_bus_init_output_irq(&d->bus[i], d->isa_irq[i]);
 
     bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.38.1


