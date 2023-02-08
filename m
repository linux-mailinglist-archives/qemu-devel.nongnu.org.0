Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E068E4C0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0y-0005mQ-Dp; Tue, 07 Feb 2023 19:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0u-0005kQ-J7
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:40 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0q-0008UZ-Cb
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:40 -0500
Received: by mail-wr1-x436.google.com with SMTP id i5so8016321wrc.0
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uNIF4djSxUYnm/AbMKC463cXHq46lEXK87Wn0R/Xyf0=;
 b=Oe1MMWaKLYwu+0LOyXn1IC0dNlTgroAGOtIk+aVSbrguok+HXHBBqAKr9x9vPdMLc1
 O6CF04HcWt33HYLATMWuV7pmz8bxvVlbQXjiXTUXo8peVntoSMkCJmpl5fXx3At34SSc
 MywMR7FY1Ed4YornA+emY96LfrCmySCgsuy7VbfcCdTCvtolQAu9OqrUrq8aPcZaFyZR
 igs3GPzRlgOcYNNPUQll2nC/NyJ+fEB2pVdjsAzDA5ydbbC1BCcr9ANbxRF3gz4Q/s9r
 nAkcmJZVdhN3KWjnRrBJO4dVYaYueu+fXn+mY6vFNRW3OyoIhbZ0iQjjKU0qj1j8ZpqK
 R0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uNIF4djSxUYnm/AbMKC463cXHq46lEXK87Wn0R/Xyf0=;
 b=DFt7K1+SyNYaWjkBjalmnjwLzYAwbpBvdgEnPjjo7iz/fr39H8TpspHssxq1xidQyX
 Kkx7BDzUnmNW9rxRRNIl16BWAx/QNu9wPQbdU63IZThChs9bHXwODTKEjO/Y73UZBKGD
 Xhxw67gcp+9qdKbbfCv5W4XxNl1tL2ZFNC5ciRs0kgrA9Ei8bsM5/MBfq034zdEcQzkj
 CN+0lXM25pF6Q2PQxKNDpiiRwUKo2sQPEfqCU1xQ38O0+Qj5dGlZPl7fpayGtnCeOUMH
 EOC2yMqjCPa++nhX90skfgj5CpziAqDGOKmSXo1vZFiC027l6Hn7eM/79fh1M/hg9cFe
 ueEA==
X-Gm-Message-State: AO0yUKVtFpGE30m6F9HiHgFV9uuSNV5JcqsDAR505h8By21rOI2SCmio
 tG/OmS7PCYyg8pt4y4l0NyPZOQxHb16y2dqh
X-Google-Smtp-Source: AK7set+DLu0hEUZ7H6xrWz9NQpT7MhjdbxpDR5xltGOHf6iD/KUY6lRrY1pmLPdw1uZThXhZ98JY0g==
X-Received: by 2002:a05:6000:1141:b0:2c3:db5b:727d with SMTP id
 d1-20020a056000114100b002c3db5b727dmr5176917wrx.53.1675814903639; 
 Tue, 07 Feb 2023 16:08:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a5d5223000000b002bfae1398bbsm12318666wra.42.2023.02.07.16.08.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:08:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] hw/ide/piix: Remove dead code in pci_piix_init_ports()
Date: Wed,  8 Feb 2023 01:07:43 +0100
Message-Id: <20230208000743.79415-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

pci_piix_init_ports() always return '0' so can't fail.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 1cd4389611..54d545ce3a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -126,7 +126,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static int pci_piix_init_ports(PCIIDEState *d)
+static void pci_piix_init_ports(PCIIDEState *d)
 {
     static const struct {
         int iobase;
@@ -149,15 +149,12 @@ static int pci_piix_init_ports(PCIIDEState *d)
         d->bmdma[i].bus = &d->bus[i];
         ide_register_restart_cb(&d->bus[i]);
     }
-
-    return 0;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
-    int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -166,11 +163,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    rc = pci_piix_init_ports(d);
-    if (rc) {
-        error_setg_errno(errp, -rc, "Failed to realize %s",
-                         object_get_typename(OBJECT(dev)));
-    }
+    pci_piix_init_ports(d);
 }
 
 static void pci_piix_ide_exitfn(PCIDevice *dev)
-- 
2.38.1


