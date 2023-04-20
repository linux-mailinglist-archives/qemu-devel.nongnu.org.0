Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949826E990C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:04:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWl4-00019W-1k; Thu, 20 Apr 2023 12:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWl2-00018G-0I
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:40 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppWkz-0002XG-Sm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:03:39 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f17eb6b10fso5396845e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006616; x=1684598616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KtWjk1YyPAFh2YYAWYSn8+5K1aVdmzHriMxzP/WY2c=;
 b=iOtpz8HLtECW2CT06kHZQa2LzJD3zv3c80JbLbDZQE4fCRSuaVng2didrcgzde0Y0Q
 r8721XymBq3VgHY+OMSUaRYIGvycHc5bXFuU7sv+Ja8ZpC6QDJV7iN4qjU2sO3P9k0LL
 xSDhDtUtN5RG5tjWGk8GgZ0ID1+4NrDh+5QFVCkc1BWiwSuA/TrlsjD/L+MSoGAu/5R1
 yDOIIfQ06nm3kX6onv5t9wDqjGz+Oaza5oVENZ+K8SwEEyJKttmwsppwua1UmmHDeqJa
 8nxLC0rHTtapuufWgS/p837hhEU65dsj/vNcL1XM//Ce4HOnPhk73EX/FqmzEzNQTrSO
 GkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006616; x=1684598616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KtWjk1YyPAFh2YYAWYSn8+5K1aVdmzHriMxzP/WY2c=;
 b=IReYIQZlEa35drBBchxhH7FDPxN5xn8JwoleAjCQQKliqVnyarvQ11WTZsiKtzwCAY
 TR63usSMjiCtoAhyC+hfsvwgODru+skj5fsjzWXn3QfdVkJeerxlOSZMyFKkaxkXaYfQ
 mLOtT3zShvFwaxW5sqHz7YYM76Rqywl6ZmAwNlLWG8NviJCA4SmbVcEWWk6EudsIDL3E
 5SRhIvGzP6aSEw5JrWHK6H3l8jTag0YwB5dW2kVPbD35debDbGQ++hzB+O9Q8k5cIk9v
 G29L/+/2lyNfCY9/nCPJ/15SwICHt8/wUTrMginQoxD2gRYBStidr7WaAqgDCh9YoXYa
 M9iA==
X-Gm-Message-State: AAQBX9fMG+VYuDdmVbU8X8Gd0ck0irJ9+4hmfJ14YNf4haZWku9gSAu0
 IqGPalfzHzHs/owfAvSblBzhToHLNqmhBueV03I=
X-Google-Smtp-Source: AKy350YAqY+IjnaLl0AmoFJGI9Im1+zXnP/sOYKnY3DTHPLSRR8ih3qM2jjaJLp1cRLOw22o1eSA9A==
X-Received: by 2002:a5d:508c:0:b0:2f4:bc68:3493 with SMTP id
 a12-20020a5d508c000000b002f4bc683493mr1814035wrt.34.1682006616267; 
 Thu, 20 Apr 2023 09:03:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe44f000000b002f00793bd7asm2310713wrm.27.2023.04.20.09.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 09:03:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/3] docs/specs/pci-ids: Convert from txt to rST
Date: Thu, 20 Apr 2023 17:03:32 +0100
Message-Id: <20230420160334.1048224-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420160334.1048224-1-peter.maydell@linaro.org>
References: <20230420160334.1048224-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Convert the pci-ids document from plain text to reStructuredText.

I opted to use definition-lists here because rST tables are
super-clunky, and actually formatting these as tables didn't
seem necessary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/index.rst   |  1 +
 docs/specs/pci-ids.rst | 98 ++++++++++++++++++++++++++++++++++++++++++
 docs/specs/pci-ids.txt | 70 ------------------------------
 3 files changed, 99 insertions(+), 70 deletions(-)
 create mode 100644 docs/specs/pci-ids.rst
 delete mode 100644 docs/specs/pci-ids.txt

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index a58d9311cb3..8aa0fcb77a9 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -8,6 +8,7 @@ guest hardware that is specific to QEMU.
 .. toctree::
    :maxdepth: 2
 
+   pci-ids
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
diff --git a/docs/specs/pci-ids.rst b/docs/specs/pci-ids.rst
new file mode 100644
index 00000000000..e1cf022006b
--- /dev/null
+++ b/docs/specs/pci-ids.rst
@@ -0,0 +1,98 @@
+================
+PCI IDs for QEMU
+================
+
+Red Hat, Inc. donates a part of its device ID range to QEMU, to be used for
+virtual devices.  The vendor IDs are 1af4 (formerly Qumranet ID) and 1b36.
+
+Contact Gerd Hoffmann <kraxel@redhat.com> to get a device ID assigned
+for your devices.
+
+1af4 vendor ID
+--------------
+
+The 1000 -> 10ff device ID range is used as follows for virtio-pci devices.
+Note that this allocation is separate from the virtio device IDs, which are
+maintained as part of the virtio specification.
+
+1af4:1000
+  network device (legacy)
+1af4:1001
+  block device (legacy)
+1af4:1002
+  balloon device (legacy)
+1af4:1003
+  console device (legacy)
+1af4:1004
+  SCSI host bus adapter device (legacy)
+1af4:1005
+  entropy generator device (legacy)
+1af4:1009
+  9p filesystem device (legacy)
+1af4:1012
+  vsock device (bug compatibility)
+
+1af4:1040 to 1af4:10ef
+  ID range for modern virtio devices.  The PCI device
+  ID is calculated from the virtio device ID by adding the
+  0x1040 offset.  The virtio IDs are defined in the virtio
+  specification.  The Linux kernel has a header file with
+  defines for all virtio IDs (``linux/virtio_ids.h``); QEMU has a
+  copy in ``include/standard-headers/``.
+
+1af4:10f0 to 1a4f:10ff
+  Available for experimental usage without registration.  Must get
+  official ID when the code leaves the test lab (i.e. when seeking
+  upstream merge or shipping a distro/product) to avoid conflicts.
+
+1af4:1100
+  Used as PCI Subsystem ID for existing hardware devices emulated
+  by QEMU.
+
+1af4:1110
+  ivshmem device (shared memory, ``docs/specs/ivshmem-spec.txt``)
+
+All other device IDs are reserved.
+
+1b36 vendor ID
+--------------
+
+The 0000 -> 00ff device ID range is used as follows for QEMU-specific
+PCI devices (other than virtio):
+
+1b36:0001
+  PCI-PCI bridge
+1b36:0002
+  PCI serial port (16550A) adapter (``docs/specs/pci-serial.txt``)
+1b36:0003
+  PCI Dual-port 16550A adapter (``docs/specs/pci-serial.txt``)
+1b36:0004
+  PCI Quad-port 16550A adapter (``docs/specs/pci-serial.txt``)
+1b36:0005
+  PCI test device (``docs/specs/pci-testdev.txt``)
+1b36:0006
+  PCI Rocker Ethernet switch device
+1b36:0007
+  PCI SD Card Host Controller Interface (SDHCI)
+1b36:0008
+  PCIe host bridge
+1b36:0009
+  PCI Expander Bridge (-device pxb)
+1b36:000a
+  PCI-PCI bridge (multiseat)
+1b36:000b
+  PCIe Expander Bridge (-device pxb-pcie)
+1b36:000d
+  PCI xhci usb host adapter
+1b36:000f
+  mdpy (mdev sample device), ``linux/samples/vfio-mdev/mdpy.c``
+1b36:0010
+  PCIe NVMe device (``-device nvme``)
+1b36:0011
+  PCI PVPanic device (``-device pvpanic-pci``)
+1b36:0012
+  PCI ACPI ERST device (``-device acpi-erst``)
+
+All these devices are documented in :doc:`index`.
+
+The 0100 device ID is used for the QXL video card device.
diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
deleted file mode 100644
index e463c4cb3a2..00000000000
--- a/docs/specs/pci-ids.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-
-PCI IDs for qemu
-================
-
-Red Hat, Inc. donates a part of its device ID range to qemu, to be used for
-virtual devices.  The vendor IDs are 1af4 (formerly Qumranet ID) and 1b36.
-
-Contact Gerd Hoffmann <kraxel@redhat.com> to get a device ID assigned
-for your devices.
-
-1af4 vendor ID
---------------
-
-The 1000 -> 10ff device ID range is used as follows for virtio-pci devices.
-Note that this allocation separate from the virtio device IDs, which are
-maintained as part of the virtio specification.
-
-1af4:1000  network device (legacy)
-1af4:1001  block device (legacy)
-1af4:1002  balloon device (legacy)
-1af4:1003  console device (legacy)
-1af4:1004  SCSI host bus adapter device (legacy)
-1af4:1005  entropy generator device (legacy)
-1af4:1009  9p filesystem device (legacy)
-1af4:1012  vsock device (bug compatibility)
-
-1af4:1040  Start of ID range for modern virtio devices.  The PCI device
-   to      ID is calculated from the virtio device ID by adding the
-1af4:10ef  0x1040 offset.  The virtio IDs are defined in the virtio
-           specification.  The Linux kernel has a header file with
-           defines for all virtio IDs (linux/virtio_ids.h), qemu has a
-           copy in include/standard-headers/.
-
-1af4:10f0  Available for experimental usage without registration.  Must get
-   to      official ID when the code leaves the test lab (i.e. when seeking
-1af4:10ff  upstream merge or shipping a distro/product) to avoid conflicts.
-
-1af4:1100  Used as PCI Subsystem ID for existing hardware devices emulated
-           by qemu.
-
-1af4:1110  ivshmem device (shared memory, docs/specs/ivshmem-spec.txt)
-
-All other device IDs are reserved.
-
-1b36 vendor ID
---------------
-
-The 0000 -> 00ff device ID range is used as follows for QEMU-specific
-PCI devices (other than virtio):
-
-1b36:0001  PCI-PCI bridge
-1b36:0002  PCI serial port (16550A) adapter (docs/specs/pci-serial.txt)
-1b36:0003  PCI Dual-port 16550A adapter (docs/specs/pci-serial.txt)
-1b36:0004  PCI Quad-port 16550A adapter (docs/specs/pci-serial.txt)
-1b36:0005  PCI test device (docs/specs/pci-testdev.txt)
-1b36:0006  PCI Rocker Ethernet switch device
-1b36:0007  PCI SD Card Host Controller Interface (SDHCI)
-1b36:0008  PCIe host bridge
-1b36:0009  PCI Expander Bridge (-device pxb)
-1b36:000a  PCI-PCI bridge (multiseat)
-1b36:000b  PCIe Expander Bridge (-device pxb-pcie)
-1b36:000d  PCI xhci usb host adapter
-1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
-1b36:0010  PCIe NVMe device (-device nvme)
-1b36:0011  PCI PVPanic device (-device pvpanic-pci)
-1b36:0012  PCI ACPI ERST device (-device acpi-erst)
-
-All these devices are documented in docs/specs.
-
-The 0100 device ID is used for the QXL video card device.
-- 
2.34.1


