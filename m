Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4605364E0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:47:38 +0200 (CEST)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucBd-0007nE-1z
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0f-0000PN-Gt
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:18 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0c-0002PB-VG
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id jx22so9411759ejb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlFf5+cAO5/IMX6mjeJdfBCz2OpTu8g+EZZGQA1K/6E=;
 b=Zu7KqvAnZGuk88o0oSEZMrNwHh5u9TnDxRAM+J82xZMZCckMvBLuQ23S69b0D1tewS
 Z810rBMMmlp+cBotjusj5YIi+eNf2rq9NTSddBLUEC78aTFQDNFnGXoRZbcbWbwkm1pF
 LSQ/w58xm8oRGmJ0QRgHLDKIZMI4oaK6fl1y0lvnY9l4IRryQWwBxsR4CLzgu1cKjB3B
 auI9KuOS+WdmrzQJr5m/HEQRWOePrMxeOXv22/DRw8WOxVUOJ955+qiZeaVYzy4x+X1n
 O0Lrkqt7NDSFqSugHMu5CA6DjIWD/pze9W6BqjLHXrjHpL3+MN4e9vJd/qTSdRvOUCN6
 KjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlFf5+cAO5/IMX6mjeJdfBCz2OpTu8g+EZZGQA1K/6E=;
 b=iV0Uwz1ClRlYo2n++EEv5zKAWHW1tFcqLkaIwi9whMapfhk3pCS4eJ9jGcjaChC6S9
 t8sXdTceIS52DW4ZHggeDzvorPFATrxL4SYq7Sru5uob2v50PvbQJDN+/3USr1CAGrlc
 pQPJozP/TKR6d2lpzXEVyxx6UA3eVwCXfHi7MsRcCUe9Mko5FSM2V8ZKCZ4uuHc036sq
 tkzhiSFRpX1Ddn34PlGgmWP6sIcHvP4SlZae61JuHQQwdCCquzR3m6rKOl9R8DBIHXtm
 /Ij7u12pKaokUrzasH/FgOEWQUACLaf5mXn2jCIPkoR1gKo4U2ZkAHQvnyqvgDnDv1mD
 jYqw==
X-Gm-Message-State: AOAM5329HWe3/1aJERP9o06ViOAhrS3nPxfonWxsE3BB9txGenJfEvFg
 NK65vd+Fdz2iX5USWiP+V7v3Cg==
X-Google-Smtp-Source: ABdhPJwkP2jZLVIBq6QTYkZdHhEgliVHVXWdu+wWm36sru2IY0zI1+GsEKk+8F4N/p776EXJGHFW4w==
X-Received: by 2002:a17:906:99c2:b0:6f4:a99c:8dfc with SMTP id
 s2-20020a17090699c200b006f4a99c8dfcmr42074310ejn.386.1653665774224; 
 Fri, 27 May 2022 08:36:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a50aad9000000b0042bda1327ddsm2216304edc.73.2022.05.27.08.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 189F91FFBD;
 Fri, 27 May 2022 16:36:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 05/33] tests/lcitool: fix up indentation to correct style
Date: Fri, 27 May 2022 16:35:35 +0100
Message-Id: <20220527153603.887929-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

3 space indentation snuck into the initial commit. Clean it up before
we let it get established. I've also:

  - removed unused os import
  - added double lines between functions
  - added some comments and grouped and sorted the generation stanzas

My lint tool is also recommending using f-strings but that requires
python 3.6.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/lcitool/refresh | 134 ++++++++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 58 deletions(-)

diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index fb49bbc441..dc1fc21ef9 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -13,14 +13,13 @@
 # the top-level directory.
 
 import sys
-import os
 import subprocess
 
 from pathlib import Path
 
 if len(sys.argv) != 1:
-   print("syntax: %s" % sys.argv[0], file=sys.stderr)
-   sys.exit(1)
+    print("syntax: %s" % sys.argv[0], file=sys.stderr)
+    sys.exit(1)
 
 self_dir = Path(__file__).parent
 src_dir = self_dir.parent.parent
@@ -30,76 +29,95 @@ lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
 
 lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
 
+
 def atomic_write(filename, content):
-   tmp = filename.with_suffix(filename.suffix + ".tmp")
-   try:
-      with tmp.open("w") as fp:
-         print(content, file=fp, end="")
-         tmp.rename(filename)
-   except Exception as ex:
-      tmp.unlink()
-      raise
+    tmp = filename.with_suffix(filename.suffix + ".tmp")
+    try:
+        with tmp.open("w") as fp:
+            print(content, file=fp, end="")
+            tmp.rename(filename)
+    except Exception as ex:
+        tmp.unlink()
+        raise
+
 
 def generate(filename, cmd, trailer):
-   print("Generate %s" % filename)
-   lcitool=subprocess.run(cmd, capture_output=True)
+    print("Generate %s" % filename)
+    lcitool = subprocess.run(cmd, capture_output=True)
 
-   if lcitool.returncode != 0:
-      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+    if lcitool.returncode != 0:
+        raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+    content = lcitool.stdout.decode("utf8")
+    if trailer is not None:
+        content += trailer
+    atomic_write(filename, content)
 
-   content = lcitool.stdout.decode("utf8")
-   if trailer is not None:
-      content += trailer
-   atomic_write(filename, content)
 
 def generate_dockerfile(host, target, cross=None, trailer=None):
-   filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
-   cmd = lcitool_cmd + ["dockerfile"]
-   if cross is not None:
-      cmd.extend(["--cross", cross])
-   cmd.extend([target, "qemu"])
-   generate(filename, cmd, trailer)
+    filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
+    cmd = lcitool_cmd + ["dockerfile"]
+    if cross is not None:
+        cmd.extend(["--cross", cross])
+    cmd.extend([target, "qemu"])
+    generate(filename, cmd, trailer)
+
 
 def generate_cirrus(target, trailer=None):
-   filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
-   cmd = lcitool_cmd + ["variables", target, "qemu"]
-   generate(filename, cmd, trailer)
+    filename = Path(src_dir, ".gitlab-ci.d", "cirrus", target + ".vars")
+    cmd = lcitool_cmd + ["variables", target, "qemu"]
+    generate(filename, cmd, trailer)
+
 
 ubuntu2004_tsanhack = [
-   "# Apply patch https://reviews.llvm.org/D75820\n",
-   "# This is required for TSan in clang-10 to compile with QEMU.\n",
-   "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
+    "# Apply patch https://reviews.llvm.org/D75820\n",
+    "# This is required for TSan in clang-10 to compile with QEMU.\n",
+    "RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h\n"
 ]
 
+
 def debian_cross_build(prefix, targets):
-   conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
-   targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
-   return "".join([conf, targets])
+    conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
+    targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
+    return "".join([conf, targets])
 
+#
+# Update all the various build configurations.
+# Please keep each group sorted alphabetically for easy reading.
+#
 
 try:
-   generate_dockerfile("centos8", "centos-stream-8")
-   generate_dockerfile("fedora", "fedora-35")
-   generate_dockerfile("ubuntu2004", "ubuntu-2004",
-                       trailer="".join(ubuntu2004_tsanhack))
-   generate_dockerfile("opensuse-leap", "opensuse-leap-152")
-   generate_dockerfile("alpine", "alpine-edge")
-
-   generate_dockerfile("debian-arm64-cross", "debian-11",
-                       cross="aarch64",
-                       trailer=debian_cross_build("aarch64-linux-gnu-",
-                                                  "aarch64-softmmu,aarch64-linux-user"))
-
-   generate_dockerfile("debian-s390x-cross", "debian-11",
-                       cross="s390x",
-                       trailer=debian_cross_build("s390x-linux-gnu-",
-                                                  "s390x-softmmu,s390x-linux-user"))
-
-   generate_cirrus("freebsd-12")
-   generate_cirrus("freebsd-13")
-   generate_cirrus("macos-11")
-
-   sys.exit(0)
+    #
+    # Standard native builds
+    #
+    generate_dockerfile("alpine", "alpine-edge")
+    generate_dockerfile("centos8", "centos-stream-8")
+    generate_dockerfile("fedora", "fedora-35")
+    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
+    generate_dockerfile("ubuntu2004", "ubuntu-2004",
+                        trailer="".join(ubuntu2004_tsanhack))
+
+    #
+    # Cross compiling builds
+    #
+    generate_dockerfile("debian-arm64-cross", "debian-11",
+                        cross="aarch64",
+                        trailer=debian_cross_build("aarch64-linux-gnu-",
+                                                   "aarch64-softmmu,aarch64-linux-user"))
+
+    generate_dockerfile("debian-s390x-cross", "debian-11",
+                        cross="s390x",
+                        trailer=debian_cross_build("s390x-linux-gnu-",
+                                                   "s390x-softmmu,s390x-linux-user"))
+
+    #
+    # Cirrus packages lists for GitLab
+    #
+    generate_cirrus("freebsd-12")
+    generate_cirrus("freebsd-13")
+    generate_cirrus("macos-11")
+
+    sys.exit(0)
 except Exception as ex:
-   print(str(ex), file=sys.stderr)
-   sys.exit(1)
+    print(str(ex), file=sys.stderr)
+    sys.exit(1)
-- 
2.30.2


