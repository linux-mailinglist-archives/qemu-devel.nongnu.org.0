Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D64D033C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:46:22 +0100 (CET)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFYz-0004uj-C2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:46:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFQB-000446-IT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nRFQ9-0003z1-SS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqiXvqMfyn0OPs4vzapneva/K0kY4LmYVXBMtxoI0VA=;
 b=beMhRDulUlpJZE/6jioRxqxojntxa7WOhxvs/sMJVMtgqXYg+IWhO+ucTTVAsUUQ1EIslI
 7Yvim3XENwIlZH/Bs0F2lel+DF3WE+sxjXV24gcz71Sm/FodmCusiWzJjdG8BFmQHb1JXU
 T/Wi2GL5nky67sy0ZTOD0pD+fVFkKZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-T1cl8ETcNUKX_GjQwgCmhA-1; Mon, 07 Mar 2022 10:37:10 -0500
X-MC-Unique: T1cl8ETcNUKX_GjQwgCmhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66877801AFE;
 Mon,  7 Mar 2022 15:37:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2ACD7D3D2;
 Mon,  7 Mar 2022 15:37:02 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/15] vdpa: Never set log_base addr if SVQ is enabled
Date: Mon,  7 Mar 2022 16:33:32 +0100
Message-Id: <20220307153334.3854134-14-eperezma@redhat.com>
In-Reply-To: <20220307153334.3854134-1-eperezma@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the log address would make the device start reporting invalid
dirty memory because the SVQ vrings are located in qemu's memory.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 69a4bfd0d4..5470566ce2 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1092,7 +1092,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
-    if (vhost_vdpa_one_time_request(dev)) {
+    struct vhost_vdpa *v = dev->opaque;
+    if (v->shadow_vqs_enabled || vhost_vdpa_one_time_request(dev)) {
         return 0;
     }
 
-- 
2.27.0


