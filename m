Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70259A2FE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:58:22 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP6GD-0002pW-C1
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5ZA-0001fr-9c
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5Z8-0003RT-PI
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660929228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6yOOSSDaKQ0fbJWVvbTbvPbjlySzJC5W4RikkHdw5Gg=;
 b=NDtAewdqnOJzqgfVX85Gz7qQ+uij0WNW27fAlnnKvHLpw+QR00akNLp1vyRy4S9VEabsYk
 Bp6ht2BP/qFegeCnLLbQTtOEvikiXzZ46hb3nipxnmotlbD5Fl6kf1XiFiaWTxnQAgARBK
 sc4TxMuiJcfaCYQa78c5boiEsdREFzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-vH7NQXQUPESlgcpxNjfICg-1; Fri, 19 Aug 2022 13:13:44 -0400
X-MC-Unique: vH7NQXQUPESlgcpxNjfICg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC17F3802BAC;
 Fri, 19 Aug 2022 17:13:43 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D90404C6E3;
 Fri, 19 Aug 2022 17:13:40 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 3/5] vdpa: validate MQ CVQ commands
Date: Fri, 19 Aug 2022 19:13:27 +0200
Message-Id: <20220819171329.3597027-4-eperezma@redhat.com>
In-Reply-To: <20220819171329.3597027-1-eperezma@redhat.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

So we are sure we can update the device model properly before sending to
the device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 96fd3bc835..d5bbda37a1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -484,6 +484,15 @@ static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t len)
                           __func__, ctrl.cmd);
         };
         break;
+    case VIRTIO_NET_CTRL_MQ:
+        switch (ctrl.cmd) {
+        case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET:
+            return true;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mq cmd %u\n",
+                          __func__, ctrl.cmd);
+        };
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
                       __func__, ctrl.class);
-- 
2.31.1


