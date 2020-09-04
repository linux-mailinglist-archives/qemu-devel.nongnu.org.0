Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C525D7A7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:43:28 +0200 (CEST)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEA7q-0001WS-Lo
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA5z-000870-LM
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41943
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA5v-0005AV-3q
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:41:29 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-78mCWcRpNuq2Ae14fnlrkw-1; Fri, 04 Sep 2020 07:41:24 -0400
X-MC-Unique: 78mCWcRpNuq2Ae14fnlrkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BD901005E6E
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4105B5DA8F
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/46] qemu-iotests: move check-block back to Makefiles
Date: Fri,  4 Sep 2020 07:40:37 -0400
Message-Id: <20200904114122.31307-2-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check-block has its own test harness, unlike every other test.  If
we capture its output, as is in general nicer to do without V=1,
there will be no sign of progress.  So for lack of a better option
just move the invocation of the test back to Makefile rules.

As a side effect, this will also fix "make check" in --disable-tools
builds, as they were trying to run qemu-iotests without having
made qemu-img before.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                    |  2 --
 tests/Makefile.include         | 15 ++++++++++++---
 tests/qemu-iotests/meson.build |  4 ----
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index 55c7d2318c..356af9142c 100644
--- a/meson.build
+++ b/meson.build
@@ -1095,11 +1095,9 @@ if have_tools
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
-  qemu_block_tools += [qemu_img, qemu_io]
   if targetos != 'windows'
     qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [block, qemuutil], install: true)
-    qemu_block_tools += [qemu_nbd]
   endif
 
   subdir('storage-daemon')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9ac8f5b86a..08301f5bc9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -468,7 +468,6 @@ check-tcg: $(RUN_TCG_TARGET_RULES)
 .PHONY: clean-tcg
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
-
 # Python venv for running tests
 
 .PHONY: check-venv check-acceptance
@@ -523,8 +522,18 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 # Consolidated targets
 
 .PHONY: check-block check-unit check check-clean get-vm-images
-check-block:
-check-build: build-unit
+check:
+
+ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
+QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
+check: check-block
+check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
+		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
+		$(patsubst %-softmmu,qemu-system-%,$(filter %-softmmu,$(TARGET_DIRS)))
+	@$<
+endif
+
+check-build: build-unit $(QEMU_IOTESTS_HELPERS-y)
 
 check-clean:
 	rm -rf $(check-unit-y) tests/*.o tests/*/*.o $(QEMU_IOTESTS_HELPERS-y)
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 3de09fb8fa..60470936b4 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -4,7 +4,3 @@ if 'CONFIG_LINUX' in config_host
 else
     socket_scm_helper = []
 endif
-test('qemu-iotests', sh, args: [files('../check-block.sh')],
-     depends: [qemu_block_tools, emulators, socket_scm_helper],
-     suite: 'block', timeout: 10000)
-
-- 
2.26.2



