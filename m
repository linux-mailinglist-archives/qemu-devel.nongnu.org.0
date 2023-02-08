Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D518568E65C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 04:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPafp-0007d3-Cy; Tue, 07 Feb 2023 21:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pPafn-0007ci-LN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:59:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pPafm-0002qO-1U
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 21:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675825141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tUFzOFIPOk6jcBhsUcx5YJJTZUoEadiLJx7HteBGGic=;
 b=CJh7bw1j3KJZzG0Y3kpRtemSzg/Um/FchifLBmgFe6REo8QVbTlwfD7ly7HNl/lN/zuAtz
 YQn+Q7YQZhyM7l1KKmQxNTkTq+Ydu7k4dc7pf7ijdfMB5R9FQeAbFNQpvmyF1YUbZjI+aP
 UfwcS8LTzXCX50bTM9nGprG1ZwKpbIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-LvAW7vmTPGu5NeD-SH8ymA-1; Tue, 07 Feb 2023 21:57:40 -0500
X-MC-Unique: LvAW7vmTPGu5NeD-SH8ymA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB17F811E6E
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 02:57:39 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-101.pek2.redhat.com [10.72.12.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5339D492B21;
 Wed,  8 Feb 2023 02:57:24 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v13 0/2] vhost-vdpa: add support for vIOMMU
Date: Wed,  8 Feb 2023 10:57:20 +0800
Message-Id: <20230208025722.2683024-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

Cindy Lu (2):
  vhost: expose function vhost_dev_has_iommu()
  vhost-vdpa: add support for vIOMMU

 hw/virtio/vhost-vdpa.c         | 173 ++++++++++++++++++++++++++++++---
 hw/virtio/vhost.c              |   2 +-
 include/hw/virtio/vhost-vdpa.h |  11 +++
 include/hw/virtio/vhost.h      |   1 +
 4 files changed, 175 insertions(+), 12 deletions(-)

-- 
2.34.3


