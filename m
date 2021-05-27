Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B23930EF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:30:56 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH2F-00021B-RR
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGw1-0006G9-At
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvz-0004TA-Oi
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsWfZcqreEfNufHHb2WG+S/8FlWuJ5zpWayfFlvq9R0=;
 b=e5Bel6Tewu5YIfcmMCz/NkdAMrs3w+cgQ++sP3A+3umRFVKPj95HaRI87H1JG9Xj+M1BVj
 cSQOX8yWJY+8DRwWQzuKKKMFLyVM/C6ic0jXG11qhJ7nnkwEt2i9Kg/vboHY4vmvwNdPiT
 O3qxWUz9fLcGJOAIs8o1uI1COVrvPH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-gVh06qyXOSScOdTAigLxsw-1; Thu, 27 May 2021 10:24:22 -0400
X-MC-Unique: gVh06qyXOSScOdTAigLxsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72370100945E;
 Thu, 27 May 2021 14:24:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B463E5B686;
 Thu, 27 May 2021 14:24:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 33A0518007B7; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/23] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref' (CVE-2021-3544)
Date: Thu, 27 May 2021 16:23:22 +0200
Message-Id: <20210527142340.1352791-6-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

The 'res->iov' will be leaked if the guest trigger following sequences:

	virgl_cmd_create_resource_2d
	virgl_resource_attach_backing
	virgl_cmd_resource_unref

This patch fixes this.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
in virgl_cmd_resource_unref"

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-6-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/virgl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 6a332d601f80..c669d73a1dbe 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
                          struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_unref unref;
+    struct iovec *res_iovs = NULL;
+    int num_iovs = 0;
 
     VUGPU_FILL_CMD(unref);
 
+    virgl_renderer_resource_detach_iov(unref.resource_id,
+                                       &res_iovs,
+                                       &num_iovs);
+    g_free(res_iovs);
+
     virgl_renderer_resource_unref(unref.resource_id);
 }
 
-- 
2.31.1


