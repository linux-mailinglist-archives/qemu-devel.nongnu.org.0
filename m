Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B9669A87
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:35:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmb-0000tC-Ji; Fri, 13 Jan 2023 09:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmU-0000s2-7V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmP-0003fQ-VT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso862982wmb.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iMMN6nvJLFr/G4zXkqeXauiYOdLOH+OhtPL6bqIWzyk=;
 b=nLQihLgIvsLLVp6YpGPAOHUMDytEsusHCcymmpHOxtmGUyrgj95ajPeyc8jm+lLJBt
 LEU3rIFfPcxledjLzg4md4uHJHEpULr9it9heuPQP/irx/CwUMBVU0yGL80BeSHBkoaP
 PtXsrm8gtE0avv7jfr7XQnSkre5PXYNiP7MjXkFeyDG0boMt/f6U1gjMt1oEkXaEqYLu
 GzKIt3VZEX3/uGtpccjoANvzJT22RgbXu2NzOCmWHY88Mp/uH1+8LmWmZNFAJn05xaOd
 7kuW2X+QIr3Qw/QDiaJUYwlMjUGBkFpKHzi5onFGnK/g3HMDqrGak9+/w9uzhek7YPl3
 P5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMMN6nvJLFr/G4zXkqeXauiYOdLOH+OhtPL6bqIWzyk=;
 b=SON/pqvQUuw+bvo5FPW60VkI2H/X9IUQKkoa4YAb1etil3Z+DA/G8G7TUckWByzfKv
 mJjw1h6BjPFjWAQlnKOVJPxaohW9zHSZA3FoZkFevAtclUIHs4s/r1ogb1Lo3MAknRal
 VtG+eiTeK3kNUI2oSRrmSCtH/ybnO8EVbNfQ3AImsh4r81DVx/lO9WHR5VJ6+VKVdX6o
 DoXIIp2QqfK7xefNDhB7Fe6Od7W/c2Q2g7wW0R0Zmz1VHmZD1n/P0lrgqwTEZY9JmhsX
 1gASygUzh6OPM5qj8s42tIOqcRnMm9dcCQj88zf9KZsol3Mn4PD4MPVqe48MIYsoQyHI
 bkyg==
X-Gm-Message-State: AFqh2kqyumB1MnWWpOhzWfysZyveRSqeFjML9N3hLcCTw+bFhZjz16La
 rnnlZ9RdLDoNYonmJfy+AzuEErYHGrxpCqkn
X-Google-Smtp-Source: AMrXdXuMg5+CcgDCckxA9jS4futtgfeBftmd2bmgzAud47iET7ouUVMGAaxzZjXA5wFwrt6SHU8P/Q==
X-Received: by 2002:a05:600c:1c9d:b0:3d1:f3eb:c718 with SMTP id
 k29-20020a05600c1c9d00b003d1f3ebc718mr69726435wms.19.1673619095951; 
 Fri, 13 Jan 2023 06:11:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/38] tests/avocado: Add SD boot test to Cubieboard
Date: Fri, 13 Jan 2023 14:10:57 +0000
Message-Id: <20230113141126.535646-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

Cubieboard now can boot directly from SD card, without the need to pass
`-kernel` parameter. Update Avocado tests to cover this functionality.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20221226220303.14420-8-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 47 +++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ec07c64291d..8c1d9815861 100644
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
2.34.1


