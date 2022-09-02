Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A723A5AB6F4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:55:50 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9xN-0008R7-Mu
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tW-0002YR-KT
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tU-0003Rh-Sh
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fi5zrVicNk7ldz8Y7Hcjeb19UvU8Pgs5bxFvt/horYc=;
 b=iPka77RQU+cNvcV4a1Mpl9stIJU88qxw3rrOym6NQkzW7WRw/dd1TQoyNQDINTtFpX8an9
 pDvtjU9VOoNNRSwSjn91PkvDF4IhTbow2J+kTIz2S/ggS1ssLhCYuNwUGfnqesUV+jSQdU
 /z8/5XyVu5SOJxSoXW08w81a1RIwqoY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-EMstl2QVOrez0y-xIrfhTg-1; Fri, 02 Sep 2022 12:51:45 -0400
X-MC-Unique: EMstl2QVOrez0y-xIrfhTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 912D53C0ED53;
 Fri,  2 Sep 2022 16:51:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 643422026D4C;
 Fri,  2 Sep 2022 16:51:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 4/8] tests/qtest: Add -vga none by default
Date: Fri,  2 Sep 2022 18:51:22 +0200
Message-Id: <20220902165126.1482-5-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing in qtest where using vga by default except for
dbus-display-test.  We add -device VGA there.

The only other test that fails after this change is:

109/659 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test ERROR
21.34s killed by signal 6 SIGABRT

Bail out! ERROR:../../../../mnt/code/qemu/full/tests/qtest/virtio-iommu-test.c:189:test_attach_detach: assertion failed (ret == 0): (6 == 0)
stderr:
qemu-system-ppc64: warning: nic e1000.0 has no peer
qemu-system-ppc64: warning: nic e1000-82544gc.0 has no peer
qemu-system-ppc64: warning: nic e1000-82545em.0 has no peer
qemu-system-ppc64: warning: nic i82550.0 has no peer
qemu-system-ppc64: warning: nic i82551.0 has no peer
qemu-system-ppc64: warning: nic i82557a.0 has no peer
qemu-system-ppc64: warning: nic i82557b.0 has no peer
qemu-system-ppc64: warning: nic i82557c.0 has no peer
qemu-system-ppc64: warning: nic i82558a.0 has no peer
qemu-system-ppc64: warning: nic i82558b.0 has no peer
qemu-system-ppc64: warning: nic i82559a.0 has no peer
qemu-system-ppc64: warning: nic i82559b.0 has no peer
qemu-system-ppc64: warning: nic i82559c.0 has no peer
qemu-system-ppc64: warning: nic i82559er.0 has no peer
qemu-system-ppc64: warning: nic i82562.0 has no peer
qemu-system-ppc64: warning: nic i82801.0 has no peer
qemu-system-ppc64: warning: nic ne2k_pci.0 has no peer
qemu-system-ppc64: warning: nic tulip.0 has no peer
qemu-system-ppc64: warning: nic pcnet.0 has no peer
qemu-system-ppc64: warning: nic vmxnet3.0 has no peer
**
ERROR:../../../../mnt/code/qemu/full/tests/qtest/virtio-iommu-test.c:189:test_attach_detach: assertion failed (ret == 0): (6 == 0)

(test program exited with status code -6)
------------------------------------------

Problem is with virtio-iommu-test.c attach_detach test.  My
understanding is that the problem is that for pseries.

$ export QTEST_QEMU_BINARY=./qemu-system-ppc64
$ ./tests/qtest/qos-test -p /ppc64/pseries/spapr-pci-host-bridge/pci-bus-spapr/pci-bus/virtio-iommu-pci/virtio-iommu/virtio-iommu-tests/attach_detach
**
ERROR:../../../../mnt/code/qemu/full/tests/qtest/virtio-iommu-test.c:189:test_attach_detach: assertion failed (ret == 0): (6 == 0)
Bail out! ERROR:../../../../mnt/code/qemu/full/tests/qtest/virtio-iommu-test.c:189:test_attach_detach: assertion failed (ret == 0): (6 == 0)
Aborted (core dumped)

My understanding is that if I remove the vga device, pseries end
without any device on the pci bus and somehow it completely breaks.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/boot-serial-test.c  |  4 ++--
 tests/qtest/dbus-display-test.c |  2 +-
 tests/qtest/display-vga-test.c  | 12 ++++++------
 tests/qtest/libqtest.c          |  1 +
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 2f99d71cab..500a312cb5 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -144,7 +144,7 @@ static testdef_t tests[] = {
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
     { "ppc", "ppce500", "", "U-Boot" },
-    { "ppc", "40p", "-vga none -boot d", "Trying cd:," },
+    { "ppc", "40p", "-boot d", "Trying cd:," },
     { "ppc", "g3beige", "", "PowerPC,750" },
     { "ppc", "mac99", "", "PowerPC,G4" },
     { "ppc", "sam460ex", "-m 256", "DRAM:  256 MiB" },
@@ -175,7 +175,7 @@ static testdef_t tests[] = {
       sizeof(kernel_plml605), kernel_plml605 },
     { "arm", "raspi2b", "", "TT", sizeof(bios_raspi2), 0, bios_raspi2 },
     /* For hppa, force bios to output to serial by disabling graphics. */
-    { "hppa", "hppa", "-vga none", "SeaBIOS wants SYSTEM HALT" },
+    { "hppa", "hppa", "", "SeaBIOS wants SYSTEM HALT" },
     { "aarch64", "virt", "-cpu max", "TT", sizeof(kernel_aarch64),
       kernel_aarch64 },
     { "arm", "microbit", "", "T", sizeof(kernel_nrf51), kernel_nrf51 },
diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
index 8be5974763..4e428cff55 100644
--- a/tests/qtest/dbus-display-test.c
+++ b/tests/qtest/dbus-display-test.c
@@ -34,7 +34,7 @@ test_setup(QTestState **qts, GDBusConnection **conn)
 {
     int pair[2];
 
-    *qts = qtest_init("-display dbus,p2p=yes -name dbus-test");
+    *qts = qtest_init("-display dbus,p2p=yes -device VGA -name dbus-test");
 
     g_assert_cmpint(socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
 
diff --git a/tests/qtest/display-vga-test.c b/tests/qtest/display-vga-test.c
index ace3bb28e0..ba3d1fcb36 100644
--- a/tests/qtest/display-vga-test.c
+++ b/tests/qtest/display-vga-test.c
@@ -12,37 +12,37 @@
 
 static void pci_cirrus(void)
 {
-    qtest_start("-vga none -device cirrus-vga");
+    qtest_start("-device cirrus-vga");
     qtest_end();
 }
 
 static void pci_stdvga(void)
 {
-    qtest_start("-vga none -device VGA");
+    qtest_start("-device VGA");
     qtest_end();
 }
 
 static void pci_secondary(void)
 {
-    qtest_start("-vga none -device secondary-vga");
+    qtest_start("-device secondary-vga");
     qtest_end();
 }
 
 static void pci_multihead(void)
 {
-    qtest_start("-vga none -device VGA -device secondary-vga");
+    qtest_start("-device VGA -device secondary-vga");
     qtest_end();
 }
 
 static void pci_virtio_gpu(void)
 {
-    qtest_start("-vga none -device virtio-gpu-pci");
+    qtest_start("-device virtio-gpu-pci");
     qtest_end();
 }
 
 static void pci_virtio_vga(void)
 {
-    qtest_start("-vga none -device virtio-vga");
+    qtest_start("-device virtio-vga");
     qtest_end();
 }
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index ee84dbfc36..16068b1b85 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -291,6 +291,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
                               "-mon chardev=char0,mode=control "
                               "-display none "
                               "-net none "
+                              "-vga none "
                               "%s"
                               " -accel qtest",
                               qemu_binary, tracearg, socket_path,
-- 
2.37.2


