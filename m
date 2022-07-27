Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C072D582E77
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:13:16 +0200 (CEST)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkax-00028t-7y
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk24-0004Gq-5k; Wed, 27 Jul 2022 12:37:13 -0400
Received: from [200.168.210.66] (port=61870 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk22-0007pB-Id; Wed, 27 Jul 2022 12:37:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Jul 2022 13:36:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 22F2F800058;
 Wed, 27 Jul 2022 13:36:39 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Subject: [RFC PATCH 8/8] tests/docker: Selective line reading by python script
Date: Wed, 27 Jul 2022 13:36:32 -0300
Message-Id: <20220727163632.59806-9-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jul 2022 16:36:39.0392 (UTC)
 FILETIME=[0BB59600:01D8A1D7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Building some images failed on ppc64le because the dockerfile tried to
install some packages that are only available in x86 and arm64, to solve
this while still having those packages be available in those architectures
a comment was put before the installation command to instruct the python
script into ignoring those lines for some architectures (in this case
ppc64le)

Overall I'm not a big fan of the way I solved this problem, so I'd like
to know if anyone has a better way to make these dockerfilse work in
PPC64LE.

For context the base images used here are available in PPC64LE but some
of the packages installed are not (in alpine's case it's XEN, which is
only available to x86 and ARM), so this patch create a ignore_list which
is set on a per-architecture basis, and any packages in a dockerfile in
this ignore_list will not be copied to the temporary dockerfile used in
the docker command.

Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
---
 tests/docker/docker.py                 | 15 ++++++++++++---
 tests/docker/dockerfiles/alpine.docker |  2 ++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d0af2861b8..9b962d1c78 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -14,6 +14,7 @@
 import os
 import sys
 import subprocess
+import platform
 import json
 import hashlib
 import atexit
@@ -207,8 +208,15 @@ def _read_qemu_dockerfile(img_name):
 
 def _dockerfile_preprocess(df):
     out = ""
+    ignore_list = []
     for l in df.splitlines():
-        if len(l.strip()) == 0 or l.startswith("#"):
+        if len(l.strip()) == 0:
+            continue
+        if l.startswith("#"):
+            if len(l.split()) >= 3:
+                if l.split()[1] == "ignore":
+                    if platform.processor() in l.split()[2].split(','):
+                        ignore_list += l.split()[3].split(',')
             continue
         from_pref = "FROM qemu/"
         if l.startswith(from_pref):
@@ -219,7 +227,8 @@ def _dockerfile_preprocess(df):
             inlining = _read_qemu_dockerfile(l[len(from_pref):])
             out += _dockerfile_preprocess(inlining)
             continue
-        out += l + "\n"
+        if not any(x in l.split() for x in ignore_list):
+            out += l + "\n"
     return out
 
 
@@ -330,7 +339,7 @@ def build_image(self, tag, docker_dir, dockerfile,
         tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
                                              encoding='utf-8',
                                              dir=docker_dir, suffix=".docker")
-        tmp_df.write(dockerfile)
+        tmp_df.write(_dockerfile_preprocess(dockerfile))
 
         if user:
             uid = os.getuid()
diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 2943a99730..5cec46d8f2 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -6,6 +6,8 @@
 
 FROM docker.io/library/alpine:edge
 
+# Lines to by ignored when this file is read by the python script
+# ignore ppc64le,ppc64 xen-dev
 RUN apk update && \
     apk upgrade && \
     apk add \
-- 
2.25.1


