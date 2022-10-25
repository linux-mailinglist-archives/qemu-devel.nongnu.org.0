Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136D60D1B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:41:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMwG-0001OD-1W; Tue, 25 Oct 2022 12:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1onMwE-0001Ir-HX
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1onMwC-0001CG-V9
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666715876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oEe4ZwgNiAGFjx4xfSQT451ByUWpuUmceC/pMY+HCyU=;
 b=PynfM0ouY8gPWMPW0NwyPlwH/OpR1WlA7nyhKXBNo2Mi73tPmUT3+3A9tufXtLZBTtA/So
 GI09n8wYX7BN4T/gx5emw7B1SDCGzqXE517H4W5tOjfD/lcTMdhiItYiGsxuGtQqKKea1s
 Fa9THMZnVzYmZk4pffjR55+VQk/90WA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-NpIVsGYSM6Oxr_neWvQReQ-1; Tue, 25 Oct 2022 12:37:54 -0400
X-MC-Unique: NpIVsGYSM6Oxr_neWvQReQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97C5438173EB;
 Tue, 25 Oct 2022 16:37:54 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-151.pek2.redhat.com [10.72.13.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA3840C835A;
 Tue, 25 Oct 2022 16:37:47 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, alex.williamson@redhat.com, jasowang@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, peterx@redhat.com, david@redhat.com,
 f4bug@amsat.org, sgarzare@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] vhost-vdpa: add support for vIOMMU
Date: Wed, 26 Oct 2022 00:37:32 +0800
Message-Id: <20221025163734.965367-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

These patches is to suppor vIOMMU in vdpa device

changes in V3
1. Move function vfio_get_xlat_addr to memory.c
2. Use the existing memory listener, while the MR is
iommu MR then call the function iommu_region_add/
iommu_region_del

Cindy Lu (2):
  vfio: move the function vfio_get_xlat_addr() to memory.c
  vhost-vdpa: add support for vIOMMU

 hw/vfio/common.c               |  92 +---------------------
 hw/virtio/vhost-vdpa.c         | 134 ++++++++++++++++++++++++++++++---
 include/exec/memory.h          |   4 +
 include/hw/virtio/vhost-vdpa.h |  10 +++
 softmmu/memory.c               |  84 +++++++++++++++++++++
 5 files changed, 225 insertions(+), 99 deletions(-)

-- 
2.34.3


