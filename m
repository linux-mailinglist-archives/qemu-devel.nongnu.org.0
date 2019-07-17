Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4B6BB43
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 13:20:46 +0200 (CEST)
Received: from localhost ([::1]:56036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnhzJ-00008b-T9
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 07:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41775)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hnhyf-00071H-Dh
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 07:20:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hnhyd-0008Bm-QM
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 07:20:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hnhya-00084F-Qy; Wed, 17 Jul 2019 07:20:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A0800300CB0D;
 Wed, 17 Jul 2019 11:19:58 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 472DE19C68;
 Wed, 17 Jul 2019 11:19:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Wed, 17 Jul 2019 13:19:46 +0200
Message-Id: <20190717111947.30356-4-thuth@redhat.com>
In-Reply-To: <20190717111947.30356-1-thuth@redhat.com>
References: <20190717111947.30356-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 17 Jul 2019 11:19:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/4] tests: Run the iotests during "make
 check" again
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

People often forget to run the iotests before submitting patches or pull
requests - this is likely due to the fact that we do not run the tests
during our mandatory "make check" tests yet. Now that we've got a proper
"auto" group of iotests that should be fine to run in every environment,
we can enable the iotests during "make check" again by running the "auto"
tests by default from the check-block.sh script.

Some cases still need to be checked first, though: iotests need bash and
GNU sed (otherwise they fail), and if gprof is enabled, it spoils the
output of some test cases causing them to fail. So if we detect that one
of the required programs is missing or that gprof is enabled, we still
have to skip the iotests to avoid failures.

And finally, since we are using check-block.sh now again, this patch also
removes the qemu-iotests-quick.sh script since we do not need that anymor=
e
(and having two shell wrapper scripts around the block tests seems rather
confusing than helpful).

Signed-off-by: Thomas Huth <thuth@redhat.com>
[AJB: -makecheck to check-block.sh, move check-block to start and gate it=
]
Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
---
 tests/Makefile.include      | 10 +++++----
 tests/check-block.sh        | 44 ++++++++++++++++++++++++++++---------
 tests/qemu-iotests-quick.sh |  8 -------
 3 files changed, 40 insertions(+), 22 deletions(-)
 delete mode 100755 tests/qemu-iotests-quick.sh

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fd7fdb8658..6f02dfcc01 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -142,7 +142,7 @@ check-unit-y +=3D tests/test-uuid$(EXESUF)
 check-unit-y +=3D tests/ptimer-test$(EXESUF)
 check-unit-y +=3D tests/test-qapi-util$(EXESUF)
=20
-check-block-$(CONFIG_POSIX) +=3D tests/qemu-iotests-quick.sh
+check-block-$(call land,$(CONFIG_POSIX),$(CONFIG_SOFTMMU)) +=3D tests/ch=
eck-block.sh
=20
 # All QTests for now are POSIX-only, but the dependencies are
 # really in libqtest, not in the testcases themselves.
@@ -1092,8 +1092,10 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
=20
 QEMU_IOTESTS_HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) =3D =
tests/qemu-iotests/socket_scm_helper$(EXESUF)
=20
-.PHONY: check-tests/qemu-iotests-quick.sh
-check-tests/qemu-iotests-quick.sh: tests/qemu-iotests-quick.sh qemu-img$=
(EXESUF) qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y)
+.PHONY: check-tests/check-block.sh
+check-tests/check-block.sh: tests/check-block.sh qemu-img$(EXESUF) \
+		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
+		$(patsubst %,%/all,$(filter %-softmmu,$(TARGET_DIRS)))
 	$<
=20
 .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
@@ -1167,7 +1169,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR)
 check-qapi-schema: $(patsubst %,check-%, $(check-qapi-schema-y)) check-t=
ests/qapi-schema/doc-good.texi
 check-qtest: $(patsubst %,check-qtest-%, $(QTEST_TARGETS))
 check-block: $(patsubst %,check-%, $(check-block-y))
-check: check-qapi-schema check-unit check-softfloat check-qtest check-de=
codetree
+check: check-block check-qapi-schema check-unit check-softfloat check-qt=
est check-decodetree
 check-clean:
 	rm -rf $(check-unit-y) tests/*.o $(QEMU_IOTESTS_HELPERS-y)
 	rm -rf $(sort $(foreach target,$(SYSEMU_TARGET_LIST), $(check-qtest-$(t=
arget)-y)) $(check-qtest-generic-y))
diff --git a/tests/check-block.sh b/tests/check-block.sh
index f3d12fd602..c8b6cec3f6 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -1,24 +1,48 @@
 #!/bin/sh
=20
-FORMAT_LIST=3D"raw qcow2 qed vmdk vpc"
+# Honor the SPEED environment variable, just like we do it for the qtest=
s.
+if [ "$SPEED" =3D "slow" ]; then
+    format_list=3D"raw qcow2"
+    group=3D
+elif [ "$SPEED" =3D "thorough" ]; then
+    format_list=3D"raw qcow2 qed vmdk vpc"
+    group=3D
+else
+    format_list=3Dqcow2
+    group=3D"-g auto"
+fi
+
 if [ "$#" -ne 0 ]; then
-    FORMAT_LIST=3D"$@"
+    format_list=3D"$@"
+fi
+
+if grep -q "TARGET_GPROF=3Dy" *-softmmu/config-target.mak 2>/dev/null ; =
then
+    echo "GPROF is enabled =3D=3D> Not running the qemu-iotests."
+    exit 0
 fi
=20
-export QEMU_PROG=3D"$PWD/x86_64-softmmu/qemu-system-x86_64"
-export QEMU_IMG_PROG=3D"$PWD/qemu-img"
-export QEMU_IO_PROG=3D"$PWD/qemu-io"
+if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
+    echo "No qemu-system binary available =3D=3D> Not running the qemu-i=
otests."
+    exit 0
+fi
+
+if ! command -v bash >/dev/null 2>&1 ; then
+    echo "bash not available =3D=3D> Not running the qemu-iotests."
+    exit 0
+fi
=20
-if [ ! -x $QEMU_PROG ]; then
-    echo "'make check-block' requires qemu-system-x86_64"
-    exit 1
+if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
+    if ! command -v gsed >/dev/null 2>&1; then
+        echo "GNU sed not available =3D=3D> Not running the qemu-iotests=
."
+        exit 0
+    fi
 fi
=20
 cd tests/qemu-iotests
=20
 ret=3D0
-for FMT in $FORMAT_LIST ; do
-    ./check -T -nocache -$FMT || ret=3D1
+for fmt in $format_list ; do
+    ./check -makecheck -$fmt $group || ret=3D1
 done
=20
 exit $ret
diff --git a/tests/qemu-iotests-quick.sh b/tests/qemu-iotests-quick.sh
deleted file mode 100755
index 0e554bb972..0000000000
--- a/tests/qemu-iotests-quick.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-cd tests/qemu-iotests
-
-ret=3D0
-TEST_DIR=3D${TEST_DIR:-/tmp/qemu-iotests-quick-$$} ./check -T -qcow2 -g =
quick || ret=3D1
-
-exit $ret
--=20
2.21.0


