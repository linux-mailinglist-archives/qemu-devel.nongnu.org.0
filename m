Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D3214CFB
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 16:14:04 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1js5P9-0001G5-An
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 10:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1js5FI-0007qX-Ee
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 10:03:52 -0400
Received: from mail-ej1-f46.google.com ([209.85.218.46]:33107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1js5FG-0008Ms-Hp
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 10:03:52 -0400
Received: by mail-ej1-f46.google.com with SMTP id n26so25730373ejx.0
 for <qemu-devel@nongnu.org>; Sun, 05 Jul 2020 07:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1T+auW0qYPkQo1Z9ArhhS+0Z6qwebNNeE+liAbp95Y=;
 b=RU6cr8cZEjnqy11EBtqAIkQtiZ1FlHU2SepASPCshzIfNVGVmHiaqxNMJmVloXw71F
 GL5TLt6zKn5nrDKksEJNKwzusniYnntDrFqeoxHYXVBm/n99nermTm45b6DOH56QG5t1
 j5DyckAo6ssIMkSyXtgh3mvBVOEE8GHrWHR7dZhSNICb8EeExyj5ug+hiQuoBsxqsASM
 hBPN8KNnaepYir5EvNOzt0v/sec01tjeJC3tn/EKK1APo2eS5pr+FRZ0h2joS3LZdy31
 iezpnoxht80dCyiw+pyAdxeEALehdLarPhntMlaYZtxXLNhHUH4ysfT/q7tX02XkeJd6
 2IXA==
X-Gm-Message-State: AOAM533LQaEf4i5AbVYxgTu6APttmFQXU2BBidAf0YocSwRWU+xeywuV
 G3OsPUWSJFT5/P22wlWfIkAccN64
X-Google-Smtp-Source: ABdhPJx4Ynk6/6aSe2XcXCrFJlh1jlYOCIk5t36q0fo9s3yD5slLDDS5wpETxffmeLUDD8OjGVNo8g==
X-Received: by 2002:a17:906:2616:: with SMTP id
 h22mr39210740ejc.154.1593957828955; 
 Sun, 05 Jul 2020 07:03:48 -0700 (PDT)
Received: from thl530.multi.box (pd9e83654.dip0.t-ipconnect.de.
 [217.232.54.84])
 by smtp.gmail.com with ESMTPSA id bq8sm10941776ejb.103.2020.07.05.07.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 07:03:48 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>
Subject: [PATCH rc6 29/30] tests/acceptance: Test the Arduino MEGA2560 board
Date: Sun,  5 Jul 2020 16:03:14 +0200
Message-Id: <20200705140315.260514-30-huth@tuxfamily.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200705140315.260514-1-huth@tuxfamily.org>
References: <20200705140315.260514-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.46; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f46.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 10:03:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=1,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Rolnik <mrolnik@gmail.com>

The test is based on
https://github.com/seharris/qemu-avr-tests/tree/master/free-rtos/Demo
demo which. If working correctly, prints 'ABCDEFGHIJKLMNOPQRSTUVWX' out.
it also demostrates that timer and IRQ are working

As the path name demonstrates, the FreeRTOS tests target a
board based on a ATMega2560 MCU. We have one, the Arduino
MEGA2560.

Complementary documentation:

https://feilipu.me/2012/01/15/ethermega-arduino-mega-2560-and-freertos/
https://feilipu.me/2015/11/24/arduino_freertos/ (see 'Compatibility')

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[rth: Squash multiple avocado fixups from f4bug]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS                      |  1 +
 tests/acceptance/machine_avr6.py | 50 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 tests/acceptance/machine_avr6.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 79e7470f5c..8b90bb7b49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -996,6 +996,7 @@ M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Sarah Harris <S.E.Harris@kent.ac.uk>
 S: Maintained
 F: hw/avr/arduino.c
+F: tests/acceptance/machine_avr6.py
 
 CRIS Machines
 -------------
diff --git a/tests/acceptance/machine_avr6.py b/tests/acceptance/machine_avr6.py
new file mode 100644
index 0000000000..b644d2a81c
--- /dev/null
+++ b/tests/acceptance/machine_avr6.py
@@ -0,0 +1,50 @@
+#
+# QEMU AVR
+#
+# Copyright (c) 2019 Michael Rolnik <mrolnik@gmail.com>
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import time
+
+from avocado_qemu import Test
+
+class AVR6Machine(Test):
+    timeout = 5
+
+    def test_freertos(self):
+        """
+        :avocado: tags=arch:avr
+        :avocado: tags=machine:arduino-mega-2560-v3
+        """
+        """
+        https://github.com/seharris/qemu-avr-tests/raw/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf
+        constantly prints out 'ABCDEFGHIJKLMNOPQRSTUVWXABCDEFGHIJKLMNOPQRSTUVWX'
+        """
+        rom_url = ('https://github.com/seharris/qemu-avr-tests'
+                   '/raw/36c3e67b8755dcf/free-rtos/Demo'
+                   '/AVR_ATMega2560_GCC/demo.elf')
+        rom_hash = '7eb521f511ca8f2622e0a3c5e8dd686efbb911d4'
+        rom_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
+
+        self.vm.add_args('-bios', rom_path)
+        self.vm.add_args('-nographic')
+        self.vm.launch()
+
+        time.sleep(2)
+        self.vm.shutdown()
+
+        self.assertIn('ABCDEFGHIJKLMNOPQRSTUVWXABCDEFGHIJKLMNOPQRSTUVWX',
+                self.vm.get_log())
-- 
2.26.2


