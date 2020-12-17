Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7942DCFAE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 11:45:57 +0100 (CET)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpqnE-0005Yo-Me
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 05:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kpqls-00059V-PW
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kpqlq-00052J-Gc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 05:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608201868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q+mh4ZhFjuCykImm8FIaqD8XRSD51LXXAQUonj0HKl0=;
 b=NeqlhohASJFU26PI1BZVY+vbFdGxD+Ob27/D7MLPAUG1QnbWxG7uE8RF2e5DvnBW87h6lO
 /WUbGPLDhdEawJ8AGtUJ0E8RTQkn9h12VYdI/eJ/+VBGMbIai9jdrCpAupc19cdkxKofjg
 6KCNHKif4kaifWVp+6IdHzbEXAKJrDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-AzHgHFWFMji_KbLXFdUuLQ-1; Thu, 17 Dec 2020 05:44:26 -0500
X-MC-Unique: AzHgHFWFMji_KbLXFdUuLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7E2C73A2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 10:44:25 +0000 (UTC)
Received: from localhost (unknown [10.36.110.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D47271C85;
 Thu, 17 Dec 2020 10:44:20 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: fix win32 compilation with --target-list=''
Date: Thu, 17 Dec 2020 14:44:17 +0400
Message-Id: <20201217104417.436508-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes linking:
x86_64-w64-mingw32-gcc  -o tests/test-qapi-util.exe version.rc_version.o tests/test-qapi-util.exe.p/test-qapi-util.c.obj -Wl,--allow-shlib-undefined -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase -Wl,--warn-common -m64 -fstack-protector-strong -Wl,--start-group libqemuutil.a -pthread -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgnutls -lwinmm -lm -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgthread-2.0 -lglib-2.0 -lintl -lws2_32 -mconsole -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 -Wl,--end-group
/usr/lib/gcc/x86_64-w64-mingw32/10.2.1/../../../../x86_64-w64-mingw32/bin/ld: libqemuutil.a(util_oslib-win32.c.obj): in function `qemu_try_set_nonblock':
/home/elmarco/src/qemu/buildw/../util/oslib-win32.c:224: undefined reference to `qemu_fd_register'

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 util/main-loop-stub.c | 26 ++++++++++++++++++++++++++
 util/meson.build      |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 util/main-loop-stub.c

diff --git a/util/main-loop-stub.c b/util/main-loop-stub.c
new file mode 100644
index 0000000000..b3e175ade5
--- /dev/null
+++ b/util/main-loop-stub.c
@@ -0,0 +1,26 @@
+/*
+ * QEMU main loop stub impl
+ *
+ * Copyright (c) 2020 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+
+void qemu_fd_register(int fd)
+{
+}
diff --git a/util/meson.build b/util/meson.build
index f359af0d46..462b79a61a 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -79,4 +79,6 @@ if have_block
   util_ss.add(when: 'CONFIG_INOTIFY1', if_true: files('filemonitor-inotify.c'),
                                         if_false: files('filemonitor-stub.c'))
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
+else
+  util_ss.add(files('main-loop-stub.c'))
 endif
-- 
2.29.0


