Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA78F313EDA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:24:49 +0100 (CET)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C9Q-00023U-QN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jr-00035f-UQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jY-00051I-ED
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tM1jaDm4ni5WMJllemkQfzXNE1ZHzx/FgPDJ4gWto9Y=;
 b=BxMCHO/E0lRewixdMPezSp3QWZYsmm0O/PVVPF8D3E3zvr+sFg5V6TMEnNggQEaaIcH4Uq
 efN/QcQreXkHYWC51nkyf/8PMbVP/9alsgTwA3Snwl0gPqp6LTbpMycNIgI77PE63Zc0Tx
 XIQXkuRcTSSP+uNRTyv74cuR491cbzE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-VuwGyc82OyqSYdeOtpBXJA-1; Mon, 08 Feb 2021 08:37:37 -0500
X-MC-Unique: VuwGyc82OyqSYdeOtpBXJA-1
Received: by mail-wr1-f71.google.com with SMTP id h18so13261477wrr.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tM1jaDm4ni5WMJllemkQfzXNE1ZHzx/FgPDJ4gWto9Y=;
 b=H5b5qBwhUXKx12DNmK0W8RQCnbGcXNwRxYz5cG5UxSI18QYQz3pqODpfDJ1hc5rUe1
 bvy0yRYgH0A6zupD9qfIDkx7pbIpwyF2eCzIKAGoPm2bUUwRDlJIfXDHgc/yQ5pzkb0l
 OFHnT+lr33cCzKjg2OgHHbny+9c3oREUXR35UebdO8PKK58cm7D5PQqrEatpwE0TXdNf
 otpgzpvIhdmJ18YkCosi+26zeqPsj6l9il88SEZOm4PO/sNBksK3UKSz4YsidVuQ54es
 g273zuMTUZwnM2W5NjT0rSN4o1LqfWkZdrMw1s1q9n7Ha5bSWYaQZY85NnYD9dJx1LcY
 kM8A==
X-Gm-Message-State: AOAM533nP0PwNxok82TKd5Ixlc8mQerGe/x7LqB2SO5ZwVexA5Rd6yK2
 BRd5ibaEEVsb4WQRB2GyC8m+aEPIHxbPsys1ECqcYjm81vhpaXxu7UgYkw0lJvcW4GGuFcxvMCV
 v/oxUTiGJ9sqYQkEemZZfjB2Ney/P2B+EVRZQJhsjfcrtUKBJbD8BgOHouOx5PUZz
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr20106990wrq.395.1612791455010; 
 Mon, 08 Feb 2021 05:37:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsXVciwcqO6JAMaPHzYMr08j8/HPtdAu9pxxWpTmM8CD6QQqbANnOSmNNfePf4PL/DLFw7Yg==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr20106975wrq.395.1612791454812; 
 Mon, 08 Feb 2021 05:37:34 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm28440059wre.78.2021.02.08.05.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] tests/acceptance: Test U-Boot/Linux from Armbian 20.08
 on Orange Pi PC
Date: Mon,  8 Feb 2021 14:36:57 +0100
Message-Id: <20210208133711.2596075-5-philmd@redhat.com>
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Test U-Boot and Linux on the recent Armbian release 20.08.

Suggested-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201023131808.3198005-5-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 46835e49dfb..128ed5500fa 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -851,6 +851,31 @@ def test_arm_orangepi_bionic_19_11(self):
 
         self.do_test_arm_orangepi_uboot_armbian(image_path)
 
+    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
+                'Test artifacts fetched from unreliable apt.armbian.com')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_orangepi_bionic_20_08(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 275 MiB compressed image and expand it
+        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
+        # As we expand it to 2 GiB we are safe.
+
+        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
+        image_hash = ('b4d6775f5673486329e45a0586bf06b6'
+                      'dbe792199fd182ac6b9c7bb6c7d3e6dd')
+        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_xz, self.workdir)
+        image_pow2ceil_expand(image_path)
+
+        self.do_test_arm_orangepi_uboot_armbian(image_path)
+
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
         """
-- 
2.26.2


