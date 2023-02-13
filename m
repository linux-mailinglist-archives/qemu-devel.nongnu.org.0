Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05A4694FB0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoX-0001Sd-GJ; Mon, 13 Feb 2023 13:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoW-0001Nx-2N
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:32 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoU-0008S7-JE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:31 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bu23so13251067wrb.8
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=JclyZ9/UqBA9BGGqA55SoSo+LpL1ZYdxe3PslvYu0+Yxk9KVvZ9IAaUZaDBkNXcQGO
 Iir74BDi18LUqcAmsy0C6cWDzj1wTIhCbQt6E1iZG7JN2uoyRDBlh4FG7cdGXPGQNgwe
 qQSkeYZeigYr4Wq+SCC6Wmb8hzuTPSFS+B0toflyI8TiFIYuTQ5OJS4t9q02HFVEVpW1
 vZ16spJxrCwlh6KhD5iGgrir1VcX3GE+/e5FXFIA6j7zecRrS4froZyBhb01JANmQCci
 AhmEqrixRAzaIeb3/kjzNuMfHJ7VHo38IYbBkWyBk0rKgusieKEatRh0wDn2yw03EFpW
 f4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=k+Rv//Ub0ixjtp5q1oWbrdazRhMFirlhLjyHcmhg54Z1XcPqW5A5wAGImNUggICISE
 oLgHIOxHFRb11Fmv3c96J8/kno6KeRtzGjQ9rjz+rbU1ZW+6y0E8jAes04jLQh+Xp8MD
 X9GhitLxBTMcN4GtULOzN1uAjr1EF1EWux3mcY4n4W81gZeEuFxhua5qpMH+phdkrnCs
 OqZHE4UzGWAjIlmqThtL0vAGARWwazEV66cyklh39ntoe7Z2bYhkqKIwAHQcX7PX/qNL
 1ghIxP1K9BpTUkq7d1O2oarUUFUeFZwVfDeHNniN8Fi/t50AV5+rRJRfawf4hBjULdo+
 BrGg==
X-Gm-Message-State: AO0yUKV+kveJsITDY7S3Bd8ejwGS+XbUtYomiyF1w5QKn1nDN+JY8a0K
 vUkE3Adzat4oBp+fGng9V5ct1AVqTuLQWz4x
X-Google-Smtp-Source: AK7set+0F/IC3ACw97foscAd1Yh3dEJIa8CBVY8UR2vjeghYtXwz20EDRQqvYdIH121r17pg40+1Hw==
X-Received: by 2002:a5d:4577:0:b0:2c5:4ec7:a466 with SMTP id
 a23-20020a5d4577000000b002c54ec7a466mr6889035wrc.31.1676313869723; 
 Mon, 13 Feb 2023 10:44:29 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1c4c06000000b003d1d5a83b2esm17393991wmf.35.2023.02.13.10.44.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 09/14] hw/net/tulip: Finish QOM conversion
Date: Mon, 13 Feb 2023 19:43:33 +0100
Message-Id: <20230213184338.46712-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
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

Use the TULIP() and DEVICE() QOM type-checking macros.
Remove uses of DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/tulip.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 915e5fb595..990507859d 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -19,7 +19,10 @@
 #include "net/eth.h"
 
 struct TULIPState {
+    /*< private >*/
     PCIDevice dev;
+    /*< public >*/
+
     MemoryRegion io;
     MemoryRegion memory;
     NICConf c;
@@ -959,7 +962,7 @@ static void tulip_fill_eeprom(TULIPState *s)
 
 static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 {
-    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(pci_dev);
     uint8_t *pci_conf;
 
     pci_conf = s->dev.config;
@@ -967,7 +970,7 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->c.macaddr);
 
-    s->eeprom = eeprom93xx_new(&pci_dev->qdev, 64);
+    s->eeprom = eeprom93xx_new(DEVICE(pci_dev), 64);
     tulip_fill_eeprom(s);
 
     memory_region_init_io(&s->io, OBJECT(&s->dev), &tulip_ops, s,
@@ -983,27 +986,26 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Error **errp)
 
     s->nic = qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
-                          pci_dev->qdev.id, s);
+                          DEVICE(pci_dev)->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->c.macaddr.a);
 }
 
 static void pci_tulip_exit(PCIDevice *pci_dev)
 {
-    TULIPState *s = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(pci_dev);
 
     qemu_del_nic(s->nic);
     qemu_free_irq(s->irq);
-    eeprom93xx_free(&pci_dev->qdev, s->eeprom);
+    eeprom93xx_free(DEVICE(s), s->eeprom);
 }
 
 static void tulip_instance_init(Object *obj)
 {
-    PCIDevice *pci_dev = PCI_DEVICE(obj);
-    TULIPState *d = DO_UPCAST(TULIPState, dev, pci_dev);
+    TULIPState *s = TULIP(obj);
 
-    device_add_bootindex_property(obj, &d->c.bootindex,
+    device_add_bootindex_property(obj, &s->c.bootindex,
                                   "bootindex", "/ethernet-phy@0",
-                                  &pci_dev->qdev);
+                                  DEVICE(obj));
 }
 
 static Property tulip_properties[] = {
-- 
2.38.1


