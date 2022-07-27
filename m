Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF67582D71
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:58:05 +0200 (CEST)
Received: from localhost ([::1]:34204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkMG-0000UK-5j
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk21-00048w-GI; Wed, 27 Jul 2022 12:37:09 -0400
Received: from [200.168.210.66] (port=61870 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk1z-0007pB-KQ; Wed, 27 Jul 2022 12:37:08 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Jul 2022 13:36:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E8ADE800358;
 Wed, 27 Jul 2022 13:36:38 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH 7/8] scripts/ci/setup: Added debian to build-environment.yml
Date: Wed, 27 Jul 2022 13:36:31 -0300
Message-Id: <20220727163632.59806-8-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jul 2022 16:36:39.0204 (UTC)
 FILETIME=[0B98E640:01D8A1D7]
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

Minicloud has a PPC64 BE Debian11 image which can be used for the CI,
so add Debian to the build-environment.yml so it can be configured with
ansible-playbook.

Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
---
 scripts/ci/setup/build-environment.yml | 31 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index a7d53d0f70..b5d415496f 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -31,9 +31,11 @@
         update_cache: yes
         upgrade: yes
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - |
+            ansible_facts['distribution'] == 'Ubuntu' or
+            ansible_facts['distribution'] == 'Debian'
 
-    - name: Install basic packages to build QEMU on Ubuntu 20.04
+    - name: Install basic packages to build QEMU on Ubuntu 20.04 or Debian11
       package:
         name:
           - ccache
@@ -56,7 +58,6 @@
           - libibverbs-dev
           - libiscsi-dev
           - libjemalloc-dev
-          - libjpeg-turbo8-dev
           - liblzo2-dev
           - libncurses5-dev
           - libncursesw5-dev
@@ -86,17 +87,37 @@
           - sparse
           - xfslibs-dev
         state: present
+      when:
+        - |
+            ansible_facts['distribution'] == 'Ubuntu' or
+            ansible_facts['distribution'] == 'Debian'
+
+    - name: Install Ubuntu exclusive packages to build QEMU
+      package:
+        name:
+          - libjpeg-turbo8-dev
+        state: present
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
+    - name: Install Debian exclusive packages to build QEMU
+      package:
+        name:
+          - libjpeg62-turbo-dev
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'Debian'
+
+    - name: Install packages to build QEMU on Ubuntu 20.04 or Debian11 on non-s390x
       package:
         name:
           - libspice-server-dev
           - libxen-dev
         state: present
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - |
+            ansible_facts['distribution'] == 'Ubuntu' or
+            ansible_facts['distribution'] == 'Debian'
         - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
 
     - name: Install basic packages to build QEMU on Ubuntu 20.04
-- 
2.25.1


