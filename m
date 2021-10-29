Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB14402F0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:10:45 +0200 (CEST)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXH2-00032f-Pz
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrF-00050R-FK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWrD-0002Zz-JG
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635533042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMpRhEmuVv3AwePRNnnG/C1BKzevnWMVK+w+0BrrWgs=;
 b=GxgAGAQWD3/+cwNChJ2zUslEi82Jriaktlm0+7OAXkguW3bdX3EQwue/GGYX8UC6Mm+eAh
 3Sb8WrMsttr2hCdPkCcx6eO57Q4P2ujNzsonm2av0TR48xQWRl8jp4OFlUb99PoZgOFnkp
 1Hf/CwKCt66KIL4WFTVixU00mhFexPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-yH9DDElbOMGEF0O3Oe-QJw-1; Fri, 29 Oct 2021 14:43:59 -0400
X-MC-Unique: yH9DDElbOMGEF0O3Oe-QJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C520802B7A;
 Fri, 29 Oct 2021 18:43:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C2A95D6CF;
 Fri, 29 Oct 2021 18:42:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 19/26] vdpa: ack VIRTIO_F_QUEUE_STATE if device
 supports it
Date: Fri, 29 Oct 2021 20:35:18 +0200
Message-Id: <20211029183525.1776416-20-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to enable or disable SVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c2580693b3..fc8396ba8a 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -521,6 +521,9 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
     if (vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
+    if (dev->features & BIT_ULL(VIRTIO_F_QUEUE_STATE)) {
+        features |= BIT_ULL(VIRTIO_F_QUEUE_STATE);
+    }
 
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-- 
2.27.0


