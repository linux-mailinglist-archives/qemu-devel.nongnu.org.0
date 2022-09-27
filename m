Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB35EBCF3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:14:51 +0200 (CEST)
Received: from localhost ([::1]:37252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5ju-0001JL-8R
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53E-0003bk-JQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od53D-0001iJ-5t
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664263842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb0dSr/OJV8D95Ry+UtOY5KDQAddafisX+Dj9PUMKgg=;
 b=alPP9Wy2/NSq0ZGhW9DPY7bdKUwyBNqswNGmH2lkct2VMDw2xUw33hjpPVl7bnRb3JOkoN
 +7SEbuDNh8Iy1Xs+lmtAizUHvIlTSsRN681YV9xYVI2zvw6PylmHGkvx/WyfsyBrIhmnPj
 O5vztYJhQGoauu+9gjRR0wCpooKrR6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-_AD6oA41NeGT4t6nGoaXeQ-1; Tue, 27 Sep 2022 03:30:40 -0400
X-MC-Unique: _AD6oA41NeGT4t6nGoaXeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30E56811732;
 Tue, 27 Sep 2022 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD4CC2166B26;
 Tue, 27 Sep 2022 07:30:37 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	stefanha@redhat.com
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 4/8] vdpa: Add vhost_vdpa_net_load_mq
Date: Tue, 27 Sep 2022 15:30:18 +0800
Message-Id: <20220927073022.28378-5-jasowang@redhat.com>
In-Reply-To: <20220927073022.28378-1-jasowang@redhat.com>
References: <20220927073022.28378-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

Same way as with the MAC, restore the expected number of queues at
device's start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e799e74..3950e4f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -400,6 +400,28 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
     return 0;
 }
 
+static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
+                                  const VirtIONet *n)
+{
+    struct virtio_net_ctrl_mq mq;
+    uint64_t features = n->parent_obj.guest_features;
+    ssize_t dev_written;
+
+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
+        return 0;
+    }
+
+    mq.virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs);
+    dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MQ,
+                                          VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET, &mq,
+                                          sizeof(mq));
+    if (unlikely(dev_written < 0)) {
+        return dev_written;
+    }
+
+    return *s->status != VIRTIO_NET_OK;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -418,6 +440,10 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     if (unlikely(r < 0)) {
         return r;
     }
+    r = vhost_vdpa_net_load_mq(s, n);
+    if (unlikely(r)) {
+        return r;
+    }
 
     return 0;
 }
-- 
2.7.4


