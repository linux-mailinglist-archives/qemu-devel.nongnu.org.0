Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F391C6642FE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 15:18:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFEf0-0001M8-HR; Tue, 10 Jan 2023 08:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEey-0001Ll-2Z
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFEew-0003c9-G9
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 08:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673357241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3H8baV6Uq1G8HQpiusdI7vVdULkB5AdxSfg8CdFen0=;
 b=B0FZ7bTAtbVMbyk6DscI6uDhmbZQ0abr8zejlNfVyHWgk+GnCC6b+eAVq5O3TkQDUlDxtm
 pGb0hOfxG1J8Dn3BZKmc0NjExtKX8S7I3u+RmJxo0lnPeHAOXP02CpoKGea5QHo8Al+cNJ
 PHwj+CI4a7yMAFXvPnFbptm7/1QmmIk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-Np7-RQktOE-gEOniHQLrvQ-1; Tue, 10 Jan 2023 08:27:18 -0500
X-MC-Unique: Np7-RQktOE-gEOniHQLrvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14D7B3C0CD47;
 Tue, 10 Jan 2023 13:27:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354E5140EBF4;
 Tue, 10 Jan 2023 13:27:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, kraxel@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 pbonzini@redhat.com, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, thuth@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>, Michael Roth <michael.roth@amd.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ed Maste <emaste@freebsd.org>
Subject: [PATCH v4 1/8] build-sys: fix crlf-ending C code
Date: Tue, 10 Jan 2023 17:26:53 +0400
Message-Id: <20230110132700.833690-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230110132700.833690-1-marcandre.lureau@redhat.com>
References: <20230110132700.833690-1-marcandre.lureau@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On msys2, the shader-to-C script produces bad C:
./ui/shader/texture-blit-vert.h:2:5: error: missing terminating " character [-Werror]

Fix it by changing the line ending from crlf to lf, and convert the
script to Python (qemu build seems perl-free after that).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 meson.build              |  2 +-
 scripts/shaderinclude.pl | 16 ----------------
 scripts/shaderinclude.py | 26 ++++++++++++++++++++++++++
 3 files changed, 27 insertions(+), 17 deletions(-)
 delete mode 100644 scripts/shaderinclude.pl
 create mode 100644 scripts/shaderinclude.py

diff --git a/meson.build b/meson.build
index 175517eafd..b3c6db8343 100644
--- a/meson.build
+++ b/meson.build
@@ -2781,7 +2781,7 @@ config_host_data.set('CONFIG_SLIRP', slirp.found())
 genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 
 hxtool = find_program('scripts/hxtool')
-shaderinclude = find_program('scripts/shaderinclude.pl')
+shaderinclude = find_program('scripts/shaderinclude.py')
 qapi_gen = find_program('scripts/qapi-gen.py')
 qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
                      meson.current_source_dir() / 'scripts/qapi/commands.py',
diff --git a/scripts/shaderinclude.pl b/scripts/shaderinclude.pl
deleted file mode 100644
index cd3bb40b12..0000000000
--- a/scripts/shaderinclude.pl
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/usr/bin/env perl
-use strict;
-use warnings;
-
-my $file = shift;
-open FILE, "<", $file or die "open $file: $!";
-my $name = $file;
-$name =~ s|.*/||;
-$name =~ s/[-.]/_/g;
-print "static GLchar ${name}_src[] =\n";
-while (<FILE>) {
-    chomp;
-    printf "    \"%s\\n\"\n", $_;
-}
-print "    \"\\n\";\n";
-close FILE;
diff --git a/scripts/shaderinclude.py b/scripts/shaderinclude.py
new file mode 100644
index 0000000000..ab2aade2cd
--- /dev/null
+++ b/scripts/shaderinclude.py
@@ -0,0 +1,26 @@
+#!/usr/bin/env python3
+#
+# Copyright (C) 2023 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import sys
+import os
+
+
+def main(args):
+    file_path = args[1]
+    basename = os.path.basename(file_path)
+    varname = basename.replace('-', '_').replace('.', '_')
+
+    with os.fdopen(sys.stdout.fileno(), "wt", closefd=False, newline='\n') as stdout:
+        with open(file_path, "r", encoding='utf-8') as file:
+            print(f'static GLchar {varname}_src[] =', file=stdout)
+            for line in file:
+                line = line.rstrip()
+                print(f'    "{line}\\n"', file=stdout)
+            print('    "\\n";', file=stdout)
+
+
+if __name__ == '__main__':
+    sys.exit(main(sys.argv))
-- 
2.39.0


