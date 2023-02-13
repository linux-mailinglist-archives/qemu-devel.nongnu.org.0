Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2461C693EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxp-0002Z7-Ok; Mon, 13 Feb 2023 02:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxn-0002NZ-EA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:23 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxk-0001ll-IW
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:23 -0500
Received: by mail-wr1-x434.google.com with SMTP id r2so11040566wrv.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=AUHUxMS5pIjp4dqOgnRBuhpoT6Smnx6s3P/ZhWdXjwRB5r5+VKclUCB/SASsRYZBr3
 P5Y8dXFAm0QnDvhWsD6yIH+i3KMxNbNo4sGe3gbuN060YhFpHmcsRB3YOFF3RzAIfF9m
 mzCaAoDu/HCzxi8hW3nGkSaBwgY2ejE8t622G+CacnpQAsYmXf+34LvB8s8urY8YTvoY
 MzhC7jaPPNcaHYR+cK7EwYMGOg/15oy8v46ALrdDs/oC9bQLy+ROAlBSooNPtjiCKAXw
 yVXbNn9XN8xdgaIji2lV3TKuiixXG/Wg+ApNBh6UCiKoaX/MeL3J2MSzM9ViKw5GRvZ7
 hn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fD8XsrjHaA7eijBs8OwmQ3XFemQ30TcP+DXj6h7knEg=;
 b=Nz3YwATSLkhUcdf+HQZCp2H2mZT/o7wWK+rZePH3KD86qcAq5MT3Hg11Hm52xbRZGO
 Q+akgYUVFup7ej+wDvdWhW4UfrGLwFUfyWt3RLr94hxAYmbDGi6jzojYQpykOxTnSVei
 OkEzj1YcnT4o9bPDFF+017R9ulNMnJaRk5m1vHhc2+wb1rXN/SN7Wu1ugigr8Edg9jn1
 awpUGmhlY0uVgPN3EpK+gaDqFMfWcMXv/JrNoCHAaiGz2z4WkAZmjwROib4ZmIG/Zndd
 zZ9QCiuNyNbstwydKrFrrPOoshMGC+oVpM9bD4yA8QuIl99aZ7GOrv4YDEyQAk0fDlXV
 OpIg==
X-Gm-Message-State: AO0yUKWG0XWjDX1FKREHg1Ps1jEUWWWH/OnAYzvhfGWDoKfKIElbr69g
 YJ0oYArAt25n7X5UfsaqTQKjnq1oCc2ym8IK
X-Google-Smtp-Source: AK7set+yk9W5YykqrxHxTXjEsGxD59TmlIySnl94ChDkcGe6d0jKYkCauKnRx1NYxu4eq4E/jEjbRA==
X-Received: by 2002:a5d:43cb:0:b0:2c5:54a7:3636 with SMTP id
 v11-20020a5d43cb000000b002c554a73636mr3115095wrr.2.1676272159667; 
 Sun, 12 Feb 2023 23:09:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e14-20020adfe7ce000000b002c54f367fe4sm5071779wrn.100.2023.02.12.23.09.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sven Schnelle <svens@stackframe.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 11/19] hw/net/tulip: Finish QOM conversion
Date: Mon, 13 Feb 2023 08:08:12 +0100
Message-Id: <20230213070820.76881-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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


