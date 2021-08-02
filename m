Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24403DD27F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:02:11 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATpp-0005oV-Nm
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mATon-00057X-3C
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:01:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1mAToj-00011U-Po
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:01:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so7827825wms.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhB4PyOnyO327paQU/h6hIMA6+zNl614oQl47zLAr98=;
 b=CH1JIHVY29VfvLhX0phcCNegDzUwXgqHq7Bfsf70tsHPrZJJw78EBYZQow95fw7Psd
 OXd3Cbl7f8thSiGZAkhnrcUIw9NyX+JoHLeLSQ3BghCgoYPHtRF07atEqnYAUiJPR4fQ
 aRuBu0NTZqQE6DxbhiglXtKjZzii/0nW26OxKMF+W6xrOJ6WcsH4ZGkVjxRntI6C1drW
 8+vwX0451gqzS8RI3ri2+zU2stQAAppLRBaujrU5EOuOHHpCUuukJcolB1iTxl+0/b4c
 HQMlKFD8Bj/KrEQvtCPH+gxF8/+o4eZQl1TBnsGxKbQRewQF/8jJD8teosRAOwVKRGrN
 gyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhB4PyOnyO327paQU/h6hIMA6+zNl614oQl47zLAr98=;
 b=TQVPYgJh4FbQ805bc6XItT8OXCuzPJOy3O7fmWIQL5XXv0SPHY4fZjay0D0uesRqai
 4hjqSI3XKzgKz4ArYbrZjCcS+8zS5yMUoTC/d2+Fw94LE1sCTJV4DDQFYtDsJ315O5h7
 QhStaRBXIZszL2RpQ6MkFGtt0d5OeeeUGz0e5SnBLULzPE7pjxtyUdqcOtKiM6lUAR1i
 muULYZRU74pDSfuX5H+vsa66uRg+SaXHFBv1K/AZNb6ZF5zWJS8WjPvNmjjU57E5Tb+0
 2dPFnFxLN6PRsClqXTW9Cn3KU9QwUo/UELQNomn7lr6JSvBInlZqsRq6JvpAbnVjGAM9
 vBhg==
X-Gm-Message-State: AOAM53195lCxXJORuaG6Pt2/BeU3w41RayEGW1T8Kbsf1SWnQHR+bkuD
 iK8qZxKmIYTS+5Qur4Ql/lyYuNZI88o=
X-Google-Smtp-Source: ABdhPJxpno+FApFF/9e3JZhOxtWqWPndhjdEGNTCAcIZl39qySiDBDaV3K/nwW8onDM6V5MgtjSakQ==
X-Received: by 2002:a1c:1bcd:: with SMTP id
 b196mr15372105wmb.160.1627894859775; 
 Mon, 02 Aug 2021 02:00:59 -0700 (PDT)
Received: from mapfelba.lan (bzq-84-109-29-12.red.bezeqint.net. [84.109.29.12])
 by smtp.gmail.com with ESMTPSA id w1sm9681852wmc.19.2021.08.02.02.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 02:00:59 -0700 (PDT)
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
X-Google-Original-From: Marcel Apfelbaum <marcel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
Date: Mon,  2 Aug 2021 12:00:57 +0300
Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=marcel.apfelbaum@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcel@redhat.com, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
As opposed to native PCIe hotplug, guests like Fedora 34
will not assign IO range to pcie-root-ports not supporting
native hotplug, resulting into a regression.

Reproduce by:
    qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
    device_add e1000,bus=p1
In the Guest OS the respective pcie-root-port will have the IO range
disabled.

Fix it by setting the "reserve-io" hint capability of the
pcie-root-ports so the firmware will allocate the IO range instead.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
---
v2:
   - improve commit message (Igor)

 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pcie_root_port.c
index ec9907917e..20099a8ae3 100644
--- a/hw/pci-bridge/gen_pcie_root_port.c
+++ b/hw/pci-bridge/gen_pcie_root_port.c
@@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, GEN_PCIE_ROOT_PORT)
         (GEN_PCIE_ROOT_PORT_AER_OFFSET + PCI_ERR_SIZEOF)
 
 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR       1
+#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE          4096
 
 struct GenPCIERootPort {
     /*< private >*/
@@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *opaque, int version_id)
 static void gen_rp_realize(DeviceState *dev, Error **errp)
 {
     PCIDevice *d = PCI_DEVICE(dev);
+    PCIESlot *s = PCIE_SLOT(d);
     GenPCIERootPort *grp = GEN_PCIE_ROOT_PORT(d);
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(d);
     Error *local_err = NULL;
@@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (grp->res_reserve.io == -1 && s->hotplug && !s->native_hotplug) {
+        grp->res_reserve.io = GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
+    }
     int rc = pci_bridge_qemu_reserve_cap_init(d, 0,
                                               grp->res_reserve, errp);
 
-- 
2.31.1


