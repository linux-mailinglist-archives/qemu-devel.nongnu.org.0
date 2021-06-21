Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A73AE498
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:11:55 +0200 (CEST)
Received: from localhost ([::1]:56698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF2A-0003AG-Dj
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEzA-0006yH-Mw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEz8-0000vw-L9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624262925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2mGkc/78nvkDGq8d5H8Ag9G4LB77T0uAoKH8O6U54I=;
 b=hgNsgW/UDIclEg8EJbKZuDCGjL7AeSIo9/9wghCM4NHqNRgSGvCCzSTiR2ZFvPH0p5P1LS
 zPnadPvLDGSScL3WcAFKHSoKYclbCuhV3RI2Y2ZMVBp0zctBp+0CmaBLGjNSrXWy9ytRCW
 hrmmhvFv7nqh+c9qUTyAza2v6X5tIno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-LxBHCx-7NyKDW8CMqu_Y8Q-1; Mon, 21 Jun 2021 04:08:44 -0400
X-MC-Unique: LxBHCx-7NyKDW8CMqu_Y8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16C09100CCC8;
 Mon, 21 Jun 2021 08:08:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8044060E1C;
 Mon, 21 Jun 2021 08:08:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com, peterx@redhat.com
Subject: [PATCH v3 1/3] Acceptance Tests: Add default kernel params and
 pxeboot url to the KNOWN_DISTROS collection
Date: Mon, 21 Jun 2021 10:08:22 +0200
Message-Id: <20210621080824.789274-2-eric.auger@redhat.com>
In-Reply-To: <20210621080824.789274-1-eric.auger@redhat.com>
References: <20210621080824.789274-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running LinuxTests we may need to run the guest with
custom params. It is practical to store the pxeboot URL
and the default kernel params so that the
tests just need to fetch those and augment the kernel params.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- add fed32 and fed33 checksums
---
 tests/acceptance/avocado_qemu/__init__.py | 52 ++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 81ac90bebb..8152420fa5 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -305,17 +305,59 @@ def ssh_command(self, command):
     'fedora': {
         '31': {
             'x86_64':
-            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
+            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
+             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
+                            "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
+             'kernel_params': "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
+                              "no_timer_check net.ifnames=0 "
+                              "console=tty1 console=ttyS0,115200n8"},
             'aarch64':
-            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
+            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
+             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
+                            "linux/releases/31/Everything/aarch64/os/images/pxeboot/",
+             'kernel_params': "root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
+                              "earlyprintk=pl011,0x9000000 ignore_loglevel "
+                              "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
+                              "console=ttyAMA0 "},
             'ppc64':
             {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
             's390x':
             {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
             }
+        ,
+        '32': {
+            'aarch64':
+            { 'kernel_params': "root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5 ro "
+                              "no_timer_check net.ifnames=0 console=tty1 "
+                              "console=ttyS0,115200n8 ",
+              'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
+              'pxeboot_url':  "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
+                              "32/Server/aarch64/os/images/pxeboot/"},
+            }
+        ,
+        '33': {
+            'aarch64':
+            { 'kernel_params': "root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a ro "
+                              "no_timer_check net.ifnames=0 console=tty1 "
+                              "console=ttyS0,115200n8 console=tty0 ",
+              'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
+              'pxeboot_url':  "https://ftp.lip6.fr/ftp/pub/linux/distributions/fedora/releases/"
+                              "33/Server/aarch64/os/images/pxeboot/"},
+            }
         }
     }
 
+def get_known_distro_kernel_params(distro, distro_version, arch):
+    try:
+        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('kernel_params')
+    except AttributeError:
+        return None
+
+def get_known_distro_pxeboot_url(distro, distro_version, arch):
+    try:
+        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('pxeboot_url')
+    except AttributeError:
+        return None
 
 def get_known_distro_checksum(distro, distro_version, arch):
     try:
@@ -449,6 +491,12 @@ def set_up_cloudinit(self, ssh_pubkey=None):
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
+    def get_default_kernel_params(self):
+        return get_known_distro_kernel_params(self.distro, self.distro_version, self.arch)
+
+    def get_pxeboot_url(self):
+        return get_known_distro_pxeboot_url(self.distro, self.distro_version, self.arch)
+
     def launch_and_wait(self, set_up_ssh_connection=True):
         self.vm.set_console()
         self.vm.launch()
-- 
2.26.3


