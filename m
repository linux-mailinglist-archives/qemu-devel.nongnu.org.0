Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22425559CAE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:54:36 +0200 (CEST)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4khf-0006QD-82
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4keO-00026R-Pb
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:51:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4keB-0000UH-CB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:51:12 -0400
Received: by mail-pg1-x534.google.com with SMTP id z14so2685974pgh.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZxV1SEFunQRfbR/PL6z95zEwXT2C6YF01HBBqKImZI=;
 b=Cphkaid9NC35b/NdFV/tA0le8dKfGzImG8wUVGKfAVxDS/MVPMKReDAj7tgBRg65CM
 k7UaV/XJMO3TBhYTB35aSktfIJHVb6QqWgdXhVXxonIsrSnfS63NRwbwIH6eZPy2TO8f
 Cf3l77V7GPFBS4BgeEbYCBo00rTTXCjVr/SRxVTq64B4fcK4c+wJoiSRGXCbynn+vguW
 b5YHMyBEobe+YKbuCnGmRgRBeGzsQxiiCHqIhrhvxhfDN90eSlsUbyaVE80nVMp9sDwc
 7BnkR47/IEVvahMyBnNRwwmzsCgs0oRb5qCL2TZi6ELflntrz8TId1zQsDw4yhU4lgAY
 Wwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZxV1SEFunQRfbR/PL6z95zEwXT2C6YF01HBBqKImZI=;
 b=WHlGHf9rjzfIribWpDgREldzwqczTd2nt9Yy4Owy9Fvxj3FUyx5oKPquOnKdsHe438
 XGMydertZCYFjeQ9RzgkjffR1QNll7j/Wia550MvqrQHPI+1ZphaaVGaPZJIuXihIG8e
 KrM79AYSAmrZTGe9TbxZYwhE+Ap1rJ/IJKQPB3UTd3rD+FqsWA66keQcnkHrahvwJfi4
 itWw2prVMmjWCLHKsJKHFICDGF00ftbnyMOaVIrMqfP4XGy5ycWLjTWVojGp3eeySWGR
 dktVaUD4u2xOZnyGS9QgBMC0D5OiQX1w3DizffBphLEIjJAksKFw0zTgefTEsoUgxSZx
 ndhw==
X-Gm-Message-State: AJIora8WCTj2Yh7x87gHPUjxgPL6Qo+QqeuGc9RmP3/9VgHp7jg7jnDM
 dBZJUMkt/mu9/GBG/Q/ZgTc=
X-Google-Smtp-Source: AGRyM1v6uKE60QnUpJoTc7Wen7zoEtmLK1iCeUtrFoPzZIEdKm+QB4hEgSqSB3e0JyHQTz9r41xV6w==
X-Received: by 2002:a05:6a00:b8b:b0:51b:eefc:7fd2 with SMTP id
 g11-20020a056a000b8b00b0051beefc7fd2mr46810680pfj.74.1656082257345; 
 Fri, 24 Jun 2022 07:50:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b001690a7df347sm1921125plo.96.2022.06.24.07.50.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 07:50:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v8 2/4] cutils: Introduce bundle mechanism
Date: Fri, 24 Jun 2022 23:50:37 +0900
Message-Id: <20220624145039.49929-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220624145039.49929-1-akihiko.odaki@gmail.com>
References: <20220624145039.49929-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files in the installation
tree. The build tree will have a new directory, qemu-bundle, to
represent what files the installation tree would have for reference by
the executables.

Note that it abandons compatibility with Windows older than 8. The
extended support for the prior version, 7 ended more than 2 years ago,
and it is unlikely that someone would like to run the latest QEMU on
such an old system.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/build-platforms.rst  |  2 +-
 include/qemu/cutils.h           | 18 +++++++--
 meson.build                     |  4 ++
 scripts/symlink-install-tree.py | 37 ++++++++++++++++++
 util/cutils.c                   | 68 +++++++++++++++++++++++----------
 util/meson.build                |  1 +
 6 files changed, 105 insertions(+), 25 deletions(-)
 create mode 100755 scripts/symlink-install-tree.py

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 1958edb4305..ebde20f9815 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -88,7 +88,7 @@ Windows
 
 The project aims to support the two most recent versions of Windows that are
 still supported by the vendor. The minimum Windows API that is currently
-targeted is "Windows 7", so theoretically the QEMU binaries can still be run
+targeted is "Windows 8", so theoretically the QEMU binaries can still be run
 on older versions of Windows, too. However, such old versions of Windows are
 not tested anymore, so it is recommended to use one of the latest versions of
 Windows instead.
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index d3e532b64c8..92c436d8c70 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -224,9 +224,21 @@ const char *qemu_get_exec_dir(void);
  * @dir: the directory (typically a `CONFIG_*DIR` variable) to be relocated.
  *
  * Returns a path for @dir that uses the directory of the running executable
- * as the prefix.  For example, if `bindir` is `/usr/bin` and @dir is
- * `/usr/share/qemu`, the function will append `../share/qemu` to the
- * directory that contains the running executable and return the result.
+ * as the prefix.
+ *
+ * When a directory named `qemu-bundle` exists in the directory of the running
+ * executable, the path to the directory will be prepended to @dir. For
+ * example, if the directory of the running executable is `/qemu/build` @dir
+ * is `/usr/share/qemu`, the result will be
+ * `/qemu/build/qemu-bundle/usr/share/qemu`. The directory is expected to exist
+ * in the build tree.
+ *
+ * Otherwise, the directory of the running executable will be used as the
+ * prefix and it appends the relative path from `bindir` to @dir. For example,
+ * if the directory of the running executable is `/opt/qemu/bin`, `bindir` is
+ * `/usr/bin` and @dir is `/usr/share/qemu`, the result will be
+ * `/opt/qemu/bin/../share/qemu`.
+ *
  * The returned string should be freed by the caller.
  */
 char *get_relocated_path(const char *dir);
diff --git a/meson.build b/meson.build
index 9efcb175d16..c49f5ebfc37 100644
--- a/meson.build
+++ b/meson.build
@@ -7,6 +7,8 @@ add_test_setup('quick', exclude_suites: ['slow', 'thorough'], is_default: true)
 add_test_setup('slow', exclude_suites: ['thorough'], env: ['G_TEST_SLOW=1', 'SPEED=slow'])
 add_test_setup('thorough', env: ['G_TEST_SLOW=1', 'SPEED=thorough'])
 
+meson.add_postconf_script('scripts/symlink-install-tree.py')
+
 not_found = dependency('', required: false)
 keyval = import('keyval')
 ss = import('sourceset')
@@ -356,10 +358,12 @@ nvmm =not_found
 hvf = not_found
 midl = not_found
 widl = not_found
+pathcch = not_found
 host_dsosuf = '.so'
 if targetos == 'windows'
   midl = find_program('midl', required: false)
   widl = find_program('widl', required: false)
+  pathcch = cc.find_library('pathcch')
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
 
diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
new file mode 100755
index 00000000000..f35aa176404
--- /dev/null
+++ b/scripts/symlink-install-tree.py
@@ -0,0 +1,37 @@
+#!/usr/bin/env python3
+
+from pathlib import Path
+import errno
+import json
+import os
+import subprocess
+import sys
+
+def destdir_join(d1: str, d2: str) -> str:
+    if not d1:
+        return d2
+    d2_path = Path(d2)
+    d2_parts = d2_path.parts
+    # c:\destdir + c:\prefix must produce c:\destdir\prefix
+    if d2_path.drive or d2_path.root:
+        d2_parts = d2_parts[1:]
+    return str(Path(d1, *d2_parts))
+
+introspect = os.environ.get('MESONINTROSPECT')
+out = subprocess.run([*introspect.split(' '), '--installed'],
+                     stdout=subprocess.PIPE, check=True).stdout
+for source, dest in json.loads(out).items():
+    assert os.path.isabs(source)
+    bundle_dest = destdir_join('qemu-bundle', dest)
+    path = os.path.dirname(bundle_dest)
+    try:
+        os.makedirs(path, exist_ok=True)
+    except BaseException as e:
+        print(f'error making directory {path}', file=sys.stderr)
+        raise e
+    try:
+        os.symlink(source, bundle_dest)
+    except BaseException as e:
+        if not isinstance(e, OSError) or e.errno != errno.EEXIST:
+            print(f'error making symbolic link {dest}', file=sys.stderr)
+            raise e
diff --git a/util/cutils.c b/util/cutils.c
index 6d04e52907b..8199dac5988 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -35,6 +35,11 @@
 #include <sys/sysctl.h>
 #endif
 
+#ifdef G_OS_WIN32
+#include <pathcch.h>
+#include <wchar.h>
+#endif
+
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
@@ -1074,31 +1079,52 @@ char *get_relocated_path(const char *dir)
 
     /* Fail if qemu_init_exec_dir was not called.  */
     assert(exec_dir[0]);
-    if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
-        return g_strdup(dir);
-    }
 
     result = g_string_new(exec_dir);
+    g_string_append(result, "/qemu-bundle");
+    if (access(result->str, R_OK) == 0) {
+#ifdef G_OS_WIN32
+        size_t size = mbsrtowcs(NULL, &dir, 0, &(mbstate_t){0}) + 1;
+        PWSTR wdir = g_new(WCHAR, size);
+        mbsrtowcs(wdir, &dir, size, &(mbstate_t){0});
+
+        PCWSTR wdir_skipped_root;
+        PathCchSkipRoot(wdir, &wdir_skipped_root);
+
+        size = wcsrtombs(NULL, &wdir_skipped_root, 0, &(mbstate_t){0});
+        char *cursor = result->str + result->len;
+        g_string_set_size(result, result->len + size);
+        wcsrtombs(cursor, &wdir_skipped_root, size + 1, &(mbstate_t){0});
+        g_free(wdir);
+#else
+        g_string_append(result, dir);
+#endif
+    } else if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
+        g_string_assign(result, dir);
+    } else {
+        g_string_assign(result, exec_dir);
+
+        /* Advance over common components.  */
+        len_dir = len_bindir = prefix_len;
+        do {
+            dir += len_dir;
+            bindir += len_bindir;
+            dir = next_component(dir, &len_dir);
+            bindir = next_component(bindir, &len_bindir);
+        } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
+
+        /* Ascend from bindir to the common prefix with dir.  */
+        while (len_bindir) {
+            bindir += len_bindir;
+            g_string_append(result, "/..");
+            bindir = next_component(bindir, &len_bindir);
+        }
 
-    /* Advance over common components.  */
-    len_dir = len_bindir = prefix_len;
-    do {
-        dir += len_dir;
-        bindir += len_bindir;
-        dir = next_component(dir, &len_dir);
-        bindir = next_component(bindir, &len_bindir);
-    } while (len_dir && len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
-
-    /* Ascend from bindir to the common prefix with dir.  */
-    while (len_bindir) {
-        bindir += len_bindir;
-        g_string_append(result, "/..");
-        bindir = next_component(bindir, &len_bindir);
+        if (*dir) {
+            assert(G_IS_DIR_SEPARATOR(dir[-1]));
+            g_string_append(result, dir - 1);
+        }
     }
 
-    if (*dir) {
-        assert(G_IS_DIR_SEPARATOR(dir[-1]));
-        g_string_append(result, dir - 1);
-    }
     return g_string_free(result, false);
 }
diff --git a/util/meson.build b/util/meson.build
index 8f16018cd43..6cacb8689f1 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -23,6 +23,7 @@ util_ss.add(when: 'CONFIG_WIN32', if_true: files('event_notifier-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('oslib-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: files('qemu-thread-win32.c'))
 util_ss.add(when: 'CONFIG_WIN32', if_true: winmm)
+util_ss.add(when: 'CONFIG_WIN32', if_true: pathcch)
 util_ss.add(files('envlist.c', 'path.c', 'module.c'))
 util_ss.add(files('host-utils.c'))
 util_ss.add(files('bitmap.c', 'bitops.c'))
-- 
2.32.1 (Apple Git-133)


