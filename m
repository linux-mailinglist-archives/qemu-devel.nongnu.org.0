Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C6B68A154
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Vu-00085b-NG; Fri, 03 Feb 2023 13:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vc-0007nH-43
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:02 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Va-0008Ed-KT
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id a2so5116955wrd.6
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=UOROVGJf2LhPr752Dw/+I93w8jyObbZA3IhAvPk00odJTomcoFC44+VlywzefzTQBI
 87UOdzz6xjb3/z/Ugj3dHNwazZt3412OTsoijUEPdpUp3MBFD7cH/6bhCR93Oimgr3gn
 hIhsa1QlaaC8RTcuQafvT4FTWWrinb1RaHh9Spr8Jw5wKNAitKVz2wLDnQ+e555kKLLv
 AqcGsxNra2OcpD6xxVviE4L0YwJ1GnLN2VGeyW0ylWgc7UCY607BbK7njSwVVNduiAoG
 42IQvlighScOqCP5CeI0+K/sIHTT28zzDnBRXMZbFRHtSH9igpqtd/kIbuR+6dUT86Pd
 PAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vovJOcxBVU6DoLhiHtjRCI4bXKmNwzDO1xetqBbwJw=;
 b=P4ElLj7KdNouJyzPRFpRXBFOhSl1OIb2gG2BV3q7ypG6vQWpqm4BZ0ROYW/ABwhqj3
 9aIIPoqvJeVQjxLlR2Zb1hHmoPlzhK8E109G2Mo9GzzNLx/GKmFpsRAlLEduiG84tBZv
 TkOiGUq6D7tuB5xvDHdjl9IovN01UNNFChwHzjmcKMyV1AMbp6mAMbPAIQdnEwX+hsnM
 L1PgVVnpjBuE3Qo59/bZ6vgZmPKLPUdz2IlE2FuqKrZoYLuBKQYwYX0sz8O5llqeIZ7Z
 2TdWDatLNqPabqgdvcniYnfkEkgqhRrbFkoppPWqK/REZNWxkb9PuviTvacvQbYG1DhD
 /z4A==
X-Gm-Message-State: AO0yUKWJD7e79CMTkaXOehu+j3axJC+ZvghWPa0K3hFc1JIF9D+wftIP
 IcQyeTdEJCt8zisrSzJaAdbb+tw9rBo1qfZi
X-Google-Smtp-Source: AK7set/hD9U6wHMO4gsaTyNxz1UIQHivzSkcKTC59mR9ACtZMldDtSDx+5HfrHQZaG9PK1iG6a9nFA==
X-Received: by 2002:a5d:456e:0:b0:2c3:db61:20ec with SMTP id
 a14-20020a5d456e000000b002c3db6120ecmr719672wrc.23.1675447797782; 
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002bbed1388a5sm2528636wrt.15.2023.02.03.10.09.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 08/19] hw/usb: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:03 +0100
Message-Id: <20230203180914.49112-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index 643d4643e4..7511af4ce2 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
     dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     dev->config[0x60] = 0x30; /* release number */
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     s->xhci.intr_update = xhci_pci_intr_update;
     s->xhci.intr_raise = xhci_pci_intr_raise;
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index faf57b4797..d73c71015b 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -36,7 +36,7 @@ static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
+    qdev_prop_set_link(DEVICE(&s->xhci), "host", OBJECT(s));
     if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
         return;
     }
-- 
2.38.1


