Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718B685DF4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3vJ-0006iA-15; Tue, 31 Jan 2023 22:36:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vG-0006eF-Bz
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:34 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3vE-0000PH-PI
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:34 -0500
Received: by mail-pl1-x629.google.com with SMTP id e6so8951215plg.12
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKDVIajL0grC0IZX1mMpfaruSFD28K8Vy5dxxXgXXEo=;
 b=ZcvVBZWQUGQ0UxlYQxl3IpZ1lJMdv61l8aXjsIUSuwrQAAdftzv8ossBmX7F089ow4
 JnBmP5aS6I338COFrRSx7K+LNAtyUR3o4R4lqHxGM47qbGGDVuCSsd3iUOTTFrspr3S5
 uUEDOYTGfA3XGs2AQiEGenMjrErb5BZKEYVT198rfpu5NoNYTTY3O6Cg7uKYwk4XkL5q
 cBmOcCX7PK5tOz2lMze0+bEwUj1IcVJh6nPuQCJ+z217Se+us1NdvKzN9vHvLcirHnlb
 mbAkBYkac4mdwsTkCL9ppkLZxAPGO45mNea87COXlEhMmRnLJxxH2dhjWuLfvAGNtMK5
 jIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKDVIajL0grC0IZX1mMpfaruSFD28K8Vy5dxxXgXXEo=;
 b=c+H6n01pQlG7VLBLBT5Y5yDtFutH4/6OuET1vYRoXMv/NzMG/4lE1zmi/4pbehuqTW
 KacZRNRsh0oQlzEwyvVTIPaGp0wyhIfJFPI/7yB8y4I80e1TttJV8rR0FWYYgp6+9dCU
 kC6Ouq7QWugJvZRTfyhRibYgg5hChX2BmAGz6cooIxHKDNiZhDSUUALjXOFR09CZyxNR
 OHvwJtjkjghT27ix8bet8bc5/t8Xxni+yNRB1ZuDuqCp/DmatSKFBTJIXs7FiouSQVdo
 lRRNetRHf+lNoC0KZp/TL7mImL6gvY/eiB0Lcy5bxYIpiGGkT4MWV7iceSlTcSh11tdo
 VTlw==
X-Gm-Message-State: AO0yUKVX8e3bgp7fhW+Ya+rU8f1xj7FPolnZgoDdMYPedSkc/+6bTLzW
 FjBK/c3gUBPA3TrZg3pdmV/TEg==
X-Google-Smtp-Source: AK7set/YzOZIyU4GQzH6PbYnUPbBDV//f9RdxdjCoHdb+qbAlxSuEzYh5Y+WiCfQAWqPTncVX0dgkA==
X-Received: by 2002:a17:902:dac8:b0:194:645a:fa9a with SMTP id
 q8-20020a170902dac800b00194645afa9amr1694365plx.8.1675222592022; 
 Tue, 31 Jan 2023 19:36:32 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:31 -0800 (PST)
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
Subject: [PATCH v5 14/29] e1000e: Configure ResettableClass
Date: Wed,  1 Feb 2023 12:35:24 +0900
Message-Id: <20230201033539.30049-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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
 hw/net/e1000e.c     | 10 ++++++----
 hw/net/trace-events |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 0bc222d354..ec274319c4 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -513,11 +513,11 @@ static void e1000e_pci_uninit(PCIDevice *pci_dev)
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
index 8fa4299704..c98ad12537 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -251,7 +251,7 @@ e1000e_vm_state_stopped(void) "VM state is stopped"
 # e1000e.c
 e1000e_cb_pci_realize(void) "E1000E PCI realize entry"
 e1000e_cb_pci_uninit(void) "E1000E PCI unit entry"
-e1000e_cb_qdev_reset(void) "E1000E qdev reset entry"
+e1000e_cb_qdev_reset_hold(void) "E1000E qdev reset hold"
 e1000e_cb_pre_save(void) "E1000E pre save entry"
 e1000e_cb_post_load(void) "E1000E post load entry"
 
-- 
2.39.1


