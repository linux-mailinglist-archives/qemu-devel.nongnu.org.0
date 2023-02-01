Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE24685E08
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:39:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vE-0006ch-U9; Tue, 31 Jan 2023 22:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vC-0006aY-PD
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:30 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vB-0000QI-7Q
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:30 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so17188518plo.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A95PLfu5QduSNtWNtARVjFG+JlZHlsOhrX6r7BxoUgQ=;
 b=fnn9BjvMtkCZObEsS03e6iTtKAkJi4wti+iKRcqp8gZ56fv/ciimB9orwcFrGNy8nE
 yYCpY54/zvNBStKubdf26L+ODe3M+uyBkMXNxEYqzQeCCOAmTh0noMnWolvLWsdPsOnS
 6HT0X0kFdnJwEFCisTffrxOXdfNte26xznVRvjjJlm9RASwpg0o3+jMGD1RYX0YIZb00
 UiB+YYoVeR5SqdnYPIQdsNOHdLU68G26iraNQO054N+b8qBw3mR+e72JYeUVgqY+1LBS
 y2yEGMTEiLoCwaZYyqcxhgnr2cnx3dTHb0U+M/Fb/YL7CxJ4p8AYIAdsHtl2Jw10Nw4P
 JyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A95PLfu5QduSNtWNtARVjFG+JlZHlsOhrX6r7BxoUgQ=;
 b=jmCe6IG/By2xwqZTMwEI4Bp/jCbI7YisjHURXkM+RA6Pk00Pvg1Bkx5+7J1gYhmoWg
 7c5DldiMQ09CDb7x/U5adE1fS0//iX38AHLlbuFh7QVDDSG1chUl0VfXmTrqvHFybu4D
 QPJjxRkCu6Gp+tRDdGFxHPKkPVmZkLnvgwnMnyu+4eNMFqnRwDgMeoAgexZGhTt6hKq1
 SBbi80Ci9ubEdXc8GW6h5eDfiNsvS0aTKqYurbLHLhXBs6IAf4ShLkVffXPAlSxcqAhm
 2vFGXoFyxqaLwQDf+bmuBi98L9qHTGCIFpyaMHQGT7h+MjAjGpyD97hCiW5PDsFsRtco
 03gg==
X-Gm-Message-State: AO0yUKXPzFTgrdXyeJ5Ks2KPiHXnZ548Nz1vactK4Lid+cIkGSrMuvtz
 bVF5dCN9mZCL6tK0tDAMDV9DoQ==
X-Google-Smtp-Source: AK7set/WxohywLbjKTqj05gM5YS2wiarYPup+fjTgxmjn3UL9yS/QpCzDeS59TtDqdl+ZQqqvZJ5tA==
X-Received: by 2002:a17:903:2283:b0:198:a347:44b8 with SMTP id
 b3-20020a170903228300b00198a34744b8mr1575953plh.31.1675222588625; 
 Tue, 31 Jan 2023 19:36:28 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:28 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 13/29] e1000: Configure ResettableClass
Date: Wed,  1 Feb 2023 12:35:23 +0900
Message-Id: <20230201033539.30049-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
2.39.1


