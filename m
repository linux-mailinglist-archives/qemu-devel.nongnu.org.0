Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBD4435F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:46:22 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVaX-0003Mw-Kf
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXX-0001tT-CZ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVXV-0001iU-BK
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634812992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ola10SeFyjh+YukD2yM5i1hwlxPrtXxrhv4X4dnt3E0=;
 b=CVggJ8lI2TXlrA/qWehBsVeDnpvJ4LMi2EAaNhwzeWMCe2HYVEHa9/KAjWueta0QMPVNSH
 pftbBwpjTlmm2aC+m6SWnYGTMNpbApZWuz6idDL8pqAu598WieJOqPXXxdpa7WU4YEZgYO
 O4rCq9W4I8wnhZzqhzHGkVoo/wn6I20=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-8l6eIFmqNHOm1CZsoU5heg-1; Thu, 21 Oct 2021 06:43:11 -0400
X-MC-Unique: 8l6eIFmqNHOm1CZsoU5heg-1
Received: by mail-pj1-f69.google.com with SMTP id
 mm1-20020a17090b358100b001a0a81b8664so2072344pjb.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O81IFWasSc/lqcy27juFh4nVyCe07fmVPajCY3pbcY8=;
 b=xiqMUx5I/IwbgwIl162a26eXnt0haUptJwSi+NAmoi7pN+eSztkGFWzjSiNzpjQ6Y/
 NqFRFkkrDNYx1Rkj2epF4K9Zh2Iby4eUr3M9C/mk3tg9Zhdm7TjpiO3BVS6FCLKesdBI
 +i1u4lQsKPQdFNx2sWunPSrgNOJnZJxpHBnsZBlRGq5Hwvif17vU95aH3gSD+LkBw8Ma
 B973A7nOX0erI5cCO5a5Sky4SpkfcIYH6FWA3iG8tDtQRItPik6esCalEjXUX/l0G6HU
 hGpuWaAT+3jkadl/cG5oVk2YPb6O/+9xYMrsj1hg0duHZlyHCFHJ5Hg2hLRZcZ9MC7Vv
 hcWg==
X-Gm-Message-State: AOAM533mrDZQLfWiaq2xzZGwcIJVxGbH057ofAL+3kCJdJzfawulLk2o
 24yT5/9rw7SaEaqs71lW6FU1KI6XrwiXBc7rRFrL/za7XQiG0OlcvMw8Equ3AO5jnKSAugvyNoh
 0Z0LNvd10RwmCychTQppUJfan3t0YFspyyZu5wPHMee54QnLlVYl8GPESwh6ra8A7
X-Received: by 2002:a17:902:7e84:b0:13e:d793:20d8 with SMTP id
 z4-20020a1709027e8400b0013ed79320d8mr4430576pla.67.1634812989892; 
 Thu, 21 Oct 2021 03:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpGj0xN5Zuzms+wtAP9YzLI48F0fnMvgQbza4BsJ41WcXG9d9J7+oY21cVwEH+6VBOC7t3dw==
X-Received: by 2002:a17:902:7e84:b0:13e:d793:20d8 with SMTP id
 z4-20020a1709027e8400b0013ed79320d8mr4430545pla.67.1634812989488; 
 Thu, 21 Oct 2021 03:43:09 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:08 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] pci/iommu: Fail early if vfio-pci detected before vIOMMU
Date: Thu, 21 Oct 2021 18:42:51 +0800
Message-Id: <20211021104259.57754-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series overrides one previous patchset:=0D
=0D
https://lore.kernel.org/qemu-devel/20210818194217.110451-1-peterx@redhat.co=
m/=0D
=0D
I started from v1 because obviously it's completely different way of doing =
the=0D
same thing, hence versioning upon it would be weird.=0D
=0D
Patches 1-7 are majorly cleanups for current pci code to finally provide a=
=0D
clean way to loop over all the pci devices on the system.=0D
=0D
Patch 8 uses the last helper pci_for_each_device_all() to loop over all the=
=0D
devices during x86 vIOMMU realize() function to fail early if e.g. vfio-pci=
=0D
devices are detected.  Although this is not exactly what Igor suggested but=
 it=0D
should be mostly the same approach, so I kept the Suggested-by credit.=0D
=0D
Please review, thanks.=0D
=0D
Peter Xu (8):=0D
  pci: Define pci_bus_dev_fn type=0D
  pci: Export pci_for_each_device_under_bus*()=0D
  pci: Use pci_for_each_device_under_bus*()=0D
  pci: Define pci_bus_fn/pci_bus_ret_fn type=0D
  pci: Add pci_for_each_root_bus()=0D
  pci: Use pci_for_each_root_bus() in current code=0D
  pci: Add pci_for_each_device_all()=0D
  x86-iommu: Fail early if vIOMMU specified after vfio-pci=0D
=0D
 hw/arm/virt-acpi-build.c   | 31 ++++++---------=0D
 hw/i386/acpi-build.c       | 39 +++++--------------=0D
 hw/i386/x86-iommu.c        | 18 +++++++++=0D
 hw/pci/pci.c               | 77 +++++++++++++++++++++++++++++---------=0D
 hw/pci/pcie.c              |  4 +-=0D
 hw/ppc/spapr_pci.c         | 12 +++---=0D
 hw/ppc/spapr_pci_nvlink2.c |  7 ++--=0D
 hw/ppc/spapr_pci_vfio.c    |  4 +-=0D
 hw/s390x/s390-pci-bus.c    |  5 +--=0D
 hw/xen/xen_pt.c            |  4 +-=0D
 include/hw/pci/pci.h       | 28 +++++++++-----=0D
 11 files changed, 132 insertions(+), 97 deletions(-)=0D
=0D
--=20=0D
2.32.0=0D
=0D


