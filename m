Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845983930DC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:26:28 +0200 (CEST)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGxv-0008BD-3V
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvs-0005io-Fl
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGvq-0004Lq-RQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7lJvPJqZFShUMq3+67WegbHN1+FUnt0YX8aeZ9iiJD0=;
 b=dh4EQj+EyeeJG1LUcBJnmLPcuqb99ChCH7Gxu2qpsDhricm9jmXwoC5JBcjmVvoOKtuWNg
 3ENO98dbJQ2mYAzOwDdrjE29kt5obNeldx6YdOS1S0v+y3Z0qzwOLiuYxD/8MRd0EO1i50
 ZpDpSlBJXVP58FUoe/W9esQCw77cVrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-uHaBSDeCMg6NLevR7hTh7Q-1; Thu, 27 May 2021 10:24:10 -0400
X-MC-Unique: uHaBSDeCMg6NLevR7hTh7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE08501ED;
 Thu, 27 May 2021 14:24:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE46F1349A;
 Thu, 27 May 2021 14:23:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2851A180079B; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] vhost-user-gpu: fix memory leak while calling
 'vg_resource_unref' (CVE-2021-3544)
Date: Thu, 27 May 2021 16:23:21 +0200
Message-Id: <20210527142340.1352791-5-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
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

If the guest trigger following sequences, the attach_backing will be leaked:

	vg_resource_create_2d
	vg_resource_attach_backing
	vg_resource_unref

This patch fix this by freeing 'res->iov' in vg_resource_destroy.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
in virgl_cmd_resource_unref")

Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210516030403.107723-5-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 0437e52b6460..770dfad52989 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -400,6 +400,7 @@ vg_resource_destroy(VuGpu *g,
     }
 
     vugbm_buffer_destroy(&res->buffer);
+    g_free(res->iov);
     pixman_image_unref(res->image);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g_free(res);
-- 
2.31.1


