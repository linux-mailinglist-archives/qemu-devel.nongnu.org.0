Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C3613255
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:15:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQsR-0004b1-DP; Mon, 31 Oct 2022 05:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsO-0004aB-Rb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:36 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsH-0000HF-MD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:36 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 7CBDEDA11CF;
 Mon, 31 Oct 2022 10:14:28 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 781C146001C; Mon, 31 Oct 2022 10:14:28 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 3/4] scripts/nsis.py: Automatically package required DLLs of
 QEMU executables
Date: Mon, 31 Oct 2022 10:14:05 +0100
Message-Id: <20221031091406.382872-4-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031091406.382872-1-sw@weilnetz.de>
References: <20221031091406.382872-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

At present packaging the required DLLs of QEMU executables is a
manual process, and error prone.

Actually build/config-host.mak contains a GLIB_BINDIR variable
which is the directory where glib and other DLLs reside. This
works for both Windows native build and cross-build on Linux.
We can use it as the search directory for DLLs and automate
the whole DLL packaging process.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220908132817.1831008-4-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 meson.build     |  1 +
 scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 37737913df..d0a186e7f5 100644
--- a/meson.build
+++ b/meson.build
@@ -3616,6 +3616,7 @@ if host_machine.system() == 'windows'
     '@OUTPUT@',
     get_option('prefix'),
     meson.current_source_dir(),
+    config_host['GLIB_BINDIR'],
     host_machine.cpu(),
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
diff --git a/scripts/nsis.py b/scripts/nsis.py
index baa6ef9594..03ed7608a2 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -18,12 +18,36 @@ def signcode(path):
         return
     subprocess.run([cmd, path])
 
+def find_deps(exe_or_dll, search_path, analyzed_deps):
+    deps = [exe_or_dll]
+    output = subprocess.check_output(["objdump", "-p", exe_or_dll], text=True)
+    output = output.split("\n")
+    for line in output:
+        if not line.startswith("\tDLL Name: "):
+            continue
+
+        dep = line.split("DLL Name: ")[1].strip()
+        if dep in analyzed_deps:
+            continue
+
+        dll = os.path.join(search_path, dep)
+        if not os.path.exists(dll):
+            # assume it's a Windows provided dll, skip it
+            continue
+
+        analyzed_deps.add(dep)
+        # locate the dll dependencies recursively
+        rdeps = find_deps(dll, search_path, analyzed_deps)
+        deps.extend(rdeps)
+
+    return deps
 
 def main():
     parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
     parser.add_argument("outfile")
     parser.add_argument("prefix")
     parser.add_argument("srcdir")
+    parser.add_argument("dlldir")
     parser.add_argument("cpu")
     parser.add_argument("nsisargs", nargs="*")
     args = parser.parse_args()
@@ -63,9 +87,26 @@ def main():
                 !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
                 """.format(arch, desc))
 
+        search_path = args.dlldir
+        print("Searching '%s' for the dependent dlls ..." % search_path)
+        dlldir = os.path.join(destdir + prefix, "dll")
+        os.mkdir(dlldir)
+
         for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
+            # find all dll dependencies
+            deps = set(find_deps(exe, search_path, set()))
+            deps.remove(exe)
+
+            # copy all dlls to the DLLDIR
+            for dep in deps:
+                dllfile = os.path.join(dlldir, os.path.basename(dep))
+                if (os.path.exists(dllfile)):
+                    continue
+                print("Copying '%s' to '%s'" % (dep, dllfile))
+                shutil.copy(dep, dllfile)
+
         makensis = [
             "makensis",
             "-V2",
@@ -73,12 +114,9 @@ def main():
             "-DSRCDIR=" + args.srcdir,
             "-DBINDIR=" + destdir + prefix,
         ]
-        dlldir = "w32"
         if args.cpu == "x86_64":
-            dlldir = "w64"
             makensis += ["-DW64"]
-        if os.path.exists(os.path.join(args.srcdir, "dll")):
-            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
+        makensis += ["-DDLLDIR=" + dlldir]
 
         makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
         subprocess.run(makensis)
-- 
2.30.2


