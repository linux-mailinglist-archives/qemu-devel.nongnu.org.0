Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0EC373E45
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:16:54 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJGf-0004AV-9p
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1leJEQ-0002l8-74
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1leJDN-0006Cg-UK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620227608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cValEhDJazpNOSPYjnyqU+NZmFAid4VDyaSpUksztoU=;
 b=Ew24A7Ig3osmWG5MgaRbPQkxOtUE9+Cvqf4iBukod4w18ldHsU2m92XQ1OTQ/nwbhRKvhb
 ECeqhteYGWWh3lxQCLDcD0U2XruqoFV8R1vdXYvDM1sEwB4KZyAcN/aZMJNggiHsIi/pcS
 ZNdcb6D5eFQXufOduCIY7MChLPNIVvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-oqxcGtHNNmWyY2CJ7eHBDg-1; Wed, 05 May 2021 11:13:25 -0400
X-MC-Unique: oqxcGtHNNmWyY2CJ7eHBDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D04E69126F
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:13:24 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5920560CD1;
 Wed,  5 May 2021 15:13:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: fix meson 0.58 warning with libvhost-user
 subproject
Date: Wed,  5 May 2021 19:13:12 +0400
Message-Id: <20210505151313.203258-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Meson now checks that subprojects do not access files from parent
project. While we all agree this is best practice, libvhost-user also
want to share a few headers with QEMU, and libvhost-user isn't really a
standalone project at this point (although this is making the dependency
a bit more explicit).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 subprojects/libvhost-user/include/atomic.h       | 1 +
 subprojects/libvhost-user/libvhost-user.c        | 2 +-
 subprojects/libvhost-user/meson.build            | 6 +-----
 subprojects/libvhost-user/standard-headers/linux | 1 +
 4 files changed, 4 insertions(+), 6 deletions(-)
 create mode 120000 subprojects/libvhost-user/include/atomic.h
 create mode 120000 subprojects/libvhost-user/standard-headers/linux

diff --git a/subprojects/libvhost-user/include/atomic.h b/subprojects/libvhost-user/include/atomic.h
new file mode 120000
index 0000000000..8c2be64f7b
--- /dev/null
+++ b/subprojects/libvhost-user/include/atomic.h
@@ -0,0 +1 @@
+../../../include/qemu/atomic.h
\ No newline at end of file
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..2971ba0112 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -40,7 +40,7 @@
 
 #endif
 
-#include "qemu/atomic.h"
+#include "include/atomic.h"
 
 #include "libvhost-user.h"
 
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index b03446e7cd..39825d9404 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -4,21 +4,17 @@ project('libvhost-user', 'c',
 
 threads = dependency('threads')
 glib = dependency('glib-2.0')
-inc = include_directories('../../include', '../../linux-headers')
 
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
-                            include_directories: inc,
                             dependencies: threads,
                             c_args: '-D_GNU_SOURCE')
 
 executable('link-test', files('link-test.c'),
-           link_whole: vhost_user,
-           include_directories: inc)
+           link_whole: vhost_user)
 
 vhost_user_glib = static_library('vhost-user-glib',
                                  files('libvhost-user-glib.c'),
-                                 include_directories: inc,
                                  link_with: vhost_user,
                                  dependencies: glib)
 
diff --git a/subprojects/libvhost-user/standard-headers/linux b/subprojects/libvhost-user/standard-headers/linux
new file mode 120000
index 0000000000..15a2378139
--- /dev/null
+++ b/subprojects/libvhost-user/standard-headers/linux
@@ -0,0 +1 @@
+../../../include/standard-headers/linux
\ No newline at end of file
-- 
2.29.0


