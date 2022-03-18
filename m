Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9814DDA8C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:28:56 +0100 (CET)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCf1-0005z4-JY
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:28:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZd-0006OW-Ei
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:21 -0400
Received: from [2a00:1450:4864:20::42c] (port=33497
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZb-0002BV-Pq
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q8so375463wrc.0
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sSwzNR8+SBA1DuRsakelB2z3vFtjsN8XSEy4XqrJuZ4=;
 b=lv5LmJKA6u4hyC7hFn0WCX6BN9RWXetBLt8ekcga9ryOBaRofiFiIZcfvW5FDcDxrR
 CZUojRA7wUoXnwk5zFpu4YwyVLvqdffd7dOAb1JG9WorESKcFoN3CT8Ex3hKy/s8o5+I
 KLpfgWnt9wMXc0c0+8Lg/p4hleX/UUASF2ZxnLsqHFFMj22w1QJkl/HYb8d6epXW8bY2
 ub7TnQnfsdD8XdiYNbzowN7Bmnw+9YkX06316LBUtulC7racMO3Ko6L0JHzXi575LyqG
 PfYiDKiNGd9reghvwc38qj4lr+RWsMm+XwLhkuxLAlNqFOcvZwAjNQu6M5T86j3xEntC
 j8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSwzNR8+SBA1DuRsakelB2z3vFtjsN8XSEy4XqrJuZ4=;
 b=U3/wSZNxVtd7yYmPVROlAHJDi8f8/RrLut2fc1+oOLbowT4nZbdE30MT8RhS3xeJPE
 Q4CmXLf7haNkkzrk1uiS0xsR8+FSftSuV9IyghbEGxv0Y1FlJ1IP1BpwdQiPJBF/wpCk
 +0ZtMCoZGtSRsE0leKWTg8+kuzgju1YSuTb9L2kX3cFZ+Wa929N2PZquopRoDd0JCPpp
 1hdAG+V7aIbJV7jNGkU20nAdisOb5nQS63BCsCVWptdlFF0wB5ywYCFjEFoT97WPom0W
 WWcLeFGM3WDPCqiVcL0nD8RYLuFj2jn2+bqj27uifbnE4Vmc40d2y563571wAPFpQAlt
 syXA==
X-Gm-Message-State: AOAM532kd0RzzkL33yVGafh4Ww7m8cliUbYKIAeBvux4o7sNFSD+c+sz
 l1lf7NWj3igVuxUdkqbcGCmVQa5GFpoIPQ==
X-Google-Smtp-Source: ABdhPJxpqu517y0iWjTjP3vbAL2YyAr6Y4Np64ui/6iisXFfuc1ppsucPM9ZueB2jH/mwCPr1wcOAA==
X-Received: by 2002:a05:6000:15c2:b0:203:8348:8cbf with SMTP id
 y2-20020a05600015c200b0020383488cbfmr8068112wry.309.1647609798459; 
 Fri, 18 Mar 2022 06:23:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] nsis installer: Fix mouse-over descriptions for emulators
Date: Fri, 18 Mar 2022 13:22:53 +0000
Message-Id: <20220318132306.3254960-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We use the nsis.py script to write out an installer script Section
for each emulator executable, so the exact set of Sections depends on
which executables were built.  However the part of qemu.nsi which
specifies mouse-over descriptions for each Section still has a
hard-coded and very outdated list (with just i386 and alpha).  This
causes two problems.  Firstly, if you build the installer for a
configuration where you didn't build the i386 binaries you get
warnings like this:
  warning 6000: unknown variable/constant "{Section_i386}" detected, ignoring (macro:_==:1)
  warning 6000: unknown variable/constant "{Section_i386w}" detected, ignoring (macro:_==:1)
(this happens in our gitlab CI jobs, for instance).
Secondly, most of the emulators in the generated installer don't have
any mouseover text.

Make nsis.py generate a second output file which has the necessary
MUI_DESCRIPTION_TEXT lines for each Section it creates, so we can
include that at the right point in qemu.nsi to set the mouse-over
text.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20220305105743.2384766-4-peter.maydell@linaro.org
---
 qemu.nsi        |  5 +----
 scripts/nsis.py | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/qemu.nsi b/qemu.nsi
index 6edd82b385d..564d617d11f 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -228,10 +228,7 @@ SectionEnd
 ; Descriptions (mouse-over).
 !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
     !insertmacro MUI_DESCRIPTION_TEXT ${SectionSystem}  "System emulation."
-    !insertmacro MUI_DESCRIPTION_TEXT ${Section_alpha}  "Alpha system emulation."
-    !insertmacro MUI_DESCRIPTION_TEXT ${Section_alphaw} "Alpha system emulation (GUI)."
-    !insertmacro MUI_DESCRIPTION_TEXT ${Section_i386}   "PC i386 system emulation."
-    !insertmacro MUI_DESCRIPTION_TEXT ${Section_i386w}  "PC i386 system emulation (GUI)."
+!include "${BINDIR}\system-mui-text.nsh"
     !insertmacro MUI_DESCRIPTION_TEXT ${SectionTools} "Tools."
 !ifdef DLLDIR
     !insertmacro MUI_DESCRIPTION_TEXT ${SectionDll}   "Runtime Libraries (DLL)."
diff --git a/scripts/nsis.py b/scripts/nsis.py
index 383bef70332..462d6cac3b6 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -33,7 +33,9 @@ def main():
         subprocess.run(["make", "install", "DESTDIR=" + destdir + os.path.sep])
         with open(
             os.path.join(destdir + args.prefix, "system-emulations.nsh"), "w"
-        ) as nsh:
+        ) as nsh, open(
+            os.path.join(destdir + args.prefix, "system-mui-text.nsh"), "w"
+        ) as muinsh:
             for exe in sorted(glob.glob(
                 os.path.join(destdir + args.prefix, "qemu-system-*.exe")
             )):
@@ -49,6 +51,15 @@ def main():
                         arch, exe
                     )
                 )
+                if arch.endswith('w'):
+                    desc = arch[:-1] + " emulation (GUI)."
+                else:
+                    desc = arch + " emulation."
+
+                muinsh.write(
+                    """
+                !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
+                """.format(arch, desc))
 
         for exe in glob.glob(os.path.join(destdir + args.prefix, "*.exe")):
             signcode(exe)
-- 
2.25.1


