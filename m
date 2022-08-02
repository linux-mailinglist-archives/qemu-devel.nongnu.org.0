Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70622587B8E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:27:52 +0200 (CEST)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIq3z-0000xZ-0K
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1L-0004Kc-Cb
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1H-0007Bk-GI
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659439498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBmdb2nVaXkPu/i1BQa972mRLyq1hHMLWo9xO7GswXE=;
 b=L0F29umTbukV+5R32DNjlNXmEAW4B0Qa19bqpxfNDWYJmhFqGN1Cexm9QaNBDH1aRPwF7U
 yOTAcrFgC1JPICux33Tk/u1jSHZjtx/kYjrGhbAe4ycFPl9R1WS7DIw7cHzTp2P3fc5chi
 uGRPW7ssf0hKhSswVRju9l2x+HYX0xc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-s2GnBqb4O0WiF-X48kkgRw-1; Tue, 02 Aug 2022 07:24:54 -0400
X-MC-Unique: s2GnBqb4O0WiF-X48kkgRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BBE8811E75;
 Tue,  2 Aug 2022 11:24:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64D672026D4C;
 Tue,  2 Aug 2022 11:24:53 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Date: Tue,  2 Aug 2022 13:24:47 +0200
Message-Id: <20220802112447.249436-3-eperezma@redhat.com>
In-Reply-To: <20220802112447.249436-1-eperezma@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Few steps allocate new resources, and all of the allocated can be
checked to avoid trying to free an invalid one.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 303447a68e..ac1810723c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
                                                  &has_cvq, errp);
     if (queue_pairs < 0) {
-        qemu_close(vdpa_device_fd);
-        return queue_pairs;
+        goto err;
     }
 
     if (opts->x_svq) {
@@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         if (invalid_dev_features) {
             error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
                        invalid_dev_features);
-            goto err_svq;
+            goto err;
         }
 
         vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
@@ -640,7 +639,6 @@ err:
         }
     }
 
-err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
2.31.1


