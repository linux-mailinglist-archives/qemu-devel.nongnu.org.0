Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C06270F64
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:19:05 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJfZo-0003E7-EO
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHQ-0005Xw-Qg
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60143
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfHG-0007Rb-GI
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 12:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUQybDQTiMw6/4JwPhuOD8S61c0O7V2K0/QidkUDYtg=;
 b=QBcJ4Q+fvLVHOHwNlGNdD1FHyDEc6uKRvRsUiO4m+4K+niP3I/rTatWu6BasDlsVWHjatP
 izeF8eWumr98PfneBv/+66yCwm5N9w5t4g2aetv0LuKiT3zMXY0TWsskWpMVXxldV4XPZ7
 gnm+46/l6v4Cl2/5lJbsaDx/O+2MQQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-6jUW-B81ODyfjxQ45G_dag-1; Sat, 19 Sep 2020 11:59:49 -0400
X-MC-Unique: 6jUW-B81ODyfjxQ45G_dag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157678712D9
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D634610016DA
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/57] mtest2make: add support for introspected test
 dependencies
Date: Sat, 19 Sep 2020 11:58:58 -0400
Message-Id: <20200919155916.1046398-40-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 11:59:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Right now all "make check" targets depend blindly on "all".  If Meson
is 0.56.0 or newer, we can use the correct dependencies using the new
"depends" entry in "meson introspect --tests".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              |  2 +-
 scripts/mtest2make.py | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 42d90cb597..897246d77c 100644
--- a/Makefile
+++ b/Makefile
@@ -78,7 +78,7 @@ ${ninja-targets-c_COMPILER} ${ninja-targets-cpp_COMPILER}: .var.command += -MP
 # reread (and MESON won't be empty anymore).
 ifneq ($(MESON),)
 Makefile.mtest: build.ninja scripts/mtest2make.py
-	$(MESON) introspect --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
+	$(MESON) introspect --targets --tests --benchmarks | $(PYTHON) scripts/mtest2make.py > $@
 -include Makefile.mtest
 endif
 
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 9cbb2e374d..c3489a4605 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -5,6 +5,7 @@
 # Author: Paolo Bonzini <pbonzini@redhat.com>
 
 from collections import defaultdict
+import itertools
 import json
 import os
 import shlex
@@ -36,7 +37,7 @@ SPEED = quick
 introspect = json.load(sys.stdin)
 i = 0
 
-def process_tests(test, suites):
+def process_tests(test, targets, suites):
     global i
     env = ' '.join(('%s=%s' % (shlex.quote(k), shlex.quote(v))
                     for k, v in test['env'].items()))
@@ -58,12 +59,19 @@ def process_tests(test, suites):
     i += 1
     if test['workdir'] is not None:
         print('.test.dir.%d := %s' % (i, shlex.quote(test['workdir'])))
+
+    if 'depends' in test:
+        deps = (targets.get(x, []) for x in test['depends'])
+        deps = itertools.chain.from_iterable(deps)
+    else:
+        deps = ['all']
+
     print('.test.name.%d := %s' % (i, test['name']))
     print('.test.driver.%d := %s' % (i, driver))
     print('.test.env.%d := $(.test.env) %s' % (i, env))
     print('.test.cmd.%d := %s' % (i, cmd))
     print('.PHONY: run-test-%d' % (i,))
-    print('run-test-%d: all' % (i,))
+    print('run-test-%d: %s' % (i, ' '.join(deps)))
     print('\t@$(call .test.run,%d,$(.test.output-format))' % (i,))
 
     test_suites = test['suite'] or ['default']
@@ -102,16 +110,19 @@ def emit_suite(name, suite, prefix):
     print('.tests += $(.test.$(SPEED).%s)' % (target, ))
     print('endif')
 
+targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
+           for t in introspect['targets']}
+
 testsuites = defaultdict(Suite)
 for test in introspect['tests']:
-    process_tests(test, testsuites)
+    process_tests(test, targets, testsuites)
 emit_prolog(testsuites, 'check')
 for name, suite in testsuites.items():
     emit_suite(name, suite, 'check')
 
 benchsuites = defaultdict(Suite)
 for test in introspect['benchmarks']:
-    process_tests(test, benchsuites)
+    process_tests(test, targets, benchsuites)
 emit_prolog(benchsuites, 'bench')
 for name, suite in benchsuites.items():
     emit_suite(name, suite, 'bench')
-- 
2.26.2



