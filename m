Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E203C79A0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:26:30 +0200 (CEST)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QrF-0007lJ-8e
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qch-0000Yq-Ij
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qcf-0008PE-DM
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5HVhx8nlAexWU/TA8sFPnLNT9sR3fwWdWFVm7BbK6mM=;
 b=ZNnL9AhdGTLubtPW68s3XiWwT5/koISz4HNZURLbcFoTKqqV+yVBINbRelU4MF9yUzBgyh
 Fj5dTDdbhhiZaCBePLP7MNkkhGp+A1XCDnEdbiTF9JGlgSNxVHuZtOXdyXWWTgpIX91xoM
 gZVbVUig4NtROP0uJJydgMYawS5zvUE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-FMX6MJFMN8uBU-ZnTrIGuA-1; Tue, 13 Jul 2021 18:11:23 -0400
X-MC-Unique: FMX6MJFMN8uBU-ZnTrIGuA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p3-20020a05600c3583b02901f55d71e34aso153281wmq.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5HVhx8nlAexWU/TA8sFPnLNT9sR3fwWdWFVm7BbK6mM=;
 b=O5wAbfB5yn+HbkhU567NIqV/iVFFTtXaKm9NZQiiq8W7SS17PQZDYUfX8DTFvMxIZm
 u1gbx8w6wkzlTBqUMMAuetga8pgnrKHYTC8Rcy6+I7TZwxhIjl+ayP1XUCunmqdc7CKa
 R7adWUZIZEWSnAi/BN1OYx+BCBKhNDAvb7ERIMCpX/DNFv+eIDAhP+xHNWE+kVY3dy6E
 YWXPF9jelVBRh2h+iaGWUC4whC3XYosEqCqlM9wgdQl6VoOdIwUFw5mhffqUSbpjkazL
 RQQ5pQB6EO+v6nOeIpNOBipTaEQnYlPrgkB4StL5jIUzs9tqjm8eUT2T7iuMXStm5NgK
 JcWA==
X-Gm-Message-State: AOAM5336gr0wL+2WKyiA8Uz48rnnTsXBH/Cv9bz2z5QFH0LtwGtKN6Dh
 tFMjtDcdsyaLxCAtoeSTw99NlDByzNDtpPrlcq0K9W7p8cP87sw6muDyOW25HKCEwsgdbc/tpRe
 vvP89GLcRwAEGEWHwuXzhsonQ9cF0DZO9biJcQHxktlIf0NcUNMD7O0pMi+Gt
X-Received: by 2002:a05:600c:1c93:: with SMTP id
 k19mr7517912wms.125.1626214281620; 
 Tue, 13 Jul 2021 15:11:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7cjlm/uoF7doU3bNjhoDS45J0pOn6TNp6F12NAN0MmMIewzksOL+RpKB9VeolC3XU3AFr9w==
X-Received: by 2002:a05:600c:1c93:: with SMTP id
 k19mr7517875wms.125.1626214281254; 
 Tue, 13 Jul 2021 15:11:21 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id x8sm104990wrt.93.2021.07.13.15.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:11:20 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:11:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] docs: Add documentation for iommu bypass
Message-ID: <20210713220946.212562-23-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-10-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/bypass-iommu.txt | 89 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 docs/bypass-iommu.txt

diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
new file mode 100644
index 0000000000..e6677bddd3
--- /dev/null
+++ b/docs/bypass-iommu.txt
@@ -0,0 +1,89 @@
+BYPASS IOMMU PROPERTY
+=====================
+
+Description
+===========
+Traditionally, there is a global switch to enable/disable vIOMMU. All
+devices in the system can only support go through vIOMMU or not, which
+is not flexible. We introduce this bypass iommu property to support
+coexist of devices go through vIOMMU and devices not. This is useful to
+passthrough devices with no-iommu mode and devices go through vIOMMU in
+the same virtual machine.
+
+PCI host bridges have a bypass_iommu property. This property is used to
+determine whether the devices attached on the PCI host bridge will bypass
+virtual iommu. The bypass_iommu property is valid only when there is a
+virtual iommu in the system, it is implemented to allow some devices to
+bypass vIOMMU. When bypass_iommu property is not set for a host bridge,
+the attached devices will go through vIOMMU by default.
+
+Usage
+=====
+The bypass iommu feature support PXB host bridge and default main host
+bridge, we add a bypass_iommu property for PXB and default_bus_bypass_iommu
+for machine. Note that default_bus_bypass_iommu is available only when
+the 'q35' machine type on x86 architecture and the 'virt' machine type
+on AArch64. Other machine types do not support bypass iommu for default
+root bus.
+
+1. The following is the bypass iommu options:
+ (1) PCI expander bridge
+     qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true
+ (2) Arm default host bridge
+     qemu -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true
+ (3) X86 default root bus bypass iommu:
+     qemu -machine q35,default_bus_bypass_iommu=true
+
+2. Here is the detailed qemu command line for 'virt' machine with PXB on
+AArch64:
+
+qemu-system-aarch64 \
+ -machine virt,kernel_irqchip=on,iommu=smmuv3,default_bus_bypass_iommu=true \
+ -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1 \
+ -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x3.0x2,bypass_iommu=true \
+
+And we got:
+ - a default host bridge which bypass SMMUv3
+ - a pxb host bridge which go through SMMUv3
+ - a pxb host bridge which bypass SMMUv3
+
+3. Here is the detailed qemu command line for 'q35' machine with PXB on
+x86 architecture:
+
+qemu-system-x86_64 \
+ -machine q35,accel=kvm,default_bus_bypass_iommu=true \
+ -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3 \
+ -device pxb-pcie,bus_nr=0x20,id=pci.20,bus=pcie.0,addr=0x4,bypass_iommu=true \
+ -device intel-iommu \
+
+And we got:
+ - a default host bridge which bypass iommu
+ - a pxb host bridge which go through iommu
+ - a pxb host bridge which bypass iommu
+
+Limitations
+===========
+There might be potential security risk when devices bypass iommu, because
+devices might send malicious dma request to virtual machine if there is no
+iommu isolation. So it would be necessary to only bypass iommu for trusted
+device.
+
+Implementation
+==============
+The bypass iommu feature includes:
+ - Address space
+   Add bypass iommu property check of PCI Host and do not get iommu address
+   space for devices bypass iommu.
+ - Arm SMMUv3 support
+   We traverse all PCI root bus and get bus number ranges, then build explicit
+   RID mapping for devices which do not bypass iommu.
+ - X86 IOMMU support
+   To support Intel iommu, we traverse all PCI host bridge and get information
+   of devices which do not bypass iommu, then fill the DMAR drhd struct with
+   explicit device scope info. To support AMD iommu, add check of bypass iommu
+   when traverse the PCI hsot bridge.
+ - Machine and PXB options
+   We add bypass iommu options in machine option for default root bus, and add
+   option for PXB also. Note that the default value of bypass iommu is false,
+   so that the devices will by default go through iommu if there exist one.
+
-- 
MST


