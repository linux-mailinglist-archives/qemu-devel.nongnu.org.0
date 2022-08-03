Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55814589160
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:27:16 +0200 (CEST)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJI9L-00012H-FO
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJI3r-0007d7-3A
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJI3p-0005Qp-6D
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659547291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkrFAJTZsaDe0mfYkYOAto1t21JBj/2fWn1m0fbCcqE=;
 b=B88GeoGxqIC/vCzWMb8gulWgMFlUU33EGlTuoVZtxfZELO7SDhszsTjbhM4su1/TVmBx75
 Y+CAzvJxFjxaEfSyjpMwwH4l+LppnwjFjLYlwFmbf0bcbVLD/k2/9tA4DXXSrnMg3HPD6Y
 m6/SwzQy/N3AbKvLyinhUnwcR3I2XmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-aU_LvNn-M8iGcGdgTzdAhA-1; Wed, 03 Aug 2022 13:19:12 -0400
X-MC-Unique: aU_LvNn-M8iGcGdgTzdAhA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77A4118E527A;
 Wed,  3 Aug 2022 17:18:41 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5B011121314;
 Wed,  3 Aug 2022 17:18:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v3 5/7] vdpa: Store x-svq parameter in VhostVDPAState
Date: Wed,  3 Aug 2022 19:18:19 +0200
Message-Id: <20220803171821.481336-6-eperezma@redhat.com>
In-Reply-To: <20220803171821.481336-1-eperezma@redhat.com>
References: <20220803171821.481336-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CVQ can be shadowed two ways:
- Device has x-svq=on parameter (current way)
- The device can isolate CVQ in its own vq group

QEMU needs to check for the second condition dynamically, because CVQ
index is not known at initialization time. Since this is dynamic, the
CVQ isolation could vary with different conditions, making it possible
to go from "not isolated group" to "isolated".

Saving the cmdline parameter in an extra field so we never disable CVQ
SVQ in case the device was started with cmdline.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index f96c3cb1da..e3b65ed546 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -36,6 +36,9 @@ typedef struct VhostVDPAState {
 
     /* Control commands shadow buffers */
     void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
+
+    /* The device always have SVQ enabled */
+    bool always_svq;
     bool started;
 } VhostVDPAState;
 
@@ -564,6 +567,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->always_svq = svq;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
-- 
2.31.1


