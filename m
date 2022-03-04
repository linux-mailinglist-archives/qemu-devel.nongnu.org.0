Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FAE4CD63F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:22:05 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8om-0006Ad-V8
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8B4-0003WE-Bd
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8B1-00016l-Id
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DkfRe+4XN2ej+2g6vgbi6qb5c1d4eupHyNI5HdgNhQg=;
 b=FG8vywXOOsAP1392/GhHOcLRdZn9gElWdC3PQqhd8/2AXKmsdA0HaI/GvIRpwEypwXOGR1
 PSybR6UCZheVG3yC8+YOreMIxEw5yZXUql8U7ufQbPuMnmYlvvKViOVvyLfgLRnb97AGhR
 SUTF+Q3pQ+1KiQqijTvAWz+edi8JJNU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-1EVUoaSiMBarA7LOgoEWmw-1; Fri, 04 Mar 2022 08:40:57 -0500
X-MC-Unique: 1EVUoaSiMBarA7LOgoEWmw-1
Received: by mail-wm1-f70.google.com with SMTP id
 3-20020a05600c230300b00384e15ceae4so2709311wmo.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DkfRe+4XN2ej+2g6vgbi6qb5c1d4eupHyNI5HdgNhQg=;
 b=YzVOeSvakt9HMJxiflG3EpagHhYHmwUZvY8sFvLYnLQu/nSj1dSTegVcUEMwqxhEYK
 qHc2xB7m/6pEWKUmF065GzGwnsCjcooP1KWn2IwaszhSyrVp6mlJ8YrCRtGi3MXydA3+
 936bqls6Coe9ldYj+WaKZ8lzvWID+pnmX33GExfTNARZgnjr3jf5pBiuvRyoCNAIBrQ+
 rXx7lS3ADD3MXgg/3lRdtSeaxKgUtWSNP7x0flHwjzFY0YmPJLLtphvHaYLOaFzyIPPr
 DDG1VoEBermXro5Rn0jR8kfqyWzeOjs5wwWXD847zVMNe6QIs9DOpH2OGJPgvCp2EteR
 OK3A==
X-Gm-Message-State: AOAM533rK8WhHXntcqH/QjUr/hbULq8JVmqdye42h6/SEZVFBscvA6s5
 oJzDMonRnbObIGUKZOs58J+eoruNjyHkPpzldgYlGftXQWeFuV5ER1M4z81gOCBDqSv7hyp0+Vo
 prxSOa25PJbOn+P0ainNrGWoPqmc5oNl48Yt3uAojVWIDtdzg6vVo9B67QyUo
X-Received: by 2002:a5d:6046:0:b0:1f0:4973:142f with SMTP id
 j6-20020a5d6046000000b001f04973142fmr7021105wrt.538.1646401255419; 
 Fri, 04 Mar 2022 05:40:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeqNd5yxCurJkeFe5EMbVhLFHdd/KUa/U0O1hRd8zSfALxtxjlTCU5h2nMtr1qaFzJ2UR+jA==
X-Received: by 2002:a5d:6046:0:b0:1f0:4973:142f with SMTP id
 j6-20020a5d6046000000b001f04973142fmr7021081wrt.538.1646401255026; 
 Fri, 04 Mar 2022 05:40:55 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4f05000000b001f05fd59776sm3766699wru.28.2022.03.04.05.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:52 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/45] pcie: Add some SR/IOV API documentation in
 docs/pcie_sriov.txt
Message-ID: <20220304133556.233983-30-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Knut Omang <knut.omang@oracle.com>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Knut Omang <knut.omang@oracle.com>

Add a small intro + minimal documentation for how to
implement SR/IOV support for an emulated device.

Signed-off-by: Knut Omang <knuto@ifi.uio.no>
Message-Id: <20220217174504.1051716-3-lukasz.maniak@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/pcie_sriov.txt | 115 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 docs/pcie_sriov.txt

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
new file mode 100644
index 0000000000..f5e891e1d4
--- /dev/null
+++ b/docs/pcie_sriov.txt
@@ -0,0 +1,115 @@
+PCI SR/IOV EMULATION SUPPORT
+============================
+
+Description
+===========
+SR/IOV (Single Root I/O Virtualization) is an optional extended capability
+of a PCI Express device. It allows a single physical function (PF) to appear as multiple
+virtual functions (VFs) for the main purpose of eliminating software
+overhead in I/O from virtual machines.
+
+Qemu now implements the basic common functionality to enable an emulated device
+to support SR/IOV. Yet no fully implemented devices exists in Qemu, but a
+proof-of-concept hack of the Intel igb can be found here:
+
+git://github.com/knuto/qemu.git sriov_patches_v5
+
+Implementation
+==============
+Implementing emulation of an SR/IOV capable device typically consists of
+implementing support for two types of device classes; the "normal" physical device
+(PF) and the virtual device (VF). From Qemu's perspective, the VFs are just
+like other devices, except that some of their properties are derived from
+the PF.
+
+A virtual function is different from a physical function in that the BAR
+space for all VFs are defined by the BAR registers in the PFs SR/IOV
+capability. All VFs have the same BARs and BAR sizes.
+
+Accesses to these virtual BARs then is computed as
+
+   <VF BAR start> + <VF number> * <BAR sz> + <offset>
+
+From our emulation perspective this means that there is a separate call for
+setting up a BAR for a VF.
+
+1) To enable SR/IOV support in the PF, it must be a PCI Express device so
+   you would need to add a PCI Express capability in the normal PCI
+   capability list. You might also want to add an ARI (Alternative
+   Routing-ID Interpretation) capability to indicate that your device
+   supports functions beyond it's "own" function space (0-7),
+   which is necessary to support more than 7 functions, or
+   if functions extends beyond offset 7 because they are placed at an
+   offset > 1 or have stride > 1.
+
+   ...
+   #include "hw/pci/pcie.h"
+   #include "hw/pci/pcie_sriov.h"
+
+   pci_your_pf_dev_realize( ... )
+   {
+      ...
+      int ret = pcie_endpoint_cap_init(d, 0x70);
+      ...
+      pcie_ari_init(d, 0x100, 1);
+      ...
+
+      /* Add and initialize the SR/IOV capability */
+      pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
+                       vf_devid, initial_vfs, total_vfs,
+                       fun_offset, stride);
+
+      /* Set up individual VF BARs (parameters as for normal BARs) */
+      pcie_sriov_pf_init_vf_bar( ... )
+      ...
+   }
+
+   For cleanup, you simply call:
+
+      pcie_sriov_pf_exit(device);
+
+   which will delete all the virtual functions and associated resources.
+
+2) Similarly in the implementation of the virtual function, you need to
+   make it a PCI Express device and add a similar set of capabilities
+   except for the SR/IOV capability. Then you need to set up the VF BARs as
+   subregions of the PFs SR/IOV VF BARs by calling
+   pcie_sriov_vf_register_bar() instead of the normal pci_register_bar() call:
+
+   pci_your_vf_dev_realize( ... )
+   {
+      ...
+      int ret = pcie_endpoint_cap_init(d, 0x60);
+      ...
+      pcie_ari_init(d, 0x100, 1);
+      ...
+      memory_region_init(mr, ... )
+      pcie_sriov_vf_register_bar(d, bar_nr, mr);
+      ...
+   }
+
+Testing on Linux guest
+======================
+The easiest is if your device driver supports sysfs based SR/IOV
+enabling. Support for this was added in kernel v.3.8, so not all drivers
+support it yet.
+
+To enable 4 VFs for a device at 01:00.0:
+
+	modprobe yourdriver
+	echo 4 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+You should now see 4 VFs with lspci.
+To turn SR/IOV off again - the standard requires you to turn it off before you can enable
+another VF count, and the emulation enforces this:
+
+	echo 0 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
+
+Older drivers typically provide a max_vfs module parameter
+to enable it at load time:
+
+	modprobe yourdriver max_vfs=4
+
+To disable the VFs again then, you simply have to unload the driver:
+
+	rmmod yourdriver
-- 
MST


