Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF3612EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 02:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opK2F-0003TC-Oo; Sun, 30 Oct 2022 21:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opK2D-0003T4-Q4
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1opK2C-0005uW-DI
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 21:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667181375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZRZE0zkGdNl0UsaiwQgYZBjxK5WDI4Ebi/iFUJusvxA=;
 b=cJps1lnARxPeHxzEv9EkgcQ8Lz3pBLuh2DsXEP9TYnsMFgiYqoIh96131gBvn7slonQ1uc
 +7f6jhyZeJROp8pFtOGMzdjQuETZASgbCxuzWXI2S1BuxNJKP5/PgI9RiJaAvcGD/7LKsp
 XTjxaoHY+B4VEiuL9GMSDfnuifc5oJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-tIga4lWfPhSE7SidKuA18g-1; Sun, 30 Oct 2022 21:56:13 -0400
X-MC-Unique: tIga4lWfPhSE7SidKuA18g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3843811E7A;
 Mon, 31 Oct 2022 01:56:13 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-79.pek2.redhat.com [10.72.12.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A8792166B29;
 Mon, 31 Oct 2022 01:56:08 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, alex.williamson@redhat.com, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, peterx@redhat.com, david@redhat.com,
 f4bug@amsat.org, sgarzare@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v8 0/2] vhost-vdpa: add support for vIOMMU
Date: Mon, 31 Oct 2022 09:56:03 +0800
Message-Id: <20221031015605.1396243-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches are to support vIOMMU in vdpa device

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

Cindy Lu (2):
  vfio: move implement of vfio_get_xlat_addr() to memory.c
  vhost-vdpa: add support for vIOMMU

 hw/vfio/common.c               | 101 +++++++--------------------
 hw/virtio/vhost-vdpa.c         | 123 ++++++++++++++++++++++++++++++---
 include/exec/memory.h          |   4 ++
 include/hw/virtio/vhost-vdpa.h |  10 +++
 softmmu/memory.c               |  72 +++++++++++++++++++
 5 files changed, 224 insertions(+), 86 deletions(-)

-- 
2.34.3


