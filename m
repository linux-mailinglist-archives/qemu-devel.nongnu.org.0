Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093C6875CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 07:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSz3-0005rq-MZ; Thu, 02 Feb 2023 01:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSz2-0005rb-0c
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:22:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSz0-0006jO-Ja
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675318926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSWyl+JQ+g2bk0l3ZTYBnaA+DxoOXvy4fW45aw/Or2s=;
 b=UzfaveOd61cgdo5yQiUKQf225SY3TJU5THbECsY5DqMM3DhSXKWGH3XIsHUISTPfk5A4sA
 tVV0FwZMYM87P9c3baq/MCDKsv8b0WjOQhOJY3Ow45Cx3utoTRpDdQW9/58af7wLGcZxgK
 wTPZCoLOts8WNv3PWfyeqmmGYbn32iU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-KAw1w_K4PUScsXM6PQhNqw-1; Thu, 02 Feb 2023 01:22:04 -0500
X-MC-Unique: KAw1w_K4PUScsXM6PQhNqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AC3A811E9C;
 Thu,  2 Feb 2023 06:22:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-0.pek2.redhat.com [10.72.14.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18BB4404BEC0;
 Thu,  2 Feb 2023 06:22:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 11/11] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
Date: Thu,  2 Feb 2023 14:21:26 +0800
Message-Id: <20230202062126.67550-12-jasowang@redhat.com>
In-Reply-To: <20230202062126.67550-1-jasowang@redhat.com>
References: <20230202062126.67550-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.

Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1a13a34..de5ed8f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
             g_strerror(errno), errno);
         return -1;
     }
-    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
         !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
         return 0;
     }
-- 
2.7.4


