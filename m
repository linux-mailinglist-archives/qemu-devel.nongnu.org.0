Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FD331F6CD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:52:53 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2Sy-0008FS-KV
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2OX-00050z-OX
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:48:17 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD2OT-0000Sc-Ih
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:48:17 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so3574861pgk.7
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BY28+sBVrktSq3FteMeyx7X46koEVdXXMEnXKMvUqas=;
 b=O1Bt7TYxGl69TZIbaK1pFS3tZkZCeNf1QCAu5lAebudPBvBcFidw7NJpvUWfm+0jYJ
 j25iQ64ynt/8FyBnFBy3mIDorqjaeu7ZrcvX61Btm2NhDpYN3qK33l5fWYQFrsbIQj76
 wd45SQIhYkmQqhs7pHcyC8DXgcYGnovkCbsv7O6Y42sM1APHUtwjadR9Aay8NmLLfzZr
 d1DJit00TCaU8G0OzprOpZ6fzDYXfUWso7F/C70QAaE/x4QjdwaIuQ7M6zqhsQSdU9r1
 2RfPCZ1rtlIXzLQgTFbMPb4U+zBv2FkJSE8xUoF5UvOi4VITdZGiwZhNufYoH/V0k76p
 Oytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BY28+sBVrktSq3FteMeyx7X46koEVdXXMEnXKMvUqas=;
 b=C8KoSEgVznhspQny2BQB3KF079WU2LyVp6OMjBY6dVsf1YljY4cO7M1dWYvuY8fUr1
 m0q2vwSbxcELs8Ws0UdH2mHeSlAbZfeouCVeDhs5oXqFKNQmudiz9VvV+8/A9HEWxzS/
 eouGZXSTeEuDPjdbzvsZIyhmTuUKUgsVAk0KEngT2MAVME/4EGIr+fLB8hkfy/deaEkz
 FrlGFGx9CK6+k8CAvtau4Qq9RMKaWoX47PLPRpvj9LfhFibVp30I2sWoFoKNUxMh5nCm
 TkrNk/DUH/18i92eKEis30G7hthPiSQDaiin5e7YIr1yyQf650CDFPs/z94tJ9pyx5qT
 n+0Q==
X-Gm-Message-State: AOAM532FtzmuM47/2kyig97P2RJBJcxUwVdvZ6asxQ2YRVnWMLXhM7xl
 Bj1m4ArtnklequSnfEXg85AtSwDgRm6FeQ==
X-Google-Smtp-Source: ABdhPJwuKzD9P1LEmHoVBrG7tw0TlZontaWgT81b4X+QC6ppVl/9U21nxyu+P9VBiEw3AreA/Nogcg==
X-Received: by 2002:a05:6a00:9d:b029:1df:c229:1b95 with SMTP id
 c29-20020a056a00009db02901dfc2291b95mr8722780pfj.80.1613728091159; 
 Fri, 19 Feb 2021 01:48:11 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id t17sm9616503pgk.25.2021.02.19.01.48.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 01:48:10 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] opengl: Do not convert format with glTexImage2D on OpenGL ES
Date: Fri, 19 Feb 2021 18:48:03 +0900
Message-Id: <20210219094803.90860-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenGL ES does not support conversion from the given data format
to the internal format with glTexImage2D.

Use the given data format as the internal format, and ignore
the given alpha channels with GL_TEXTURE_SWIZZLE_A in case the
format contains alpha channels.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/console-gl.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/ui/console-gl.c b/ui/console-gl.c
index 0a6478161fe..7c9894a51d9 100644
--- a/ui/console-gl.c
+++ b/ui/console-gl.c
@@ -73,11 +73,20 @@ void surface_gl_create_texture(QemuGLShader *gls,
     glBindTexture(GL_TEXTURE_2D, surface->texture);
     glPixelStorei(GL_UNPACK_ROW_LENGTH_EXT,
                   surface_stride(surface) / surface_bytes_per_pixel(surface));
-    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB,
-                 surface_width(surface),
-                 surface_height(surface),
-                 0, surface->glformat, surface->gltype,
-                 surface_data(surface));
+    if (epoxy_is_desktop_gl()) {
+        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB,
+                     surface_width(surface),
+                     surface_height(surface),
+                     0, surface->glformat, surface->gltype,
+                     surface_data(surface));
+    } else {
+        glTexImage2D(GL_TEXTURE_2D, 0, surface->glformat,
+                     surface_width(surface),
+                     surface_height(surface),
+                     0, surface->glformat, surface->gltype,
+                     surface_data(surface));
+        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_SWIZZLE_A, GL_ONE);
+    }
 
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
-- 
2.24.3 (Apple Git-128)


