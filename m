Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3F702E0A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:26:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYCI-00011l-RT; Mon, 15 May 2023 09:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCG-00011B-CP
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pyYCE-0005iN-Tm
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684157102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1gNBrRFqgp2bD/4TSRPkamgLuj6ABvvN+anmJCtOkcs=;
 b=XVD1olSqP9s7YF/m8I5El3hyUDGC2sDDtTKHa8MHEfNBaNSJVQ6tZsyAVYcSVnli3oY/Ao
 hmlJ28ZAo8u6I0D2pq3hbaGrGYIFXHlBT6+tOzcx6pZUEoMkTHL5aQOqgbSKoVOZGHLC13
 tQqLa+SRYhC3YQ4lLV+aB8kDG1Um1G4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-SQ3LrCyyPtSkcfIT-FaLoA-1; Mon, 15 May 2023 09:25:00 -0400
X-MC-Unique: SQ3LrCyyPtSkcfIT-FaLoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5652A857DE7
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 13:25:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2408AC15BA0;
 Mon, 15 May 2023 13:24:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] egl: no need to lookup EGL functions manually
Date: Mon, 15 May 2023 17:24:55 +0400
Message-Id: <20230515132455.1025608-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

libepoxy handles loading the function pointer and dispatching the call,
so you don't have to worry about it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/egl-helpers.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
index 4203163ace..60385c1f48 100644
--- a/ui/egl-helpers.c
+++ b/ui/egl-helpers.c
@@ -439,10 +439,8 @@ static EGLDisplay qemu_egl_get_display(EGLNativeDisplayType native,
 
     /* In practise any EGL 1.5 implementation would support the EXT extension */
     if (epoxy_has_egl_extension(NULL, "EGL_EXT_platform_base")) {
-        PFNEGLGETPLATFORMDISPLAYEXTPROC getPlatformDisplayEXT =
-            (void *) eglGetProcAddress("eglGetPlatformDisplayEXT");
-        if (getPlatformDisplayEXT && platform != 0) {
-            dpy = getPlatformDisplayEXT(platform, native, NULL);
+        if (platform != 0) {
+            dpy = eglGetPlatformDisplayEXT(platform, native, NULL);
         }
     }
 
-- 
2.40.1


