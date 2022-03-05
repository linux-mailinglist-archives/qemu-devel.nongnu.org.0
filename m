Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A44CE453
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 12:00:57 +0100 (CET)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQS9g-0000oE-9w
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 06:00:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6g-00045s-Sg
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:50 -0500
Received: from [2a00:1450:4864:20::333] (port=36749
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQS6f-0002Qp-6c
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:57:50 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r64-20020a1c4443000000b003898fc06f1eso28893wma.1
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUX9V0ZBEbQk4Ir+TZBJ/F4T0+S7tCpReG3Qi8NpDVg=;
 b=Pn8ePUqV0cbmn1wpDyBxyC4C4xwuXTsjs3WnQMKknRNiUtHLxOgAxtWEEqtc8mhImE
 E0b3QhPJU/XHlfIXDHHwwWyRPzw6bD750VVHBKNmsiAJiq/2jfrVUf9Yu32gv2b39y75
 /fT0caxTsXq7x3Yi1mK/fzJVkm9wiLo9sxXUwuxfzacLYDt8M21VehC2qg4edehcM8OO
 zxAHc93H8B/YfOLpd0aKsKhHBRmIHp0UzNZRjGFssDxgaAuPPX6O3hD22emPZSqr+NN/
 C3BwTiwHBMp3p155FTx6JGQjrYZQ/dOdnRHkuH7u0tEOOXtIKmfL1cWJNriSBGF8Jy4i
 Z73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUX9V0ZBEbQk4Ir+TZBJ/F4T0+S7tCpReG3Qi8NpDVg=;
 b=GUkL49DzxoUPhh7D4Sghvyd8r/OX7r3qqMYRhP11V4GvyBy8rdZi0qhS4DYAkMwPzc
 w7F8TOnaWVCckSP2TEIPggGGqV5fpq0F0ukXshvjOD7+eehM33Vrvw70HVPhyAB9l2/W
 cxpz4SDG9zTKglE5dxMM6LKzMDdIj56alVVAu6CTQQ+4slME9Av6Xfnw1bU42g3ARvSP
 jQkdKfD9m5+WHxlsOwAf5GMbcoUTaM2E9lUm6gTDSSt2mD7dkhXvMTqsutVzvmRQddWV
 2C7NzH8smzQAcnmicWLtyBJqTex6bfDfbFeoVvCn05oJMA7TsW9f7ZV3CqPz0mY0acI9
 tD9g==
X-Gm-Message-State: AOAM5307511YYKG5bGmJrRQYpIwyr1bxTyLnhsTdDOUCb2UUZWzTV2g1
 3/hep45E4jpQ7yGKDojGD+8tMtwAD+2jZQ==
X-Google-Smtp-Source: ABdhPJw24MyLwK6Nd8Raokx4X8UA6aAURllFsgyOWF0MW833o20qS7RJj7FTjRkJIAi/b7UAe+gQ6Q==
X-Received: by 2002:a05:600c:190c:b0:389:8f94:fcac with SMTP id
 j12-20020a05600c190c00b003898f94fcacmr2023482wmq.27.1646477867859; 
 Sat, 05 Mar 2022 02:57:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm24079324wmq.0.2022.03.05.02.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 02:57:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] nsis installer: Fix mouse-over descriptions for emulators
Date: Sat,  5 Mar 2022 10:57:43 +0000
Message-Id: <20220305105743.2384766-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220305105743.2384766-1-peter.maydell@linaro.org>
References: <20220305105743.2384766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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
---
I opted to put the logic into the Python script, which I think
many QEMU contributors understand, rather than investigating
whether NSIS installer script magic might for instance allow
us to write out only one file rather than two, since I think
very few of us understand the NSIS installer...
---
 qemu.nsi        |  5 +----
 scripts/nsis.py | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/qemu.nsi b/qemu.nsi
index a44d2be32a2..aa93adee396 100644
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


