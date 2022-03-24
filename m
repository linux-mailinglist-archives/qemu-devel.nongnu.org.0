Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6934E694A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 20:25:36 +0100 (CET)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXT5T-0006Xn-Mg
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 15:25:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSqx-0003AO-Sf; Thu, 24 Mar 2022 15:10:37 -0400
Received: from [187.72.171.209] (port=8328 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nXSqp-0005Rq-FI; Thu, 24 Mar 2022 15:10:32 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 24 Mar 2022 16:09:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7FE138001D4;
 Thu, 24 Mar 2022 16:09:16 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 4/6] tests/tcg: add support for ppc64le softmmu tests
Date: Thu, 24 Mar 2022 16:08:52 -0300
Message-Id: <20220324190854.156898-5-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Mar 2022 19:09:16.0997 (UTC)
 FILETIME=[A86E7750:01D83FB2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding a new, "virtual" TCG test target, ppc64le-softmmu, seems to
be the cleanest way to support both BE and LE tests for
ppc64-softmmu.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 tests/Makefile.include                    |  7 ++++---
 tests/tcg/configure.sh                    | 11 ++++++++++-
 tests/tcg/ppc64/Makefile.softmmu-target   |  2 ++
 tests/tcg/ppc64le/Makefile.softmmu-target |  7 +++++++
 4 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/ppc64le/Makefile.softmmu-target

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..4001fedbc3 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -40,9 +40,10 @@ SPEED = quick
 TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 
 # Per guest TCG tests
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
+TCG_TARGETS=$(patsubst tests/tcg/config-%.mak, %, $(wildcard tests/tcg/config-*.mak))
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TARGETS))
 
 # Probe for the Docker Builds needed for each build
 $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed4b5ccb1f..a4ac7a4e44 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -80,6 +80,10 @@ fi
 : ${cross_as_tricore="tricore-as"}
 : ${cross_ld_tricore="tricore-ld"}
 
+# If target ppc64-softmmu is configured, also include the virtual test target
+# ppc64le-softmmu
+target_list=`echo $target_list | sed 's/ppc64-softmmu/& ppc64le-softmmu/'`
+
 for target in $target_list; do
   arch=${target%%-*}
 
@@ -237,7 +241,12 @@ for target in $target_list; do
       ;;
     *-softmmu)
       echo "CONFIG_SOFTMMU=y" >> $config_target_mak
-      echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
+      if test $arch = "ppc64le"; then
+        sys_arch=ppc64
+      else
+        sys_arch=$arch
+      fi
+      echo "QEMU=$PWD/qemu-system-$sys_arch" >> $config_target_mak
       ;;
   esac
 
diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Makefile.softmmu-target
index 8f9925ca5a..511b6322df 100644
--- a/tests/tcg/ppc64/Makefile.softmmu-target
+++ b/tests/tcg/ppc64/Makefile.softmmu-target
@@ -2,6 +2,8 @@
 # PowerPC64 system tests
 #
 
+BIG_ENDIAN ?= 1
+
 # For now, disable tests that are failing
 DISABLED_TESTS := memory
 DISABLED_EXTRA_RUNS := run-gdbstub-memory
diff --git a/tests/tcg/ppc64le/Makefile.softmmu-target b/tests/tcg/ppc64le/Makefile.softmmu-target
new file mode 100644
index 0000000000..d4162160ee
--- /dev/null
+++ b/tests/tcg/ppc64le/Makefile.softmmu-target
@@ -0,0 +1,7 @@
+#
+# PowerPC64 LE system tests
+#
+
+BIG_ENDIAN = 0
+
+include $(SRC_PATH)/tests/tcg/ppc64/Makefile.softmmu-target
-- 
2.25.1


