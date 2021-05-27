Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E93930E9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:28:00 +0200 (CEST)
Received: from localhost ([::1]:38854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGzO-0003hE-Gw
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvb-00054g-UG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGva-00049t-8a
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZGrIz//c6HzXMND+tL9twY5A7Ll/vS79v1T9EAp1qw=;
 b=DqQPA/PlCyxL6C2MUjO90MGxXsgM3J5RzzxyupSJBUFZAlRX+09zunTiZfEDoyY1FZ4OHV
 xeH8gLJ7mJS6nzfZbbKsBLU3BZvjo8z+Ooz5Ic2r8iYzoGuj/pbPMdgUcckwzlfB8bAvkx
 PkipwsNdEnWxhvU0gWBDnaY7v4uE0zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-RtVMHw0kOhOQyLnK_79i2g-1; Thu, 27 May 2021 10:23:58 -0400
X-MC-Unique: RtVMHw0kOhOQyLnK_79i2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92F51501E1;
 Thu, 27 May 2021 14:23:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9C405D9CC;
 Thu, 27 May 2021 14:23:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10ED2180039F; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] vhost-user-gpu: fix resource leak in
 'vg_resource_create_2d' (CVE-2021-3544)
Date: Thu, 27 May 2021 16:23:19 +0200
Message-Id: <20210527142340.1352791-3-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

Call 'vugbm_buffer_destroy' in error path to avoid resource leak.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-3-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f73f292c9f72..b5e153d0d648 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -349,6 +349,7 @@ vg_resource_create_2d(VuGpu *g,
         g_critical("%s: resource creation failed %d %d %d",
                    __func__, c2d.resource_id, c2d.width, c2d.height);
         g_free(res);
+        vugbm_buffer_destroy(&res->buffer);
         cmd->error = VIRTIO_GPU_RESP_ERR_OUT_OF_MEMORY;
         return;
     }
-- 
2.31.1


