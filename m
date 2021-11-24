Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E559645C0D7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:08:59 +0100 (CET)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mps1C-00009Z-V3
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:08:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvK-0005q7-Jp
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvE-0005mD-Js
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsFY/0q5F9tQW7ROicgTgyYA19ve6U8YhIMCSRPor/4=;
 b=ASDk+WhydHAOHWTqpG2i09qWrYOwddR3YDWpzWy4l/g8qnbZ0WDUPwATaQw+cz98RGzdcw
 Je85FVfA2sel0uJp05608ji2nIfy/iN8AQwlTh2PF3/EKKYZlEZ5XZ6q3e9SJBQMKDYMqD
 qLj0CdPyno9sxjmLsud4FQiyIZJ09xo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-0Afz9ZcUN827pSj3f6IqzA-1; Wed, 24 Nov 2021 08:02:46 -0500
X-MC-Unique: 0Afz9ZcUN827pSj3f6IqzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8440883DD20;
 Wed, 24 Nov 2021 13:02:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F816794A2;
 Wed, 24 Nov 2021 13:02:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/18] ui: avoid warnings about directdb on Alpine / musl
 libc
Date: Wed, 24 Nov 2021 13:01:36 +0000
Message-Id: <20211124130150.268230-5-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Alpine, SDL is built with directfb support and this triggers warnings
during QEMU build

In file included from /usr/include/directfb/direct/thread.h:38,
                 from /usr/include/directfb/direct/debug.h:43,
                 from /usr/include/directfb/direct/interface.h:36,
                 from /usr/include/directfb/directfb.h:49,
                 from /usr/include/SDL2/SDL_syswm.h:80,
                 from /builds/berrange/qemu/include/ui/sdl2.h:8,
                 from ../ui/sdl2-gl.c:31:
/usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
   41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
      |                         ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/ui/sdl2.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index f85c117a78..0330978df8 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -5,7 +5,18 @@
 #undef WIN32_LEAN_AND_MEAN
 
 #include <SDL.h>
+
+/* with Alpine / muslc SDL headers pull in directfb headers
+ * which in turn trigger warning about redundant decls for
+ * direct_waitqueue_deinit.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wredundant-decls"
+
 #include <SDL_syswm.h>
+
+#pragma GCC diagnostic pop
+
 #ifdef CONFIG_SDL_IMAGE
 # include <SDL_image.h>
 #endif
-- 
2.33.1


