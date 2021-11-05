Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41BC4462CB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:35:30 +0100 (CET)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixVJ-0007W7-T1
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRj-0001Ky-CD
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRh-0006kD-0U
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jepb0sxPU4MnEldnynn07wp15ustYFOmjzojh9N9SRY=;
 b=TWLMATvePZDPP6UrlFUjFajv7GRtsqEE9RGNcqWIFi28ihFJMsPSQMaEVYv48xXRJ4gS+t
 NUA608gx4j5JNv/wFJCZRXzsc4Ki4BsHkL2Xws4/9ph/KljMqgUBVbRTJF1XkkTk21usfI
 dMawqmq+ChLdzh47qQFeF984kB6RUYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-ulgDOllmO8qtJ29AVNe5bA-1; Fri, 05 Nov 2021 07:31:41 -0400
X-MC-Unique: ulgDOllmO8qtJ29AVNe5bA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384821006AA3;
 Fri,  5 Nov 2021 11:31:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC33519739;
 Fri,  5 Nov 2021 11:31:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E2E21805C8C; Fri,  5 Nov 2021 12:30:44 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] ui/gtk-egl: blitting partial guest fb to the proper
 scanout surface
Date: Fri,  5 Nov 2021 12:30:43 +0100
Message-Id: <20211105113043.4059361-7-kraxel@redhat.com>
In-Reply-To: <20211105113043.4059361-1-kraxel@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dongwon Kim <dongwon.kim@intel.com>

eb_fb_blit should be able to blit partial image of guest display (blob res)
in case multiple displays are configured for the guest and they are set as extended-
desktop mode.

v2: egl_fb includes dmabuf info then make egl_fb_blit position and size
    parameters programmed in dmabuf structure (previously position/size
    parameters were given to egl_fb_blit separately)
    (Vivek Kasireddy)

    changed the commit message as there is no interface change to egl_fb_blit

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20211104065153.28897-6-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/egl-helpers.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 385a3fa75223..3a88245b6780 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -90,14 +90,31 @@ void egl_fb_setup_new_tex(egl_fb *fb, int width, int height)
 
 void egl_fb_blit(egl_fb *dst, egl_fb *src, bool flip)
 {
-    GLuint y1, y2;
+    GLuint x1 = 0;
+    GLuint y1 = 0;
+    GLuint x2, y2;
+    GLuint w = src->width;
+    GLuint h = src->height;
 
     glBindFramebuffer(GL_READ_FRAMEBUFFER, src->framebuffer);
     glBindFramebuffer(GL_DRAW_FRAMEBUFFER, dst->framebuffer);
     glViewport(0, 0, dst->width, dst->height);
-    y1 = flip ? src->height : 0;
-    y2 = flip ? 0 : src->height;
-    glBlitFramebuffer(0, y1, src->width, y2,
+
+    if (src->dmabuf) {
+        x1 = src->dmabuf->x;
+        y1 = src->dmabuf->y;
+        w = src->dmabuf->scanout_width;
+        h = src->dmabuf->scanout_height;
+    }
+
+    w = (x1 + w) > src->width ? src->width - x1 : w;
+    h = (y1 + h) > src->height ? src->height - y1 : h;
+
+    y2 = flip ? y1 : h + y1;
+    y1 = flip ? h + y1 : y1;
+    x2 = x1 + w;
+
+    glBlitFramebuffer(x1, y1, x2, y2,
                       0, 0, dst->width, dst->height,
                       GL_COLOR_BUFFER_BIT, GL_LINEAR);
 }
-- 
2.31.1


