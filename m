Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024223E216
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 21:25:17 +0200 (CEST)
Received: from localhost ([::1]:39428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3lVs-0003e3-W7
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 15:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lO0-00048O-Lt
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50383
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lNy-0006PU-HY
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:17:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=z3G/MI8928RPYx88f49ktkffkdJptjveZyHWfa3stAg=;
 b=GDgT8YBXo4dMR07NcrL+TihsB/QBxM776YnLQEDOpxfUcUlmsmWL9/6JSIMvlYmeq+7aDs
 bG3xjcHvj4CFzOaS9tAQ2+zFmA9Jeu909niRABoxRFBrbLpegOuTx5hhwvjYZ2LRtWPybO
 HRYyX8EXm+wPY5LH0wrPccN6twkkZko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-a5A1tEvNOrCTFJL7gZEOlw-1; Thu, 06 Aug 2020 15:17:02 -0400
X-MC-Unique: a5A1tEvNOrCTFJL7gZEOlw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC1719200C2
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:01 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3069E5F9DC
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:17:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 019/143] meson: add sparse support
Date: Thu,  6 Aug 2020 21:14:15 +0200
Message-Id: <1596741379-12902-20-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not use cgcc; instead, extract compilation commands from compile_commands.json
and invoke sparse directly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                |  1 +
 configure               |  8 ++------
 meson.build             |  7 +++++++
 scripts/check_sparse.py | 25 +++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 scripts/check_sparse.py

diff --git a/Makefile b/Makefile
index 18f6aa7..9a75047 100644
--- a/Makefile
+++ b/Makefile
@@ -1245,6 +1245,7 @@ endif
 	$(call print-help,install,Install QEMU, documentation and tools)
 	$(call print-help,ctags/TAGS,Generate tags file for editors)
 	$(call print-help,cscope,Generate cscope index)
+	$(call print-help,sparse,Run sparse on the QEMU source)
 	@echo  ''
 	@$(if $(TARGET_DIRS), \
 		echo 'Architecture specific targets:'; \
diff --git a/configure b/configure
index bdd35d2..6ee1359 100755
--- a/configure
+++ b/configure
@@ -2986,7 +2986,7 @@ fi
 ##########################################
 # Sparse probe
 if test "$sparse" != "no" ; then
-  if has cgcc; then
+  if has sparse; then
     sparse=yes
   else
     if test "$sparse" = "yes" ; then
@@ -7777,11 +7777,7 @@ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_INCLUDES=$QEMU_INCLUDES" >> $config_host_mak
 if test "$sparse" = "yes" ; then
-  echo "CC           := REAL_CC=\"\$(CC)\" cgcc"       >> $config_host_mak
-  echo "CPP          := REAL_CC=\"\$(CPP)\" cgcc"      >> $config_host_mak
-  echo "CXX          := REAL_CC=\"\$(CXX)\" cgcc"      >> $config_host_mak
-  echo "HOST_CC      := REAL_CC=\"\$(HOST_CC)\" cgcc"  >> $config_host_mak
-  echo "QEMU_CFLAGS  += -Wbitwise -Wno-transparent-union -Wno-old-initializer -Wno-non-pointer-null" >> $config_host_mak
+  echo "SPARSE_CFLAGS = -Wbitwise -Wno-transparent-union -Wno-old-initializer -Wno-non-pointer-null" >> $config_host_mak
 fi
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LDFLAGS_NOPIE=$LDFLAGS_NOPIE" >> $config_host_mak
diff --git a/meson.build b/meson.build
index ed61853..9749c3d 100644
--- a/meson.build
+++ b/meson.build
@@ -17,6 +17,13 @@ add_project_arguments(config_host['QEMU_INCLUDES'].split(),
 
 python = import('python').find_installation(config_host['PYTHON'].split()[0])
 
+if 'SPARSE_CFLAGS' in config_host
+  run_target('sparse',
+             command: [find_program('scripts/check_sparse.py'),
+                       config_host['SPARSE_CFLAGS'].split(),
+                       'compile_commands.json'])
+endif
+
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false)
 endif
diff --git a/scripts/check_sparse.py b/scripts/check_sparse.py
new file mode 100644
index 0000000..0de7aa5
--- /dev/null
+++ b/scripts/check_sparse.py
@@ -0,0 +1,25 @@
+#! /usr/bin/env python3
+
+# Invoke sparse based on the contents of compile_commands.json
+
+import json
+import subprocess
+import sys
+import shlex
+
+def extract_cflags(shcmd):
+    cflags = shlex.split(shcmd)
+    return [x for x in cflags
+            if x.startswith('-D') or x.startswith('-I') or x.startswith('-W')
+               or x.startswith('-std=')]
+
+cflags = sys.argv[1:-1]
+with open(sys.argv[-1], 'r') as fd:
+    compile_commands = json.load(fd)
+
+for cmd in compile_commands:
+    cmd = ['sparse'] + cflags + extract_cflags(cmd['command']) + [cmd['file']]
+    print(' '.join((shlex.quote(x) for x in cmd)))
+    r = subprocess.run(cmd)
+    if r.returncode != 0:
+        sys.exit(r.returncode)
-- 
1.8.3.1



