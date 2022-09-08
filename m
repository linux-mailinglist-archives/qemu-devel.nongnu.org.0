Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4D5B1F36
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:32:14 +0200 (CEST)
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHdb-0001kD-O0
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa3-0004TM-Rb
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:32 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa2-0002aX-69
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:31 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b21so4948797plz.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zkVLGjem6wSZCZmhICiJtuczZUPqP8zkVJzeqrMRh7k=;
 b=NELC95h8i/tRnhGiNTjjRNRTfL2jkxAPvhLLxO02FO0ur3cLdAGs8f4O8UzSc9MG8z
 JYMDQlhuG9/NQP2hlW9UK0lUOj9BQ/Otb7a7cjqo/b6PZWCAHLSq24ipLqCm+DFt9mgt
 gJWC1/RQdT1Xh+R5Nsv8T5eMg5uSId6hirp3RsL+DcEz1eOCzfGvqlfftnixoCdD2HVl
 mOMoEF71Yl5RxBpzantMJRSFP2dkTRmAvzXSBEfQMyBi794Lhp5FoISc6Mvj4KCYRPeh
 oShWJBJ/w2is/K5M3Pr7MxQbB6zKfBxXVW1Cxvq83l5wL6l+P5T3LZ2yPMa9aD19qQ89
 jXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zkVLGjem6wSZCZmhICiJtuczZUPqP8zkVJzeqrMRh7k=;
 b=nwQGvZWxDTT+ChsmyCNzGAJplHa/cpYngbU57izpZ6cY5oWqzdeF8ktMwv0+ncG34j
 Qz5UT8EK+cBK2+9HrNebV8+Ety7fABcYnA/8ObZOWhu6wC8d+N07D85F0W18iPAjoNFS
 n0xeKZFrmnSdgAOzw7BVQcSbWvN73kV5JUYSzdFH9wI/sv5laaUxllP05cwdJY1Pppit
 uZPFew4P3K9vKxDqEQrHkKgKeen+fe2t7MJaFcKqY7AsvzXQ5KnAPepeADTYVmdN/w2o
 iC3FFgi4a1eCzo/QNIp3eZ/zrdMZSwADaqgm8A1wsC5xGLRTauqQWUGOqTOLO94HAC+s
 USHA==
X-Gm-Message-State: ACgBeo0N9f689F2+d4yWfyzj1eJwwbEEil7yO5EeE+pY68buysJE6KdU
 EfzlMeAsCtN0ixPP1QlH1YtGVmkbXeo=
X-Google-Smtp-Source: AA6agR4L1z3mTifhI0QgbLaqu2dbwkEIMPePvorNqctY/Vpenz168BSTW91tQQbTzGEMnO4Y+j2btg==
X-Received: by 2002:a17:902:dac2:b0:172:5f2a:f30 with SMTP id
 q2-20020a170902dac200b001725f2a0f30mr8798142plx.167.1662643708027; 
 Thu, 08 Sep 2022 06:28:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 2/7] scripts/nsis.py: Fix destination directory name when
 invoked on Windows
Date: Thu,  8 Sep 2022 21:28:12 +0800
Message-Id: <20220908132817.1831008-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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
2.34.1


