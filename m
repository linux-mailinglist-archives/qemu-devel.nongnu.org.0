Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8F582DF5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 19:06:14 +0200 (CEST)
Received: from localhost ([::1]:41676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkU8-00064Q-B6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 13:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk1y-00042D-Gx; Wed, 27 Jul 2022 12:37:06 -0400
Received: from [200.168.210.66] (port=61870 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oGk1x-0007pB-07; Wed, 27 Jul 2022 12:37:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 27 Jul 2022 13:36:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BD356800058;
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
Subject: [PATCH 6/8] scripts/ci/setup: Add Fedora to build-environment.yml
Date: Wed, 27 Jul 2022 13:36:30 -0300
Message-Id: <20220727163632.59806-7-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Jul 2022 16:36:39.0063 (UTC)
 FILETIME=[0B836270:01D8A1D7]
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

Minicloud doesn't have a RHEL image, but it does have Fedora 34 and 35
images and both use DNF as package manager, so just change the ansible facts
to check if it's RHEL or Fedora

Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
---
 scripts/ci/setup/build-environment.yml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 43cf8c759f..a7d53d0f70 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -165,8 +165,10 @@
           - zlib-devel
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
-        - ansible_facts['distribution_version'] == '8'
+        - |
+           (ansible_facts['distribution'] == 'RedHat' and
+            ansible_facts['distribution_version'] == '8') or
+            ansible_facts['distribution'] == 'Fedora'
 
     - name: Install packages only available on x86 and aarch64
       dnf:
@@ -175,6 +177,8 @@
           - spice-server
         state: present
       when:
-        - ansible_facts['distribution_file_variety'] == 'RedHat'
-        - ansible_facts['distribution_version'] == '8'
+        - |
+           (ansible_facts['distribution'] == 'RedHat' and
+            ansible_facts['distribution_version'] == '8') or
+            ansible_facts['distribution'] == 'Fedora'
         - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-- 
2.25.1


