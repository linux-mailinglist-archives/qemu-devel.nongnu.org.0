Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7553105B2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:17:40 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vN5-0007wE-Jw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v38-0001Qq-7T
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7v36-0001Ed-Hc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 01:57:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612508219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb6aGabv3PX5EzjJmYdUPHkoV1EnNOL4o2shw1dCEPg=;
 b=ioKGbdYk2qaU0qg3/o+B9xMlqNN49kRlfk+boAEjX3LMTm/bz2grjrhscRfwAxytRtyc/p
 OeJnSPeQEFj9fFbTpbXb9/80uMsB4T10FBKrrP90Xf1+07zOOKzKLRP6VLjzuEjptZ8yTG
 BRK2hNb0GPcUXRLPmustAmqZHCO2W/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-d5yN4DZPOk-ZC60CXu4aJA-1; Fri, 05 Feb 2021 01:56:58 -0500
X-MC-Unique: d5yN4DZPOk-ZC60CXu4aJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B4D21005501
 for <qemu-devel@nongnu.org>; Fri,  5 Feb 2021 06:56:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C34D60C9B;
 Fri,  5 Feb 2021 06:56:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 86D4A1800864; Fri,  5 Feb 2021 07:56:21 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] virtio-gpu: avoid re-entering cmdq processing
Date: Fri,  5 Feb 2021 07:56:17 +0100
Message-Id: <20210205065620.1726554-22-kraxel@redhat.com>
In-Reply-To: <20210205065620.1726554-1-kraxel@redhat.com>
References: <20210205065620.1726554-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next patch will notify the GL context got flush, which will resume
the queue processing. However, if this happens within the caller
context, it will end up with a stack overflow flush/update loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210204105232.834642-18-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 1 +
 hw/display/virtio-gpu.c        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 4f3dbf79f9bc..0043268e9021 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -148,6 +148,7 @@ struct VirtIOGPU {
 
     uint64_t hostmem;
 
+    bool processing_cmdq;
     bool renderer_inited;
     bool renderer_reset;
     QEMUTimer *fence_poll;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 0e833a462bae..7eb4265a6da7 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -814,6 +814,10 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
 {
     struct virtio_gpu_ctrl_command *cmd;
 
+    if (g->processing_cmdq) {
+        return;
+    }
+    g->processing_cmdq = true;
     while (!QTAILQ_EMPTY(&g->cmdq)) {
         cmd = QTAILQ_FIRST(&g->cmdq);
 
@@ -843,6 +847,7 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
             g_free(cmd);
         }
     }
+    g->processing_cmdq = false;
 }
 
 static void virtio_gpu_gl_unblock(VirtIOGPUBase *b)
-- 
2.29.2


