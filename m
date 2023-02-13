Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742DF69426E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnl-0005VK-EJ; Mon, 13 Feb 2023 05:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnh-0005MH-85
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:09 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVne-0003SW-Te
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:11:08 -0500
Received: by mail-wm1-x334.google.com with SMTP id r18so8294402wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tu5dVA6dI9cI2EiBQY93c/MUAVRJTVadUXPrnS7cBWs=;
 b=kd7JFUErabWj3jbv4l9FoJPEb7TNJf1BnTvreb61q8oEoF2iFKRm2sJfo2HgMhEQbB
 ig3HCa5JseNl759osJlGKNIRi5TgTJI87o30rpLdOaalDyOg5yRB+spAePMaAytuFyKB
 jlhcqFu8uoU6BQ1tdIo/vn0IyknvWdRZy4rtJHFG5cVPrHTQYjVq7tAxLvbkrjwmuDR5
 sd8y+Moj3d/2HJiDBYqI7BgBhpWDlMn+ygbNxKhPbDkpbdWMEsL1hQ79e8UABvQQtoXV
 V5Zwu4lue42hUAUGq0/S7azR11XaUMMk/xjUYrHIyoxxCcrdk5qSwbjEn5cok5tt2wKx
 gKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tu5dVA6dI9cI2EiBQY93c/MUAVRJTVadUXPrnS7cBWs=;
 b=aHZYToE8J2oD+BuBUbHedjDTJ5sfjxtM4AmjLUwSAoC4fAoCznysLii59GGmKdE1A3
 vvomFJ1iYTXE/x3vVfesLdzq2XWI2HKzySkT+H3/ARxuk4MWauC3txzxnwoXyR3x8h2i
 YQ8N0v3/Y1cBNQP8djwWZ8xFodwpNNgKefd/HHpxPiQh+dLyH1VY3xWlW8otqRRQ2NqY
 EaSkZ5JZxUvHHAWva4he2dz/eKyYHIUqDF2bazXZ+R6u856egJRBu3zT5JTbVMxGmsg2
 9DuQTyPzny7/iDCFnYt+a0aoJ9+FraY8L9Dj/kUOTHgSOccamJjGUaEnD6eveptKjna3
 MyAQ==
X-Gm-Message-State: AO0yUKWF3in5tNtkXgEvBGfe5J7MkRgNwHTnZ6fa06eQu7vq8fqgjbH/
 ofkiIYFYTMBHrHOlvatttNrOA2UxC5Ef/bgU
X-Google-Smtp-Source: AK7set8EPOuaF+L7gg2EefeAKBkkiisOmnEP/o93KZCJkPPF81mU0r3D+yVGvqusJFJ/XepfO8PiKQ==
X-Received: by 2002:a05:600c:331b:b0:3dc:4356:533c with SMTP id
 q27-20020a05600c331b00b003dc4356533cmr18409573wmp.5.1676283065206; 
 Mon, 13 Feb 2023 02:11:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iv12-20020a05600c548c00b003dc521f336esm14628652wmb.14.2023.02.13.02.11.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:11:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/7] hw/net/eepro100: Convert reset handler to DeviceReset
Date: Mon, 13 Feb 2023 11:10:44 +0100
Message-Id: <20230213101048.94519-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
References: <20230213101048.94519-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/eepro100.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 4b5d45576b..722fb55e4a 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -486,8 +486,9 @@ static void eepro100_fcp_interrupt(EEPRO100State * s)
 }
 #endif
 
-static void e100_pci_reset(EEPRO100State *s, Error **errp)
+static void e100_pci_reset(DeviceState *dev)
 {
+    EEPRO100State *s = EEPRO100(dev);
     E100PCIDeviceInfo *info = eepro100_get_class(s);
     uint32_t device = s->device;
     uint8_t *pci_conf = s->dev.config;
@@ -1847,18 +1848,11 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 {
     EEPRO100State *s = DO_UPCAST(EEPRO100State, dev, pci_dev);
     E100PCIDeviceInfo *info = eepro100_get_class(s);
-    Error *local_err = NULL;
 
     TRACE(OTHER, logout("\n"));
 
     s->device = info->device;
 
-    e100_pci_reset(s, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     /* Add 64 * 2 EEPROM. i82557 and i82558 support a 64 word EEPROM,
      * i82559 and later support 64 or 256 word EEPROM. */
     s->eeprom = eeprom93xx_new(&pci_dev->qdev, EEPROM_SIZE);
@@ -2076,6 +2070,7 @@ static void eepro100_base_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     device_class_set_props(dc, e100_properties);
+    dc->reset = e100_pci_reset;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
     k->romfile = "pxe-eepro100.rom";
-- 
2.38.1


