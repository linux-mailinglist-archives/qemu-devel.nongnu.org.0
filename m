Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6024D3F3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:29:54 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95F3-0003GA-7z
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94F3-0004Ah-Kk
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Eg-0001yv-Nm
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRgSshCIGbpZrD0DiUgpzC0UEfwrQbJklSmOPt4JwD0=;
 b=MIzE5nxUwmIsCvp4liz5mZUwdklIsys4FWTPRu8KnkCTg3s9Jq82icHzwOpqBe9tXQ0Wak
 L7i93eaiSJVxwzvHWHoAcp6q/PLf2slmmjpg/G20cgNP/l03w/3hD1TZQV68YTkNlqCHIy
 avT4ovNZca4GJfmbERR/RDBiFQxpNo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-jLLoZu3TP3KaYDE434qdgw-1; Fri, 21 Aug 2020 06:25:23 -0400
X-MC-Unique: jLLoZu3TP3KaYDE434qdgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF5E81F02D
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D02BD10098AE
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 143/152] meson: convert check-block
Date: Fri, 21 Aug 2020 06:23:20 -0400
Message-Id: <20200821102329.29777-144-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                    |  2 ++
 tests/Makefile.include         | 18 ++----------------
 tests/meson.build              |  4 ++++
 tests/qemu-iotests/meson.build | 10 ++++++++++
 4 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 tests/qemu-iotests/meson.build

diff --git a/meson.build b/meson.build
index fd7b362fb7..02a8bd5a63 100644
--- a/meson.build
+++ b/meson.build
@@ -1001,9 +1001,11 @@ if have_tools
              dependencies: [authz, block, crypto, io, qom, qemuutil], install: true)
   qemu_io = executable('qemu-io', files('qemu-io.c'),
              dependencies: [block, qemuutil], install: true)
+  qemu_block_tools = [qemu_img, qemu_io]
   if targetos == 'linux' or targetos == 'sunos' or targetos.endswith('bsd')
     qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [block, qemuutil], install: true)
+    qemu_block_tools += [qemu_nbd]
   endif
 
   subdir('storage-daemon')
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 4a2435342a..1f07a36f32 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -160,8 +160,6 @@ check-unit-y += tests/test-uuid$(EXESUF)
 check-unit-y += tests/ptimer-test$(EXESUF)
 check-unit-y += tests/test-qapi-util$(EXESUF)
 
-check-block-$(call land,$(CONFIG_POSIX),$(CONFIG_SOFTMMU)) += tests/check-block.sh
-
 generated-files-y += tests/test-qapi-types.h
 generated-files-y += tests/include/test-qapi-types-sub-module.h
 generated-files-y += tests/test-qapi-types-sub-sub-module.h
@@ -480,14 +478,6 @@ check-tcg: $(RUN_TCG_TARGET_RULES)
 clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 
-QEMU_IOTESTS_HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
-
-.PHONY: check-tests/check-block.sh
-check-tests/check-block.sh: tests/check-block.sh qemu-img$(EXESUF) \
-		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
-		$(patsubst %-softmmu,qemu-system-%,$(filter %-softmmu,$(TARGET_DIRS)))
-	@$<
-
 # Python venv for running tests
 
 .PHONY: check-venv check-acceptance
@@ -542,9 +532,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 # Consolidated targets
 
 .PHONY: check-block check-unit check check-clean get-vm-images
-ifeq ($(CONFIG_TOOLS),y)
-check-block: $(patsubst %,check-%, $(check-block-y))
-endif
+check-block:
 check-build: build-unit
 
 check-clean:
@@ -552,14 +540,12 @@ check-clean:
 	rm -f tests/test-qapi-gen-timestamp
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
-check: check-block check-unit
+check: check-unit
 
 clean: check-clean
 
 # Build the help program automatically
 
-all: $(QEMU_IOTESTS_HELPERS-y)
-
 -include $(wildcard tests/*.d)
 
 endif
diff --git a/tests/meson.build b/tests/meson.build
index d724402cf4..f834c272e8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,3 +1,7 @@
+if have_system and 'CONFIG_POSIX' in config_host
+  subdir('qemu-iotests')
+endif
+
 test('decodetree', sh,
      args: [ files('decode/check.sh'), config_host['PYTHON'], files('../scripts/decodetree.py') ],
      workdir: meson.current_source_dir() / 'decode',
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
new file mode 100644
index 0000000000..3de09fb8fa
--- /dev/null
+++ b/tests/qemu-iotests/meson.build
@@ -0,0 +1,10 @@
+if 'CONFIG_LINUX' in config_host
+    socket_scm_helper = executable('socket_scm_helper', 'socket_scm_helper.c',
+                                    build_by_default: false)
+else
+    socket_scm_helper = []
+endif
+test('qemu-iotests', sh, args: [files('../check-block.sh')],
+     depends: [qemu_block_tools, emulators, socket_scm_helper],
+     suite: 'block', timeout: 10000)
+
-- 
2.26.2



