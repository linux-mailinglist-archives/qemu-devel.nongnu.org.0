Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26F61315A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:45:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPSD-0006Gk-Iy; Mon, 31 Oct 2022 03:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opPS9-0006GO-OD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:43:25 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opPS7-00088x-QC
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:43:25 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 457A0DA0438;
 Mon, 31 Oct 2022 08:43:19 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 2467D46001C; Mon, 31 Oct 2022 08:43:19 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: [RFC PATCH] Add new build target 'check-spelling'
Date: Mon, 31 Oct 2022 08:43:17 +0100
Message-Id: <20221031074317.377366-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

`make check-spelling` can now be used to get a list of spelling errors.
It uses the latest version of codespell, a spell checker implemented in Python.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This RFC can already be used for manual tests, but still reports false
positives, mostly because some variable names are interpreted as words.
These words can either be ignored in the check, or in some cases the code
might be changed to use different variable names.

The check currently only skips a few directories and files, so for example
checked out submodules are also checked.

The rule can be extended to allow user provided ignore and skip lists,
for example by introducing Makefile variables CODESPELL_SKIP=userfile
or CODESPELL_IGNORE=userfile. A limited check could be implemented by
providing a base directory CODESPELL_START=basedirectory, for example
CODESPELL_START=docs.

Regards,
Stefan

 tests/Makefile.include       | 10 ++++++++++
 tests/codespell/README.rst   | 18 ++++++++++++++++++
 tests/codespell/exclude-file |  3 +++
 tests/codespell/ignore-words | 19 +++++++++++++++++++
 tests/requirements.txt       |  1 +
 5 files changed, 51 insertions(+)
 create mode 100644 tests/codespell/README.rst
 create mode 100644 tests/codespell/exclude-file
 create mode 100644 tests/codespell/ignore-words

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..b9daeda932 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -155,6 +155,16 @@ check-acceptance-deprecated-warning:
 
 check-acceptance: check-acceptance-deprecated-warning | check-avocado
 
+.PHONY: check-spelling
+CODESPELL_DIR=tests/codespell
+check-spelling: check-venv
+	source $(TESTS_VENV_DIR)/bin/activate && \
+	cd "$(SRC_PATH)" && \
+	codespell -s . \
+	  --exclude-file=$(CODESPELL_DIR)/exclude-file \
+	  --ignore-words=$(CODESPELL_DIR)/ignore-words \
+	  --skip="./.git,./bin,./build,./linux-headers,*.patch,nohup.out"
+
 # Consolidated targets
 
 .PHONY: check check-clean get-vm-images
diff --git a/tests/codespell/README.rst b/tests/codespell/README.rst
new file mode 100644
index 0000000000..67e070d631
--- /dev/null
+++ b/tests/codespell/README.rst
@@ -0,0 +1,18 @@
+=============================
+Check spelling with codespell
+=============================
+
+`make check-spelling` can be used to get a list of spelling errors.
+It reports files with spelling errors and a summary of all misspelled words.
+The report is generated by the latest version of codespell, a spell checker
+implemented in Python.
+
+See https://github.com/codespell-project/codespell for more information.
+
+Some file patterns are excluded from the check.
+
+In addition tests/codespell includes several files which are used to
+suppress certain false positives in the codespell report.
+
+exclude-file - complete lines which should be ignored
+ignore-words - list of words which should be ignored
diff --git a/tests/codespell/exclude-file b/tests/codespell/exclude-file
new file mode 100644
index 0000000000..57de81a4eb
--- /dev/null
+++ b/tests/codespell/exclude-file
@@ -0,0 +1,3 @@
+ * VAS controller.
+number generator daemon such as the one found in the vhost-device crate of
+introspection.  The latter can conceivably confuse clients, so tread
diff --git a/tests/codespell/ignore-words b/tests/codespell/ignore-words
new file mode 100644
index 0000000000..4d336a2f44
--- /dev/null
+++ b/tests/codespell/ignore-words
@@ -0,0 +1,19 @@
+buid
+busses
+dout
+falt
+fpr
+hace
+hax
+hda
+nd
+ot
+pard
+parm
+ptd
+ser
+som
+synopsys
+te
+toke
+ue
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..dd44e6768f 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -4,3 +4,4 @@
 # Note that qemu.git/python/ is always implicitly installed.
 avocado-framework==88.1
 pycdlib==1.11.0
+codespell
-- 
2.30.2


