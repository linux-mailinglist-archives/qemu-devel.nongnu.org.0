Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAD9698090
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKTF-00071Z-Vk; Wed, 15 Feb 2023 11:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKT3-0006yf-6U
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSKT1-0008H3-Lj
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:17:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id o36so13739600wms.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX94LAhKXIsTrF88ApJCd14czN1lbFutyRtESU1HH4c=;
 b=U9gcUplE2QGhzIEBwDNzBI7wxI1m9FrgknIW2X5+YETPPnPRYzPulLNLeDCJ4Wd8y7
 on0wqxhabITPfHynVP5+QGOp8nltp4ceNnZ/KuRI6tro7CP/9+aBmZek2HknNRck8IXF
 N8AQsfS/yFxrO1/6MgRT/hVmFdo1MKMwwzE3G330OGLzHDahK5WJuMnGhKeuSF/spJ4S
 vT2wUF2nRN0k76AUbQVvjO9C6hsgnPhchg7ULjIHuu/PZ/YoES98/N59R0ZF/fLb4XDy
 S5a0ZrUm9zgq70j6kIq9003UpLpObqMmoT5uEIPRJTxtLzWnQ94v6O4vWVh4p/2mTkXj
 srjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bX94LAhKXIsTrF88ApJCd14czN1lbFutyRtESU1HH4c=;
 b=Y8y1jFjhm+onjQzbCsxMBF1QNa0wX9qiFJ7tWLtldDO7nHKedYhO1/HN+ZBppHLuvF
 LaZhf6ipUJqbvYD7NNz0MWhIeN20ool6WQarosh4V5a0A88snM9tm1hfH4zrGCSs74P5
 DLiinvsbvL+nDuDQhyuysfHu2hfjPf+z21DNPDjeaAztIliUEnV/xPC+pAUSq548rfgJ
 bbz70ibTlWZCGav+btoBsnNACBR+Os3rKt2QuSZWqqAt8jg7vIBeQEjKQsFjSnds1TZj
 jnntnDZvbGHLr+y7D38bAcd1pxCkKMm6h5nBdDSFqdBlKI7bWL+WxoaUf966CgRV+Opo
 ZuNA==
X-Gm-Message-State: AO0yUKUVdABHyDp/84Vp751jHUdtjuTNCvrQ6RqgwQRHN9go5UEeLvH+
 /9A43HQuUvZ120KJKe4sIfsUg+cTxo9WbfSK
X-Google-Smtp-Source: AK7set/Ye3s+lLYQDekRwzOFAaAb63NM5pc+WGdAewUJShpS9neQ7HpQPDmi7XamI8UEFcrPcM08qA==
X-Received: by 2002:a05:600c:3b9b:b0:3e2:669:757 with SMTP id
 n27-20020a05600c3b9b00b003e206690757mr1389930wms.10.1676477830222; 
 Wed, 15 Feb 2023 08:17:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b003df245cd853sm2718304wmq.44.2023.02.15.08.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 08:17:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 05/18] hw/i386/pc_piix: Wire PIIX3 IDE ouput IRQs to ISA
 bus IRQs 14/15
Date: Wed, 15 Feb 2023 17:16:28 +0100
Message-Id: <20230215161641.32663-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161641.32663-1-philmd@linaro.org>
References: <20230215161641.32663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
index 7085b4bc58..983baf0211 100644
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


