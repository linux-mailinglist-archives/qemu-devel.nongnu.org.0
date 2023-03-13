Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC7D6B7513
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:02:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfwF-0002BA-QE; Mon, 13 Mar 2023 07:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfwC-00028Z-MC
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbfwB-0003vF-77
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:01:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678705314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxQQ/DryfYO5Hfit4DRbxI3FRh1OF59gFMlc22PQCvs=;
 b=PHSQmpj77+ws9QqXqetA0roNeAxz0AE909+/NvW6kHPAB8mXRO00I7vC5RZBAeoHGHi+P6
 KIAajB5CJQtTZBHnyAu+A8JSkAQnWKu8RwbkEiygzWLrzoWUjxXLAvAsiEpGr1SFX7DPbF
 zFWp8+WAPfg2uT+Mq5KGcYOA/RnYex4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-jwSPUx-pPTyHvL8A0RXJgg-1; Mon, 13 Mar 2023 07:01:51 -0400
X-MC-Unique: jwSPUx-pPTyHvL8A0RXJgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0E1385A588;
 Mon, 13 Mar 2023 11:01:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F6D40C6E67;
 Mon, 13 Mar 2023 11:01:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 05/18] meson: ensure dbus-display generated code is built
 before other units
Date: Mon, 13 Mar 2023 15:01:13 +0400
Message-Id: <20230313110126.383392-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230313110126.383392-1-marcandre.lureau@redhat.com>
References: <20230313110126.383392-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
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

It's simply by luck that dbus-display header is built first before the
other units using it.

With sourceset, I can't find an easier way out than declaring an extra
dependency for dbus-display1 generate code.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 ui/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 612ea2325b..0b2d0d21d1 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -83,7 +83,9 @@ if dbus_display
                                           '--interface-prefix', 'org.qemu.',
                                           '--c-namespace', 'QemuDBus',
                                           '--generate-c-code', '@BASENAME@'])
-  dbus_ss.add(when: [gio, pixman, opengl, gbm],
+  dbus_display1_lib = static_library('dbus-display1', dbus_display1, dependencies: gio)
+  dbus_display1_dep = declare_dependency(link_with: dbus_display1_lib, include_directories: include_directories('.'))
+  dbus_ss.add(when: [gio, pixman, opengl, gbm, dbus_display1_dep],
               if_true: [files(
                 'dbus-chardev.c',
                 'dbus-clipboard.c',
@@ -91,7 +93,7 @@ if dbus_display
                 'dbus-error.c',
                 'dbus-listener.c',
                 'dbus.c',
-              ), dbus_display1])
+              )])
   ui_modules += {'dbus' : dbus_ss}
 endif
 
-- 
2.39.2


