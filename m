Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199A43FFD28
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:31:55 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5YA-0003N0-4M
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5EV-0002WI-MN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5ET-0003QK-Sx
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzLf0auC+j4eXJaf7dJ/qxEgaQwsUXek6YlR7iaIGaY=;
 b=WW9knFUeJIPAJP8p3pCkyu+b+aEGNgITn+TnDqwhy6O0s38Aw3Yr5OHiMkwyYTpLKXbcXr
 jYsCvL9olhqodaUNcYlDEGcpYfA2u2Yg88zit2OtxoEsvtrE96a/hkOn6ZNyoNtOyJgn+Y
 0WTlIN7SbSj8WDELEq249461gypiFto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219--1NOy3i1MWuj4vnSWOZxTA-1; Fri, 03 Sep 2021 05:11:32 -0400
X-MC-Unique: -1NOy3i1MWuj4vnSWOZxTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39498835DE0;
 Fri,  3 Sep 2021 09:11:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEBF260BF1;
 Fri,  3 Sep 2021 09:11:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 10/21] vhost-vdpa: fix the wrong assertion in
 vhost_vdpa_init()
Date: Fri,  3 Sep 2021 17:10:20 +0800
Message-Id: <20210903091031.47303-11-jasowang@redhat.com>
In-Reply-To: <20210903091031.47303-1-jasowang@redhat.com>
References: <20210903091031.47303-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lulu@redhat.com, gdawar@xilinx.com, eperezma@redhat.com, elic@nvidia.com,
 lingshan.zhu@intel.com, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vhost_vdpa_add() can fail for various reasons, so the assertion of the
succeed is wrong. Instead, we should free the NetClientState and
propagate the error to the caller

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99327d17b4..d02cad9855 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -173,7 +173,10 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     }
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
-    assert(s->vhost_net);
+    if (ret) {
+        qemu_close(vdpa_device_fd);
+        qemu_del_net_client(nc);
+    }
     return ret;
 }
 
-- 
2.25.1


