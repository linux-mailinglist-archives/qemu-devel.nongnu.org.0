Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4016638C48
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZl8-0004TY-Gf; Fri, 25 Nov 2022 09:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZl6-0004Mu-6Q
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:32:52 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZl3-0001Bz-Go
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:32:50 -0500
Received: by mail-pl1-x62e.google.com with SMTP id io19so4140172plb.8
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gAHoljyqQEPuHJ4kDZUdXlgSzT5d3mXtgNfuiLhTyD0=;
 b=YO9t8NVgC7/K0dDSXm6LlE1l6M/RfUC8vJLpcQYIQ5h9hxe9kL8lKOAy4mC1qzebhC
 bV05mDk3+iycTg3id+Y00qV/dsehk+NxGKPmsHF4qpFUGj12vz+hxbsBQ6cLHqmxkkls
 0c4dcm9CynCIM8PvOOcqYQsQCE0pBn8JdaFmQw0a847HkNeC9IK1oWf3QJezQ7hjL8ze
 eVi5h1MUcEQMx7NqxnF73AZ/A7AO06bAF5DNHYxwuM8pbwZC3X+y+0VTaQPGetHhQqCZ
 3efrLovq3htq5siou8uJ/o+vNTdteHEB3O/e+ACXUAZ6kl+r2K2HYyQMZ1FNBSd5f+2n
 sdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gAHoljyqQEPuHJ4kDZUdXlgSzT5d3mXtgNfuiLhTyD0=;
 b=rgfCU+61jNPxNRD9Pqe9yBpUzV2qN5Bgq3YltCRRqo6SZ57hBOTM1sq1366emdul9t
 ttJHw58f2fCZFlwGg+mTisywHXh0YWzzAXzmZzbkA7eHtPWU2woRW74hlzZI8qWCfuEf
 aCsEUK8/Am0R5BRcG5vTmpEzVqnUjSmVOhHSEe9hbS1/MfIU4amfiO+k4xakkix7QGGg
 GSfl35gJRjjxS+RqPXrhbioC5NaNmPGlEwx6RwEEaayECR+vDE1dmpQMW1oQZsELB5At
 d/vW/tyeAIsgSTHon6xWlUFZZ/KCWH3zcuZO0pwsyqMs0jaY+BWUx/nl9iwvMc7DGKNQ
 2Srw==
X-Gm-Message-State: ANoB5pn1baQhFw2kNkGPlg/LOwe4efTnC+mwN5kSgZZcUZZgS6tmldFO
 SvAkN3gDsT99mLNPv6ch2Jg1zSL/8V6zHQ==
X-Google-Smtp-Source: AA0mqf4CpccJGo3q6ztyFY5ju6nA2hWMi6En29dFRVPCewhE09PIn2IspuB1DahnSrmx7aPf8YkZVQ==
X-Received: by 2002:a17:903:2013:b0:186:8a1e:9b46 with SMTP id
 s19-20020a170903201300b001868a1e9b46mr18712460pla.80.1669386767854; 
 Fri, 25 Nov 2022 06:32:47 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a170902d40d00b00186da904da0sm3458793ple.154.2022.11.25.06.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:32:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2] e1000: Configure ResettableClass
Date: Fri, 25 Nov 2022 23:32:33 +0900
Message-Id: <20221125143233.60372-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
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
 hw/net/e1000.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e26e0a64c1..025aba726b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -373,9 +373,9 @@ static bool e1000_vet_init_need(void *opaque)
     return chkflag(VET);
 }
 
-static void e1000_reset(void *opaque)
+static void e1000_reset_hold(Object *obj)
 {
-    E1000State *d = opaque;
+    E1000State *d = E1000(obj);
     E1000BaseClass *edc = E1000_GET_CLASS(d);
     uint8_t *macaddr = d->conf.macaddr.a;
 
@@ -1746,12 +1746,6 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
                                         e1000_flush_queue_timer, d);
 }
 
-static void qdev_e1000_reset(DeviceState *dev)
-{
-    E1000State *d = E1000(dev);
-    e1000_reset(d);
-}
-
 static Property e1000_properties[] = {
     DEFINE_NIC_PROPERTIES(E1000State, conf),
     DEFINE_PROP_BIT("autonegotiation", E1000State,
@@ -1777,6 +1771,7 @@ typedef struct E1000Info {
 static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
@@ -1789,9 +1784,9 @@ static void e1000_class_init(ObjectClass *klass, void *data)
     k->revision = info->revision;
     e->phy_id2 = info->phy_id2;
     k->class_id = PCI_CLASS_NETWORK_ETHERNET;
+    rc->phases.hold = e1000_reset_hold;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
     dc->desc = "Intel Gigabit Ethernet";
-    dc->reset = qdev_e1000_reset;
     dc->vmsd = &vmstate_e1000;
     device_class_set_props(dc, e1000_properties);
 }
-- 
2.38.1


