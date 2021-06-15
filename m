Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D93A8802
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:47:45 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDA8-00019I-Mq
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3f-00008N-91
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltD3Z-0003XH-PM
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixzbqTGrnkDdaDRNlYbW9vE+R1y9kfRoe1BEyGd7dwI=;
 b=SWk9sZnUoiBzYNmnZ2GrIygk4bIKyBfW62Yoip1iqxn1fDSM8pVWkscz5Ak17YzV9Dluy9
 CQNNX+KV0Jux0stKIySrFsAOeV7e9oEJtKvMe1cFXYbq/2SgGhCrq4yuBwXT+e5Ug2UMiC
 9N5Ws8+NnYwZSpl5qvbvOn28fUa4X7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-5mV3HLlUN5iXMNmS8vxSRw-1; Tue, 15 Jun 2021 13:40:55 -0400
X-MC-Unique: 5mV3HLlUN5iXMNmS8vxSRw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DEE1084F4A;
 Tue, 15 Jun 2021 17:40:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 287CB1962D;
 Tue, 15 Jun 2021 17:40:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5FBB18003B6; Tue, 15 Jun 2021 19:40:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] vhost-user-gpu: reorder free calls.
Date: Tue, 15 Jun 2021 19:40:24 +0200
Message-Id: <20210615174025.3409518-3-kraxel@redhat.com>
In-Reply-To: <20210615174025.3409518-1-kraxel@redhat.com>
References: <20210615174025.3409518-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Free in correct order to avoid use-after-free.

Resolves: CID 1453812
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210604103714.1237414-1-kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 6dc6a44f4e26..611360e6b475 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -350,8 +350,8 @@ vg_resource_create_2d(VuGpu *g,
     if (!res->image) {
         g_critical("%s: resource creation failed %d %d %d",
                    __func__, c2d.resource_id, c2d.width, c2d.height);
-        g_free(res);
         vugbm_buffer_destroy(&res->buffer);
+        g_free(res);
         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
         return;
     }
-- 
2.31.1


