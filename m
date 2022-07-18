Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F60578849
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:25:06 +0200 (CEST)
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUUP-00021L-Nx
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDUQC-0005gX-VT
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDUQ8-0001Sr-9z
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 13:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658164835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/DT+yts5ND7sEUSkV7VfF3dJVYZ0K5T2G8XQXQrA54s=;
 b=PKmT8VipPQsmL4FZfTtLViu6EHVo0RvH7YT6MwOGkpjIb5mMe8en2b5pA5E+ldxcA7fAd0
 X+k4K5fKH/+osWm4TnmSwIalnYKv1uedRGAYJDE4rJXb8sDo0IQaZjMDQ9kywEJcf4aRfx
 d+SnkVY4zOhC+sSKXv5SNmGpKB5zR/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-strUONQfOF-msXd08p6glg-1; Mon, 18 Jul 2022 13:20:32 -0400
X-MC-Unique: strUONQfOF-msXd08p6glg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC4838037A9;
 Mon, 18 Jul 2022 17:20:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3AA141511A;
 Mon, 18 Jul 2022 17:20:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>
Subject: [PATCH] util: Fix broken build on Haiku
Date: Mon, 18 Jul 2022 19:20:26 +0200
Message-Id: <20220718172026.139004-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

A recent commit moved some Haiku-specific code parts from oslib-posix.c
to cutils.c, but failed to move the corresponding header #include
statement, too, so "make vm-build-haiku.x86_64" is currently broken.
Fix it by moving the header #include, too.

Fixes: 06680b15b4 ("include: move qemu_*_exec_dir() to cutils")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 util/cutils.c      | 4 ++++
 util/oslib-posix.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index 8199dac598..cb43dda213 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -35,6 +35,10 @@
 #include <sys/sysctl.h>
 #endif
 
+#ifdef __HAIKU__
+#include <kernel/image.h>
+#endif
+
 #ifdef G_OS_WIN32
 #include <pathcch.h>
 #include <wchar.h>
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 7a34c1657c..bffec18869 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -62,10 +62,6 @@
 #include <mach-o/dyld.h>
 #endif
 
-#ifdef __HAIKU__
-#include <kernel/image.h>
-#endif
-
 #include "qemu/mmap-alloc.h"
 
 #ifdef CONFIG_DEBUG_STACK_USAGE
-- 
2.31.1


