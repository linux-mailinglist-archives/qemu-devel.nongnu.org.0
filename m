Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A483D30C204
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:42:14 +0100 (CET)
Received: from localhost ([::1]:40402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wsf-0000fa-NG
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6whF-0004QB-OV
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:30:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6whD-0004MH-UE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2hjXGn6r0/yrb9LYWphq3SI0hUk92h1ayDItWCET1Jg=;
 b=MYDSJOoFF2CGouw5YaaGRtNppeRu5tNuTCg8qLvwKDJZBN9k7D7ZWzcyiYb8AzXUViN2Ji
 q16H5AytwuM1ZxlSf8nJcs+ICsvCU7rRYsnqPdKadqtRmihdu3iDNa4H8lCzBQiNHdvPnI
 7TzYIMVQflKLPLZXBu86qP7R4/yiulQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-jP71c5WkMQ2KWY8I2ieMcA-1; Tue, 02 Feb 2021 09:30:21 -0500
X-MC-Unique: jP71c5WkMQ2KWY8I2ieMcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93B8393BE
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:30:20 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC5EB5D9E8;
 Tue,  2 Feb 2021 14:29:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 17/20] virtio-gpu: avoid re-entering cmdq processing
Date: Tue,  2 Feb 2021 18:26:22 +0400
Message-Id: <20210202142625.609070-18-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next patch will notify the GL context got flush, which will resume
the queue processing. However, if this happens within the caller
context, it will end up with a stack overflow flush/update loop.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 1 +
 hw/display/virtio-gpu.c        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 4f3dbf79f9..0043268e90 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -148,6 +148,7 @@ struct VirtIOGPU {
 
     uint64_t hostmem;
 
+    bool processing_cmdq;
     bool renderer_inited;
     bool renderer_reset;
     QEMUTimer *fence_poll;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 0e833a462b..7eb4265a6d 100644
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
2.29.0


