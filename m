Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7BE43DA6F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:36:06 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfx93-0007Z1-8w
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx4r-0003mt-Af
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx4p-0000Li-Kd
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HnFIQz2oec65q08qJRovIdwn7YPszDR/Xr8+WcSmU3Y=;
 b=bcGQX3/WBxXeAilUBS1QvTsD3cR/6P46YRdLoRKsCvKWQiEYn7nCmCC2uar9IBspkNMP7f
 7o0xTGrij6Zgy2d6ZxQg0syWrc3tH+Jh3VrYOfF1AhG9llsDHbB0LMfHj/KP8HvUJ7Ed+N
 +wjbMuQFK5hhR6s6Zn4djfanMC0l0pI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-VXqIQpxxPGKjOROUQIuoMg-1; Thu, 28 Oct 2021 00:31:41 -0400
X-MC-Unique: VXqIQpxxPGKjOROUQIuoMg-1
Received: by mail-pf1-f197.google.com with SMTP id
 d7-20020a056a0010c700b0047e4c951cc0so95013pfu.10
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HnFIQz2oec65q08qJRovIdwn7YPszDR/Xr8+WcSmU3Y=;
 b=Wgsn+zvEG19PB/IpMsKux0TZuXk8FLQ13JCWvO+xeH/A0rnBuZYVCzkh34jtx5v797
 r62m9cEPFPTPPJdm23jJ8aMyo7JyQ/7yb0w+9L6z7ZO0k3IozDvF1wPNfEcZfdPOoiQF
 e7eTI03nEZ8YO+YPK3Vbc8C+Xb85es/X7AvgsB1/CFfpVuO+wBOCEU0QmNm9SJafnEMM
 24ptuzXOl25OYWNEJjB+nW7Y3eu2yCBApBWjOaVOvL8bk5kiHMU8t0qdmEB33UcU/1Lz
 +gshlYDi4vsgHVLyuA4Fmkly5DsG7Dpjy+N9mAib/8kau9Ss87MP2nNnFq3VHjYso/I+
 REzg==
X-Gm-Message-State: AOAM53349lTfmDH5uARwQojr5ZvGVTJFNs50lZGRKCS0wdz9xRVMDLTZ
 LO9ZVH2rEwRMmQsMwhmiX5IPiwHw5WBQ7JDoGnTZ+kTtW59uxMJgfzUub/Tn1LYaHXu++kAdnlP
 d80KcgAusKxh9+x4QyDSyu6j/Tula1ln+cn/VFMDrqDsmsT3pxScCJ/1afbhJraoz
X-Received: by 2002:a05:6a00:855:b0:44d:4d1e:9080 with SMTP id
 q21-20020a056a00085500b0044d4d1e9080mr1899258pfk.66.1635395500023; 
 Wed, 27 Oct 2021 21:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtT70FZr/uCIZePh9Do41/p2/9fGIhxT3ZLwYofN5xcqpJI4LPZxPBTqLvXKKsa00JaX9nzg==
X-Received: by 2002:a05:6a00:855:b0:44d:4d1e:9080 with SMTP id
 q21-20020a056a00085500b0044d4d1e9080mr1899207pfk.66.1635395499621; 
 Wed, 27 Oct 2021 21:31:39 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.31.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:31:39 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] pci/iommu: Fail early if vfio-pci detected before
 vIOMMU
Date: Thu, 28 Oct 2021 12:31:24 +0800
Message-Id: <20211028043129.38871-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note that patch 1-4 are cleanups for pci subsystem, and patch 5 is a fix to
fail early for mis-ordered qemu cmdline on vfio and vIOMMU.  Logically they
should be posted separately and they're not directly related, however to make
it still correlated to v1 I kept them in the same patchset.

In this version I used pre_plug() hook for q35 to detect the ordering issue as
Igor suggested, meanwhile it's done via object_resolve_path_type() rather than
scanning the pci bus as Michael suggested.

Please review, thanks.

v2 changelog:
- Picked up r-b where I can
- Merged patch 1 & 4, 2 & 3, 5 & 6
- s/pci_root_bus_args/PCIRootBusArgs/ [David, Michael]
- Replace "void* " with "void *" in pci.h [Phil]
- Dropped "pci: Add pci_for_each_device_all()"
- Dropped "x86-iommu: Fail early if vIOMMU specified after vfio-pci"
- Added "qom: object_child_foreach_recursive_type()"
- Added "pc/q35: Add pre-plug hook for x86-iommu"

v1: https://lore.kernel.org/qemu-devel/20211021104259.57754-1-peterx@redhat.com/

Peter Xu (5):
  pci: Define pci_bus_dev_fn/pci_bus_fn/pci_bus_ret_fn
  pci: Export pci_for_each_device_under_bus*()
  qom: object_child_foreach_recursive_type()
  pci: Add pci_for_each_root_bus()
  pc/q35: Add pre-plug hook for x86-iommu

 hw/arm/virt-acpi-build.c    | 31 ++++++++--------------
 hw/i386/acpi-build.c        | 39 +++++++---------------------
 hw/i386/pc.c                |  4 +++
 hw/i386/x86-iommu.c         | 14 ++++++++++
 hw/pci/pci.c                | 52 +++++++++++++++++++++++++------------
 hw/pci/pcie.c               |  4 +--
 hw/ppc/spapr_pci.c          | 12 ++++-----
 hw/ppc/spapr_pci_nvlink2.c  |  7 +++--
 hw/ppc/spapr_pci_vfio.c     |  4 +--
 hw/s390x/s390-pci-bus.c     |  5 ++--
 hw/xen/xen_pt.c             |  4 +--
 include/hw/i386/x86-iommu.h |  8 ++++++
 include/hw/pci/pci.h        | 26 ++++++++++++-------
 include/qom/object.h        | 20 ++++++++++++++
 qom/object.c                | 27 +++++++++++++++++++
 15 files changed, 160 insertions(+), 97 deletions(-)

-- 
2.32.0


