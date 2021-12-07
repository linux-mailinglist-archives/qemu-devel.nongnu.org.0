Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C123E46B6AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:08:20 +0100 (CET)
Received: from localhost ([::1]:55462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muWSR-0001ss-15
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:08:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muWQE-0000ZI-FU
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:06:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muWQB-0007ad-3J
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 04:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638867957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jH5Z+b+kHxLfWuoLPzACTnUO2SkL8BPHZ6haC4T6bSw=;
 b=D5VcLiVdYpH37H8tD5a/pIiD4HNLvWTeeu9XwhkAfNjxwhumPC4qgqNWDOkOrWCQzwKPcZ
 w7nc8GS3lkH3ZbDpxH7e34wHEF4SiyICKz/TByXs1mh7ui+qj6I8sDYiOv+mjo0oYWOohQ
 ouYHG9p3q38SSC2ECp+A2oYd9XCgEl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-Cvgc3HDeMpOenXIycO_a1g-1; Tue, 07 Dec 2021 04:05:52 -0500
X-MC-Unique: Cvgc3HDeMpOenXIycO_a1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFFFB6408E;
 Tue,  7 Dec 2021 09:05:51 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C26735D6CF;
 Tue,  7 Dec 2021 09:05:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0] tests/qtest: Make the netfilter test independent from
 a specific NIC
Date: Tue,  7 Dec 2021 10:05:48 +0100
Message-Id: <20211207090548.105307-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Hongyang <yanghy@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The netfilter test needs a NIC, no matter which one, so it uses
e1000 by default (or virtio-net-ccw on s390x). However, this NIC
might not be always compiled into the QEMU target binary, so assuming
that this NIC is always available is a bad idea. Since the exact type
of NIC does not really matter for this test, let's switch to "-nic"
instead of "-netdev" so that QEMU can simply pick a default NIC for us.
This way we can now run the test on other targets that have a default
machine which features an on-board/default NIC, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build      | 23 +++++++++++++++++------
 tests/qtest/test-netfilter.c |  8 +-------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 5260b33dc0..cd88cf4bf9 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -104,27 +104,36 @@ endif
 
 qtests_x86_64 = qtests_i386
 
-qtests_alpha = [ 'boot-serial-test' ] +                                                      \
+qtests_alpha = [ 'boot-serial-test' ] + \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_avr = [ 'boot-serial-test' ]
 
-qtests_hppa = [ 'boot-serial-test' ] +                                                       \
+qtests_hppa = [ 'boot-serial-test' ] + \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
-qtests_m68k = [ 'boot-serial-test' ]
-qtests_microblaze = [ 'boot-serial-test' ]
+qtests_m68k = [ 'boot-serial-test' ] + \
+  (slirp.found() ? [ 'test-netfilter' ] : [])
+
+qtests_microblaze = [ 'boot-serial-test' ] + \
+  (slirp.found() ? [ 'test-netfilter' ] : [])
+
 qtests_microblazeel = qtests_microblaze
 
 qtests_mips = \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_mips64 = \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_mips64el = \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
@@ -147,10 +156,12 @@ qtests_ppc64 = \
 qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 
-qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test']
+qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
+  (slirp.found() ? [ 'test-netfilter' ] : [])
 
 qtests_sparc64 = \
-  (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
+  (slirp.found() ? [ 'test-netfilter' ] : []) + \
+  (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) + \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
diff --git a/tests/qtest/test-netfilter.c b/tests/qtest/test-netfilter.c
index 785b6f3226..b09ef7fae9 100644
--- a/tests/qtest/test-netfilter.c
+++ b/tests/qtest/test-netfilter.c
@@ -178,11 +178,6 @@ int main(int argc, char **argv)
 {
     int ret;
     char *args;
-    const char *devstr = "e1000";
-
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-        devstr = "virtio-net-ccw";
-    }
 
     g_test_init(&argc, &argv, NULL);
     qtest_add_func("/netfilter/addremove_one", add_one_netfilter);
@@ -192,8 +187,7 @@ int main(int argc, char **argv)
     qtest_add_func("/netfilter/remove_netdev_multi",
                    remove_netdev_with_multi_netfilter);
 
-    args = g_strdup_printf("-netdev user,id=qtest-bn0 "
-                           "-device %s,netdev=qtest-bn0", devstr);
+    args = g_strdup_printf("-nic user,id=qtest-bn0");
     qtest_start(args);
     ret = g_test_run();
 
-- 
2.27.0


