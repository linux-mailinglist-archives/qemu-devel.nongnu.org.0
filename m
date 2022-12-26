Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75465653F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 23:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9vZK-0004uL-DC; Mon, 26 Dec 2022 17:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ8-0004lh-LY; Mon, 26 Dec 2022 17:03:26 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ6-0003Yh-TT; Mon, 26 Dec 2022 17:03:26 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s5so16834668edc.12;
 Mon, 26 Dec 2022 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JWN1aEv28Joh2/ZLVeS7ANU8mdC3qcchN8nXt3z+4VY=;
 b=dYwpNCzvVKZCI8Xm3ii4afLZlEeS5envIDmcaeKPnfrnSPqcNRLf9ob/CGNpKUmWh5
 wR18qWwV/7baUdvwXjFfIUkH50wGDJqU7OY/LGXNZtkDF6CoVPYZ0FB4RXGk7VBD+Xch
 0psIW/pfT0LGIW1tR4tPLr0pRQVbuY/UMlW+1ZK3T0/PljXi48XpDzxg9no68RZonzJY
 PtU/jR7Q+fg9DRjLHroA9i9+Z2ZxaQb6G4dkd4TKJQRd3K0yhw0vRpSNSLmO5aByryA4
 8v/Kd1qEBzR+ncesJp6P86GZyLiTrNzuCc+vMu0A52ijiO9mNg1HtGXjAJLFGSDFU0GG
 Uq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JWN1aEv28Joh2/ZLVeS7ANU8mdC3qcchN8nXt3z+4VY=;
 b=CV53wX6CK/6GORSx6P+uviUfkceTpMpEcSb1P3FbE3Vl8jNUynF8aH05m+AtgxRdns
 CwLsJIzh20du9LllIe8m6MhT2jEBKXe5ib7XqFO3aOQCyH4muh1PagShv5tUVvQLQ/Do
 zweFF0BGDLs1h/ZhFB+uPgpHT39wY1hr3WnOglrDbPb61gJyIrVFVD+/6FOmH6UIIQtv
 si2eG6X3Vrl9Hu4+BYXinAf+iQfu24DbYjoEHucpYDQEbhIDtFBWe0GZwfNvFpSecgrf
 a2wl/GSOwMwq3qcRh04fgBzkbh6WM5KUGvJpiw87wat+xFyRSxRBUYrN9SH1FBErzZX+
 f9TA==
X-Gm-Message-State: AFqh2konTFkR1kypZW8qyZiXy6p2CO2PqjICYN1h1sdRNGu2keZyGPVP
 DFw34G0m99pMM+WUEJG7LtzEP9FnnkMp7Q==
X-Google-Smtp-Source: AMrXdXuVFrlCz2Bti4L3Jmmp4N0S5utQz0/MmvbhNn/1roA7q65107Ikxgcauj9iJGgT7q46h4kdDg==
X-Received: by 2002:a05:6402:13c4:b0:46a:be66:c0e2 with SMTP id
 a4-20020a05640213c400b0046abe66c0e2mr16955326edx.28.1672092203329; 
 Mon, 26 Dec 2022 14:03:23 -0800 (PST)
Received: from penguin.lxd ([87.116.176.120])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020aa7d541000000b0046951b43e84sm5111467edr.55.2022.12.26.14.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:03:23 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 7/7] tests/avocado: Add SD boot test to Cubieboard
Date: Mon, 26 Dec 2022 23:03:03 +0100
Message-Id: <20221226220303.14420-8-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Cubieboard now can boot directly from SD card, without the need to pass
`-kernel` parameter. Update Avocado tests to cover this functionality.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 tests/avocado/boot_linux_console.py | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ec07c64291..8c1d981586 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -620,6 +620,53 @@ def test_arm_cubieboard_sata(self):
                                                 'sda')
         # cubieboard's reboot is not functioning; omit reboot test.
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_cubieboard_openwrt_22_03_2(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:cubieboard
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 7.5 MiB compressed image and expand it
+        # to 126 MiB.
+        image_url = ('https://downloads.openwrt.org/releases/22.03.2/targets/'
+                     'sunxi/cortexa8/openwrt-22.03.2-sunxi-cortexa8-'
+                     'cubietech_a10-cubieboard-ext4-sdcard.img.gz')
+        image_hash = ('94b5ecbfbc0b3b56276e5146b899eafa'
+                      '2ac5dc2d08733d6705af9f144f39f554')
+        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_gz, self.workdir)
+        image_pow2ceil_expand(image_path)
+
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
+                         '-nic', 'user',
+                         '-no-reboot')
+        self.vm.launch()
+
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'usbcore.nousb '
+                               'noreboot')
+
+        self.wait_for_console_pattern('U-Boot SPL')
+
+        interrupt_interactive_console_until_pattern(
+                self, 'Hit any key to stop autoboot:', '=>')
+        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
+                                                kernel_command_line + "'", '=>')
+        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel ...');
+
+        self.wait_for_console_pattern(
+            'Please press Enter to activate this console.')
+
+        exec_command_and_wait_for_pattern(self, ' ', 'root@')
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'Allwinner sun4i/sun5i')
+        # cubieboard's reboot is not functioning; omit reboot test.
+
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_arm_quanta_gsj(self):
         """
-- 
2.30.2


