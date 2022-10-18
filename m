Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9F6030B1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:22:38 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpMF-00088b-VJ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okouz-0003ys-V1
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okouu-00041p-4n
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666108447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZc8KECUWBNobBZc8CFJsMcY8vcdF9fEHV21KlVtVO8=;
 b=ZqRuLVXbp609mRBGPgBXSIoEoemKzICJaivT88OMR3havwSmOEIArWvvDsGUQZtX/HpURf
 kX2xBoBcCbHnLUPNVX3VmQpENHPLYqzkmkujw9ByfcBHAujOyqg29NckGpsSjfSSaBX2iM
 KWWqhKv0jJNrfDwAAFexJeibWlEoY1Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-bwslpo9uNeetKGvz3sXEmw-1; Tue, 18 Oct 2022 11:54:05 -0400
X-MC-Unique: bwslpo9uNeetKGvz3sXEmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06E8C3C3C975;
 Tue, 18 Oct 2022 15:54:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEF692157F21;
 Tue, 18 Oct 2022 15:54:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 5/5] vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if
 SVQ is enabled
Date: Tue, 18 Oct 2022 17:53:21 +0200
Message-Id: <20221018155321.145135-6-eperezma@redhat.com>
In-Reply-To: <20221018155321.145135-1-eperezma@redhat.com>
References: <20221018155321.145135-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 2a52672b44..14a265e30a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -564,6 +564,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     if (svq) {
         /* Add SVQ logging capabilities */
         s->vhost_vdpa.added_features |= BIT_ULL(VHOST_F_LOG_ALL);
+
+        /* We can emulate guest announce shadowing CVQ */
+        s->vhost_vdpa.added_features |= BIT_ULL(VIRTIO_NET_F_GUEST_ANNOUNCE);
     }
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
-- 
2.31.1


