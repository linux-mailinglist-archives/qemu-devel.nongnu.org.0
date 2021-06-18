Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2873AC2AA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 06:58:40 +0200 (CEST)
Received: from localhost ([::1]:45030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6aV-0003jU-JR
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 00:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WM-0003RK-Qm
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WK-0003X7-7o
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0Wp5YRWvy+e9AOuNE8Ki93asQ8A+Bl2HfigdF+Qyd4=;
 b=ARbHPnOmptjXb06pp1WGFDlBcJTMgdnsiPU/iUgdsW6dmhUeQXx3f4/bILpyw2axEnvVSf
 nDM9rfnE5v/QzIYwMYclqz4D7Jl1xfDm8cjqITSAId2gSjRna6cOjsVWTqAuHQTwCFrpzJ
 oYurXveVSKKcVIsQgG1TYtcIdxrhdIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-Hk157ZyFMc2tiYsA9czDog-1; Fri, 18 Jun 2021 00:54:16 -0400
X-MC-Unique: Hk157ZyFMc2tiYsA9czDog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37113100A8F1;
 Fri, 18 Jun 2021 04:54:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E1F5D9CC;
 Fri, 18 Jun 2021 04:54:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0BFC618017C9; Fri, 18 Jun 2021 06:53:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/24] modules: collect module meta-data
Date: Fri, 18 Jun 2021 06:53:31 +0200
Message-Id: <20210618045353.2510174-3-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add script to collect the module meta-data from the source code,
store the results in *.modinfo files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/modinfo-collect.py | 67 ++++++++++++++++++++++++++++++++++++++
 meson.build                | 11 +++++++
 2 files changed, 78 insertions(+)
 create mode 100755 scripts/modinfo-collect.py

diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
new file mode 100755
index 000000000000..4acb188c3e89
--- /dev/null
+++ b/scripts/modinfo-collect.py
@@ -0,0 +1,67 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+import os
+import sys
+import json
+import shlex
+import subprocess
+
+def find_command(src, target, compile_commands):
+    for command in compile_commands:
+        if command['file'] != src:
+            continue
+        if target != '' and command['command'].find(target) == -1:
+            continue
+        return command['command']
+    return 'false'
+
+def process_command(src, command):
+    skip = False
+    arg = False
+    out = []
+    for item in shlex.split(command):
+        if arg:
+            out.append(x)
+            arg = False
+            continue
+        if skip:
+            skip = False
+            continue
+        if item == '-MF' or item == '-MQ' or item == '-o':
+            skip = True
+            continue
+        if item == '-c':
+            skip = True
+            continue
+        out.append(item)
+    out.append('-DQEMU_MODINFO')
+    out.append('-E')
+    out.append(src)
+    return out
+
+def main(args):
+    target = ''
+    if args[0] == '--target':
+        args.pop(0)
+        target = args.pop(0)
+        print("MODINFO_DEBUG target %s" % target)
+        arch = target[:-8] # cut '-softmmu'
+        print("MODINFO_START arch \"%s\" MODINFO_END" % arch)
+    with open('compile_commands.json') as f:
+        compile_commands = json.load(f)
+    for src in args:
+        print("MODINFO_DEBUG src %s" % src)
+        command = find_command(src, target, compile_commands)
+        cmdline = process_command(src, command)
+        print("MODINFO_DEBUG cmd", cmdline)
+        result = subprocess.run(cmdline, stdout = subprocess.PIPE,
+                                universal_newlines = True)
+        if result.returncode != 0:
+            sys.exit(result.returncode)
+        for line in result.stdout.split('\n'):
+            if line.find('MODINFO') != -1:
+                print(line)
+
+if __name__ == "__main__":
+    main(sys.argv[1:])
diff --git a/meson.build b/meson.build
index a2311eda6ec5..bb99619257d5 100644
--- a/meson.build
+++ b/meson.build
@@ -2021,6 +2021,9 @@ subdir('tests/qtest/fuzz')
 # Library dependencies #
 ########################
 
+modinfo_collect = find_program('scripts/modinfo-collect.py')
+modinfo_files = []
+
 block_mods = []
 softmmu_mods = []
 foreach d, list : modules
@@ -2034,6 +2037,14 @@ foreach d, list : modules
       else
         softmmu_mods += sl
       endif
+      if module_ss.sources() != []
+        modinfo_files += custom_target(d + '-' + m + '.modinfo',
+                                       output: d + '-' + m + '.modinfo',
+                                       input: module_ss.sources(),
+                                       capture: true,
+                                       build_by_default: true, # to be removed when added to a target
+                                       command: [modinfo_collect, '@INPUT@'])
+      endif
     else
       if d == 'block'
         block_ss.add_all(module_ss)
-- 
2.31.1


