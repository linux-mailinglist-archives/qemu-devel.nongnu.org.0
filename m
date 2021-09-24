Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973A7417BBA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:21:04 +0200 (CEST)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqko-00046r-Dn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqPd-0005lS-EN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqPa-0006UF-B5
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dquti180UQK/Lsk5V0Ny0QjbiyQ8coto5ujeal+aekk=;
 b=hSg6NfSs0Ba/J+fG1KmZ8eKYGyOWTB3www7t1oUM5MldKrTIn4sNZ/0rI2D4QUS3jP/o13
 wg+at82gUkF3YHJB12GTTF/5qN0IMO7rkSt0b9f1u6pz2p3hiBy1zuyvYbQGIHypue95k5
 xvcU1oYuv1myu2eIknViA1dIPki4Zi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-QjwBS40MPDCiMTYnhcQr0A-1; Fri, 24 Sep 2021 14:57:19 -0400
X-MC-Unique: QjwBS40MPDCiMTYnhcQr0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C65E100CCC1;
 Fri, 24 Sep 2021 18:57:17 +0000 (UTC)
Received: from p50.net (unknown [10.22.33.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABBA25C1A3;
 Fri, 24 Sep 2021 18:57:14 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] Acceptance Tests: keep track and disable tests with
 known issues
Date: Fri, 24 Sep 2021 14:54:54 -0400
Message-Id: <20210924185506.2542588-5-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
References: <20210924185506.2542588-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces a convention, under which tests with known open
issues, will be automatically excluded from execution via "make
check-acceptance".  It should by itself improve the reliability
of test jobs, even those with rare failures.

Those tests can still be run with:

  ./tests/venv/bin/avocado run $TEST_ID

With the test identification are obtainable via:

  ./tests/venv/bin/avocado list tests/acceptance

And for tests with known issues:

  ./tests/venv/bin/avocado list -t issue tests/acceptance

A list of tests that are enabled (that is, match the currently
configured targets, and do not have known issues) can be obtained
with:

  make list-acceptance

As a future improvement, a tool can be added to sync the "issue" tags
with issues that end up being resolved closed.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/testing.rst                 | 28 ++++++++++++++++++++++++++
 tests/Makefile.include                 |  3 ++-
 tests/acceptance/boot_linux_console.py |  3 +++
 tests/acceptance/machine_rx_gdbsim.py  |  3 +++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 2818c58ff8..f93a9bed3f 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1147,6 +1147,34 @@ variable as shown on the code snippet below to skip the test:
   def test(self):
       do_something()
 
+Disabling tests
+---------------
+
+If you want to have a test temporarily disabled (from ``make
+check-acceptance``), you can add an Avocado ``issue`` tag to the test.  Example::
+
+  class Feature(Test):
+
+      def test(self):
+        """
+        :avocado: tags=issue
+        """
+        do_something()
+
+Rather than simply adding an ``issue`` tag, it may be helpful to point
+to an actual issue on the project's issue tracker::
+
+  class Feature(Test):
+
+      def test(self):
+        """
+        Reason for disabling this test is documented and tracked at
+        https://gitlab.com/qemu-project/qemu/-/issues/9999
+
+        :avocado: tags=issue:9999
+        """
+        do_something()
+
 Uninstalling Avocado
 --------------------
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index d1f90572a7..eb3e5d2aa6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -94,7 +94,8 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 # information please refer to "avocado --help".
 AVOCADO_SHOW=app
 AVOCADO_RUNNER=runner
-AVOCADO_TAGS=$(patsubst %-softmmu,-t arch:%, $(filter %-softmmu,$(TARGETS)))
+comma := ,
+AVOCADO_TAGS=$(patsubst %-softmmu,--filter-by-tags=-issue$(comma)arch:%, $(filter %-softmmu,$(TARGETS)))
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, \
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0a49c0e276..4c824bc161 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -485,6 +485,9 @@ def test_arm_raspi2_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:raspi2b
+
+        # https://gitlab.com/qemu-project/qemu/-/issues/636
+        :avocado: tags=issue:636
         """
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/acceptance/machine_rx_gdbsim.py
index 32b737b6d8..62893a9989 100644
--- a/tests/acceptance/machine_rx_gdbsim.py
+++ b/tests/acceptance/machine_rx_gdbsim.py
@@ -54,6 +54,9 @@ def test_linux_sash(self):
         :avocado: tags=arch:rx
         :avocado: tags=machine:gdbsim-r5f562n7
         :avocado: tags=endian:little
+
+        # https://gitlab.com/qemu-project/qemu/-/issues/507
+        :avocado: tags=issue:507
         """
         dtb_url = ('https://acc.dl.osdn.jp/users/23/23887/rx-virt.dtb')
         dtb_hash = '7b4e4e2c71905da44e86ce47adee2210b026ac18'
-- 
2.31.1


