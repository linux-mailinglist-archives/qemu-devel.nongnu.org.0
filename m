Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4A47B30D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:43:36 +0100 (CET)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNdH-0005pj-BG
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKuE-0006sH-Qq
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:48:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKuC-0003mi-8b
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q+Xk3O/LjRDf2Wp1rmglgGgwqt2XrHHw2r6jvJus/Uw=;
 b=NBWigA0ikdgBYJqXfXJCFtfRddz4YCLDzHhFpHS4gyGhBVHySnpsyzBY4NoOFB6XB/3j9E
 TZ0yb4AxXQdr/kKIiDvmrVSMXuXV6AL7vmehdWyN4LBM1H3xKJOvfqsnUqRKHebqoeWb6U
 HAp33nqVByqdWOxHTcOclRG9uCbymwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-d1DylhiQM9CQUOP7GVw0ow-1; Mon, 20 Dec 2021 05:30:43 -0500
X-MC-Unique: d1DylhiQM9CQUOP7GVw0ow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17920640A0;
 Mon, 20 Dec 2021 10:30:42 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E29D6ABBA;
 Mon, 20 Dec 2021 10:30:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] tests/qtest: Make the filter tests independent from a
 specific NIC
Date: Mon, 20 Dec 2021 11:30:25 +0100
Message-Id: <20211220103025.311759-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yang Hongyang <yanghy@cn.fujitsu.com>,
 Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These filter tests need a NIC, no matter which one, so they use a common
NIC by default. However, these common NIC models might not always have
been compiled into the QEMU target binary, so assuming that a certain NIC
is available is a bad idea. Since the exact type of NIC does not really
matter for these tests, let's switch to "-nic" instead of "-netdev" so
that QEMU can simply pick a default NIC for us.
This way we can now run the tests on other targets that have a default
machine with an on-board/default NIC, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build              | 40 +++++++++++++++++++++-------
 tests/qtest/test-filter-mirror.c     | 10 ++-----
 tests/qtest/test-filter-redirector.c | 20 +++-----------
 tests/qtest/test-netfilter.c         |  8 +-----
 4 files changed, 38 insertions(+), 40 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ebeac59b3f..7811177f03 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -47,7 +47,6 @@ qtests_i386 = \
   (have_tools ? ['ahci-test'] : []) +                                                       \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +           \
   (config_all_devices.has_key('CONFIG_SGA') ? ['boot-serial-test'] : []) +                  \
-  (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['test-filter-redirector'] : []) +    \
   (config_all_devices.has_key('CONFIG_ISA_IPMI_KCS') ? ['ipmi-kcs-test'] : []) +            \
   (config_host.has_key('CONFIG_LINUX') and                                                  \
    config_all_devices.has_key('CONFIG_ISA_IPMI_BT') ? ['ipmi-bt-test'] : []) +              \
@@ -90,7 +89,9 @@ qtests_i386 = \
    'vmgenid-test',
    'migration-test',
    'test-x86-cpuid-compat',
-   'numa-test']
+   'numa-test',
+   'test-filter-redirector'
+  ]
 
 dbus_daemon = find_program('dbus-daemon', required: false)
 if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
@@ -109,31 +110,49 @@ endif
 
 qtests_x86_64 = qtests_i386
 
-qtests_alpha = [ 'boot-serial-test' ] +                                                      \
+qtests_alpha = ['boot-serial-test'] + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_avr = [ 'boot-serial-test' ]
 
-qtests_hppa = [ 'boot-serial-test' ] +                                                       \
+qtests_hppa = ['boot-serial-test'] + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
-qtests_m68k = [ 'boot-serial-test' ]
-qtests_microblaze = [ 'boot-serial-test' ]
+qtests_m68k = ['boot-serial-test'] + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : [])
+
+qtests_microblaze = ['boot-serial-test'] + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : [])
+
 qtests_microblazeel = qtests_microblaze
 
 qtests_mips = \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_mips64 = \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_mips64el = \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : [])
 
 qtests_ppc = \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : []) + \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
   ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
@@ -143,19 +162,22 @@ qtests_ppc64 = \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['device-plug-test'] : []) +               \
   (config_all_devices.has_key('CONFIG_POWERNV') ? ['pnv-xscom-test'] : []) +                 \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['rtas-test'] : []) +                      \
-  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +              \
+  (slirp.found() ? ['pxe-test'] : []) +              \
   (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +         \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                      \
   qtests_pci + ['migration-test', 'numa-test', 'cpu-plug-test', 'drive_del-test']
 
 qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 
-qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test']
+qtests_sparc = ['prom-env-test', 'm48t59-test', 'boot-serial-test'] + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
+  (slirp.found() ? ['test-netfilter'] : [])
 
 qtests_sparc64 = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
+  (slirp.found() ? ['test-netfilter'] : []) + \
+  ['test-filter-mirror', 'test-filter-redirector'] + \
   ['prom-env-test', 'boot-serial-test']
 
 qtests_npcm7xx = \
diff --git a/tests/qtest/test-filter-mirror.c b/tests/qtest/test-filter-mirror.c
index bc0dee64dd..95367d14d3 100644
--- a/tests/qtest/test-filter-mirror.c
+++ b/tests/qtest/test-filter-mirror.c
@@ -28,13 +28,8 @@ static void test_mirror(void)
     char *recv_buf;
     uint32_t size = sizeof(send_buf);
     size = htonl(size);
-    const char *devstr = "e1000";
     QTestState *qts;
 
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-        devstr = "virtio-net-ccw";
-    }
-
     ret = socketpair(PF_UNIX, SOCK_STREAM, 0, send_sock);
     g_assert_cmpint(ret, !=, -1);
 
@@ -42,11 +37,10 @@ static void test_mirror(void)
     g_assert_cmpint(ret, !=, -1);
 
     qts = qtest_initf(
-        "-netdev socket,id=qtest-bn0,fd=%d "
-        "-device %s,netdev=qtest-bn0,id=qtest-e0 "
+        "-nic socket,id=qtest-bn0,fd=%d "
         "-chardev socket,id=mirror0,fd=%d "
         "-object filter-mirror,id=qtest-f0,netdev=qtest-bn0,queue=tx,outdev=mirror0 "
-        , send_sock[1], devstr, recv_sock[1]);
+        , send_sock[1], recv_sock[1]);
 
     struct iovec iov[] = {
         {
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index 4269b2cdd9..4f3f59cba8 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -62,16 +62,6 @@
 /* TODO actually test the results and get rid of this */
 #define qmp_discard_response(qs, ...) qobject_unref(qtest_qmp(qs, __VA_ARGS__))
 
-static const char *get_devstr(void)
-{
-    if (g_str_equal(qtest_get_arch(), "s390x")) {
-        return "virtio-net-ccw";
-    }
-
-    return "rtl8139";
-}
-
-
 static void test_redirector_tx(void)
 {
     int backend_sock[2], recv_sock;
@@ -93,8 +83,7 @@ static void test_redirector_tx(void)
     g_assert_cmpint(ret, !=, -1);
 
     qts = qtest_initf(
-        "-netdev socket,id=qtest-bn0,fd=%d "
-        "-device %s,netdev=qtest-bn0,id=qtest-e0 "
+        "-nic socket,id=qtest-bn0,fd=%d "
         "-chardev socket,id=redirector0,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector1,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector2,path=%s "
@@ -103,7 +92,7 @@ static void test_redirector_tx(void)
         "-object filter-redirector,id=qtest-f1,netdev=qtest-bn0,"
         "queue=tx,indev=redirector2 "
         "-object filter-redirector,id=qtest-f2,netdev=qtest-bn0,"
-        "queue=tx,outdev=redirector1 ", backend_sock[1], get_devstr(),
+        "queue=tx,outdev=redirector1 ", backend_sock[1],
         sock_path0, sock_path1, sock_path0);
 
     recv_sock = unix_connect(sock_path1, NULL);
@@ -163,8 +152,7 @@ static void test_redirector_rx(void)
     g_assert_cmpint(ret, !=, -1);
 
     qts = qtest_initf(
-        "-netdev socket,id=qtest-bn0,fd=%d "
-        "-device %s,netdev=qtest-bn0,id=qtest-e0 "
+        "-nic socket,id=qtest-bn0,fd=%d "
         "-chardev socket,id=redirector0,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector1,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector2,path=%s "
@@ -173,7 +161,7 @@ static void test_redirector_rx(void)
         "-object filter-redirector,id=qtest-f1,netdev=qtest-bn0,"
         "queue=rx,outdev=redirector2 "
         "-object filter-redirector,id=qtest-f2,netdev=qtest-bn0,"
-        "queue=rx,indev=redirector1 ", backend_sock[1], get_devstr(),
+        "queue=rx,indev=redirector1 ", backend_sock[1],
         sock_path0, sock_path1, sock_path0);
 
     struct iovec iov[] = {
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


