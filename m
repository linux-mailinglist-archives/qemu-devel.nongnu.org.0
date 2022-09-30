Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434AE5F0D45
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:19:30 +0200 (CEST)
Received: from localhost ([::1]:46178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGrN-0007Y9-Dn
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGWz-00043o-8C
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGWv-0002O2-5D
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664546296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F7ny+Yn0k/aTNGzAkaFuzhjqmaemWKswjVKEhpHsTU0=;
 b=Vg1Urjwlae6j/2O+7pFYGzWXUVTcFRnw388tZa9ZN0elvUwhCS33kOKdMVkmgV4Fz1bt4o
 Hb2SCJA0qxb1iN1z+7UbgMzFfgKj4v+1IYbNXOW/CMFuxGkJhoGiqompjxj1T8gjSPgpFM
 C48M11BciZlBfWPP6hr3C2ycBQbqjFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-ysfNuTd6NvCy88PKyybEZg-1; Fri, 30 Sep 2022 09:58:12 -0400
X-MC-Unique: ysfNuTd6NvCy88PKyybEZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765E11C07592;
 Fri, 30 Sep 2022 13:58:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DB9640C6EC5;
 Fri, 30 Sep 2022 13:58:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D99F3180039F; Fri, 30 Sep 2022 15:58:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, David Hildenbrand <david@redhat.com>,
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/5] pci-ids: virtio cleanup
Date: Fri, 30 Sep 2022 15:58:05 +0200
Message-Id: <20220930135810.1892149-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop legacy ids for virtio 1.0 devices, they are not needed
and will be overridden anyway by generic virtio pci code.

Improve modern virtio id documentation.

Gerd Hoffmann (5):
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_VSOCK
  pci-ids: drop list of modern virtio devices

 docs/specs/pci-ids.txt           | 15 ++++++---------
 include/hw/pci/pci.h             |  4 ----
 hw/virtio/vhost-user-vsock-pci.c |  2 --
 hw/virtio/vhost-vsock-pci.c      |  2 --
 hw/virtio/virtio-iommu-pci.c     |  4 +---
 hw/virtio/virtio-mem-pci.c       |  2 --
 hw/virtio/virtio-pmem-pci.c      |  2 --
 7 files changed, 7 insertions(+), 24 deletions(-)

-- 
2.37.3


