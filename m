Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632246AE7DA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:03:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZag3-0007Mj-5N; Tue, 07 Mar 2023 12:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZafs-0007D1-Q5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZafr-0002i4-Bt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678208425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XBc8z/0Knd4RN/W7zgQgFati1V+zxjXPjl9jjZul64I=;
 b=JxaMkYEqELCVB9pfm2JNEmLjrdPU9AV7fZAH/DuY6i0mOpi+hmzTyxQqaIT+akgPAjzAfz
 891WI75elrLYKpoWTdb/fOYCVptkf8sJjKqMTjXKHVXKmWzyAWsnqGfw2FpvGiWC0YjPb0
 AAF44kjzztLdh3+Ns5e65Qr6SuOHwHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-WxB8mSfWNjqP2wN10WfjPw-1; Tue, 07 Mar 2023 12:00:21 -0500
X-MC-Unique: WxB8mSfWNjqP2wN10WfjPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCFBB817077;
 Tue,  7 Mar 2023 17:00:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F4D40C1106;
 Tue,  7 Mar 2023 17:00:19 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, Alvaro Karsz <alvaro.karsz@solid-run.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH for 8.1] vdpa: accept VIRTIO_NET_F_SPEED_DUPLEX in SVQ
Date: Tue,  7 Mar 2023 18:00:18 +0100
Message-Id: <20230307170018.260557-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

There is no reason to block it as it has nothing to do with the vrings.
All the support of the feature comes via config space.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Suggested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
---
 net/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index de5ed8ff22..8b25559320 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -99,7 +99,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
-    BIT_ULL(VIRTIO_NET_F_STANDBY);
+    BIT_ULL(VIRTIO_NET_F_STANDBY) |
+    BIT_ULL(VIRTIO_NET_F_SPEED_DUPLEX);
 
 #define VHOST_VDPA_NET_CVQ_ASID 1
 
-- 
2.31.1


