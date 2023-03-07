Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98446ADE23
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:58:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVwM-0002Ei-6z; Tue, 07 Mar 2023 06:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwK-00028l-4U
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwI-00033f-HZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MO2aoZ44E6myoCFN2vgXYm+jOHocGXEpoXAwrcahkY8=;
 b=DN/pr2b6CenLEX7btLaYUz51xeQgSQbp8a8tZqa81a6ciH1qwVD0/zkpJTEaUVwgOzCYdb
 Bc8eXiol3lzdd4v+wZDaY/sBLHHyZ1/T4ZVuPj3xbFIlmKHLF4+Ofh76P54h30JeEyylBH
 KdWWyTl4tls2f1gjviLpvffBzPMh8Lc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-yPvzkbgTMhmNF5Lrz_sRwg-1; Tue, 07 Mar 2023 06:57:02 -0500
X-MC-Unique: yPvzkbgTMhmNF5Lrz_sRwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6261A280AA23;
 Tue,  7 Mar 2023 11:57:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F5B2140EBF4;
 Tue,  7 Mar 2023 11:57:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 05/18] meson: ensure dbus-display generated code is built
 before other units
Date: Tue,  7 Mar 2023 15:56:24 +0400
Message-Id: <20230307115637.2464377-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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


