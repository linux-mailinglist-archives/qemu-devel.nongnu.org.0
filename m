Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490966482AF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3d7I-0004Un-KN; Fri, 09 Dec 2022 08:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3d73-0004P3-DB
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:08:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3d6y-0004aI-DV
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670591293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s1+TZMFyVlanO61KJ9CVYvxQxQCH2CkIoAkGGjIAsV0=;
 b=eAPrbJT8JZcdfoTrttDK0WunNN/xeqLxhbUIdryrQJQnATJcYl/ApYmbw4SzG6rrEU8Ceh
 yWYQyWitjDcQeV9Gv98bcwhIm1msfZbqPTIAoUco1CfVgpimZdGGwyBy3mCdY12WBclZK9
 Cf2noDOZTrxLJ973akdQ1CFO5QfEewo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-_7R64siiM2SHsM6um3lIog-1; Fri, 09 Dec 2022 08:08:12 -0500
X-MC-Unique: _7R64siiM2SHsM6um3lIog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353DF802E5D
 for <qemu-devel@nongnu.org>; Fri,  9 Dec 2022 13:08:12 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-16.pek2.redhat.com [10.72.12.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6B72166B29;
 Fri,  9 Dec 2022 13:08:09 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v12 0/1] vhost-vdpa: add support for vIOMMU
Date: Fri,  9 Dec 2022 21:08:04 +0800
Message-Id: <20221209130805.3614970-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

These patches are to support vIOMMU in vdpa device
Verified in vp_vdpa/vdpa_sim_net driverand intel_iommu
virtio-iommu device

changes in V3
1. Move function vfio_get_xlat_addr to memory.c
2. Use the existing memory listener, while the MR is
iommu MR then call the function iommu_region_add/
iommu_region_del

changes in V4
1.make the comments in vfio_get_xlat_addr more general

changes in V5
1. Address the comments in the last version
2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
the memory is backed by a discard manager. So the device can have its
own warning.

changes in V6
move the error_report for the unpopulated discard back to
memeory_get_xlat_addr

changes in V7
organize the error massage to avoid the duplicate information

changes in V8
Organize the code follow the comments in the last version

changes in V9
Organize the code follow the comments

changes in V10
Address the comments

changes in V11
Address the comments
fix the crash found in test

changes in V12
Address the comments, squash patch 1 into the next patch
improve the code style issue

Cindy Lu (1):
  vhost-vdpa: add support for vIOMMU

 hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++---
 include/hw/virtio/vhost-vdpa.h |  10 ++
 2 files changed, 161 insertions(+), 11 deletions(-)

-- 
2.34.3


