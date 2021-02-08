Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA08313EC5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:22:15 +0100 (CET)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C6w-00070s-K5
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jn-00035G-A4
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96jR-00050T-Nr
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jITNoidllkoIIPBuiQV1gJNrrM15qrzDl0Q/+b51jBA=;
 b=UBLAZnMbhxeg/dWf7nOG4yXU/ZsIdw+pqM0xgPWr2BknFz6noxN6wxE0KNA9EYvLg08ahP
 OHQgpt/4NgSLwNLofZNeF7ausZESSSKkQALGg67dvPcwG+JLjH3miIsLxqCK9+ouh4aqaK
 raghRVh8t8F1OW+0hFty082LhSnSusw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-k_giI1PjPOKyekrkKWqrtw-1; Mon, 08 Feb 2021 08:37:31 -0500
X-MC-Unique: k_giI1PjPOKyekrkKWqrtw-1
Received: by mail-wm1-f71.google.com with SMTP id o18so6402244wmq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jITNoidllkoIIPBuiQV1gJNrrM15qrzDl0Q/+b51jBA=;
 b=OwlPp7WCF3awjtWwzuDjHLScVmJxdRCdanCJSmHhX38fg7mn6iZsGSEYJOpuLutWVy
 Ps0F4oOE8NGP9TIP4Qyum050hU7heMnAomYBvGESBooAOdEbsfW8LwtfPh8qg0a4aWa5
 H9/daexjEzFY0HmiwR0kMdjnVdhiGm2C9kuMCMXqfqfK7+P6EtPtnATrEYiHBBG5s2oA
 E7QVUbKVW0o5H3fyxKW2rPsjqf/wuKknrrUV/TZqJKnO4ci62xMKQtFxyyyGrvvTuTAL
 Jw/ppm1rkjdgSYZzmbjLLFS3ofhmeYhvpSS/4CBPnlK31q8bPoKKFCMjR5p5KGXCfFwe
 yk6Q==
X-Gm-Message-State: AOAM5319Jfg3WAoEH6cwqfbRI2INOBj2duEDZBzkupmggaNpGoIiuLK5
 J3akeq2BsldwPUpMPmkRQBkXe0Zc0Y2abBaRiPYOHxu/DLXsV4cTcS7p2YXPXAUFxJZRoNzm3js
 OV2om9zHvClwHPEN0cPjwBSiL04tiYv4linikZH6F4TVDznalmqSydMCKXOU5NhMC
X-Received: by 2002:a5d:47a2:: with SMTP id 2mr19863845wrb.393.1612791450122; 
 Mon, 08 Feb 2021 05:37:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOr09k8z7hT2JXJvkdxsrUeG7Zw/0T64qb5hXdp0SOn9dF79fy3bcNpU04uOdaLkgXeK267Q==
X-Received: by 2002:a5d:47a2:: with SMTP id 2mr19863821wrb.393.1612791449921; 
 Mon, 08 Feb 2021 05:37:29 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o18sm12706252wmp.19.2021.02.08.05.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:37:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] tests/acceptance: Extract
 do_test_arm_orangepi_armbian_uboot() method
Date: Mon,  8 Feb 2021 14:36:56 +0100
Message-Id: <20210208133711.2596075-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

As we want to reuse the same U-Boot test for multiple
Armbian releases, extract the common part as
do_test_arm_orangepi_armbian_uboot().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-Id: <20201023131808.3198005-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 45 ++++++++++++++------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index fb41bb7144b..46835e49dfb 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -802,27 +802,7 @@ def test_arm_orangepi_sd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable dl.armbian.com')
-    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
-    def test_arm_orangepi_bionic(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
-
-        # This test download a 196MB compressed image and expand it to 1GB
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
-        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
-        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
-        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
-        image_path = os.path.join(self.workdir, image_name)
-        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
-        image_pow2ceil_expand(image_path)
-
+    def do_test_arm_orangepi_uboot_armbian(self, image_path):
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
                          '-nic', 'user',
@@ -848,6 +828,29 @@ def test_arm_orangepi_bionic(self):
                                       'to <orangepipc>')
         self.wait_for_console_pattern('Starting Load Kernel Modules...')
 
+    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
+                'Test artifacts fetched from unreliable apt.armbian.com')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
+    def test_arm_orangepi_bionic_19_11(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 196MB compressed image and expand it to 1GB
+        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
+        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
+        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
+        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
+        image_path = os.path.join(self.workdir, image_name)
+        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
+        image_pow2ceil_expand(image_path)
+
+        self.do_test_arm_orangepi_uboot_armbian(image_path)
+
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
         """
-- 
2.26.2


