Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE23C15E6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:24:34 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VtB-000658-GG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmp-0008Vk-Ki
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vml-00089P-JY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:17:57 -0400
Received: by mail-ej1-x62e.google.com with SMTP id b2so10269055ejg.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GW8GDqEW0MB1VWp13Ta+BoF0VS+4/kxC0ZAJIRx+5/8=;
 b=jXEYW1kJkXxnvZo7ySO41R7JtEaxkLPDNgeP+ONL6VwJow7uLeAtydkeYmaO25aYi7
 HpzIifeTRPtGMwfA2JdQon+LCdoPCzpcU1BR+HAqw/BcUZ4X+aaqDLGcyOPJSHJB18td
 L8iPp9L+VQk5HVfGBMHKtdI+ay8aB2tIZP8Lv7WRB1fstA7nuwOAjnWTFZZH+5R/pYes
 dEkrHIRdp/5L59aHhU2ubWXoRSNOqrX2IhaEHmJEr78JdDN/yWJoF9MHB8WB6bMyyOB+
 JN/7+2wYZd0o6iNZ/aWYM+3+oZDp3S/zYhTrAaBqqrqA2wRJD5qfkytHq+FLNlO38+tP
 sRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GW8GDqEW0MB1VWp13Ta+BoF0VS+4/kxC0ZAJIRx+5/8=;
 b=OTQLgqRUNtkID3I2HGn+j0jYF2y/goUbVqyJqitMD4Zr5ONy6A6fX8SXfpC4epIj4K
 LvF998j+cBF5Rxly2YCjN7DtyPAaIBa34xVJw3en5+zxRY1PQsmtBB5ZkJ4HRbZVtCYM
 3njGrX8Z7CpdJC5Im9+oCGBM7S/JCpE4gz60zGuU3LizszDT/GS4i8tkxt41B0t1yAgK
 5BVWogOz4Mn+aa5GXZxL08l6tYCNqxCUj8DjlEX738m+bDdYNza/TTvmNkgJP3v6sklW
 Qkqb1gT0NggslT3OGATDhM9F4hx6APuLeq35iyoFvt6tnd7WgcOC9AqFF2D761/wJ4Y/
 79yw==
X-Gm-Message-State: AOAM531gpeN6UkQA0MNVmi6aNw++Tz4Jj8Ww4F9N6eahy99wIaYiIHTW
 N7o9sg+5YPWVfbSlrXH0aDCsvUajA/0=
X-Google-Smtp-Source: ABdhPJxq3ZTHO73cP6y+Kx+Z1MqUlToj2xxykDDgNPdeOKR/555ajkuUc2bKNlL2Wt7vNaEnOd6wSg==
X-Received: by 2002:a17:906:3a53:: with SMTP id
 a19mr31558645ejf.88.1625757474116; 
 Thu, 08 Jul 2021 08:17:54 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:17:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/48] modules: collect module meta-data
Date: Thu,  8 Jul 2021 17:17:06 +0200
Message-Id: <20210708151748.408754-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Add script to collect the module meta-data from the source code,
store the results in *.modinfo files.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-3-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                | 16 +++++++++
 scripts/modinfo-collect.py | 67 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 scripts/modinfo-collect.py

diff --git a/meson.build b/meson.build
index 9cd966a86b..ff580f1f80 100644
--- a/meson.build
+++ b/meson.build
@@ -2241,6 +2241,9 @@ subdir('tests/qtest/fuzz')
 # Library dependencies #
 ########################
 
+modinfo_collect = find_program('scripts/modinfo-collect.py')
+modinfo_files = []
+
 block_mods = []
 softmmu_mods = []
 foreach d, list : modules
@@ -2254,6 +2257,19 @@ foreach d, list : modules
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
diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
new file mode 100755
index 0000000000..4acb188c3e
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
-- 
2.31.1



