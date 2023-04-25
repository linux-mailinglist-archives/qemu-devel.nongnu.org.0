Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3676EDD29
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOV-0002cT-VC; Tue, 25 Apr 2023 03:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNk-0001ja-H5
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNi-0006sW-3r
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ENB/ftYh8f6TIyn1LHdOpb4fofLhwW3Aa4TSW+e9pK0=;
 b=c9l+g8QCBGmhA/awuR4tkVM+L1yY61vXh8u9sLfKVeIEn7iZL7theA3ZKThbko7HGdwqFY
 1cU851xdt90Awy4TgItBRMgU/card+qDwY9Z9+ldTSBxVf3MV3DWtZ6r7JUi3mKLOOyRnJ
 ouUV/0j3Xz3PygfKv0IxGC5/WfcpyPA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-_P61B52jNHefddncIO9SiA-1; Tue, 25 Apr 2023 03:46:32 -0400
X-MC-Unique: _P61B52jNHefddncIO9SiA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so29624095e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408790; x=1685000790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENB/ftYh8f6TIyn1LHdOpb4fofLhwW3Aa4TSW+e9pK0=;
 b=jjg3rgNRtAHS4cKcbt5wR7EwACdBiru7RJXVxToCscAS7BYpezgocEAtNzOT/MEpMd
 JzPhCja2HHSzHBvn+pLddAesD7dvNrK9ER/m8L80TYkGkV2sI7bwJpYIvBfjr4EI/c+3
 ntbI8wfoLfgC8+/MXYqQzUJfC/t6OvF3o0TQVuHKHpwhLlvJrxSqJRF4KeICGkHkwZDX
 4VbfM7hvnl0XpSzJrEEIZTUp7gFKhIz/JWLsFirKZ4QixOjLLmUKW+3vQSqcyUoIhgM1
 ekcOhaIZLvixSVeqirP8ADsP/QR+7M7JEIA5QQGtxSplAxYh8huH+uItDh3D1hebHdyC
 Ir6A==
X-Gm-Message-State: AAQBX9fqXgKUBwuoGPLRgAWINBMfsIRG+53BhvHitDM0p4DvY2TPcrRj
 cRSCQ/Gv13hkedSQMWr7WnChssqCpIQdwYkHavCJOWPqSZ4R14NIRjbMDP3qTyAT9vZISvYip6G
 q94Od9Q73V9ADaKJcZuhnyACpF0e6pwK+2vdE9gbOCBD5FwF5Zvs72gk+cHxiB7twahjU
X-Received: by 2002:a5d:6b04:0:b0:2f6:121a:c1d0 with SMTP id
 v4-20020a5d6b04000000b002f6121ac1d0mr11403745wrw.19.1682408790474; 
 Tue, 25 Apr 2023 00:46:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350b9oMWpcaOo9YS0u2xc5QZ9xJjUc/hUU7fOHMT4xr6ajAIw2XlK4SrOYqsuDHm7agZ9vwhQdA==
X-Received: by 2002:a5d:6b04:0:b0:2f6:121a:c1d0 with SMTP id
 v4-20020a5d6b04000000b002f6121ac1d0mr11403733wrw.19.1682408790086; 
 Tue, 25 Apr 2023 00:46:30 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm12524587wrc.6.2023.04.25.00.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:29 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 27/31] docs/specs/pci-ids: Convert from txt to rST
Message-ID: <0c0e21d1c1e2dde4f7437bcd5c53127013cc25f7.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Peter Maydell <peter.maydell@linaro.org>

Convert the pci-ids document from plain text to reStructuredText.

I opted to use definition-lists here because rST tables are
super-clunky, and actually formatting these as tables didn't
seem necessary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230420160334.1048224-2-peter.maydell@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/pci-ids.txt | 70 ------------------------------
 docs/specs/index.rst   |  1 +
 docs/specs/pci-ids.rst | 98 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+), 70 deletions(-)
 delete mode 100644 docs/specs/pci-ids.txt
 create mode 100644 docs/specs/pci-ids.rst

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
deleted file mode 100644
index e463c4cb3a..0000000000
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
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index a58d9311cb..8aa0fcb77a 100644
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
index 0000000000..e1cf022006
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
-- 
MST


