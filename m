Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8568EBF8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgzP-0005NJ-RF; Wed, 08 Feb 2023 04:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzM-0005Jz-TH
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzL-0005tV-2d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQJuvt6i7H5KtDKMtl36daFtmGk30qd1bEA7/xzw5GU=;
 b=dXeG14RTnGEIYL44HlQzhjS4i0st0kaPr3lw1pO28w3TiwSIZFytC2SXrvGX51euSsmif0
 rDGVxr37BeGNHVfMnbfQNp+nxwnRkglfC0MdDZqr65/hX7PxPKhFU8d6CO2+SrAVnk7Q7V
 i+JtbDKjKm5/rTN9xztQx0EM+mLti40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-navIAAeOON6LlW1Mk9JWwQ-1; Wed, 08 Feb 2023 04:43:32 -0500
X-MC-Unique: navIAAeOON6LlW1Mk9JWwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50D248027FD;
 Wed,  8 Feb 2023 09:43:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42B172166B29;
 Wed,  8 Feb 2023 09:43:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 10/13] vdpa: block migration if device has unsupported
 features
Date: Wed,  8 Feb 2023 10:42:50 +0100
Message-Id: <20230208094253.702672-11-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

A vdpa net device must initialize with SVQ in order to be migratable at
this moment, and initialization code verifies some conditions.  If the
device is not initialized with the x-svq parameter, it will not expose
_F_LOG so the vhost subsystem will block VM migration from its
initialization.

Next patches change this, so we need to verify migration conditions
differently.

QEMU only supports a subset of net features in SVQ, and it cannot
migrate state that cannot track or restore in the destination.  Add a
migration blocker if the device offer an unsupported feature.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 309861e56c..a0c4d5de2c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -952,6 +952,15 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                                      iova_range);
         if (!ncs[i])
             goto err;
+
+        if (i == 0) {
+            VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, ncs[0]);
+
+            if (!s->vhost_vdpa.dev->migration_blocker) {
+                vhost_vdpa_net_valid_svq_features(features,
+                                        &s->vhost_vdpa.dev->migration_blocker);
+            }
+        }
     }
 
     if (has_cvq) {
-- 
2.31.1


