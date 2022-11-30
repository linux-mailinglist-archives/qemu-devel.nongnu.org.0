Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6D63CEBD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 06:34:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0FiW-00016f-RY; Wed, 30 Nov 2022 00:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0FiV-00016N-0D
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p0FiQ-0005e3-3l
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 00:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669786379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wKw1QF8rSx+j5ST83ONE2W5tMlEMlqWB5lDGqooJxFI=;
 b=JQhBqxT6HAvzcA2mi9YvzdMjj7gRO/BclC2LzyJSMbpGzKEQHLftYJYyPqeuCdeyGzt6t1
 /ABkAaPx+o7ZQz697y0KIBp1F7gzlWnRhuHhGFjWuYYBoyotxflEw3TRXKIziMp/KWZp0C
 lVJX2AlxdcMkapmZgMtK8x1VRrV/+8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-fghADWDQPyaxsZNu3wsrFA-1; Wed, 30 Nov 2022 00:32:56 -0500
X-MC-Unique: fghADWDQPyaxsZNu3wsrFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9977D811E67
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:32:56 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-154.pek2.redhat.com [10.72.12.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BCC34A9254;
 Wed, 30 Nov 2022 05:32:54 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v11 0/2] vhost-vdpa: add support for vIOMMU
Date: Wed, 30 Nov 2022 13:32:49 +0800
Message-Id: <20221130053251.2606831-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Fix the crash found in test

Cindy Lu (2):
  vhost-vdpa: Skip the range check while MR is IOMMU
  vhost-vdpa: add support for vIOMMU

 hw/virtio/vhost-vdpa.c         | 168 ++++++++++++++++++++++++++++++---
 include/hw/virtio/vhost-vdpa.h |  10 ++
 2 files changed, 167 insertions(+), 11 deletions(-)

-- 
2.34.3


