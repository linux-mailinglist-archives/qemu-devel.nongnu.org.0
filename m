Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF23D3459
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:56:48 +0200 (CEST)
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oAx-0004eq-HB
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9K-00027K-Fz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9G-0006B9-7Z
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627019700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h6ROhyOucg0NsaKHg4akItGkAQpqQE6aZa+mmUA8rok=;
 b=QjM1I2fePbnFR6XMvcXuh2SonAw2gQlSSvSP93GzGm0Y/Szt9Ha/+Lhf6umAH9O0plITEx
 xk9VLWc4wbLpGADqFMkIZ+Bx+0oeyQagKaXXguKOOrEfaXx22nghtjTVDNerbcFC7wumpl
 myeFEV16DmKeJeHfn2KiyQ3R6Aks9Cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-FhixPXtLOoWmPNdbM5Q9VQ-1; Fri, 23 Jul 2021 01:54:59 -0400
X-MC-Unique: FhixPXtLOoWmPNdbM5Q9VQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F0F3639F
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:54:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D8BD10016F7;
 Fri, 23 Jul 2021 05:54:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD0DA1800938; Fri, 23 Jul 2021 07:54:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] hw/display/virtio-gpu: Fix memory leak (CID 1453811)
Date: Fri, 23 Jul 2021 07:54:43 +0200
Message-Id: <20210723055448.1032115-2-kraxel@redhat.com>
In-Reply-To: <20210723055448.1032115-1-kraxel@redhat.com>
References: <20210723055448.1032115-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To avoid leaking memory on the error path, reorder the
code as:
- check the parameters first
- check resource already existing
- finally allocate memory

Reported-by: Coverity (CID 1453811: RESOURCE_LEAK)
Fixes: e0933d91b1c ("virtio-gpu: Add virtio_gpu_resource_create_blob")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210531101928.1662732-1-philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 6b7f643951fe..990e71fd4062 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -340,37 +340,31 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
         return;
     }
 
-    res = virtio_gpu_find_resource(g, cblob.resource_id);
-    if (res) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
-                      __func__, cblob.resource_id);
-        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
-        return;
-    }
-
-    res = g_new0(struct virtio_gpu_simple_resource, 1);
-    res->resource_id = cblob.resource_id;
-    res->blob_size = cblob.size;
-
     if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
         cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
                       __func__);
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
-        g_free(res);
         return;
     }
 
-    if (res->iov) {
-        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+    if (virtio_gpu_find_resource(g, cblob.resource_id)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
+                      __func__, cblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
 
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    res->resource_id = cblob.resource_id;
+    res->blob_size = cblob.size;
+
     ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
                                         cmd, &res->addrs, &res->iov,
                                         &res->iov_cnt);
-    if (ret != 0) {
+    if (ret != 0 || res->iov) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        g_free(res);
         return;
     }
 
-- 
2.31.1


