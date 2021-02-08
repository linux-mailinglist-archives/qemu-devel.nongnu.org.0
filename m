Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B422313EEC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:28:59 +0100 (CET)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CDS-0006Ym-5Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jO-00032h-Pv
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jI-0004zk-Kq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gKSefXopzRxtb9v5Y5RO90UGTU966dCGUeKM2oJe9pM=;
 b=CkwvFHEegGmrwqzGkFoCzCRgW/vMJ6sLqZ8Aw5+J/G2Gk+fJQwI3AX6U2C58nUT3NGW1q8
 BWgf+WpwX3AGt0Tvj5JEmsYsePqCDyfjEVnd004dInIWJO0Fwk9ggeWLgJQWXcIm5Amfhu
 aJPC3utVpgvZSf2Ed8+ef5vjFZhj2nY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-enNia-EHOh23aPjpv4DZ5A-1; Mon, 08 Feb 2021 08:37:26 -0500
X-MC-Unique: enNia-EHOh23aPjpv4DZ5A-1
Received: by mail-wm1-f69.google.com with SMTP id q24so8658941wmc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKSefXopzRxtb9v5Y5RO90UGTU966dCGUeKM2oJe9pM=;
 b=sBTyuX0tejYWIb7fPiIDO4P8aIwr8Ur1+YEAue4rmKg0x+zrlAvhBkbm9Cbyn8zet5
 lCrZ+ouKi8kHzrC2Yj7tBu+bmikI9Unwq3EgsLrsd9mBp5Qgxqh4m6ogoQbQpCqgewhg
 atM71gy8hdIJPlp0og/juDHQXjAT2dUL/3vhosurs7vplCghMC9/5YntdjUZ1ROdIyrM
 qc6/i9YCpyRw1JNDRhOtou1Wl0JjMGmT5hNYiblb/j3CD/maRqbPL/A/yRhLuA2w2F6d
 Xcq0rgWBrJcp4w/6J/0utHWjmA7SfMMOAEDfDo2572vdAJqTiv0s0CeZb8TjG03B/a6q
 geMg==
X-Gm-Message-State: AOAM533OD0uVVThKBPgJHuygPdntFuMEtmow6LicfGPA3v/ehVISQJK+
 f8tHC5udIFbet8VCuW9kYpRZgZP64Bu7TLIGlpbcV+bPw8enHc63C8Mps6FDYKTwyNySOiz3cZ2
 h5zW83d+pylFYoeAfufp6T8nMgkl7Nz35q8bk6ekx1PGjLCuNu84K+tKo3yDovuJ6
X-Received: by 2002:adf:e809:: with SMTP id o9mr6519385wrm.137.1612791445112; 
 Mon, 08 Feb 2021 05:37:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbCUE/71sl4ykxHJeD//6I9Vz+CgigCrvPW/h/UvdPj1abvsMHm6Nq/+mV4gi6k9VorznBpg==
X-Received: by 2002:adf:e809:: with SMTP id o9mr6519356wrm.137.1612791444771; 
 Mon, 08 Feb 2021 05:37:24 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s6sm21016927wmh.2.2021.02.08.05.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] tests/acceptance: Introduce tesseract_ocr() helper
Date: Mon,  8 Feb 2021 14:36:55 +0100
Message-Id: <20210208133711.2596075-3-philmd@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to reuse the tesseract OCR code.
Create a new tesseract_ocr() helper and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201021105035.2477784-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/machine_m68k_nextcube.py | 21 +++++----------------
 tests/acceptance/tesseract_utils.py       | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/acceptance/machine_m68k_nextcube.py
index 3c7400c43e4..09e2745cc52 100644
--- a/tests/acceptance/machine_m68k_nextcube.py
+++ b/tests/acceptance/machine_m68k_nextcube.py
@@ -7,13 +7,11 @@
 
 import os
 import time
-import logging
 
 from avocado_qemu import Test
 from avocado import skipUnless
-from avocado.utils import process
 
-from tesseract_utils import tesseract_available
+from tesseract_utils import tesseract_available, tesseract_ocr
 
 PIL_AVAILABLE = True
 try:
@@ -61,12 +59,8 @@ def test_bootrom_framebuffer_size(self):
     def test_bootrom_framebuffer_ocr_with_tesseract_v3(self):
         screenshot_path = os.path.join(self.workdir, "dump.ppm")
         self.check_bootrom_framebuffer(screenshot_path)
-
-        console_logger = logging.getLogger('console')
-        text = process.run("tesseract %s stdout" % screenshot_path).stdout_text
-        for line in text.split('\n'):
-            if len(line):
-                console_logger.debug(line)
+        lines = tesseract_ocr(screenshot_path, tesseract_version=3)
+        text = '\n'.join(lines)
         self.assertIn('Backplane', text)
         self.assertIn('Ethernet address', text)
 
@@ -77,13 +71,8 @@ def test_bootrom_framebuffer_ocr_with_tesseract_v3(self):
     def test_bootrom_framebuffer_ocr_with_tesseract_v4(self):
         screenshot_path = os.path.join(self.workdir, "dump.ppm")
         self.check_bootrom_framebuffer(screenshot_path)
-
-        console_logger = logging.getLogger('console')
-        proc = process.run("tesseract --oem 1 %s stdout" % screenshot_path)
-        text = proc.stdout_text
-        for line in text.split('\n'):
-            if len(line):
-                console_logger.debug(line)
+        lines = tesseract_ocr(screenshot_path, tesseract_version=4)
+        text = '\n'.join(lines)
         self.assertIn('Testing the FPU, SCC', text)
         self.assertIn('System test failed. Error code', text)
         self.assertIn('Boot command', text)
diff --git a/tests/acceptance/tesseract_utils.py b/tests/acceptance/tesseract_utils.py
index acd6e8c2faa..72cd9ab7989 100644
--- a/tests/acceptance/tesseract_utils.py
+++ b/tests/acceptance/tesseract_utils.py
@@ -6,7 +6,9 @@
 # later. See the COPYING file in the top-level directory.
 
 import re
+import logging
 
+from avocado.utils import process
 from avocado.utils.path import find_command, CmdNotFoundError
 
 def tesseract_available(expected_version):
@@ -26,3 +28,19 @@ def tesseract_available(expected_version):
         return False
     # now this is guaranteed to be a digit
     return int(match.groups()[0]) == expected_version
+
+
+def tesseract_ocr(image_path, tesseract_args='', tesseract_version=3):
+    console_logger = logging.getLogger('tesseract')
+    console_logger.debug(image_path)
+    if tesseract_version == 4:
+        tesseract_args += ' --oem 1'
+    proc = process.run("tesseract {} {} stdout".format(tesseract_args,
+                                                       image_path))
+    lines = []
+    for line in proc.stdout_text.split('\n'):
+        sline = line.strip()
+        if len(sline):
+            console_logger.debug(sline)
+            lines += [sline]
+    return lines
-- 
2.26.2


