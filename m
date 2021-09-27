Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E29D419CA5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:29:08 +0200 (CEST)
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuR9-0000ZI-G7
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuOo-0006Gt-FV
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuOl-0005TK-GM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632763598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHBSjBy2Udn0J9NJbjnkI2cwk+chfijVKaYIeQcCmJ4=;
 b=i5XPdJcnFKRhH4M5ARmKLkut387PNzpqXOkuZm2kCFi7TGTA/HVFdnojkaLqG5v+QiUDoQ
 ALpJXn9CMbZq1k49CFb3YG84uSLZRrRA+LLKzWvThYUw/MsqNBBMlvahhhDu8zAMecZpmp
 1EIOX4z0U50yxWqdeTXatDIH3OkVqI0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-oHXszAt-P_uiOMtcZYPaJQ-1; Mon, 27 Sep 2021 13:26:37 -0400
X-MC-Unique: oHXszAt-P_uiOMtcZYPaJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso487459wmp.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHBSjBy2Udn0J9NJbjnkI2cwk+chfijVKaYIeQcCmJ4=;
 b=G10BNc6ctJL8Fw2Zin7t0HQ8gX8dm3tUq87KHKAOUQanNg306b0h+Iy25bL4tM79jX
 OooDk5P/DavlEm7pWlK071/1BEyfmEPBq3badovXODkLfO/F4aRRrhoMBB89ayAyuUOT
 B3E5PJVXTCXqtlfhzd/I14b2CRXwJ7NTo0PcDYpsnYmUSs96jgaVH3K19DSp71atpqPm
 bjRHZLy/dMJ28U4hU0nv0kY/88RiHXdjVB7jzzpO+HDHCNDHZ11O4JoE8jh8GzAy2Ere
 4VUXgvbzb269OfLOX+kcpeCwddCdZ6VGk1lw+in4W5kCb0e8wvfz8L1ssMzf9JFUF6wP
 PoOQ==
X-Gm-Message-State: AOAM5332i9tfixQ1uebATXUMucWwTzcnQ1fyyNFNGHQXhj2kloFVRRfY
 eL9FroDmrEnTwr/9Fh5Dr62juEtkHilAvo/J3ch2/oxMw2FBpyOPI3Hx1SkHc/u/QcHd8ZGNFnT
 rMHCiPabsmArcny6CVTSjN8PQeu7nZGK2oEY5ZrGaVyUWxvpqeidZEKDtE3paBZ/m
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr220623wmq.95.1632763596259; 
 Mon, 27 Sep 2021 10:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu5cwzInMFuRRN3V4PgsCsszal0Xrje//gQW3AOs955FXzZoXAVYwYCdfkGl5ykYaVywzxIQ==
X-Received: by 2002:a05:600c:4ec6:: with SMTP id
 g6mr220599wmq.95.1632763596033; 
 Mon, 27 Sep 2021 10:26:36 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h18sm17162794wrb.33.2021.09.27.10.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:26:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: 
Subject: [PULL v2 22/22] tests/acceptance: Test powernv machines
Date: Mon, 27 Sep 2021 19:26:26 +0200
Message-Id: <20210927172626.2026308-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927172626.2026308-1-philmd@redhat.com>
References: <20210927172626.2026308-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
with a simple PCI layout.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210817093036.1288791-1-clg@kaod.org>
---
 tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0a49c0e2760..06fc967f6c4 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
 
+    def do_test_ppc64_powernv(self, proc):
+        images_url = ('https://github.com/open-power/op-build/releases/download/v2.7/')
+
+        kernel_url = images_url + 'zImage.epapr'
+        kernel_hash = '0ab237df661727e5392cee97460e8674057a883c5f74381a128fa772588d45cd'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash,
+                                       algorithm='sha256')
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', 'console=tty0 console=hvc0',
+                         '-device', 'pcie-pci-bridge,id=bridge1,bus=pcie.1,addr=0x0',
+                         '-device', 'nvme,bus=pcie.2,addr=0x0,serial=1234',
+                         '-device', 'e1000e,bus=bridge1,addr=0x3',
+                         '-device', 'nec-usb-xhci,bus=bridge1,addr=0x2')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("CPU: " + proc + " generation processor")
+        self.wait_for_console_pattern("zImage starting: loaded")
+        self.wait_for_console_pattern("Run /init as init process")
+        self.wait_for_console_pattern("Creating 1 MTD partitions")
+
+    def test_ppc_powernv8(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:powernv8
+        """
+        self.do_test_ppc64_powernv('P8')
+
+    def test_ppc_powernv9(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:powernv9
+        """
+        self.do_test_ppc64_powernv('P9')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
-- 
2.31.1


