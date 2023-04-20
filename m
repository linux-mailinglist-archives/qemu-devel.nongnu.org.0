Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD36E9888
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:40:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWOB-0001ea-6a; Thu, 20 Apr 2023 11:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1ppWO8-0001dY-VJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:40:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robin@streamhpc.com>)
 id 1ppWO7-0002gG-Fd
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:40:00 -0400
Received: by mail-ej1-x62d.google.com with SMTP id a5so7355728ejb.6
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=streamhpc-com.20221208.gappssmtp.com; s=20221208; t=1682005197; x=1684597197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fMSXDOyBHSzUo4V9CU8EMz5/zuTCjkvesZBc0BhhGlk=;
 b=BXHKBdyYDmXuJqbRMXQotKkZ+OOFH9r1++BUUvn2mhnuRTcUM8G4obRwn1GrE5UU6F
 TObwVuTsLjQ3gTjJvC0/7LEb4Yy/mY4ckFSrg1VjhSoG3obxvBKnK46B89R2NOjEgNld
 YDfP8eYLL8oGz0NPIbloR3Km5U+qhhge7YxX8nJ5Spqn9LYb1+WyWfgTFudeAjMy5/9y
 bbxRyCOGasgLq1orRhQDW/6Kc0Sy+hu/8TZxUHaUAoUCfd8Ni4wxu4MhnuIMbzNDmYro
 vfekRd7Abq6YOZQDA9LhVbXIu9C+8YgOuCygasaz1aup+6+8BfdXGxfHrkGuORDGgZ77
 Dj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682005197; x=1684597197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fMSXDOyBHSzUo4V9CU8EMz5/zuTCjkvesZBc0BhhGlk=;
 b=S8Aktc0CmiNrzIr4cOE4TdLYWXWnjhLzetaFaaPdrhRAbi60JRueq/z57l/XnZbeoX
 Ai75YkbaYRxTIugN1yCwIBK5yqdNq90WMfn/RKsmdb1Z9mE/wVccI9DL7Rtn6Vm/4vZz
 ZjmuDuncSLRoLSgnlFsupGfBbhHdgFDuaajPhI7kpjLXUugXQXNchfEC8oMOMPb3+5bD
 lyoWOVQB2tMxKr4nMLWz8KX948if8dd1iOLqYJQdz7ne12JRqaWhE2oC4mKHV0QemD60
 afzy70aeh2cSsz3TKU26b0RqW+G9nNz8uqeKzzhGRQv/YLPgWQi5N/I2eGLASlRcqaNq
 MojQ==
X-Gm-Message-State: AAQBX9evrr+T2UoCX2xQU3/uwcBgWQr8Lm3Het31YHX2C1jihs9Ccydp
 DL1Ys3klp66Eo8Jyt7TxycBHUaTVBybvNNmciug=
X-Google-Smtp-Source: AKy350b79GBW17UivoDNW6XF1/Revf0RVNc3LUsUb9VPXEWK1GIgQ9yZ9v0S89aiLf7IZOTGjCOzVg==
X-Received: by 2002:a17:906:9713:b0:94e:eab3:9e86 with SMTP id
 k19-20020a170906971300b0094eeab39e86mr1987665ejx.33.1682005197721; 
 Thu, 20 Apr 2023 08:39:57 -0700 (PDT)
Received: from localhost.localdomain (095-097-139-014.static.chello.nl.
 [95.97.139.14]) by smtp.gmail.com with ESMTPSA id
 r2-20020a1709063d6200b00949691d3183sm859463ejf.36.2023.04.20.08.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:39:57 -0700 (PDT)
From: robin@streamhpc.com
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Robin Voetter <robin@streamhpc.com>
Subject: [PATCH 1/1] pcie: Allow generic PCIE root port to enable atomic
 completion
Date: Thu, 20 Apr 2023 17:38:40 +0200
Message-Id: <20230420153839.167418-2-robin@streamhpc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420153839.167418-1-robin@streamhpc.com>
References: <20230420153839.167418-1-robin@streamhpc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=robin@streamhpc.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Robin Voetter <robin@streamhpc.com>

Adds an experimental option to the pcie-root-port to make it report
support for the PCIe atomic completion capabilities.  This can now be
enabled by setting the x-atomic-completion option on the pcie-root-port
device.  Defaults to disabled for now.  For example:

    -device pcie-root-port,x-atomic-completion=true,id=pcie.1

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Robin Voetter <robin@streamhpc.com>
---
 hw/pci-bridge/gen_pcie_root_port.c | 2 ++
 hw/pci/pcie.c                      | 6 ++++++
 include/hw/pci/pcie_port.h         | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index 1ce4e7beba..097eaecbed 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -145,6 +145,8 @@ static Property gen_rp_props[] = {
                                 speed, PCIE_LINK_SPEED_16),
     DEFINE_PROP_PCIE_LINK_WIDTH("x-width", PCIESlot,
                                 width, PCIE_LINK_WIDTH_32),
+    DEFINE_PROP_BOOL("x-atomic-completion", PCIESlot,
+                     atomic_completion, false),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b8c24cf45f..5dd61e3cdb 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -663,6 +663,12 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
 
     qbus_set_hotplug_handler(BUS(pci_bridge_get_sec_bus(PCI_BRIDGE(dev))),
                              OBJECT(dev));
+
+    if (s->atomic_completion) {
+        /* PCIe requires setting both comp32 and comp64 if either is supported */
+        pci_set_long(dev->config + dev->exp.exp_cap + PCI_EXP_DEVCAP2,
+                     PCI_EXP_DEVCAP2_ATOMIC_COMP32 | PCI_EXP_DEVCAP2_ATOMIC_COMP64);
+    }
 }
 
 void pcie_cap_slot_reset(PCIDevice *dev)
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index 90e6cf45b8..5e85657bb0 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -68,6 +68,9 @@ struct PCIESlot {
     /* broken ACPI hotplug compat knob to preserve 6.1 ABI intact */
     bool        hide_native_hotplug_cap;
 
+    /* Enables PCIE Atomic completion on pcie_root_port */
+    bool atomic_completion;
+
     QLIST_ENTRY(PCIESlot) next;
 };
 
-- 
2.39.2


