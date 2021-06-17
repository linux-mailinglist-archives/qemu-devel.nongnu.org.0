Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169883AB103
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:10:13 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoyS-0006fh-24
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltopS-0007RA-5h
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ltopJ-00024y-Oa
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 06:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623924045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pt9vWo6DEUS2b2jwpAXDuj+ICRNHHBuuZn51HIPtiMU=;
 b=OMyjnYlLIv8w/HOgjEQsm2TLQdTDb1sbcMdSvO5pMJ7bIcok/9Ag6mi0qn8cay2WsB1dJq
 HSwNfutE00oM16Va35Y6Yc+8qKHrXqFM+W7lSDqed+ktOmMnz0+PH5P9OK3Oyj0QKRCjG6
 Tx6dM2TgATxHHD5o11kfujTlL7S8tZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-50N28ozNN62Ekj9HHUX9Rw-1; Thu, 17 Jun 2021 06:00:42 -0400
X-MC-Unique: 50N28ozNN62Ekj9HHUX9Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68BAB100CED0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:00:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B44665C1BB;
 Thu, 17 Jun 2021 10:00:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 1/3] tests: qtest: add qtest_has_kvm() to check if tested
 binary supports KVM
Date: Thu, 17 Jun 2021 06:00:31 -0400
Message-Id: <20210617100031.1380288-1-imammedo@redhat.com>
In-Reply-To: <20210616152455.1270264-2-imammedo@redhat.com>
References: <20210616152455.1270264-2-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, philmd@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently it not possible to create tests that have KVM as a hard
requirement on a host that doesn't support KVM for tested target
binary (modulo going through the trouble of compiling out
the offending test case).

Following scenario makes test fail when it's run on non x86 host:
  qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288

This patch introduces qtest_has_kvm() to let users check if KVM is
available in advance and skip registering non run-able test-cases.

PS:
It's simplistic and not as versatile/precise as earlier proposed
'query-accels' series, but it get job done for simple cases.

on upside it's much cheaper to execute than the 'query-accels' as
it doesn't need to run QEMU for probing.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v2:
  - fix access() check.
     s/access()/!access()/
  - format C array items at meson.build time, and drop
    splitting targets string at runtime

 tests/qtest/libqos/libqtest.h |  7 +++++++
 meson.build                   |  2 ++
 tests/qtest/libqtest.c        | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..bab0047117 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -588,6 +588,13 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_has_kvm:
+ *
+ * Returns: True if the QEMU executable under test supports KVM
+ */
+bool qtest_has_kvm(void);
+
 /**
  * qtest_add_func:
  * @str: Test case path.
diff --git a/meson.build b/meson.build
index d2a9ce91f5..7fec4e8289 100644
--- a/meson.build
+++ b/meson.build
@@ -75,6 +75,8 @@ elif cpu in ['mips', 'mips64']
 else
   kvm_targets = []
 endif
+kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
+config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 825b13a44c..daa6d54059 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -920,6 +920,24 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+bool qtest_has_kvm(void)
+{
+    int i;
+    bool ret = false;
+    const char *arch = qtest_get_arch();
+    const char *targets[] = { CONFIG_KVM_TARGETS };
+
+    for (i = 0; i < ARRAY_SIZE(targets); i++) {
+        if (!strncmp(targets[i], arch, strlen(arch))) {
+            if (!access("/dev/kvm", R_OK | W_OK)) {
+                ret = true;
+                break;
+            }
+        }
+    }
+    return ret;
+}
+
 bool qtest_get_irq(QTestState *s, int num)
 {
     /* dummy operation in order to make sure irq is up to date */
-- 
2.27.0


