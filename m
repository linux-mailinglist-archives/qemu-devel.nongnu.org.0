Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6043BC7E8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:35:30 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gYD-0005xR-3e
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gRA-0000ji-1w
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1m0gR6-0002YM-Nu
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625560087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHHcPpl9D02xWNusNPR+J6jEeGdfuSuBQZqOzMXGjUc=;
 b=O1ZaAKND1W5LPhj9errCn0zEGquHv3SL9Kfu7L9iHLfonlOlRJtfDXYiQupwRbBCKHPHEP
 lxOnN0q+jvnRoflO713bTQOVMUwBLsKXo0XEGNez92h0/opEODeAwPNSjz5Y5ayxGZImXo
 R53fKakjvYNRpI+oYLa3hZdijVQNct8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-9BwKFCczOZmtR_w9Qs_CCQ-1; Tue, 06 Jul 2021 04:28:04 -0400
X-MC-Unique: 9BwKFCczOZmtR_w9Qs_CCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4A981023F51;
 Tue,  6 Jul 2021 08:28:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-227.pek2.redhat.com
 [10.72.13.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD9C17A70;
 Tue,  6 Jul 2021 08:28:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V2 07/18] vhost-vdpa: tweak the error label in vhost_vdpa_add()
Date: Tue,  6 Jul 2021 16:27:06 +0800
Message-Id: <20210706082717.37730-8-jasowang@redhat.com>
In-Reply-To: <20210706082717.37730-1-jasowang@redhat.com>
References: <20210706082717.37730-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce new error label to avoid the unnecessary checking of net
pointer.

Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 21f09c546f..0da7bc347a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     net = vhost_net_init(&options);
     if (!net) {
         error_report("failed to init vhost_net for queue");
-        goto err;
+        goto err_init;
     }
     s->vhost_net = net;
     ret = vhost_vdpa_net_check_device_id(net);
     if (ret) {
-        goto err;
+        goto err_check;
     }
     return 0;
-err:
-    if (net) {
-        vhost_net_cleanup(net);
-        g_free(net);
-    }
+err_check:
+    vhost_net_cleanup(net);
+    g_free(net);
+err_init:
     return -1;
 }
 
-- 
2.25.1


