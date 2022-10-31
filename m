Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C25613253
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQsJ-0004Zh-A6; Mon, 31 Oct 2022 05:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsG-0004Z0-Vb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:28 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsF-0000Gx-GJ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:28 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 4E40BDA10FC;
 Mon, 31 Oct 2022 10:14:26 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 4ABE146001C; Mon, 31 Oct 2022 10:14:26 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 2/4] scripts/nsis.py: Fix destination directory name when
 invoked on Windows
Date: Mon, 31 Oct 2022 10:14:04 +0100
Message-Id: <20221031091406.382872-3-sw@weilnetz.de>
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

"make installer" on Windows fails with the following message:

  Traceback (most recent call last):
    File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 89, in <module>
      main()
    File "G:\msys64\home\foo\git\qemu\scripts\nsis.py", line 34, in main
      with open(
  OSError: [Errno 22] Invalid argument:
  'R:/Temp/tmpw83xhjquG:/msys64/qemu/system-emulations.nsh'
  ninja: build stopped: subcommand failed.

Use os.path.splitdrive() to form a canonical path without the drive
letter on Windows. This works with cross-build on Linux too.

Fixes: 8adfeba953e0 ("meson: add NSIS building")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220908132817.1831008-3-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/nsis.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index bbb41d9386..baa6ef9594 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -28,16 +28,18 @@ def main():
     parser.add_argument("nsisargs", nargs="*")
     args = parser.parse_args()
 
+    # canonicalize the Windows native prefix path
+    prefix = os.path.splitdrive(args.prefix)[1]
     destdir = tempfile.mkdtemp()
     try:
         subprocess.run(["make", "install", "DESTDIR=" + destdir])
         with open(
-            os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
+            os.path.join(destdir + prefix, "system-emulations.nsh"), "w"
         ) as nsh, open(
-            os.path.join(destdir + args.prefix, "system-mui-text.nsh"), "w"
+            os.path.join(destdir + prefix, "system-mui-text.nsh"), "w"
         ) as muinsh:
             for exe in sorted(glob.glob(
-                os.path.join(destdir + args.prefix, "qemu-system-*.exe")
+                os.path.join(destdir + prefix, "qemu-system-*.exe")
             )):
                 exe = os.path.basename(exe)
                 arch = exe[12:-4]
@@ -61,7 +63,7 @@ def main():
                 !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
                 """.format(arch, desc))
 
-        for exe in glob.glob(os.path.join(destdir + args.prefix, "*.exe")):
+        for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
         makensis = [
@@ -69,7 +71,7 @@ def main():
             "-V2",
             "-NOCD",
             "-DSRCDIR=" + args.srcdir,
-            "-DBINDIR=" + destdir + args.prefix,
+            "-DBINDIR=" + destdir + prefix,
         ]
         dlldir = "w32"
         if args.cpu == "x86_64":
-- 
2.30.2


