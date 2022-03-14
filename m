Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FF84D8B1C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:51:48 +0100 (CET)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTorD-0005nv-QL
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:51:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobN-0005lB-NS
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobI-0007gL-Ij
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awJA20GrHdmE5mx1jebRcOJ+jzW4aMns4g2tdpXeRaI=;
 b=YqP+/Sq3385mFSSeYzoFB5+MIrrnJbmiT7Z5KvGfAgl7coMXgQlB+F+KKQE8L4rKt0q2iW
 s2aEjW9622bkxQ6Z7TknXFimaW0crWwKj6WYggYyYcUYyLbN6jv5wHvUiJ7XVu7sB++pay
 9IkzJDOdiLlAdw8o60SJo+iigojlYuI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-jvonCG3lOKadFXUx7_lPGQ-1; Mon, 14 Mar 2022 13:35:12 -0400
X-MC-Unique: jvonCG3lOKadFXUx7_lPGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3279D3806706
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:35:12 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70FD2401E3B;
 Mon, 14 Mar 2022 17:35:11 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/15] vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
Date: Mon, 14 Mar 2022 18:34:52 +0100
Message-Id: <20220314173455.200342-13-eperezma@redhat.com>
In-Reply-To: <20220314173455.200342-1-eperezma@redhat.com>
References: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to achieve migration, so the destination can restore its
index.

Setting base as last used idx, so destination will see as available all
the entries that the device did not use, including the in-flight
processing ones.

This is ok for networking, but other kinds of devices might have
problems with these retransmissions.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ec38189492..93dbe1043c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1141,8 +1141,25 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
 static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
+    struct vhost_vdpa *v = dev->opaque;
     int ret;
 
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs,
+                                                      ring->index);
+
+        /*
+         * Setting base as last used idx, so destination will see as available
+         * all the entries that the device did not use, including the in-flight
+         * processing ones.
+         *
+         * TODO: This is ok for networking, but other kinds of devices might
+         * have problems with these retransmissions.
+         */
+        ring->num = svq->last_used_idx;
+        return 0;
+    }
+
     ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
     trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
     return ret;
-- 
2.27.0


