Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAE1478E69
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:49:47 +0100 (CET)
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEYF-0003nX-MP
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEPA-00084u-Cr
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:40:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEP8-0007He-QG
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5T1rWyDX3wH+c9zfbdZrfj9a0NfwEv2ASTEHlbqLIDc=;
 b=AwwUN+Qm3/aeFTFS/FwOmHBFfazRE4BSHuAbEooxCi8tR8aygk8fke44MoWfTMJeM7tkVT
 Y7/c8BuqkaXSYgGj0xbQCr3B5L+/qeCWWrQrIoOWSWIIwd/SzUIDKbFBlsfnfcZZj+szh8
 WeCuZ9BbKHDAxdfsdG0C4eqqXEhOARg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-L4oPANRoOSaLRh2zncWvqw-1; Fri, 17 Dec 2021 09:40:08 -0500
X-MC-Unique: L4oPANRoOSaLRh2zncWvqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A837C85EE61;
 Fri, 17 Dec 2021 14:40:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 172325BE37;
 Fri, 17 Dec 2021 14:39:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/36] virtio-gpu: use VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP
Date: Fri, 17 Dec 2021 18:37:28 +0400
Message-Id: <20211217143756.1831099-9-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's part of Linux headers for a while now.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/virtio-gpu-virgl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 0d87de65d79a..73cb92c8d5c6 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -175,7 +175,7 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
         virgl_renderer_force_ctx_0();
         dpy_gl_scanout_texture(
             g->parent_obj.scanout[ss.scanout_id].con, info.tex_id,
-            info.flags & 1 /* FIXME: Y_0_TOP */,
+            info.flags & VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP,
             info.width, info.height,
             ss.r.x, ss.r.y, ss.r.width, ss.r.height);
     } else {
-- 
2.34.1.8.g35151cf07204


