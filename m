Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A116C3419
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:25:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecu1-00025g-Fq; Tue, 21 Mar 2023 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pectn-00023n-48
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pectk-000079-HW
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679408615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2rRG+cM8lasheioW483uCqYuq4mzJORL3A4kgs9AhRk=;
 b=VRIuKcTvO4rSMsrunZKxDx9gfnVOwyJ8X51hJoJ0YdF2iPYqOGl4wJEPTUQ4Z3efIeg+Kz
 SG9lMLCrSaFOiN4T4w1JEUElS9/STsVCS4W272XveuzeHjBYtoKlM7RVQnv4TK6p05u5k/
 GCU+mrD0RW+jAb0GcrGB5XI9YjPXSV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-PhZkO8GaPBWSrsSzcogpNw-1; Tue, 21 Mar 2023 10:23:33 -0400
X-MC-Unique: PhZkO8GaPBWSrsSzcogpNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EFEF800B23
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:23:33 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90AA7C15BA0;
 Tue, 21 Mar 2023 14:23:31 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v15 0/4] vhost-vdpa: add support for vIOMMU
Date: Tue, 21 Mar 2023 22:23:23 +0800
Message-Id: <20230321142327.749980-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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

changes in V13
fail to start if IOMMU and svq enable at same time
improve the code style issue

changes in V14
Address the comments

changes in V15
Address the comments

Cindy Lu (4):
  vhost: expose function vhost_dev_has_iommu()
  vhost_vdpa: fix the input in trace_vhost_vdpa_listener_region_del()
  vhost-vdpa: Add check for full 64-bit in region delete
  vhost-vdpa: Add support for vIOMMU.

 hw/virtio/trace-events         |   2 +-
 hw/virtio/vhost-vdpa.c         | 182 ++++++++++++++++++++++++++++++---
 hw/virtio/vhost.c              |   2 +-
 include/hw/virtio/vhost-vdpa.h |  11 ++
 include/hw/virtio/vhost.h      |   1 +
 5 files changed, 184 insertions(+), 14 deletions(-)

-- 
2.34.3


