Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564D25335A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 17:17:27 +0200 (CEST)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAxAz-0003nk-Vv
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 11:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAx72-0008AN-Jq
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:13:20 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kAx6x-00040O-L5
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 11:13:20 -0400
Received: by mail-pl1-x62e.google.com with SMTP id k13so1034343plk.13
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0MHaD6z1pFAFDf/EBlzuj/2Fpp3Ey6jqJZfY5kTLTeE=;
 b=buxL7o2gl2rq1DrzBrFoWhNVe6jsUr5bTGprR8+VbdW/q7UNjQNzwJrVAbcvYJ2/2c
 mhp9+87j8/5DKsv2dlEOH+UnWJzmIjuKq7k9kzuvG2xKbe69GPe+MEbx47lFbA8RRprx
 Ebmd2aZoQ5c2umLoRGV8H+D0u2dbN83hilcnoa1doEoH5WB2g5IXjjJDeqUccIsvT7Fj
 pgQcjADV7n1kTzhrB0aH4cTU72mEu/iY4RWjLp8PTUwBBbo71+aJg6usWTlwX7de8gze
 0Lw8xp4OFaOGFYd9EQ0SBZn43PUg1lscjGmekzWD4wOMLYOCkt8O+jpBxJB69MAImMZJ
 jRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0MHaD6z1pFAFDf/EBlzuj/2Fpp3Ey6jqJZfY5kTLTeE=;
 b=JsDuajdCtFSkW9uU7nisoEhRMr9H2LXTuIjhuWNrxGKG5rsA3sSAl2ax3NNBRr+M++
 Ts//LfxdS50llyHSgQEaMSxnVzARAx8Yz1c90r/mNu6ePIkAm9J4MMJia4k7Fpb1aNiU
 lFDL1tb05/EYWw7iUAcG6QTf4U7o3rq8mVwRLNrV5BleZRlrf3FCtYjYCDK6m4bXyvLu
 PYva+A+FwU/ttOAFrEodl5HEKG9b8hecX4Y4F72lx5HeZUdABKZJImVP0PBnKdCAt2tN
 HM5gF0fyq0Z59eFtmMwRsPdT//gdtB3LzhwcJ55vp/l5q8ZWuCw8u4DluLa38rVwRmni
 BkAg==
X-Gm-Message-State: AOAM5335DsBUFIMxwBY6bzMLM6Td+NTdQLAJ6PuV3ShlvL2rxjow4Niw
 qw7ok/A8wOgCMuGXdff0DfJJOkEMk7ox1reI
X-Google-Smtp-Source: ABdhPJytdbx54KPrz4yfPZP9CRm8X6ZpVXgP+X2YUedrI1cUPqHWv33iI4O9pk70yxZWKZicJzzu8g==
X-Received: by 2002:a17:902:bb87:: with SMTP id
 m7mr12211235pls.61.1598454793119; 
 Wed, 26 Aug 2020 08:13:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:c080:1c01:4fe:5400:2ff:fef1:b056])
 by smtp.googlemail.com with ESMTPSA id
 27sm2423169pgk.89.2020.08.26.08.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 08:13:12 -0700 (PDT)
From: luoyonggang@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] meson: Convert undefsym.sh to undefsym.py
Date: Wed, 26 Aug 2020 23:10:06 +0800
Message-Id: <20200826151006.80-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200826151006.80-1-luoyonggang@gmail.com>
References: <20200826151006.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

undefsym.sh are not msys2 compatible, convert it to python script

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build         |  2 +-
 scripts/undefsym.py | 56 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/undefsym.sh | 20 ----------------
 3 files changed, 57 insertions(+), 21 deletions(-)
 create mode 100644 scripts/undefsym.py
 delete mode 100755 scripts/undefsym.sh

diff --git a/meson.build b/meson.build
index 1644bbd83c..d6e3bcea7e 100644
--- a/meson.build
+++ b/meson.build
@@ -845,7 +845,7 @@ foreach d, list : modules
 endforeach
 
 nm = find_program('nm')
-undefsym = find_program('scripts/undefsym.sh')
+undefsym = find_program('scripts/undefsym.py')
 block_syms = custom_target('block.syms', output: 'block.syms',
                              input: [libqemuutil, block_mods],
                              capture: true,
diff --git a/scripts/undefsym.py b/scripts/undefsym.py
new file mode 100644
index 0000000000..ebc009fb24
--- /dev/null
+++ b/scripts/undefsym.py
@@ -0,0 +1,56 @@
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
+Compare the static library for compute the symbol duplication
+"""
+
+import sys
+import subprocess
+
+def filter_lines_set(stdout):
+    linesSet = set()
+    for line in stdout.splitlines():
+        tokens = line.split(b' ')
+        if len(tokens) >= 1:
+            if len(tokens) > 1 and tokens[1] == b'U':
+                continue
+            new_line = b'-Wl,-u,' + tokens[0]
+            if not new_line in linesSet:
+                linesSet.add(new_line)
+    return linesSet
+
+def main(args):
+    global _SCRIPT
+    print(" ".join(args),  file=sys.stderr)
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
+    lines_set_right = filter_lines_set(pc.stdout)
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


