Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDA6F08B6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:50:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oh-00029R-IY; Thu, 27 Apr 2023 11:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o9-0001r6-GP
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o6-0004lo-Al
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:20 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso49350365e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oa1kZsBc5Tdan51WU2r4Uy35B4rpsLKztYDttyHE2dE=;
 b=aUR3iCC21rS2lk7U91g3xkZjGsHncZ0+K0lxjIj1SnA9n8tzTJTQIjRtv0gxyUOW9A
 kFQIDaLsykGkUSw7L9tvClVgWKi+hxjIe28ePdlRGH0zTngMpeDm6LBez38SndaLumw2
 xJ0XsjJQujmVOWY8/fG7jzDJQjd6vZyJ/uTb1u/SPDgPOSrIkq2X2I2FWkQ/FXnS9kOm
 2l5jdAsv1PL0hamfRIz7O4P5ypHdIzJyzfQuxiv5l0aN87MAl/Csfnes1ACmi9IL6sX6
 /ghy3Xqogn9+/cdSipX+VzNAGgTr5fRnyG2Chp8hPOM+0PZM+Wb06+9UrKQbct9z3wer
 F6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oa1kZsBc5Tdan51WU2r4Uy35B4rpsLKztYDttyHE2dE=;
 b=WMbD+agK2QqZKNuliYcG+xXDB9IQN/CLEIIZb1CG3XaksiIaPz640dGiRtMrZMFyjM
 J5BAU93jH6jjBSNfzNU6zex36l8Na9W9yprdWS3Jt4elFzpKJ13a3QSkdeIaSEC+IEII
 uI2RW00uI4JwY4hOsYS5kEQ2nepx7ahcG9FmP6zx2lfhmmyFeMl7+jAfighEUSvoqR1S
 ENUBljhgoYP6CHXktbHjJlQjoB5ff3iBkGxql85iQugNHe63UduC0xWQJuxFtweyPIkn
 +4gxYr6EhHapg+p1TeHYqlkXwmGgJbCA1OvJvqhldY+R5n/H46TlIB/KqDJxM5n27bkV
 bjVg==
X-Gm-Message-State: AC+VfDzqXjo/uJoAzYeNM7MKhKKEOHMVzCMH3izks9bMqtZIf75spzNk
 69Kwt88Ab0hy0IuAbNNbY/HTOA==
X-Google-Smtp-Source: ACHHUZ47tZazc2BooeXrNqjVyKY8jDMvYI6Zl2MpvWWkl8xATyeibGJp06sImef4y+r3s7R2agm2rA==
X-Received: by 2002:a1c:7c12:0:b0:3f1:6fba:b69a with SMTP id
 x18-20020a1c7c12000000b003f16fbab69amr1848532wmc.11.1682610316862; 
 Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c3ac300b003f19b3d89e9sm15365227wms.33.2023.04.27.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8EA01FFC2;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 12/18] tests/avocado/tuxrun_baselines.py: improve code coverage
 for ppc64
Date: Thu, 27 Apr 2023 16:45:04 +0100
Message-Id: <20230427154510.1791273-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Commit c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb disabled the
boot_linux.py test-case due to which the code coverage for ppc
decreased by around 2%. As per the discussion on
https://lore.kernel.org/qemu-devel/87sfdpqcy4.fsf@linaro.org/ it
was mentioned that the baseline test for ppc64 could be modified
to make up this 2% code coverage. This patch attempts to achieve
this 2% code coverage by adding various device command line
arguments (to ./qemu-system-ppc64) in the tuxrun_baselines.py
test-case.

The code coverage report with boot_linux.py, without it and finally
with these tuxrun_baselines.py changes is as follows:

With boot_linux.py
------------------
  lines......: 13.8% (58006 of 420997 lines)
  functions..: 20.7% (7675 of 36993 functions)
  branches...: 9.2% (22146 of 240611 branches)
Without boot_linux.py (without this patch changes)
--------------------------------------------------
  lines......: 11.9% (50174 of 420997 lines)
  functions..: 18.8% (6947 of 36993 functions)
  branches...: 7.4% (17580 of 239017 branches)
Without boot_linux.py (with this patch changes)
-----------------------------------------------
  lines......: 13.8% (58287 of 420997 lines)
  functions..: 20.7% (7640 of 36993 functions)
  branches...: 8.4% (20223 of 240611 branches)

Rebased on Alex Benee's testing/next branch:
https://gitlab.com/stsquad/qemu/-/tree/testing/next

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424041830.1275636-1-kconsul@linux.vnet.ibm.com>
Message-Id: <20230424092249.58552-13-alex.bennee@linaro.org>

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index e8749717e9..3a46e7a745 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -11,6 +11,7 @@
 
 import os
 import time
+import tempfile
 
 from avocado import skip, skipIf
 from avocado_qemu import QemuSystemTest
@@ -72,6 +73,8 @@ def setUp(self):
         # Occasionally we need extra devices to hook things up
         self.extradev = self.get_tag('extradev')
 
+        self.qemu_img = super().get_qemu_img()
+
     def wait_for_console_pattern(self, success_message, vm=None):
         wait_for_console_pattern(self, success_message,
                                  failure_message='Kernel panic - not syncing',
@@ -179,6 +182,63 @@ def common_tuxrun(self,
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
 
+    def ppc64_common_tuxrun(self, sums, prefix):
+        # add device args to command line.
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
+                         '-device', 'virtio-net,netdev=vnet')
+        self.vm.add_args('-netdev', '{"type":"user","id":"hostnet0"}',
+                         '-device', '{"driver":"virtio-net-pci","netdev":'
+                         '"hostnet0","id":"net0","mac":"52:54:00:4c:e3:86",'
+                         '"bus":"pci.0","addr":"0x9"}')
+        self.vm.add_args('-device', '{"driver":"qemu-xhci","p2":15,"p3":15,'
+                         '"id":"usb","bus":"pci.0","addr":"0x2"}')
+        self.vm.add_args('-device', '{"driver":"virtio-scsi-pci","id":"scsi0"'
+                         ',"bus":"pci.0","addr":"0x3"}')
+        self.vm.add_args('-device', '{"driver":"virtio-serial-pci","id":'
+                         '"virtio-serial0","bus":"pci.0","addr":"0x4"}')
+        self.vm.add_args('-device', '{"driver":"scsi-cd","bus":"scsi0.0"'
+                         ',"channel":0,"scsi-id":0,"lun":0,"device_id":'
+                         '"drive-scsi0-0-0-0","id":"scsi0-0-0-0"}')
+        self.vm.add_args('-device', '{"driver":"virtio-balloon-pci",'
+                         '"id":"balloon0","bus":"pci.0","addr":"0x6"}')
+        self.vm.add_args('-audiodev', '{"id":"audio1","driver":"none"}')
+        self.vm.add_args('-device', '{"driver":"usb-tablet","id":"input0"'
+                         ',"bus":"usb.0","port":"1"}')
+        self.vm.add_args('-device', '{"driver":"usb-kbd","id":"input1"'
+                         ',"bus":"usb.0","port":"2"}')
+        self.vm.add_args('-device', '{"driver":"VGA","id":"video0",'
+                         '"vgamem_mb":16,"bus":"pci.0","addr":"0x7"}')
+        self.vm.add_args('-object', '{"qom-type":"rng-random","id":"objrng0"'
+                         ',"filename":"/dev/urandom"}',
+                         '-device', '{"driver":"virtio-rng-pci","rng":"objrng0"'
+                         ',"id":"rng0","bus":"pci.0","addr":"0x8"}')
+        self.vm.add_args('-object', '{"qom-type":"cryptodev-backend-builtin",'
+                         '"id":"objcrypto0","queues":1}',
+                         '-device', '{"driver":"virtio-crypto-pci",'
+                         '"cryptodev":"objcrypto0","id":"crypto0","bus"'
+                         ':"pci.0","addr":"0xa"}')
+        self.vm.add_args('-device', '{"driver":"spapr-pci-host-bridge"'
+                         ',"index":1,"id":"pci.1"}')
+        self.vm.add_args('-device', '{"driver":"spapr-vscsi","id":"scsi1"'
+                         ',"reg":12288}')
+        self.vm.add_args('-m', '2G,slots=32,maxmem=4G',
+                         '-object', 'memory-backend-ram,id=ram1,size=1G',
+                         '-device', 'pc-dimm,id=dimm1,memdev=ram1')
+
+        # Create a temporary qcow2 and launch the test-case
+        with tempfile.NamedTemporaryFile(prefix=prefix,
+                                         suffix='.qcow2') as qcow2:
+            process.run(self.qemu_img + ' create -f qcow2 ' +
+                        qcow2.name + ' 1G')
+
+            self.vm.add_args('-drive', 'file=' + qcow2.name +
+                         ',format=qcow2,if=none,id='
+                         'drive-virtio-disk1',
+                         '-device', 'virtio-blk-pci,scsi=off,bus=pci.0,'
+                         'addr=0xb,drive=drive-virtio-disk1,id=virtio-disk1'
+                         ',bootindex=2')
+            self.common_tuxrun(csums=sums, drive="scsi-hd")
+
     #
     # The tests themselves. The configuration is derived from how
     # tuxrun invokes qemu (with minor tweaks like using -blockdev
@@ -379,7 +439,7 @@ def test_ppc64(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=endian:big
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64
@@ -391,14 +451,13 @@ def test_ppc64(self):
                  "1d953e81a4379e537fc8e41e05a0a59d9b453eef97aa03d47866c6c45b00bdff",
                  "vmlinux" :
                  "f22a9b9e924174a4c199f4c7e5d91a2339fcfe51c6eafd0907dc3e09b64ab728" }
-
-        self.common_tuxrun(csums=sums, drive="scsi-hd")
+        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64_')
 
     def test_ppc64le(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
-        :avocado: tags=cpu:POWER8
+        :avocado: tags=cpu:POWER10
         :avocado: tags=console:hvc0
         :avocado: tags=tuxboot:ppc64le
         :avocado: tags=image:vmlinux
@@ -409,8 +468,7 @@ def test_ppc64le(self):
                  "b442678c93fb8abe1f7d3bfa20556488de6b475c22c8fed363f42cf81a0a3906",
                  "vmlinux" :
                  "979eb61b445a010fb13e2b927126991f8ceef9c590fa2be0996c00e293e80cf2" }
-
-        self.common_tuxrun(csums=sums, drive="scsi-hd")
+        self.ppc64_common_tuxrun(sums, prefix='tuxrun_ppc64le_')
 
     def test_riscv32(self):
         """
-- 
2.39.2


