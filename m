Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B8637E56
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 18:34:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyG6W-0000fb-PK; Thu, 24 Nov 2022 12:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyG6U-0000f2-BZ
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 12:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyG6T-0006nd-0q
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 12:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669311216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxSaZR7f+8Mlb3ugqwigOl8aChdPsaR66sNuJYO/XCY=;
 b=OQLpWHcAAKvbwa0WzngnCSsu7YxXzsQJ4PVLMGyPovNWeEJ9EayO4142X2Ur+yUFqCBVN9
 RZnKKbwfFiIYBC23AbsITi22Oi1djTp2nqiXa8m5TLciGF+dlyifYf9A2f3oKU63y50oZn
 OJC1oZ71rtwiZlPwEsYHV1UmFlB3ndc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-u4hbdNH4PaKCWXUCWZaBsA-1; Thu, 24 Nov 2022 12:33:33 -0500
X-MC-Unique: u4hbdNH4PaKCWXUCWZaBsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD16811E75;
 Thu, 24 Nov 2022 17:33:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E3014C819;
 Thu, 24 Nov 2022 17:33:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v2 4/4] vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in
 vhost-vdpa
Date: Thu, 24 Nov 2022 18:33:14 +0100
Message-Id: <20221124173314.2123015-5-eperezma@redhat.com>
In-Reply-To: <20221124173314.2123015-1-eperezma@redhat.com>
References: <20221124173314.2123015-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

So qemu emulates it even in case the device does not support it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8172aa8449..79f022c2bf 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -72,7 +72,6 @@ const int vdpa_feature_bits[] = {
     VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
-    VIRTIO_NET_F_GUEST_ANNOUNCE,
     VIRTIO_NET_F_STATUS,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
2.31.1


