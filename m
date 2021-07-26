Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A463D5EC2
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:54:48 +0200 (CEST)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82wI-00063Q-J9
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uX-0003fF-Bt
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m82uU-0002rg-7S
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627314772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5papoyz4CHjmdx2Nco/7wq0YEH55m69dpuZXVIZkCDg=;
 b=VVvqMk9qYKmylTTErxzmeWrlFNjrKmWRulj1JXRS9yfra94cYBaGqPDyPCljGVX84yK3Ml
 aH3Dp2TloPJRDXGu+Aml7yRbOhUC1WBbt8OxrwppM12KaHi82p6hfVdrHwkuwAx7Ccjr/R
 KQuZrAktxCu0k/35f8Or0FYh8eWCSuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-sCixxFGGNX-bFrqAJAQ9qQ-1; Mon, 26 Jul 2021 11:52:49 -0400
X-MC-Unique: sCixxFGGNX-bFrqAJAQ9qQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8056100E422;
 Mon, 26 Jul 2021 15:52:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E96645D9D3;
 Mon, 26 Jul 2021 15:52:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 715471800843; Mon, 26 Jul 2021 17:52:35 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] nsis.py: create dlldir automatically
Date: Mon, 26 Jul 2021 17:52:33 +0200
Message-Id: <20210726155235.2249878-2-kraxel@redhat.com>
In-Reply-To: <20210726155235.2249878-1-kraxel@redhat.com>
References: <20210726155235.2249878-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use objdump do figure which dlls are needed.  Copy them to a temporary
dlldir and pass that directory to makensis.

This patch removes the need to manually copy dlls to $srcdir/dll/w{32,64}
to get functional windows installers via "make installer".

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/nsis.py | 27 +++++++++++++++++++++++----
 meson.build     |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 5135a0583167..5a3cc7c09628 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -7,6 +7,7 @@
 import argparse
 import glob
 import os
+import sys
 import shutil
 import subprocess
 import tempfile
@@ -19,16 +20,35 @@ def signcode(path):
     subprocess.run([cmd, path])
 
 
+def copydlls(binary, srcdir, dstdir):
+    cmdline = [ "objdump", "-p", binary ]
+    result = subprocess.run(cmdline, stdout = subprocess.PIPE,
+                            universal_newlines = True)
+    if result.returncode != 0:
+        sys.exit(result.returncode)
+    for line in result.stdout.split('\n'):
+        if line.find('DLL Name') != -1:
+            dll = line.split()[2]
+            src = os.path.join(srcdir, dll)
+            dst = os.path.join(dstdir, dll)
+            if os.path.isfile(src) and not os.path.isfile(dst):
+                print("nsis.py: copy " + src)
+                shutil.copyfile(src, dst)
+                copydlls(src, srcdir, dstdir)
+
+
 def main():
     parser = argparse.ArgumentParser(description="QEMU NSIS build helper.")
     parser.add_argument("outfile")
     parser.add_argument("prefix")
     parser.add_argument("srcdir")
     parser.add_argument("cpu")
+    parser.add_argument("dllsrc")
     parser.add_argument("nsisargs", nargs="*")
     args = parser.parse_args()
 
     destdir = tempfile.mkdtemp()
+    dlldir = tempfile.mkdtemp()
     try:
         subprocess.run(["make", "install", "DESTDIR=" + destdir + os.path.sep])
         with open(
@@ -52,6 +72,7 @@ def main():
 
         for exe in glob.glob(os.path.join(destdir + args.prefix, "*.exe")):
             signcode(exe)
+            copydlls(exe, args.dllsrc, dlldir)
 
         makensis = [
             "makensis",
@@ -59,19 +80,17 @@ def main():
             "-NOCD",
             "-DSRCDIR=" + args.srcdir,
             "-DBINDIR=" + destdir + args.prefix,
+            "-DDLLDIR=" + dlldir,
         ]
-        dlldir = "w32"
         if args.cpu == "x86_64":
-            dlldir = "w64"
             makensis += ["-DW64"]
-        if os.path.exists(os.path.join(args.srcdir, "dll")):
-            makensis += ["-DDLLDIR={0}/dll/{1}".format(args.srcdir, dlldir)]
 
         makensis += ["-DOUTFILE=" + args.outfile] + args.nsisargs
         subprocess.run(makensis)
         signcode(args.outfile)
     finally:
         shutil.rmtree(destdir)
+        shutil.rmtree(dlldir)
 
 
 if __name__ == "__main__":
diff --git a/meson.build b/meson.build
index f2e148eaf98e..4a2d54fbae3f 100644
--- a/meson.build
+++ b/meson.build
@@ -2790,6 +2790,7 @@ if host_machine.system() == 'windows'
     get_option('prefix'),
     meson.current_source_dir(),
     host_machine.cpu(),
+    config_host['QEMU_GA_MSI_MINGW_DLL_PATH'],
     '--',
     '-DDISPLAYVERSION=' + meson.project_version(),
   ]
-- 
2.31.1


