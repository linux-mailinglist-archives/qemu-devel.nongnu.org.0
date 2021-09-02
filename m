Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A313FED46
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:56:09 +0200 (CEST)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlKC-0000gi-2B
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0k-00005i-6Z
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLl0i-0004yi-9V
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630582559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7o7Y7o2bDmU0SLRHdZYU1uewUfgBMKhN+1xL5aSUFt0=;
 b=LEA0x7wrkdBYjn+Lvad2CbNBO/ei0Sts94MCAhBi1Pmw/FdH/+WTp8xmXCJ+ABVKEimKbc
 JE7shd5SWVDvx8cm09mJ2z8cfrpDY6gZ51NdV3BMJcui8fJwLYKtXXwexH14AmiTQZpHLX
 HBDJVixLkWBZmabhtpFdVtpK803ztU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-5UW4bhbnMrShf9LOTpsXHQ-1; Thu, 02 Sep 2021 07:35:56 -0400
X-MC-Unique: 5UW4bhbnMrShf9LOTpsXHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04E6D107ACCA;
 Thu,  2 Sep 2021 11:35:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E231C6A8F8;
 Thu,  2 Sep 2021 11:35:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] tests: qtest: add qtest_has_accel() to check if
 tested binary supports accelerator
Date: Thu,  2 Sep 2021 07:35:38 -0400
Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
In-Reply-To: <20210902113551.461632-1-imammedo@redhat.com>
References: <20210902113551.461632-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: lvivier@redhat.com, thuth@redhat.com, f4bug@amsat.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently it is not possible to create tests that have KVM as a hard
requirement on a host that doesn't support KVM for tested target
binary (modulo going through the trouble of compiling out
the offending test case).

Following scenario makes test fail when it's run on non x86 host:
  qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288

This patch introduces qtest_has_accel() to let users check if accel is
available in advance and avoid executing non run-able test-cases.

It implements detection of TCG and KVM only, the rest could be
added later on, when we actually start testing them in qtest.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
There is an alternative 'runtime' approach on list:
'query-accels' series.
https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-4-philmd@redhat.com/

on upside this impl. much cheaper to execute than the 'query-accels'
as it doesn't need to run QEMU for probing.

v4:
  - s/qtest_has_kvm/qtest_has_accel/
  - add TCG detection (based on --disable-tcg)
v3:
  - make it work with --disable-kvm
       (Claudio Fontana <cfontana@suse.de>)
v2:
  - fix access() check.
     s/access()/!access()/
  - format C array items at meson.build time

CC: thuth@redhat.com
CC: lvivier@redhat.com
CC: f4bug@amsat.org
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 meson.build                   |  6 ++++++
 tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..59e9271195 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_add_func:
  * @str: Test case path.
diff --git a/meson.build b/meson.build
index bf63784812..42c99b1ebd 100644
--- a/meson.build
+++ b/meson.build
@@ -76,6 +76,12 @@ else
   kvm_targets = []
 endif
 
+kvm_targets_c = ''
+if not get_option('kvm').disabled() and targetos == 'linux'
+  kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
+endif
+config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
+
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i368 emulator provides xenpv machine type for multiple architectures
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 825b13a44c..643769e416 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -920,6 +920,33 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    if (g_str_equal(accel_name, "tcg")) {
+#if defined(CONFIG_TCG)
+        return true;
+#else
+        return false;
+#endif
+    } else if (g_str_equal(accel_name, "kvm")) {
+        int i;
+        const char *arch = qtest_get_arch();
+        const char *targets[] = { CONFIG_KVM_TARGETS };
+
+        for (i = 0; i < ARRAY_SIZE(targets); i++) {
+            if (!strncmp(targets[i], arch, strlen(arch))) {
+                if (!access("/dev/kvm", R_OK | W_OK)) {
+                    return true;
+                }
+            }
+        }
+    } else {
+        /* not implemented */
+        g_assert_not_reached();
+    }
+    return false;
+}
+
 bool qtest_get_irq(QTestState *s, int num)
 {
     /* dummy operation in order to make sure irq is up to date */
-- 
2.27.0


