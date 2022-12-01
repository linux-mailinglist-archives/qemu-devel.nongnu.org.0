Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127263ECF3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 10:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gGh-0000dG-7a; Thu, 01 Dec 2022 04:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gGe-0000cz-20
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:54:08 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gGb-0003ut-BE
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 04:54:06 -0500
Received: by mail-pg1-x531.google.com with SMTP id q71so1211710pgq.8
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 01:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yHpyqJ3tvUHBCREG3Pa1Aa2FYYv+dS5u+TiioURtseg=;
 b=xo5zUl+NsDgDFaZga4xtv8tTwVv0XTwV12iLJ7oI6V4inVAlMUF7T/bBQDIG0SLFiC
 OXnWkY/uYENLAwzJ4M0NJHpqy4cUYWlHI2/vWzNoeayoyQ3ObUHr0iRDOnThJwMyHp1q
 Tm71ggPclvYJc1ZOu6h8BEIjN8YBrO1kpKzu7YzVTkLW4r3gmHt9ZyrR8zh82hnjjGnt
 DnOkXKVWZt3cxKV9NPXHhaPWUbDP384izRhX9ceVX+5MeBZ78cJp5Oih0flbo2yg74Dl
 yROXnrmboaUMTzXT4bHEcg9KjjkEWa0UoM/eq75700+0jrWpL1eHtIchQQ/DaLf515Pd
 ACwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHpyqJ3tvUHBCREG3Pa1Aa2FYYv+dS5u+TiioURtseg=;
 b=ihkZsiEGRJQk2UbqSdPGbOYAdE4waYLt1qDf1nDpdqx+W7XpMHICqH4HWFNM5BqYUf
 R6CgR7uyEQHIsdtfbIn595Rv0OYbR1q+dKDeb7lSpsPODW+VKg5HSGXuLPuCajOTp/tG
 brzj6/LTDtZMcz4EG2Usfi/rWnt3Pui9/DUTcTdivoDO9fU6QgEicZDfLFWq+3Dxmk4N
 T9awG/c3Bjr9zS+3gOJpstrNXhTBFLawnvMt9apwEY01YRPie5f8hAdfBq7OVxFx7xf6
 Ftvpq40OWJSu/jsb59YwrdAc4usgREzh4GIbIE6FoV8wyVQyckCBd7hKlepGuxqubigD
 MdJw==
X-Gm-Message-State: ANoB5pmsa8zhDZVM9+0ogFkScSjI8iFNApguILpTxhJPWeAwxqRDkKc/
 8/Mzi4aN5MISdorUksZP2hNZScY6oFaCNrhb
X-Google-Smtp-Source: AA0mqf40V4T2eISOlSJZpSF6slK02T3kMYk+w8OmCqgsQ+jkye63N3x3a0p4brIin9skjbh6b9XNjg==
X-Received: by 2002:a63:4e0a:0:b0:477:96e2:9264 with SMTP id
 c10-20020a634e0a000000b0047796e29264mr38935518pgb.422.1669888443433; 
 Thu, 01 Dec 2022 01:54:03 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 z16-20020aa79590000000b00574e84ed847sm2837492pfj.24.2022.12.01.01.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:54:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] e1000: Configure ResettableClass
Date: Thu,  1 Dec 2022 18:53:51 +0900
Message-Id: <20221201095351.63392-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x531.google.com
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


