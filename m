Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D257313F27
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:38:07 +0100 (CET)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CMI-0005yE-Bs
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96k9-00038y-QS
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jv-00054M-Go
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrjRolBqzvx3TVpQAliwRxg0JEen6JUgkxKwhs5FXZA=;
 b=hF+lTt7r2iwpEWjW9K6/+jNmIshkSg1wqW4Jjw9oXtrgb2PTWTcxfkZlleB7F9ZTN9EheJ
 Z0pWa9ehYNSfLO/MQEs7nuzAX8Zc5OfdFXyEE+PwRQBn/DrRtDqrxzVjV2bwzZmSmcecVR
 UpOY86dWo7v125ildT7l4UhTPrSPnBw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-nYUjMaQsMWGQzZOmBV1AjQ-1; Mon, 08 Feb 2021 08:38:03 -0500
X-MC-Unique: nYUjMaQsMWGQzZOmBV1AjQ-1
Received: by mail-wm1-f70.google.com with SMTP id b62so8692372wmc.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrjRolBqzvx3TVpQAliwRxg0JEen6JUgkxKwhs5FXZA=;
 b=eVJXD8Rb2m2EVgIncrp9gRHOFgGPYRo+YpsFbV8el58tSEzVTelo8QXUgjJ4rm1iVk
 8Br8vEwn0CZbbq0/gaqlBBfnNzPO72VWigfmJVhNzSXaKpGiLAwZVl9rQAPKFEmFv8vF
 G6XYhzFqsddrXf2BzAWen9TjxMsEJSrHlfqFAp9bfY9NX6+4/6MDJC5185hvhdn0CDCo
 IeiF5x/Mvtq2RDzoOTNDJSnwe6KX14YkAQ/ZON2c4//bbRRcgPSPPWY3gYl9gtIa8MeP
 1OQMaYPWK9ZRADGitWfRPt8T++JXfUlkfXa5tQfLp44MYItHGbVt4uNTwEDYpC5PeQWB
 NAEg==
X-Gm-Message-State: AOAM531Tq+cL6anvbO/xxFUsztm1kWhxWHuqmYhiXOfxiMOcowf9SHvc
 c499k4N7C3t0obLQuhnTkYVnP6F6YLmYGKN8PNHvjntxaEfAUOsIlD1tWFmOtSArCdCnAM+PcX5
 tqQgfVQUK6zOy8cx5ZtXpZPN/rPvEFKbrNUL9ynIIb+3eO81xdk4qtkylLkvo4Z5H
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr15260533wme.28.1612791481462; 
 Mon, 08 Feb 2021 05:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGMGl9n0x6oci64XMlQsIp/DAD0K7AOnK/74rceQMatDzuRGgZfLYHRig9G0yoiDR/8QOXhw==
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr15260506wme.28.1612791481091; 
 Mon, 08 Feb 2021 05:38:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c62sm21511657wmd.43.2021.02.08.05.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] tests/acceptance: Re-enable the microblaze test
Date: Mon,  8 Feb 2021 14:37:02 +0100
Message-Id: <20210208133711.2596075-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The microblaze kernel sometimes gets stuck during boot (ca. 1 out of 200
times), so we disabled the corresponding acceptance tests some months
ago. However, it's likely better to check that the kernel is still
starting than to not testing it at all anymore. Move the test to
a separate file, enable it again and check for an earlier console
message that should always appear.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210128152815.585478-1-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS                            |  1 +
 tests/acceptance/boot_linux_console.py |  9 -------
 tests/acceptance/machine_microblaze.py | 35 ++++++++++++++++++++++++++
 3 files changed, 36 insertions(+), 9 deletions(-)
 create mode 100644 tests/acceptance/machine_microblaze.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 9543d7c44a2..99621abf8d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1119,6 +1119,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
 F: include/hw/char/xilinx_uartlite.h
+F: tests/acceptance/machine_microblaze.py
 
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index c34075d5378..eb012867997 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1056,15 +1056,6 @@ def test_m68k_mcf5208evb(self):
         tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
         self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
 
-    @skip("Test currently broken") # Console stuck as of 5.2-rc1
-    def test_microblaze_s3adsp1800(self):
-        """
-        :avocado: tags=arch:microblaze
-        :avocado: tags=machine:petalogix-s3adsp1800
-        """
-        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
-        self.do_test_advcal_2018('17', tar_hash, 'ballerina.bin')
-
     def test_or1k_sim(self):
         """
         :avocado: tags=arch:or1k
diff --git a/tests/acceptance/machine_microblaze.py b/tests/acceptance/machine_microblaze.py
new file mode 100644
index 00000000000..7f6d18495d8
--- /dev/null
+++ b/tests/acceptance/machine_microblaze.py
@@ -0,0 +1,35 @@
+# Functional test that boots a microblaze Linux kernel and checks the console
+#
+# Copyright (c) 2018, 2021 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import archive
+
+class MicroblazeMachine(Test):
+
+    timeout = 90
+
+    def test_microblaze_s3adsp1800(self):
+        """
+        :avocado: tags=arch:microblaze
+        :avocado: tags=machine:petalogix-s3adsp1800
+        """
+
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2018/download/day17.tar.xz')
+        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/day17/ballerina.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'This architecture does not have '
+                                       'kernel memory protection')
+        # Note:
+        # The kernel sometimes gets stuck after the "This architecture ..."
+        # message, that's why we don't test for a later string here. This
+        # needs some investigation by a microblaze wizard one day...
-- 
2.26.2


