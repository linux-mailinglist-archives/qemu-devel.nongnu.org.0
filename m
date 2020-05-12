Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A61CED58
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 08:54:05 +0200 (CEST)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYOnk-00030a-QV
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 02:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1jYOkp-0006Vz-PV
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:51:05 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1jYOko-0003WI-RC
 for qemu-devel@nongnu.org; Tue, 12 May 2020 02:51:03 -0400
Received: by mail-pf1-x443.google.com with SMTP id 18so5921295pfv.8
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 23:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n1YMwf+t1T5UgegU3i8L9NnD54cq03Rj2vu5lbPV+/E=;
 b=aLJN5kry9pPgPC/ax2xGSDghg3mbseTy09Q76ZGjtwt1QOO/qCejRU1OZHdcJln4w4
 ep11kPrc/ljMXulCYKFVJbfEbNMQBGIO8VCnA75uxc7X5u241JPhd0DopSrSo7EQsSg2
 clWp255m39llK2IyLWm4N69wV8Ph30qNXak+3xAYegV7TvV7BwfVwh/r4sDLYfIZ9U5D
 yUH78ASx52fRiH3l/HoxAIa+mTQCw+ZXQ1CvfxGk1dPSKHRRTZVyi/uMmY3X7G0/4yMK
 wnmL0whfNTouK5xA7/oKnSy6L5jX84Sjs6vs7JhjxIpOoBD/8HA/W3b00tqjP0Bygy3B
 Wvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n1YMwf+t1T5UgegU3i8L9NnD54cq03Rj2vu5lbPV+/E=;
 b=QYoyeSl6af4f88LteEmjYTMGKjaKFeCN4z4TNNvKbBzPbTzeHtrbn/e0nwG0h5TfnV
 a2fYye5EvwMlH7fuMwOjm1o1KCNjPH3X2GNAh0YCe/RmV24HWCOpWERlFRy4JJGHtwX3
 fTVcmVxPihwVZQfMIuqDjR9bsKvKauf6W6wKFS162OGTxtq3ZSdYJgfrzz6g0ys/0vmE
 BUsVdOuLbASA9F12lRBCxHsmYytRYQyDXrx1XVlq1XpwFKEZgu3QKUnEHLgU9EsJbwd7
 Bn88JrFjjHKkhw/eBllmM1Pu5LOPWmdnUq2dCmqrDiZq3v/PQhGzx0Lgl+k1BQ2/coZL
 K4Lg==
X-Gm-Message-State: AGi0PuYkpDVw/4S7mPW+i6eUmGTn+FAmE22ycUJh0hSSdEFMahbYBrWB
 oeprVZ7HK5CEVnbtX23lVFE=
X-Google-Smtp-Source: APiQypILBxi68u3U4HOHs3OK8clSj+5l6mFqBlxTCNFl59zhR/WSwevyBq86bKFUDuryDvvreWDcMw==
X-Received: by 2002:aa7:951b:: with SMTP id b27mr19858573pfp.2.1589266261715; 
 Mon, 11 May 2020 23:51:01 -0700 (PDT)
Received: from localhost.localdomain ([75.167.104.59])
 by smtp.gmail.com with ESMTPSA id j7sm11837286pjy.9.2020.05.11.23.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 23:51:01 -0700 (PDT)
From: Paul Zimmerman <pauldzim@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v5 7/7] raspi2 acceptance test: add test for dwc-hsotg (dwc2)
 USB host
Date: Mon, 11 May 2020 23:49:00 -0700
Message-Id: <20200512064900.28554-8-pauldzim@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512064900.28554-1-pauldzim@gmail.com>
References: <20200512064900.28554-1-pauldzim@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=pauldzim@gmail.com; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Paul Zimmerman <pauldzim@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a check for functional dwc-hsotg (dwc2) USB host emulation to
the Raspi 2 acceptance test

Reviewed-by: Philippe Mathieu-Daude <f4bug@amsat.org>
Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index c6b06a1a13..abb5ca3dd4 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -378,13 +378,18 @@ class BootLinuxConsole(Test):
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               serial_kernel_cmdline[uart_id])
+                               serial_kernel_cmdline[uart_id] +
+                               ' root=/dev/mmcblk0p2 rootwait ' +
+                               'dwc_otg.fiq_fsm_enable=0')
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
-                         '-append', kernel_command_line)
+                         '-append', kernel_command_line,
+                         '-device', 'usb-kbd')
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
+        console_pattern = 'Product: QEMU USB Keyboard'
+        self.wait_for_console_pattern(console_pattern)
 
     def test_arm_raspi2_uart0(self):
         """
-- 
2.17.1


