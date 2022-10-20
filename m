Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBA605EA0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:18:39 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTZN-00063Z-TH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:18:38 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTGp-0001Tj-P9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olStA-0004Sz-3h
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSt8-0001L3-JD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5A6Wz4vTjMQXnGigxrbVFmdXH778LWcKk1IV3D0UUo=;
 b=JhBFPXxjvIBQzlEMYvscn0K7euorl1gLqDxS+h8LBccF5gHbijXyDGLHSD+R7NVPid9iUS
 1Q1rl5TpP9KrFIFImcML10Z16OTvz2so5vXq37fyJGMX0yZbFyHcshuSR+oQpSddVYNgEE
 upRQnBkHy7pEIiizIa3cyRyAHVmEZWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-txaBdR4kN--lilMfUGh2Ww-1; Thu, 20 Oct 2022 06:34:52 -0400
X-MC-Unique: txaBdR4kN--lilMfUGh2Ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5291C3C6EAA9;
 Thu, 20 Oct 2022 10:34:52 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09288C15BA5;
 Thu, 20 Oct 2022 10:34:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 7/7] vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if SVQ is
 enabled
Date: Thu, 20 Oct 2022 12:34:29 +0200
Message-Id: <20221020103429.347525-8-eperezma@redhat.com>
In-Reply-To: <20221020103429.347525-1-eperezma@redhat.com>
References: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So qemu emulates it in case the device does not support it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 5fda405a66..64442e8455 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -566,6 +566,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
         /* VIRTIO_NET_F_STATUS is mandatory for _F_GUEST_ANNOUNCE. */
         s->vhost_vdpa.added_features |= BIT_ULL(VIRTIO_NET_F_STATUS);
+
+        /* We can emulate guest announce shadowing CVQ */
+        s->vhost_vdpa.added_features |= BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE);
     }
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
-- 
2.31.1


