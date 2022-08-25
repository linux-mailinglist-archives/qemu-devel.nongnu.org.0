Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD2D5A194C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 21:11:10 +0200 (CEST)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRIFw-0005eQ-SA
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 15:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9X-00006j-DX
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oRI9S-0006Rx-13
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 15:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661454265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EiC9qsa92qPMgZCmBJglnW5RyionM1aBUgNqKB3yf0=;
 b=eXT6YK3vAMDTilL7A6T75PHexLqqqZr73Mq2AeourPxzfacxT5wUiejX0q1TsPt5z5qsx7
 /ceLG+pJ+Pq3zeDoTjYbj4CC/nQ/5GMG7G8KXZl9F6g0eDuiO6tfzniT5PHEYvVIzUdxyb
 41Nm8o/ca3/wQP+VN6Nfnq7RnrWoMnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-2PUCCOzKOx2Iq0F55r7kmw-1; Thu, 25 Aug 2022 15:04:21 -0400
X-MC-Unique: 2PUCCOzKOx2Iq0F55r7kmw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A327E85A589;
 Thu, 25 Aug 2022 19:04:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9597492C3B;
 Thu, 25 Aug 2022 19:04:17 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eli Cohen <eli@mellanox.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 6/6] vdpa: Allow MQ feature in SVQ
Date: Thu, 25 Aug 2022 21:03:56 +0200
Message-Id: <20220825190356.317527-7-eperezma@redhat.com>
In-Reply-To: <20220825190356.317527-1-eperezma@redhat.com>
References: <20220825190356.317527-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Finally enable SVQ with MQ feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index c6cbe2fb5c..4bc3fd01a8 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -94,6 +94,7 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_MRG_RXBUF) |
     BIT_ULL(VIRTIO_NET_F_STATUS) |
     BIT_ULL(VIRTIO_NET_F_CTRL_VQ) |
+    BIT_ULL(VIRTIO_NET_F_MQ) |
     BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
-- 
2.31.1


