Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38083AE228
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:20:35 +0200 (CEST)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBQI-0000O2-KO
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBN8-0001TK-7N
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBN6-0000wp-G8
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4EBTteney8BVVBED29AxcFjQxXseHHgEAt1TjYqrfoQ=;
 b=KE1qQyQXXxrZYMx6VmAii5X897RnXNA0XhgmM/Owq1k7FNYRzpzoUetkpvyvBtKocLwj5a
 caUQ2T7DgX42Ch9AXYd/TOwfAyQjWVCkSWh+BOfiL8hHHjqYi3NoEJUuzsY8PFR2U8tqvZ
 65kiCbGRwAIJDg7k1ZK+qWArZRSePlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-3DqwFxf1Nu-boMlWDhuucQ-1; Mon, 21 Jun 2021 00:17:14 -0400
X-MC-Unique: 3DqwFxf1Nu-boMlWDhuucQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B3C71084F4C;
 Mon, 21 Jun 2021 04:17:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE1760877;
 Mon, 21 Jun 2021 04:17:10 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 05/18] vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
Date: Mon, 21 Jun 2021 12:16:37 +0800
Message-Id: <20210621041650.5826-6-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-1-jasowang@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The previous vhost_net_cleanup is sufficient for freeing, calling
vhost_vdpa_del() in this case will lead an extra round of free. Note
that this kind of "double free" is safe since vhost_dev_cleanup() zero
the whole structure.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 728e63ff54..f5689a7c32 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -82,16 +82,6 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static void vhost_vdpa_del(NetClientState *ncs)
-{
-    VhostVDPAState *s;
-    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
-    s = DO_UPCAST(VhostVDPAState, nc, ncs);
-    if (s->vhost_net) {
-        vhost_net_cleanup(s->vhost_net);
-    }
-}
-
 static int vhost_vdpa_add(NetClientState *ncs, void *be)
 {
     VhostNetOptions options;
@@ -122,7 +112,6 @@ err:
     if (net) {
         vhost_net_cleanup(net);
     }
-    vhost_vdpa_del(ncs);
     return -1;
 }
 
-- 
2.25.1


