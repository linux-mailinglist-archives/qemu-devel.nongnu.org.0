Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB629678F58
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:37:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAz6-0002jg-I7; Mon, 23 Jan 2023 23:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz5-0002jF-5S
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:35 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAz3-0002OT-Ki
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so12911325pjb.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=kOlUYtVf4vSztB0C74exGPeN0nt12owkrmZvnYngfYdWJ7K8kxvfn3ivHJWT3BjX/r
 +j4ntHgQE8JCbZW4cndkCTAY48znNqM9z7cw1kVtrKwU71OFPGPEu0UoCw4Oev+KW4UJ
 Xqhv7WSanUZ27W+stfdZAeDEhn9mlV27N7YxEUrODITUtrGmI5qeam03fNO7Rm63y2Ee
 O2avdawf9ID79Y/Jp/ikuUBM5qU1yCjJYJQEV23wqe1afufmk9ybgPJ9JdJLLLglmNDN
 KZGlKr04q/H5nICKYOBLsh1qAmmROBrdGy4H9m5R/cdm2p4WXaAowauS90ROlRgVMw5Y
 4fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o59WGdHhwe8iSCsWwjunxDpf/pqoUB2o+GMOEcSVcy8=;
 b=S+LVwQ64pz5WQAsHtUUjpWSn6m1afDDm4At5z21O4r8AgOvCbzkAsk1gEuN9ZMgBFm
 SHj9p12Pj7e6pJNOUXoo6CN/R3DG7Ejl6CduwNrQPFfDflr+7szC/rFhzpZS3d3h/mVh
 50q0oa2xnxrWl7iorkqMnuW3+rBGQAP6onM1tsuF/pNStTY4wqwzaukpy7uLCPaq3UCG
 TCoTjI+78/sjfsiV3z3fVK7ewcm2lfyZvKrdM1fnntsFgCSa6k4T0562lViq+HaTv8cs
 Q7zDbTIVe5N4hD6Ng2MqINX93Zd1hwcfbyC5aKacbNM94V8gQvtMtM/0l+9GTHrnrA7S
 Korw==
X-Gm-Message-State: AFqh2krZJ960T1TFWUWkyxUr8A6SA42GAwtOhI9GqBIVMmu+gf7dV7ed
 o+I/A7GYCGE28melQqKiUKMgtw==
X-Google-Smtp-Source: AMrXdXtgp1025rBEBQW/DQZx3AwPHNCih7IyDWQI67ayYTc59kJ0azUNyYZXsGlZNsHkkBnQouz5Dg==
X-Received: by 2002:a17:902:8492:b0:18f:438a:cfe1 with SMTP id
 c18-20020a170902849200b0018f438acfe1mr25390093plo.59.1674534753014; 
 Mon, 23 Jan 2023 20:32:33 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:32 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/26] e1000: Configure ResettableClass
Date: Tue, 24 Jan 2023 13:31:30 +0900
Message-Id: <20230124043143.5515-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
There is no behavioral difference.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/e1000.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 3353a3752c..c81d914a02 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -377,9 +377,9 @@ static bool e1000_vet_init_need(void *opaque)
     return chkflag(VET);
 }
 
-static void e1000_reset(void *opaque)
+static void e1000_reset_hold(Object *obj)
 {
-    E1000State *d = opaque;
+    E1000State *d = E1000(obj);
     E1000BaseClass *edc = E1000_GET_CLASS(d);
     uint8_t *macaddr = d->conf.macaddr.a;
 
@@ -1731,12 +1731,6 @@ static void pci_e1000_realize(PCIDevice *pci_dev, Error **errp)
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
@@ -1762,6 +1756,7 @@ typedef struct E1000Info {
 static void e1000_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     E1000BaseClass *e = E1000_CLASS(klass);
     const E1000Info *info = data;
@@ -1774,9 +1769,9 @@ static void e1000_class_init(ObjectClass *klass, void *data)
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
2.39.0


