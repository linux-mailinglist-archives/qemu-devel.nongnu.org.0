Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD9E5B1F54
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:36:44 +0200 (CEST)
Received: from localhost ([::1]:39654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHhz-0006PH-OV
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa6-0004Wz-PG
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:35 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:47038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa4-0002bH-CX
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:33 -0400
Received: by mail-pf1-x432.google.com with SMTP id c198so8050920pfc.13
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=f6QlqcK7maFhzyN9eWoUNYZ/AucGHK6lcA3QFGZvpf0=;
 b=DEpyf22yRYcdcIMrb0bl1MeQRE98wb8UNN8haZzNDY2UTQ0GEAT2NNpzdMT4QRvwDF
 3etTTs3RFWF4ugmxp6JsQ8jeTGqRfgAVD9DSwNxRfedbJoFxmB2Gj31zwRG+c17PMXMx
 BbcBx8YZIRM5lRF948ZLQTsL9HBmc+NuB8CRGetG1gWWX7st9jwnwpACPEdLP48NlLxl
 UptZW0IdQWQayxoBvnPi8eXPf5g/CqIHLlb8movKKodQKqei1DwP6hURwDKg82rvzy0i
 pa7V/WjA8SRzP6vozXQapp8C8/0oZPy191EilAG6zbkJkjjCM9F2pYhkve9xcfWN2+e6
 OO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f6QlqcK7maFhzyN9eWoUNYZ/AucGHK6lcA3QFGZvpf0=;
 b=7qz4GrUQjwapeKbj0kp57AHtr6V8nD9aoJPCJW9Wg4uorLJfVPUhCBBBreEfcQ2Clq
 V9DOyaM9ZPY07yD/9AYK5/kfY6K/S5DShMlrpzHlZJn9bsYCls644YxMB6Z4HBqr+syE
 pMA2V8SE94bqiTG+GwrrgEl5WFGNR2gLxGZv4tbSZ1HgwiJHGw6sevhQV3i6Ol10fCb3
 mNBRqQY/4D3AFvjR8nWwoeKpQ2BClfiqQND0Gg9YpESeweJLVeQeJSBUWuT6Sb7pfGAt
 xwZySaoyWq6ifRfYmSlZjdro1uXSPj66GDJ2QRjqWOO4RiHQF5PVfD9mnTbh+fTrqWsd
 2/2g==
X-Gm-Message-State: ACgBeo0zKXUIKV+udV6/Et5Sgs7Yrgf8PH6DKpNCAZndTwK1ZkS1ysJx
 fJdqgZx3R2WR3xe1yUlhbCzr3+CoVFI=
X-Google-Smtp-Source: AA6agR4lpL6OagoODDKP+xYuwuvdZ7yApasZ1AQTHNNVrXwatXa+5Q5Tb9CfOfyO2+Xt+zI57wDOKg==
X-Received: by 2002:a63:3115:0:b0:434:fe5b:adf with SMTP id
 x21-20020a633115000000b00434fe5b0adfmr5911838pgx.3.1662643710456; 
 Thu, 08 Sep 2022 06:28:30 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 3/7] scripts/nsis.py: Automatically package required DLLs of
 QEMU executables
Date: Thu,  8 Sep 2022 21:28:13 +0800
Message-Id: <20220908132817.1831008-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

At present packaging the required DLLs of QEMU executables is a
manual process, and error prone.

Actually build/config-host.mak contains a GLIB_BINDIR variable
which is the directory where glib and other DLLs reside. This
works for both Windows native build and cross-build on Linux.
We can use it as the search directory for DLLs and automate
the whole DLL packaging process.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 meson.build     |  1 +
 scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index c2adb7caf4..4c03850f9f 100644
--- a/meson.build
+++ b/meson.build
@@ -3657,6 +3657,7 @@ if host_machine.system() == 'windows'
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
2.34.1


