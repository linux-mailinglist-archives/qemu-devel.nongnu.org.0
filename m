Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96609255EB9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 18:25:00 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhBT-00071P-Ll
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 12:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kBh9o-0004l8-4p
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:23:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kBh9m-0006Dg-EB
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:23:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id q93so748370pjq.0
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZiMRoeF7G/b98wNi88YNT8vTFSa3RHCtmDHzAQmKfM=;
 b=pJAcD7hTKZmGQQ4R3+/Hzaz+ZDWND0yPxS8jaRVsiQUNBHh1HJ/uIDF+qe1GVVZlxT
 Uzy9qDdRWX48WN5rQPG76MvL67JKYhBDen3JUI1ZQRNESbugmxLA1OVIkpMj4/eMxPPs
 BZzmRuA7Xxc/mSMfpwahhhlwo6+Z88RHVEjaZE7JtEN6CoE2gQXZPhYcsz2FFaXOAVkV
 PziRUvKnxMfHr6fE6U/sO0Mny2nS4pmVUwSeoNawUeBFO3T73FCRdY6MqSZv/pGeF5dU
 rUairXUV4TvhRFG9krUIT3x9TuDiXGXvV/5QVCbcMT1uMEQyRUaNPgKdsBKfH2r3AsiA
 JFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZiMRoeF7G/b98wNi88YNT8vTFSa3RHCtmDHzAQmKfM=;
 b=C1SGMOzSTqc0N0xphwrKFPF9ioCucRAOSNKr3q/XmZg1le6ea4/U6IgUjqT3U5ecxq
 2ymEml7TWx/UZQv+5TZ5CBaRnvtVh5/+AvLykcpKV2kncQP0jm97XilhaOjwa9Xs0TOZ
 PmnM5F6wpNu+Y46pfziR0zZH3v4K/rImwFe1vekNNLxSAC3RUXetTZZBjXUGAXqzk/b5
 iWYPnyaTMiyH3w+pwH2RH5/gzOyzKIAEZ9pBXCBGSJiyBWAHXEpR3BQawumzuGPNCdA/
 68dvMOOVa6b9w1N/LPvb4yDPSF0ysjAGHnPoBIQ5iOMrEn76SBky1j2EHPuVucUpCpVS
 0p3Q==
X-Gm-Message-State: AOAM5332emKmtQ4qzY7lksY3QvnTe4+qk3T6Y9P0H3heuXJdOvCnU+EZ
 WdayDS//GhtlY2CMpI9eTeDXEuIUHDlURHa7
X-Google-Smtp-Source: ABdhPJy+94rw29BwrPkZm7T5zGG+jYw1TCRLzgvSQjjglErHMiWyNXXYSz/wRbE6wI4v1Rb/ETto+w==
X-Received: by 2002:a17:90a:5282:: with SMTP id
 w2mr2048704pjh.77.1598631791757; 
 Fri, 28 Aug 2020 09:23:11 -0700 (PDT)
Received: from localhost.localdomain ([2401:c080:1c01:4fe:5400:2ff:fef1:b056])
 by smtp.googlemail.com with ESMTPSA id
 v8sm1629324pju.1.2020.08.28.09.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 09:23:11 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: Convert undefsym.sh to undefsym.py
Date: Sat, 29 Aug 2020 00:22:45 +0800
Message-Id: <20200828162246.423-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200828162246.423-1-luoyonggang@gmail.com>
References: <20200828162246.423-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

undefsym.sh are not msys2 compatible, convert it to python script

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build         |  2 +-
 scripts/undefsym.py | 57 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/undefsym.sh | 20 ----------------
 3 files changed, 58 insertions(+), 21 deletions(-)
 create mode 100644 scripts/undefsym.py
 delete mode 100755 scripts/undefsym.sh

diff --git a/meson.build b/meson.build
index 74f8ea0c2e..9d8419bf82 100644
--- a/meson.build
+++ b/meson.build
@@ -859,7 +859,7 @@ foreach d, list : modules
 endforeach
 
 nm = find_program('nm')
-undefsym = find_program('scripts/undefsym.sh')
+undefsym = find_program('scripts/undefsym.py')
 block_syms = custom_target('block.syms', output: 'block.syms',
                              input: [libqemuutil, block_mods],
                              capture: true,
diff --git a/scripts/undefsym.py b/scripts/undefsym.py
new file mode 100644
index 0000000000..c690f88c7a
--- /dev/null
+++ b/scripts/undefsym.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+# -*- coding: utf-8 -*-
+
+# Before a shared module's DSO is produced, a static library is built for it
+# and passed to this script.  The script generates -Wl,-u options to force
+# the inclusion of symbol from libqemuutil.a if the shared modules need them,
+# This is necessary because the modules may use functions not needed by the
+# executable itself, which would cause the function to not be linked in.
+# Then the DSO loading would fail because of the missing symbol.
+
+
+"""
+Compare the static library with the shared module for compute the symbol duplication
+"""
+
+import sys
+import subprocess
+
+def filter_lines_set(stdout, is_static = True):
+    linesSet = set()
+    for line in stdout.splitlines():
+        tokens = line.split(b' ')
+        if len(tokens) >= 1:
+            if len(tokens) > 1:
+                if is_static and tokens[1] == b'U':
+                    continue
+                if not is_static and tokens[1] != b'U':
+                    continue
+            new_line = b'-Wl,-u,' + tokens[0]
+            if not new_line in linesSet:
+                linesSet.add(new_line)
+    return linesSet
+
+def main(args):
+    if len(args) <= 3:
+        sys.exit(0)
+
+    nm = args[1]
+    staticlib = args[2]
+    pc = subprocess.run([nm, "-P", "-g", staticlib], stdout=subprocess.PIPE)
+    if pc.returncode != 0:
+        sys.exit(-1)
+    lines_set_left = filter_lines_set(pc.stdout)
+
+    shared_modules = args[3:]
+    pc = subprocess.run([nm, "-P", "-g"] + shared_modules, stdout=subprocess.PIPE)
+    if pc.returncode != 0:
+        sys.exit(-1)
+    lines_set_right = filter_lines_set(pc.stdout, False)
+    lines = []
+    for line in sorted(list(lines_set_right)):
+        if line in lines_set_left:
+            lines.append(line)
+    sys.stdout.write(b'\n'.join(lines).decode())
+
+if __name__ == "__main__":
+    main(sys.argv)
diff --git a/scripts/undefsym.sh b/scripts/undefsym.sh
deleted file mode 100755
index b9ec332e95..0000000000
--- a/scripts/undefsym.sh
+++ /dev/null
@@ -1,20 +0,0 @@
-#! /usr/bin/env bash
-
-# Before a shared module's DSO is produced, a static library is built for it
-# and passed to this script.  The script generates -Wl,-u options to force
-# the inclusion of symbol from libqemuutil.a if the shared modules need them,
-# This is necessary because the modules may use functions not needed by the
-# executable itself, which would cause the function to not be linked in.
-# Then the DSO loading would fail because of the missing symbol.
-
-if test $# -le 2; then
-  exit 0
-fi
-
-NM=$1
-staticlib=$2
-shift 2
-# Find symbols defined in static libraries and undefined in shared modules
-comm -12 \
-  <( $NM -P -g $staticlib | awk '$2!="U"{print "-Wl,-u," $1}' | sort -u) \
-  <( $NM -P -g "$@" | awk '$2=="U"{print "-Wl,-u," $1}' | sort -u)
-- 
2.27.0.windows.1


