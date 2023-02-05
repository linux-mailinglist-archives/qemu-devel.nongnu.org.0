Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3285168AF3B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:06:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu2-00015E-Cr; Sun, 05 Feb 2023 05:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtT-0000yv-0q; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtQ-00057b-Nl; Sun, 05 Feb 2023 05:05:06 -0500
Received: by mail-oi1-x236.google.com with SMTP id r28so7619852oiw.3;
 Sun, 05 Feb 2023 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFLXQSIkaNrU/k0/AGC5VeAmUpsRZSfIo69ujVvNr00=;
 b=pxXVbr1O/fOjMWaIDcPvbCuXeJ8Vhv7y3FA90dc/MSKD8lv2/gXgZ/zZU/8lDVBAlh
 gjde5zb/tnkQa68C98Ek36rAg0yjBu8fYVQF2JXSCtjS+KM63Bau7F9UGrNTGle5TJK8
 ar3Jp+qQLXD+7w4Byqb6hjQJU91LiaHs4EmKKCISEXQ6L92MFpLw9AJ8+JX0P5jtspRx
 bmltfp/fp0jRO2ipn4yjA68xxX1TzxtEal2zlp4FiAQyLIjmXiuCgG0DVUZLBk0wD/my
 tocWKKNZa4g7rvBQoKuKqVvkFexGXAYopwid91aRMOUZuCjU+3dkqIZ4w4PyfmoHL849
 IneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFLXQSIkaNrU/k0/AGC5VeAmUpsRZSfIo69ujVvNr00=;
 b=Qsu5VeaSBR5TruQebcbNRT47Duuqe7Jlzs3zsXAguZgOuOq8PiBBPMEtWEnA6MruDf
 hWxeoisN0GyqQQZXofGlsC64bPXqOpVIcHJhbp+ifSK2mX5KxH4u3jfSy0edf4nRLOgF
 h4L0Q9GiER69rXD4R/+7wY3iNI9itKxkCSQhBqJ0+vFuYN+eRnfTxciTwvY5wcCypRNY
 x6yGI6EAKBCUXW6woDfGqkqufjaafd1KZ1Fhpyb5Ber4ga6cZmh86gqBWcdqfTdw4DUs
 z2cnc7PO0rfwOVvTczOiIoa/XVRevAJtBF5i5leDuD7JxdVczpKx1h0ECdMgu5Qbx/ZV
 upXw==
X-Gm-Message-State: AO0yUKXgXUMfAipF5U57OFBVy08yykeQWMAxDqBc6RMnpaLOCsszQxEm
 mHkTlvC+MHXcwpvYQWcRoySbkz+d/CQ=
X-Google-Smtp-Source: AK7set9Thc86AEsEMEZOpxx01QztsINiWo4ifsd8y7fQt9pLV3Ueha6eBkpHWdlW2+hLXjHn9IsVhw==
X-Received: by 2002:aca:a993:0:b0:378:5763:7631 with SMTP id
 s141-20020acaa993000000b0037857637631mr8218450oie.26.1675591503404; 
 Sun, 05 Feb 2023 02:05:03 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:03 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 04/16] hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
Date: Sun,  5 Feb 2023 07:04:37 -0300
Message-Id: <20230205100449.2352781-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

mv64361_pcihost_map_irq() is a reimplementation of
pci_swizzle_map_irq_fn(). Resolve this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20230106113927.8603-1-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/mv64361.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 015b92bd5f..f43f33fbd9 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -72,11 +72,6 @@ struct MV64361PCIState {
     uint64_t remap[5];
 };
 
-static int mv64361_pcihost_map_irq(PCIDevice *pci_dev, int n)
-{
-    return (n + PCI_SLOT(pci_dev->devfn)) % PCI_NUM_PINS;
-}
-
 static void mv64361_pcihost_set_irq(void *opaque, int n, int level)
 {
     MV64361PCIState *s = opaque;
@@ -97,7 +92,7 @@ static void mv64361_pcihost_realize(DeviceState *dev, Error **errp)
     g_free(name);
     name = g_strdup_printf("pci.%d", s->index);
     h->bus = pci_register_root_bus(dev, name, mv64361_pcihost_set_irq,
-                                   mv64361_pcihost_map_irq, dev,
+                                   pci_swizzle_map_irq_fn, dev,
                                    &s->mem, &s->io, 0, 4, TYPE_PCI_BUS);
     g_free(name);
     pci_create_simple(h->bus, 0, TYPE_MV64361_PCI_BRIDGE);
-- 
2.39.1


