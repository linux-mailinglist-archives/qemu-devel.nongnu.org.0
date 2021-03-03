Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D303232ACBD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 02:29:18 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHGKD-00021u-8C
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 20:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDp-0008Cw-Jk; Tue, 02 Mar 2021 20:22:41 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHGDo-0003bn-2G; Tue, 02 Mar 2021 20:22:41 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q20so15077620pfu.8;
 Tue, 02 Mar 2021 17:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWS+hvZZd+PyjeXy42iVXkbp4JG+ZMxRgGlpplATrRU=;
 b=iJJH0QPafqgD0/2C6xh04yLm8ByALcroBMPT1wJOuLyXqI9oZTRfANlG4ubn0hASCQ
 g4WwwO+ff7YPrtI2F3gW8oMHazLs3pdMGD3nw15Kz8H2hkVsyPOALvyltkZG0HDjnYzj
 2yXGXgJ0LVPK9EQHd7umlJtwW77Zlk+ToyTkvypdRS1eupLr9OSCXEnAZ+gZtm+clm5Q
 DyLIUotZ7x1Fe8NAZLXQxXAYYNXJlF7DcefruS9qzJ+xMJ7FvDshK5geLtyenO0HJZAl
 XfZkIkA0YM0LUbUnAdLilz3JLxxHV3oxmWHs4Qf2GLvcQF9AodXfvwWRL87fZ6henNKg
 GUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VWS+hvZZd+PyjeXy42iVXkbp4JG+ZMxRgGlpplATrRU=;
 b=JAWcs/wQcWqTI8Rf365HWEc+ItjXfWahwVB41CM8pPXqtXuEmrbbwtnGNU40ck//nY
 A9PPzc6l48+RtAqkImNCilHEi1afJHFvppXYZcX4lLP04h1G/21pcw9cuprLlwf10ZMr
 pwSSO+u9Akn7CU0OuVTtThe7Bv/adTsgUwCSsnYqTTLU2URlg1aGpNN6cPyx3a1bGirM
 UCIPcuF4FnyHi99lC72veBehQyZcKx+368XiNRqXI3IiaqEVU1HvhOGM9O5l3wuCBhuK
 3XDoZ9mf68y8DowxWLnWj5jeWSVCMYvvw9Wi77Rq7+wlkRfBEl4qwBTdeJgo0Om85GsL
 mthA==
X-Gm-Message-State: AOAM531Yz4Dg20g2M63cx2Kghio85jShBSl/aHJ6Hzhzthnzb/G9DLOn
 q4dDaDq0HCDsgL3mDNlQOug=
X-Google-Smtp-Source: ABdhPJwkTLPinOtgYT2e/A+lS3m57eqjfvJEqfdDWMAbuQ/AaUfXa+jWKxQYo39tB133xv3VQN4fBQ==
X-Received: by 2002:a63:e109:: with SMTP id z9mr20493678pgh.5.1614734558250;
 Tue, 02 Mar 2021 17:22:38 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id t19sm14135427pgj.8.2021.03.02.17.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:22:37 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 2/2] tests/acceptance: Test ast2600 machine
Date: Wed,  3 Mar 2021 11:52:17 +1030
Message-Id: <20210303012217.637737-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303012217.637737-1-joel@jms.id.au>
References: <20210303012217.637737-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
Tacoma BMC machine.

There is no root file system so the test terminates when boot reaches
the stage where it attempts and fails to mount something.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 2f46a08fdc10..6b7d7f5df984 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1094,6 +1094,32 @@ def do_test_arm_aspeed(self, image):
         # self.wait_for_console_pattern("login:")
         self.vm.shutdown()
 
+    def test_arm_ast2600_debian(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:tacoma-bmc
+        """
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20210302T203551Z/'
+                   'pool/main/l/linux/'
+                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
+        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
+                                    algorithm='sha256')
+        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        dtb_path = self.extract_from_deb(deb_path,
+                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path)
+        self.vm.launch()
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
+        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
+        self.wait_for_console_pattern("ftgmac100 1e670000.ftgmac eth0: irq")
+        self.wait_for_console_pattern("VFS: Cannot open root device")
+        self.vm.shutdown()
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
-- 
2.30.1


