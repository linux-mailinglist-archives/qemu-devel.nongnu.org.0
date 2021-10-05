Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415BF4228DB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:52:58 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXksK-0000Vi-P6
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkob-0006rd-M6
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkoY-0001N2-E3
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633441741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd9E2vlOyKFfCTOowmisLiSg73kL7/5ysAUnJgM/Zb4=;
 b=TANaNSJFrpSBCouHANafX1ucBwa0OfN+SC5KqTZC9XIbsh//e9c/eLVSmfdUQfsnFH1UWx
 ARHVCYj7OlwJ1vV+daS/02sSOUyXzIO0vaOah40Ud6V7SXwnGDSpGyKcPZuUPzqMFk9cSv
 z1aXtExfxZMCXTBZOZvAs0vjLURO3ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-RJItEwsnPBmQvoqvlilBqg-1; Tue, 05 Oct 2021 09:49:01 -0400
X-MC-Unique: RJItEwsnPBmQvoqvlilBqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF5DB100CCCF;
 Tue,  5 Oct 2021 13:48:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC5331F42C;
 Tue,  5 Oct 2021 13:48:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] vdpa: Skip protected ram IOMMU mappings
Date: Tue,  5 Oct 2021 15:48:41 +0200
Message-Id: <20211005134843.439050-2-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-1-eperezma@redhat.com>
References: <20211005134843.439050-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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


