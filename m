Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404CE638BE2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZOa-0002h9-HP; Fri, 25 Nov 2022 09:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZOU-0002b0-6R
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:30 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZOS-0001Mx-NW
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:09:29 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so3091929pjo.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ut3aVjkZHPcVZZAk2wFRN7/OCGDPzIxs/E+sB5jWzfc=;
 b=YVuin+d0QfeCEo3DwvYSb92sPo96xXd2lD+5ZyQ2R6XPhcVqiB4fx20vpGmj/LzCev
 7G8K3kKCztKdXPosN8p81fpEx8UszSftlDQ4XIEx+N4swIT49d5mj1epDpxLy9gBUrCj
 iBYfaNJBtEytdzh9vHu+5yQxQEUFcK4WabdV7wdXU43fuv/7kHAcLYnwLdeii9rGz+lN
 eJtCrDhq+guPF3fMgnUOE5P8llJHNi1uc54fHKJ2gY7pHpk4j3Y9Podt/b5pb9Q5nw9+
 Ytz/GQ9+X5JVg6kqQ5UIES1Gn7ymo9mLFjaBc3oeyePtPJdcoxLP3EldJdTCbiCsnO18
 4ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ut3aVjkZHPcVZZAk2wFRN7/OCGDPzIxs/E+sB5jWzfc=;
 b=DnMnUgEErSOFfOkuAqnVWYYRTgQL93b9kP+5PLWGTXcA9KfOR8v9J8sWixRICvvISW
 mDoitC4rwzAvNsz480gsYV1mWs+31fC2AYuLA3Nz8s+s+Rl2n9uYpdpweyVbZDmpCa1C
 GsRAGItbTHxPDNnzxbFlzdk0sBO7YY66oBLmeTx892wftCfxGcDfl+dSaCJkXlUGYxn1
 DWL0bA/pWlpf2OrTDQfgNjMhkgrFfuDzPNX/PJ+1B6gotW5jZOEMQAxj5C5WZXIJEEon
 xmOq3LO2ms2xKK2veFdrFBwUXFhFMq+O8y3rxrDqnauj8Iwydi0VLTrK11yk6NxLhhk3
 uDug==
X-Gm-Message-State: ANoB5pk4wQ4Nm9hI3/xvpSEQvBGRSXaGIKt6O3Iu2PNB7guj2cC5XFEF
 NmOo3Ax3vdRFy9eprdKlu0Wwf2ayaiktMg==
X-Google-Smtp-Source: AA0mqf7FW5vd+w1o5OxODXrymKBfuO4pype+LOAo+CR6h2uP1M6zjslul9AE9VTU1l37VMwVpNMBVg==
X-Received: by 2002:a17:902:8604:b0:189:5484:3717 with SMTP id
 f4-20020a170902860400b0018954843717mr10152105plo.15.1669385366734; 
 Fri, 25 Nov 2022 06:09:26 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 ca16-20020a17090af31000b0020ad86f4c54sm3025683pjb.16.2022.11.25.06.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:09:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000e: Configure ResettableClass
Date: Fri, 25 Nov 2022 23:09:22 +0900
Message-Id: <20221125140922.56760-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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
 hw/net/e1000e.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 7523e9f5d2..4f31a7894a 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -512,9 +512,9 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
     msi_uninit(pci_dev);
 }
 
-static void e1000e_qdev_reset(DeviceState *dev)
+static void e1000e_qdev_reset(Object *obj)
 {
-    E1000EState *s = E1000E(dev);
+    E1000EState *s = E1000E(obj);
 
     trace_e1000e_cb_qdev_reset();
 
@@ -669,6 +669,7 @@ static Property e1000e_properties[] = {
 static void e1000e_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
+    ResettableClass *rc = RESETTABLE_CLASS(class);
     PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
 
     c->realize = e1000e_pci_realize;
@@ -679,8 +680,9 @@ static void e1000e_class_init(ObjectClass *class, void *data)
     c->romfile = "efi-e1000e.rom";
     c->class_id = PCI_CLASS_NETWORK_ETHERNET;
 
+    rc->phases.hold = e1000e_qdev_reset;
+
     dc->desc = "Intel 82574L GbE Controller";
-    dc->reset = e1000e_qdev_reset;
     dc->vmsd = &e1000e_vmstate;
 
     e1000e_prop_disable_vnet = qdev_prop_uint8;
-- 
2.38.1


