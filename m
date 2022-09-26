Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3C5EA07E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:39:27 +0200 (CEST)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclWI-0002to-7v
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockq0-0005oR-2A
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpv-0003pO-BX
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wap4bE3M153XlNUESFRpL6QFaSZ1Y/NXM6sOa6Kq+is=;
 b=CSj1H82LVn5KSUDQLbH23QpvR5FHkMHOYI4nW1uu6/DWO8Mimi95Oh2EScRCORPWdmTwdd
 aKCBO937Gzp6mSqRS65k3At+Hw5cVIaBUMWQCeU/5IpEW0bfezrGSrmE4/P7Uk16nik1bl
 wbJDQPO/PEGMa311phRKPiy2Q4Qa5O8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-e1sCCUMRMBae7bM_-G8l9g-1; Mon, 26 Sep 2022 05:55:34 -0400
X-MC-Unique: e1sCCUMRMBae7bM_-G8l9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE2F3101CC62;
 Mon, 26 Sep 2022 09:55:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F63A2084836;
 Mon, 26 Sep 2022 09:55:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 760C8180A408; Mon, 26 Sep 2022 11:55:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 25/25] virtio-gpu: update scanout if there is any area covered
 by the rect
Date: Mon, 26 Sep 2022 11:55:09 +0200
Message-Id: <20220926095509.3759409-26-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

The scanout is currently updated only if the whole rect is inside the
scanout space. This is not a correct condition because the scanout should
be updated even a small area in the scanout space is covered by the rect.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220909014052.7297-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 20cc703dcc6e..5e15c79b94a5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -515,9 +515,10 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
         for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
             scanout = &g->parent_obj.scanout[i];
             if (scanout->resource_id == res->resource_id &&
-                rf.r.x >= scanout->x && rf.r.y >= scanout->y &&
-                rf.r.x + rf.r.width <= scanout->x + scanout->width &&
-                rf.r.y + rf.r.height <= scanout->y + scanout->height &&
+                rf.r.x < scanout->x + scanout->width &&
+                rf.r.x + rf.r.width >= scanout->x &&
+                rf.r.y < scanout->y + scanout->height &&
+                rf.r.y + rf.r.height >= scanout->y &&
                 console_has_gl(scanout->con)) {
                 dpy_gl_update(scanout->con, 0, 0, scanout->width,
                               scanout->height);
-- 
2.37.3


