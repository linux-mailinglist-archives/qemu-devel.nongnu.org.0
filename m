Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18194966A5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:52:10 +0100 (CET)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0tG-0001tj-2x
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0co-0000Vh-4N
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:35:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0cl-0005bk-Ji
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmCwl6Nz8JRbyOedP3rUAJKjLtNcb8z/YRVGc+oGDNY=;
 b=Ym5BsZ3ZaIDjoZTc0N3EIhur3cp9woeCOueBpXelBGBpBpY+iVvR0XGwGGRpKVmzB9bwlG
 EX91IYNwPaOGNQSgdNV2C/cj+AK8N1Tm+gK6IcV1djYDiyIIf/iC+rMtFG1Wtr92XeY+H2
 05K5zwjvI1xQZaRV/RzaBHiSVXGxLQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-yEC3F6q6P7S6lT-YMENfmA-1; Fri, 21 Jan 2022 15:35:03 -0500
X-MC-Unique: yEC3F6q6P7S6lT-YMENfmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D055A46861;
 Fri, 21 Jan 2022 20:35:01 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E98C0E2C1;
 Fri, 21 Jan 2022 20:34:56 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/31] vdpa: Clear VHOST_VRING_F_LOG at
 vhost_vdpa_set_vring_addr in SVQ
Date: Fri, 21 Jan 2022 21:27:28 +0100
Message-Id: <20220121202733.404989-27-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doing so would cause the device to export writes to SVQ addresses, which
are not part of the guest's IOVA.

Like the previous patch, this is currently not possible since SVQ does
not run if the device exports VHOST_VRING_F_LOG. But it's needed to
enable migration with SVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 887857c177..ab729b3371 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -660,10 +660,16 @@ static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
 static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
                                        struct vhost_vring_addr *addr)
 {
+    struct vhost_vdpa *v = dev->opaque;
+
     trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
                                     addr->desc_user_addr, addr->used_user_addr,
                                     addr->avail_user_addr,
                                     addr->log_guest_addr);
+
+    if (v->shadow_vqs_enabled) {
+        addr->flags &= ~BIT_ULL(VHOST_VRING_F_LOG);
+    }
     return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
 }
 
-- 
2.27.0


