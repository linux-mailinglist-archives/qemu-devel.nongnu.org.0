Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD242DB46
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 16:14:59 +0200 (CEST)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb1Va-0006Vs-Rq
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 10:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb1TW-0004Vs-Hs
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb1TT-0007QL-MS
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634220765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVICSCdbvQf7wvOj3zWj2+vcB8JW6gnqe14JMTFXWXQ=;
 b=H8XIlibILf/IpXHaqezr2ozPuF2ul2KhZexWiwDRev1b86L0SvCcYPNS1e9rJf5XbGwElW
 GA5pKE+Iqfpr5prjPgCt2z0klU6toW7V6Wtvo1mqxRSvmacL4ytVEJMWD4XD4jeDgAIx4F
 yUVhB6CxsS8trgJpba5uSL18huFFi+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-5q4tgh1_MzCpMVEJu58z_w-1; Thu, 14 Oct 2021 10:12:44 -0400
X-MC-Unique: 5q4tgh1_MzCpMVEJu58z_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 612461054FBC;
 Thu, 14 Oct 2021 14:12:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95DA760C0F;
 Thu, 14 Oct 2021 14:12:41 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] vdpa: Skip protected ram IOMMU mappings
Date: Thu, 14 Oct 2021 16:12:34 +0200
Message-Id: <20211014141236.923287-2-eperezma@redhat.com>
In-Reply-To: <20211014141236.923287-1-eperezma@redhat.com>
References: <20211014141236.923287-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the logic of commit 56918a126ae ("memory: Add RAM_PROTECTED
flag to skip IOMMU mappings") with VFIO, skip memory sections
inaccessible via normal mechanisms, including DMA.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 47d7a5a23d..ea1aa71ad8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -28,6 +28,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
+            memory_region_is_protected(section->mr) ||
            /* vhost-vDPA doesn't allow MMIO to be mapped  */
             memory_region_is_ram_device(section->mr) ||
            /*
-- 
2.27.0


