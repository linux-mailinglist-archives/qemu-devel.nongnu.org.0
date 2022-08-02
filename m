Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD4587B9B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:28:38 +0200 (CEST)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIq4j-0001eG-Jp
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1L-0004Kb-Cd
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIq1I-0007Ba-ON
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 07:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659439496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZ83/2iKBYgUumgQVCnyKZLgWLPFYMPqVj7+h/Iq+ts=;
 b=SWkNqukzMNJcbEOmzWNVaVH66auxwHf7yu53jQB93UgRK9wrbVFEs78+TNcFl0LCR3KhDX
 hViTDu7uOyTth0BCwwGvMvMY8IWngF9prrsTRtQSgvy+Z2UZDZH02SFIuMAbf9Iax1J0uT
 MxFSYIfp/ckbBjGPLM0kWAEGwjlNPW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-6goJY07LPsqLpb6R5PmlpA-1; Tue, 02 Aug 2022 07:24:53 -0400
X-MC-Unique: 6goJY07LPsqLpb6R5PmlpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C13A18A0161;
 Tue,  2 Aug 2022 11:24:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2F42026D07;
 Tue,  2 Aug 2022 11:24:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH 1/2] vdpa: Fix file descriptor leak on get features error
Date: Tue,  2 Aug 2022 13:24:46 +0200
Message-Id: <20220802112447.249436-2-eperezma@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

File descriptor vdpa_device_fd is not free in the case of returning
error from vhost_vdpa_get_features. Fixing it by making all errors go to
the same error path.

Resolves: Coverity CID 1490785
Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6abad276a6..303447a68e 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
-    int queue_pairs, r, i, has_cvq = 0;
+    int queue_pairs, r, i = 0, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
     if (unlikely(r < 0)) {
-        return r;
+        goto err;
     }
 
     queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
-- 
2.31.1


