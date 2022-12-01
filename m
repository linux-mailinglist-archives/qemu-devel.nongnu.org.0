Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA88363ED2A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0gPF-0002cm-HI; Thu, 01 Dec 2022 05:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gNt-0002GC-U5
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:01:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p0gNr-0005gj-OW
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:01:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 x13-20020a17090a46cd00b00218f611b6e9so1512687pjg.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PtKtd2hJ8EcNxfGz1vY4RnWHhqsuqaslWXzw703Rq6Q=;
 b=imoQ7zVEvMCW87gnv7CB5VA5micNwZK5nCT5rET8DHfaKF6xnjggMAFPOSUYgnl/6T
 VVcr9RIZi7cyMhCcia5ZmZnzfA2GFkJvRQhsHxMAcB7KLqC1sI32/eEvDzup6pv+K5Xk
 YgCd+fLFeD0f1ydCYgc8O49DGnPSDrxQX3aeWr+Pu2iDhRW7Nr5vVEFNhThiv6Xn15F/
 kJs8KFDTL2GDuYoxGqkxXidZ15T3w4PQ+/YolcgNN1+p/g2VxLHDUJ3wqg2F+Kuekl2R
 HNK5qngvOZoKwCHEh9kNRJ1ZO1Vdfo1gJTQV/DOpGmgqAoWpsd30BchQu7GpUO/0NnMx
 +b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtKtd2hJ8EcNxfGz1vY4RnWHhqsuqaslWXzw703Rq6Q=;
 b=pt6s+SN29eeHGbuffavbsEb8mLBk2ZzDKTt1WQAEqohdM/rWDqtL667GnoruLrdWIN
 /jxp+P/w3D1QzxwnuoBig6oaeT4xPHPcKABJOa8DKZnZmtN6R918VD6dBgSQhWIclFGb
 KTQNlUZeI7x88nx+dlHmBCMgkfZWjF+3owJWJxnU7sS8uTKS4BN0QQJOYiTzwv20Zhnc
 dZx3fTyj7Cx/Ve1lFF4EUORSwU3VQCRC2mEPNPuLU9hssLuYRFrphRvb6izc1QqfWJXS
 hkcs0pELzqDIMRbHHf2QMjdaIYvpRutPKBkSS5MgXVBvc6HsCMHKEhWdtU/7AT3m6Nn9
 yAqQ==
X-Gm-Message-State: ANoB5pkJ+caeugz7p8kIzH/rOyGb7B9dknAzpHQolBcKDpVlklu8lXbr
 ECr4cQ4PsQXLlokW/5hTWfzQi26i0uNMAeTE
X-Google-Smtp-Source: AA0mqf7CuL1vBxtHAyus7zO7Sh54teXK1GXX5jr2NIjxBrNYow0vYinXd7UWcrKZWyNdoQUFBnNY/w==
X-Received: by 2002:a17:90a:dd83:b0:218:61bd:d00d with SMTP id
 l3-20020a17090add8300b0021861bdd00dmr73273255pjv.236.1669888893632; 
 Thu, 01 Dec 2022 02:01:33 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170903234500b0017f48a9e2d6sm3183969plh.292.2022.12.01.02.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 02:01:33 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3] e1000e: Configure ResettableClass
Date: Thu,  1 Dec 2022 19:01:13 +0900
Message-Id: <20221201100113.64387-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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


