Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D71638C64
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZra-0000hc-S3; Fri, 25 Nov 2022 09:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyZrL-0000XZ-Tq
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:39:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyZrK-0003Dr-Fg
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669387156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QFsBKp6966xhE0+ynbfWh/QItQC4M0JZqDcdwq3UDY=;
 b=EWqq9VXganyaZL8p0t1lPqeCAEmrFL9b0iH0tx5vMoynAZT7iDlcc4C1oFMPv2t/LVPv4a
 WTPpaev0Ksj/jcfIsDayEfyw0t1FnM4QQHptiC5F3pE7YiniM9rAS/DEy1kGG0NAZLxQbz
 2OydsaDzGlyuIHBqSoFEsKwV6PcL//M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-GRoFvZZoOyuKcdAg2fwIFA-1; Fri, 25 Nov 2022 09:39:13 -0500
X-MC-Unique: GRoFvZZoOyuKcdAg2fwIFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9A811C08965;
 Fri, 25 Nov 2022 14:39:12 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4BD32028E94;
 Fri, 25 Nov 2022 14:39:10 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Cindy Lu <lulu@redhat.com>
Subject: [RFC PATCH 3/3] vdpa: add VIRTIO_NET_F_CTRL_GUEST_OFFLOADS to SVQ
 features
Date: Fri, 25 Nov 2022 15:38:59 +0100
Message-Id: <20221125143859.2211494-4-eperezma@redhat.com>
In-Reply-To: <20221125143859.2211494-1-eperezma@redhat.com>
References: <20221125143859.2211494-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This way it is possible to migrate them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 7ce094bd67..eca0184d3a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -81,6 +81,7 @@ const int vdpa_feature_bits[] = {
 static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_CSUM) |
     BIT_ULL(VIRTIO_NET_F_GUEST_CSUM) |
+    BIT_ULL(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) |
     BIT_ULL(VIRTIO_NET_F_MTU) |
     BIT_ULL(VIRTIO_NET_F_MAC) |
     BIT_ULL(VIRTIO_NET_F_GUEST_TSO4) |
--
2.31.1


