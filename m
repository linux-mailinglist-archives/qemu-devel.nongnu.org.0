Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6046C638C57
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZpJ-0007iw-S9; Fri, 25 Nov 2022 09:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZpH-0007ic-VW
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:37:11 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZpG-0002HJ-6K
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:37:11 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so4350160pjb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XcgIJATLqYyDkIH/feV2vGRa+FBqG11GP47w8rglFx4=;
 b=EUQUpFyeFnjtCWyRm18tOaPiF8FF8ETTqD+8QA0qddk4p1CaANkRFNSqzK6ihZH8RQ
 joRafg5IF44olgGztZnJLmYOL/zULVpIRCbdJCvtzasdwTw5WCWMyuncIGCwpxZqs8ot
 MIPOV3U7mw4Ngd+BonTldl2u1f0qRlpCMdOFLxjwf1VsK4QPl9liCqjwux6dZo029YCc
 jN/p26tmZHd1KTiKdsczDr7c9PrgdYJdGRE9HpkCOI9VeYkZQXBqJ9Td3d3ZJSRpwYXe
 i7ff/eNkd5rd0TkGL3wH2jkMZlojoD3IESMJpFcadczyGkHuSbS/hgCsFIcg5TA12i8l
 xXcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XcgIJATLqYyDkIH/feV2vGRa+FBqG11GP47w8rglFx4=;
 b=7WJLgOOxPoyFrqm+j0SfrGh1svRWoppPwvauM5WvyqSkA4Ej7sPSCBiVuMrQQh1BCD
 1Q/jQS6AhUtastuCF84IaeMuxdWrbyj9k1ar7RBm6kl4E6dmPCGiqcekQVNdoXS9dHk6
 uxb8vBPpge8u7EdrvOW762ANocbAZfZ+gpA7xqT/0Sw0JwqQwO399qpG3JbfDtqCWfbh
 YYMQfrfhqtxjuPP9EIkHVcQJ+X2ieN0s6mCwLSbX0hWJOdEabYjrRwMTKd8FyDVilbdo
 QWoNyNk0V8b16a8n53x0ztl0yP8j5Ce48kXsXWRKGK85y6atilYZ98N1Y4Q3zpx+bN/f
 MK+w==
X-Gm-Message-State: ANoB5pmtfyKLzscf1QsU4ABbkok7d7fSJdTIcXPb+3JSQDcu/X+TQ17m
 D71U03zP/ra6niteWh/1fjCKsVM37/NM+Q==
X-Google-Smtp-Source: AA0mqf6P/vTLBKDyJ+zxQtToIh0MWjAOFit8gS0n8ftPGOb/flHvpZUb4MQfsOztJIrKEssZomHumQ==
X-Received: by 2002:a17:90a:5883:b0:218:f84:3f98 with SMTP id
 j3-20020a17090a588300b002180f843f98mr47631274pji.238.1669387028610; 
 Fri, 25 Nov 2022 06:37:08 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 i65-20020a626d44000000b0057458d1f939sm3144151pfc.152.2022.11.25.06.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:37:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] e1000e: Configure ResettableClass
Date: Fri, 25 Nov 2022 23:36:56 +0900
Message-Id: <20221125143656.61756-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/e1000e.c     | 10 ++++++----
 hw/net/trace-events |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 7523e9f5d2..923ad2fc89 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -512,11 +512,11 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
     msi_uninit(pci_dev);
 }
 
-static void e1000e_qdev_reset(DeviceState *dev)
+static void e1000e_qdev_reset_hold(Object *obj)
 {
-    E1000EState *s = E1000E(dev);
+    E1000EState *s = E1000E(obj);
 
-    trace_e1000e_cb_qdev_reset();
+    trace_e1000e_cb_qdev_reset_hold();
 
     e1000e_core_reset(&s->core);
 
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
 
+    rc->phases.hold = e1000e_qdev_reset_hold;
+
     dc->desc = "Intel 82574L GbE Controller";
-    dc->reset = e1000e_qdev_reset;
     dc->vmsd = &e1000e_vmstate;
 
     e1000e_prop_disable_vnet = qdev_prop_uint8;
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 4c0ec3fda1..2bdf437c7c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -253,7 +253,7 @@ e1000e_vm_state_stopped(void) "VM state is stopped"
 # e1000e.c
 e1000e_cb_pci_realize(void) "E1000E PCI realize entry"
 e1000e_cb_pci_uninit(void) "E1000E PCI unit entry"
-e1000e_cb_qdev_reset(void) "E1000E qdev reset entry"
+e1000e_cb_qdev_reset_hold(void) "E1000E qdev reset hold"
 e1000e_cb_pre_save(void) "E1000E pre save entry"
 e1000e_cb_post_load(void) "E1000E post load entry"
 
-- 
2.38.1


