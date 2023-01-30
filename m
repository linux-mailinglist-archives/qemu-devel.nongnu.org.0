Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41C680F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUW7-00049c-7W; Mon, 30 Jan 2023 08:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUW5-00048g-Rz
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:13 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUW3-0003jo-LY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so11182913pjl.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKDVIajL0grC0IZX1mMpfaruSFD28K8Vy5dxxXgXXEo=;
 b=n5USP73N9pFABRwhkq8fV8QNs2CgCRYdB/eUwekLtSxP7NlvFgBZM6u61qPxYNg67i
 Z2tQZel+FV7t3ZrYJWwnk8M7Tf78s7w7ztR7A2bklTj6Y1s1yDAGVr1MPz4CqCe7zyuO
 cL3krzrZpzEM9hv/MgZW5JXUgWODoADSazu1MFfIQ6YoLSVdQgP8WlPvufnhzL6pXW7a
 wt3N4uKk5IL8RaidH1UBtPx5Z6edFTsWhsDRaa4RYlXNaDyiRXavMbi/w6wY4pEuJ0JE
 DkzMJkG4t4TN6IrSzLaemgQNLDexPRFuahtEDUxI2MfMGFmvKjzoVk+nkujl5ss7CZts
 GrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKDVIajL0grC0IZX1mMpfaruSFD28K8Vy5dxxXgXXEo=;
 b=VZ+a9AgaxuPmzbOdzVMbyruC27jgwnn9Qo4WdaBpjHL+urEJMSg5VgRjc7RMMcMFmM
 Vm7kdBqhenm0Y22hidP2du9TQh2zAFjjXICh3d2TK4GWGqtIAnHR6CxSe9GU7zYDzn1b
 TlVxZz8IhBQSbrCXaRMe9VgrkVa53srVZIMtcpfWwIyblvpUMWMV83yEhnyuOb7YpoOh
 jOb3S9sXAuwSpUIbxMH//TcyP9Ba9O8eNv7G2P/ZSQ4/WjR91Byod5r2YN0tBIeA+wva
 08l8PsxL8a3hmjZhHFBwFhEhoGDLPuVHuGV8GJ5jdYuGNYO67Cw0J5dPMKfqTVkIFTO2
 ehgQ==
X-Gm-Message-State: AFqh2kpFtZnxy4ARXH8UsTmznos2kEcIyLn+rJjMjxOW7hpa2jBKk0Wp
 ZEpmoGXFc/WaL/FvAIKslpCJuQ==
X-Google-Smtp-Source: AMrXdXsljQdbYEJ+bgZAKlhcRb2viKuwQc1CCwXcMDsHqCXLPY0vo41B8tmxeGDDXJkYeixWUSqjAg==
X-Received: by 2002:a17:902:a405:b0:194:8b10:3bcf with SMTP id
 p5-20020a170902a40500b001948b103bcfmr43530733plq.49.1675086489872; 
 Mon, 30 Jan 2023 05:48:09 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:09 -0800 (PST)
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
Subject: [PATCH v4 14/28] e1000e: Configure ResettableClass
Date: Mon, 30 Jan 2023 22:47:01 +0900
Message-Id: <20230130134715.76604-15-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


