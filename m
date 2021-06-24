Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC23B2CC1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:46:19 +0200 (CEST)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMsE-0005Qz-Lh
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlR-0006oP-7o
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlM-0006bi-VU
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CzOIxD65y19koasVPSSkxnX2ji9OGc3vbKbbCFjB1g=;
 b=RoBgsPadIOTpwojr9nZPAxqAnJsBxop7wTz9sUnvMrGShezhErCWKsgdlLV1lHzR3vDCVJ
 JuGrTZEWGU6zoU0OrTaHFkYAcialSt1dnK43tBHFiwoJVkziCM6ak/3N8vD0MwZB2Q/b3Z
 i/SqBElSDpFPjCetwDoL1UxowAgDxM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-4PHS5DFyPDm0sp4xlTDHww-1; Thu, 24 Jun 2021 06:39:09 -0400
X-MC-Unique: 4PHS5DFyPDm0sp4xlTDHww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3564F804140;
 Thu, 24 Jun 2021 10:39:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E1941009962;
 Thu, 24 Jun 2021 10:38:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE55518007A1; Thu, 24 Jun 2021 12:38:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/34] modules: collect module meta-data
Date: Thu, 24 Jun 2021 12:38:04 +0200
Message-Id: <20210624103836.2382472-3-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add script to collect the module meta-data from the source code,
store the results in *.modinfo files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/modinfo-collect.py | 67 ++++++++++++++++++++++++++++++++++++++
 meson.build                | 16 +++++++++
 2 files changed, 83 insertions(+)
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
index d8a92666fbcd..30ca06c6c2d4 100644
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
@@ -2034,6 +2037,19 @@ foreach d, list : modules
       else
         softmmu_mods += sl
       endif
+      if module_ss.sources() != []
+        # FIXME: Should use sl.extract_all_objects(recursive: true) as
+        # input. Sources can be used multiple times but objects are
+        # unique when it comes to lookup in compile_commands.json.
+        # Depnds on a mesion version with
+        # https://github.com/mesonbuild/meson/pull/8900
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


