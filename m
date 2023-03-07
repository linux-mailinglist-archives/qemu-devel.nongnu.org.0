Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E58C6ADE22
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:58:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVx0-0004RR-Kp; Tue, 07 Mar 2023 06:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwx-00049d-Uc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVww-000386-D8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=68pvYe/0fh7+ksxqpXN2pdkgide/UfgXPlMTgTXTWvY=;
 b=LQhT8dhwFAFJ3KMI4n2yd+ALMCPGPghLbqf9aFpBgAS2x9832Lue3Fg71xjoI/1B93/36N
 y5Os68MG08pw/3gU0+G/UGenJrW/4NhX2IWbyOe9fFlG+WlHt0erxZzYVxFdEH4E4/OTh6
 bYNVYfthV/l3ysZOvO8gnLneUJNpdo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-Wyh7NAucMX2Kw4U79PJLqQ-1; Tue, 07 Mar 2023 06:57:44 -0500
X-MC-Unique: Wyh7NAucMX2Kw4U79PJLqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 757583823A03;
 Tue,  7 Mar 2023 11:57:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B8C82166B26;
 Tue,  7 Mar 2023 11:57:42 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 14/18] ui/sdl: add optional logging when _SDL_DEBUG is set
Date: Tue,  7 Mar 2023 15:56:33 +0400
Message-Id: <20230307115637.2464377-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Apparently, there is no environment variable you can set for libsdl to
enable logging.

(similar to _VNC_DEBUG)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/sdl2.h | 2 ++
 ui/sdl2.c         | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 8fb7e08262..6fea36db82 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -6,6 +6,8 @@
 
 #include <SDL.h>
 
+/* #define _SDL_DEBUG 1 */
+
 /* with Alpine / muslc SDL headers pull in directfb headers
  * which in turn trigger warning about redundant decls for
  * direct_waitqueue_deinit.
diff --git a/ui/sdl2.c b/ui/sdl2.c
index f259e4c4d1..592eca3e1c 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -841,6 +841,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 #endif
 
+#ifdef _SDL_DEBUG
+    SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
+#endif
+
     if (SDL_Init(SDL_INIT_VIDEO)) {
         fprintf(stderr, "Could not initialize SDL(%s) - exiting\n",
                 SDL_GetError());
-- 
2.39.2


