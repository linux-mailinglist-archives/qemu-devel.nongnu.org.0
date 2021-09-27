Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF8419B68
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:17:19 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuFi-00075R-8S
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1y-0002XR-QF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1v-00033M-P8
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRgWYEGsAgU7uIIj68INIPW3631NH105ds18Xph/6rE=;
 b=Is3V1atxTKS0laSQYv1VuYnQcdGhKQHHBZiyMNstabgpVq5yfFVB3zbPX9oRPEZCyxoISf
 LXBASwoZCFC0t5cc4ClKZhga3Uuj5oauvovFiCx9QV3k/ODfgsK06Vlu1W+FSQkwj5CW2Y
 hZVSBXhlAQULfDTRQiXl2gDMozdma6M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-BreAnMqoMIKzFnYpLciewQ-1; Mon, 27 Sep 2021 13:02:54 -0400
X-MC-Unique: BreAnMqoMIKzFnYpLciewQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so177686wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRgWYEGsAgU7uIIj68INIPW3631NH105ds18Xph/6rE=;
 b=r/buyeL7sz/V64PhrZHcgnievjH2QZuA/a2reBTq+KijvIt3IxEFqJoO4rYsmUCyUM
 lCRuOYVAI+SlmH2eYDWxEJIdDe2CO5fNsVzShVvgQzwsglzwRFWHCc5gvK2hvGvf8zZt
 4KraFuw7pZ2akAKh1PST6o8I5Rj5gX2J49KSFZF5FtpQYcNuK3eywUgjtVGgj6wTq3H1
 BIvJbfPyRd1MHHAOu6z1Lu4imFM4++yvGin7dnfwaI4elA0toW3bDM1/JB4c91dMJ2mZ
 XDDJCBF0YF6+ikZsn5uqXBvah1Guv6UYkSRNipj83+ZF+JJe8Qek9aZYKchrXb/CFfRh
 LJJw==
X-Gm-Message-State: AOAM531lzJsPx+4CE8F8Yz7jXaNGQCJLQNHJe6FiyYykWEq70PL0K75w
 NUCrgVWhiznFCPU/w57PjT5LnbirrzVTLU2Ew9rJorTc6SWhklw3Sf5Oc6CjOV4jZtJOzwSWFhR
 9I8/Eu+VJkdLlIW7gdi0kmGxgqQuZuQSsmrewYvKZ6ISEA+WKmSAuNoAeDlro/D78
X-Received: by 2002:adf:ded1:: with SMTP id i17mr1075170wrn.83.1632762172044; 
 Mon, 27 Sep 2021 10:02:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqiLU35jXyGdjD/P8O5Tevc+W3mytoyTvWIX4B9mr1aQ8vyK7iZQXUrw5hCkv96HMKmRIdIQ==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr1075133wrn.83.1632762171773; 
 Mon, 27 Sep 2021 10:02:51 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id m2sm104958wmm.3.2021.09.27.10.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] tests/acceptance: Linux boot test for record/replay
Date: Mon, 27 Sep 2021 19:02:11 +0200
Message-Id: <20210927170227.2014482-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds a test for record/replay, which boots Linux
image from the disk and interacts with the network.
The idea and code of this test is borrowed from boot_linux.py
This test includes only x86_64 platform. Other platforms and
machines will be added later after testing and improving
record/replay to completely support them.

Each test consists of the following phases:
 - downloading the disk image
 - recording the execution
 - replaying the execution

Replay does not validates the output, but waits until QEMU
finishes the execution. This is reasonable, because
QEMU usually hangs when replay goes wrong.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <162737554047.1735673.13133593401566029378.stgit@pasha-ThinkPad-X280>
---
 MAINTAINERS                      |   1 +
 tests/acceptance/replay_linux.py | 116 +++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 tests/acceptance/replay_linux.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d7915ec128e..069db6d2995 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2973,6 +2973,7 @@ F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
 F: tests/acceptance/replay_kernel.py
+F: tests/acceptance/replay_linux.py
 F: tests/acceptance/reverse_debugging.py
 F: qapi/replay.json
 
diff --git a/tests/acceptance/replay_linux.py b/tests/acceptance/replay_linux.py
new file mode 100644
index 00000000000..15953f9e496
--- /dev/null
+++ b/tests/acceptance/replay_linux.py
@@ -0,0 +1,116 @@
+# Record/replay test that boots a complete Linux system via a cloud image
+#
+# Copyright (c) 2020 ISP RAS
+#
+# Author:
+#  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+import logging
+import time
+
+from avocado import skipUnless
+from avocado.utils import cloudinit
+from avocado.utils import network
+from avocado.utils import vmimage
+from avocado.utils import datadrainer
+from avocado.utils.path import find_command
+from avocado_qemu import LinuxTest
+
+class ReplayLinux(LinuxTest):
+    """
+    Boots a Linux system, checking for a successful initialization
+    """
+
+    timeout = 1800
+    chksum = None
+    hdd = 'ide-hd'
+    cd = 'ide-cd'
+    bus = 'ide'
+
+    def setUp(self):
+        super(ReplayLinux, self).setUp()
+        self.boot_path = self.download_boot()
+        self.cloudinit_path = self.prepare_cloudinit()
+
+    def vm_add_disk(self, vm, path, id, device):
+        bus_string = ''
+        if self.bus:
+            bus_string = ',bus=%s.%d' % (self.bus, id,)
+        vm.add_args('-drive', 'file=%s,snapshot,id=disk%s,if=none' % (path, id))
+        vm.add_args('-drive',
+            'driver=blkreplay,id=disk%s-rr,if=none,image=disk%s' % (id, id))
+        vm.add_args('-device',
+            '%s,drive=disk%s-rr%s' % (device, id, bus_string))
+
+    def launch_and_wait(self, record, args, shift):
+        vm = self.get_vm()
+        vm.add_args('-smp', '1')
+        vm.add_args('-m', '1024')
+        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
+        if args:
+            vm.add_args(*args)
+        self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
+        self.vm_add_disk(vm, self.cloudinit_path, 1, self.cd)
+        logger = logging.getLogger('replay')
+        if record:
+            logger.info('recording the execution...')
+            mode = 'record'
+        else:
+            logger.info('replaying the execution...')
+            mode = 'replay'
+        replay_path = os.path.join(self.workdir, 'replay.bin')
+        vm.add_args('-icount', 'shift=%s,rr=%s,rrfile=%s' %
+                    (shift, mode, replay_path))
+
+        start_time = time.time()
+
+        vm.set_console()
+        vm.launch()
+        console_drainer = datadrainer.LineLogger(vm.console_socket.fileno(),
+                                    logger=self.log.getChild('console'),
+                                    stop_check=(lambda : not vm.is_running()))
+        console_drainer.start()
+        if record:
+            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
+                                          self.name)
+            vm.shutdown()
+            logger.info('finished the recording with log size %s bytes'
+                % os.path.getsize(replay_path))
+        else:
+            vm.event_wait('SHUTDOWN', self.timeout)
+            vm.shutdown(True)
+            logger.info('successfully fihished the replay')
+        elapsed = time.time() - start_time
+        logger.info('elapsed time %.2f sec' % elapsed)
+        return elapsed
+
+    def run_rr(self, args=None, shift=7):
+        t1 = self.launch_and_wait(True, args, shift)
+        t2 = self.launch_and_wait(False, args, shift)
+        logger = logging.getLogger('replay')
+        logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxX8664(ReplayLinux):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=accel:tcg
+    """
+
+    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+
+    def test_pc_i440fx(self):
+        """
+        :avocado: tags=machine:pc
+        """
+        self.run_rr(shift=1)
+
+    def test_pc_q35(self):
+        """
+        :avocado: tags=machine:q35
+        """
+        self.run_rr(shift=3)
-- 
2.31.1


