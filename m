Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F8443217
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:53:56 +0100 (CET)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhw6l-0004rI-GD
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhw4x-0003QH-4K
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mhw4v-0005SL-O4
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 11:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635868321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wm8fbFGPzUUCJoqX9BjblDQm68NG/7R2nHjAWV4gH7s=;
 b=iyQlOfv/G4HJBIi61OT2N7sbDZadq+9rqrpGorXpXyjrTpPsE0UCz/O/5OfuUpE85lwXVo
 mD008u92sOftnvQCZ3mPNU358iselbYud+TMGzBoZrjix3LzPeb9WxnlhwF7wBfs/94jQI
 +o04I+Gp2VHh3bI9lKoGrNRpCajx1PU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-Bjqt7ycGMKG3QiJihfocCw-1; Tue, 02 Nov 2021 11:51:59 -0400
X-MC-Unique: Bjqt7ycGMKG3QiJihfocCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31A2F101F003
 for <qemu-devel@nongnu.org>; Tue,  2 Nov 2021 15:51:59 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49BD760BE5;
 Tue,  2 Nov 2021 15:51:58 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] net/vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
Date: Tue,  2 Nov 2021 16:51:57 +0100
Message-Id: <20211102155157.241034-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use g_autofree to ensure that `config` is freed when
vhost_vdpa_get_max_queue_pairs() returns.

Reported-by: Coverity (CID 1465228: RESOURCE_LEAK)
Fixes: 402378407d ("vhost-vdpa: multiqueue support")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 49ab322511..373b706b90 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
 {
     unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
-    struct vhost_vdpa_config *config;
+    g_autofree struct vhost_vdpa_config *config = NULL;
     __virtio16 *max_queue_pairs;
     uint64_t features;
     int ret;
-- 
2.31.1


