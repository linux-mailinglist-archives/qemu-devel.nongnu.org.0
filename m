Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F273554FD8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:51:52 +0200 (CEST)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o42dx-0008PF-Mv
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o42bi-0007h2-FF
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o42bf-0002GU-PV
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655912966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ldY6/iG5i/0pXuxfR/jL2psxba3h5n9Op9LJJ67u9SE=;
 b=DZJHmGcOa4K+C1Jr9yN5kGEAQ96OqS6IoRP3/RQrsB9F+n0AwpJP4NymQw8D+/fh6tDY0l
 kiQP1bF5d5Br1kEmoopy4eDVNy75nOgwmURIUlmueZdCNqVTjGLNWj1QhLkdE8OhQJw1TA
 t3Q9JRP8d0nlg/PGly0yP45WMGfmDm8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-r6p_o8D-PY2wK-BPzW4Qsg-1; Wed, 22 Jun 2022 11:49:23 -0400
X-MC-Unique: r6p_o8D-PY2wK-BPzW4Qsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB4F802D1C;
 Wed, 22 Jun 2022 15:49:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7441121314;
 Wed, 22 Jun 2022 15:49:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] audio/dbus: fix building
Date: Wed, 22 Jun 2022 19:49:18 +0400
Message-Id: <20220622154918.560870-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit c9c847481 broken dbus audio module compilation with bad
'CONFIG_GIO' usage. Furthermore, it implied extra dependency on audio
module which aren't necessary.

The problem was that 'dbus_display' is not correctly automatically set
on MacOS, because opengl dependency wasn't taken into account.

Fixes: c9c847481 ("audio/dbus: Fix building with modules on macOS")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build       | 2 ++
 audio/meson.build | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9efcb175d161..1aaf77e3dcbc 100644
--- a/meson.build
+++ b/meson.build
@@ -1652,6 +1652,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
+  .require(opengl.found(),
+           error_message: '-display dbus requires epoxy/egl') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
diff --git a/audio/meson.build b/audio/meson.build
index 94dab16891d5..3abee908602a 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -28,7 +28,7 @@ endforeach
 
 if dbus_display
     module_ss = ss.source_set()
-    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
+    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
     audio_modules += {'dbus': module_ss}
 endif
 
-- 
2.37.0.rc0


