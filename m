Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3905F4200
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:29:43 +0200 (CEST)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofg7K-0008TX-5T
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz5-0005ga-Mv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz0-0007fc-L8
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664882465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H7HThnAMN0fWHosrDqPzDLG2YSUpRlrMvNbw81l/jCQ=;
 b=DGkPP5U8JHi43zJQhd6EkhGdv0hP6jFYZwPr2jd50RDzuAJgXnQQdSSNQOkB1r1ZtQUuum
 ZfysQfUgsI0Orvd9n2/FJ227Dp/TSMoBmitefliLMEgyG69UnwYkgKAVjqo/w+7tGuZLcC
 /MbRD8tfYrvFTPpFKb1iA/VMZ1JgN5U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-8-Hl_4Z2NMGibJIMzJVQXw-1; Tue, 04 Oct 2022 07:21:02 -0400
X-MC-Unique: 8-Hl_4Z2NMGibJIMzJVQXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA6293833283;
 Tue,  4 Oct 2022 11:21:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C71C15BA4;
 Tue,  4 Oct 2022 11:21:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 654DE18000B3; Tue,  4 Oct 2022 13:21:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 0/5] pci-ids: virtio cleanup
Date: Tue,  4 Oct 2022 13:20:55 +0200
Message-Id: <20221004112100.301935-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

v3:
 - add review + test tags
 - more verbose commit messages.
 - drop vsock (#define needed for bug compatibility reasons).
 - added comment to pci.h, trying to avoid this happening again.

Gerd Hoffmann (5):
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
  pci-ids: drop list of modern virtio devices
  pci-ids: document modern virtio-pci ids in pci.h too

 docs/specs/pci-ids.txt       | 16 +++++++---------
 include/hw/pci/pci.h         | 13 ++++++++++---
 hw/virtio/virtio-iommu-pci.c |  4 +---
 hw/virtio/virtio-mem-pci.c   |  2 --
 hw/virtio/virtio-pci.c       |  2 +-
 hw/virtio/virtio-pmem-pci.c  |  2 --
 6 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.37.3


