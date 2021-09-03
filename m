Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EE3FFCE4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:18:12 +0200 (CEST)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Kt-0006Fb-S3
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5E8-0001Gs-2i
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mM5E6-00037e-Ig
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630660270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jk9s+ZB/7Z47crrBJJpqNT4+zdFPnTmPiGioaBJ3Ls0=;
 b=BbcpRwZaBsHw9XBfMnnzxL7WTkq8ETAKgbbLOq3jSlma3Gvn6J6OevZO1m6WKHOfk446CC
 J59CluyK8cww8DZrILi6P0ufxtbsoLSkXLqmDRQzhXfOw3lSEZjyaVvy1WahyXzCmGOwbZ
 1aLg6AutBG097uIE+GrBdPfX6l3DWVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-HMteJurGOjynZvb8JOziRA-1; Fri, 03 Sep 2021 05:11:07 -0400
X-MC-Unique: HMteJurGOjynZvb8JOziRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80B0100670B;
 Fri,  3 Sep 2021 09:11:05 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-217.pek2.redhat.com
 [10.72.13.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E56DE60BF1;
 Fri,  3 Sep 2021 09:11:02 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH V2 06/21] vhost-vdpa: remove the unnecessary check in
 vhost_vdpa_add()
Date: Fri,  3 Sep 2021 17:10:16 +0800
Message-Id: <20210903091031.47303-7-jasowang@redhat.com>
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
Cc: eperezma@redhat.com, elic@nvidia.com, gdawar@xilinx.com,
 lingshan.zhu@intel.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VhostVDPAState is just allocated by qemu_new_net_client() via
g_malloc0() in net_vhost_vdpa_init(). So s->vhost_net is NULL for
sure, let's remove this unnecessary check in vhost_vdpa_add().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 395117debd..5c09cacd5a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -111,10 +111,6 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
         error_report("failed to init vhost_net for queue");
         goto err;
     }
-    if (s->vhost_net) {
-        vhost_net_cleanup(s->vhost_net);
-        g_free(s->vhost_net);
-    }
     s->vhost_net = net;
     ret = vhost_vdpa_net_check_device_id(net);
     if (ret) {
-- 
2.25.1


