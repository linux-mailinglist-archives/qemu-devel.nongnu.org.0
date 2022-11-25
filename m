Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1288638BDC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZNh-0002Bs-Nf; Fri, 25 Nov 2022 09:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZNf-0002BO-L7
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:08:39 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZNe-0001Ip-2p
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:08:39 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d6so4087900pll.7
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0IEX8iA+Z9IZyYjqALMs9zkMZz9QZA2/mj+SWMdkwQs=;
 b=pPk49uQG3hqxzo+SuV1+mJsuKL6Wm79/MkznbvDgg2k+90G6HHoioNbaawRvqV2Tbs
 OVPLfqT7v9FM786cs868PQAzXnQtFq8atoUduKHVZvuiVyqYNWdBHyEzfGrQFVs7NR/J
 S/U1tv8/BgKLamTz875AUySlgxYkc40LuGB31xmqhY3pcs19IIspha+8DLd0ogtX1rPd
 fQa9/61+0f1aTyJw1tBKDdGuYLBcR076uSQMupRa1QMdIWAkMUstqx7opCSEBM9l83/o
 kC+3aJOWi9+ZBZkuUBecNuUuhCd66OBszixBtq8eBU77B0OuKufM3QxUYNgM2SLEsAXN
 FjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0IEX8iA+Z9IZyYjqALMs9zkMZz9QZA2/mj+SWMdkwQs=;
 b=PfFm6Sn4ZWNUFpfA+2A2rk0UKUDqr1oJpPE3ULBaG3HGYX36ozSUCdZK7R/s/ofg1H
 Je9dP424X4utQdJ/6BMsOAl53opb+bLepDPf2wMEhQLKc3WaEBAvrm3R5Jl1e0kQuEIz
 t7+PApwZy+JiV5a3Xlfws6wH4BmimMoFrSsSub/Wzzc4a1RcQR1k1crw1RBKkysK6Dv3
 lB+hU605OdRjMzPKakHmZlef6/EvRxF0+9AbItorYiOrw9cGh5l4+E45VpBBu9e0vQVX
 gzz9zg8FNPMeMRCgtqdFcwlzBWpnJrJ2p2bruyZ8Fevd0eNQFmbCSxX+AQ/NYcD0BsMg
 4tDA==
X-Gm-Message-State: ANoB5pkx6/yNdCXSdHlqCWVcQrCAPPpkW/TIovRWlYKyd/jyJEwinUhs
 YUUkN2DN3thaME3ihtkUzu89nRP7HTeuzg==
X-Google-Smtp-Source: AA0mqf7nrEm0JLfu5fOM18yC7Mm73ZiObLhicrUjwVVAq6fKYsI61aNh9bSaNf8ZMCVCScN3SvLvgA==
X-Received: by 2002:a17:90a:8a13:b0:20a:e24d:5e32 with SMTP id
 w19-20020a17090a8a1300b0020ae24d5e32mr46912559pjn.138.1669385316498; 
 Fri, 25 Nov 2022 06:08:36 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170903230100b0017a0668befasm3472161plh.124.2022.11.25.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:08:36 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000: Configure ResettableClass
Date: Fri, 25 Nov 2022 23:08:28 +0900
Message-Id: <20221125140828.56636-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This is part of recent efforts of refactoring e1000 and e1000e.

DeviceClass's reset member is deprecated so migrate to ResettableClass.
Thre is no behavioral difference.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e26e0a64c1..f97610d7e1 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1746,9 +1746,9 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
                                         e1000_flush_queue_timer, d);
 }
 
-static void qdev_e1000_reset(DeviceState *dev)
+static void qdev_e1000_reset(Object *obj)
 {
-    E1000State *d = E1000(dev);
+    E1000State *d = E1000(obj);
     e1000_reset(d);
 }
 
@@ -1777,6 +1777,7 @@ typedef struct E1000Info {
 static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
@@ -1789,9 +1790,9 @@ static void e1000_class_init(ObjectClass *klass, void *data)
     k->revision = info->revision;
     e->phy_id2 = info->phy_id2;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
+    rc->phases.hold = qdev_e1000_reset;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc = "Intel Gigabit Ethernet";
-    dc->reset = qdev_e1000_reset;
     dc->vmsd = &vmstate_e1000;
     device_class_set_props(dc, e1000_properties);
 }
-- 
2.38.1


