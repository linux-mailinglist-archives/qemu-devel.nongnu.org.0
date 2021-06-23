Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045FD3B2007
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:08:44 +0200 (CEST)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7Ip-0000uG-UZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BF-00064c-Gq; Wed, 23 Jun 2021 14:00:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BD-0003CC-OR; Wed, 23 Jun 2021 14:00:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id u11so3585154wrw.11;
 Wed, 23 Jun 2021 11:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2T3MRe80pK9VipLCU8CHFoaCxHfrkK4bYUI1dyRLTTU=;
 b=Xck+VA6i84WM+hkfWrM6apyO901HJYkRdZ8CP1BWld1+yNC9/0+oM+5A+/6woI9cv7
 vBrPW5/iISrl5k2Is8FJOYkS/Uze6Bpwu2yjrMxf3hsMk7VZsEoM4VZf8aaMYvzvnvZ5
 YdbYzx6DySBCX3XfLT/M7VBROn0tPA5unFKgVSoBAd0ed3brfHA6NV08GdgAzDx1PGP/
 0rj5QxtzGuqzgnVnt/m3PxIybd/Eh4Ax/RTo+U1tQgDUw3mHYnVj1CgWb+d02X5xrRbi
 Efr1RJPeycXsyCwhT8+C633xfBWnGMMT6b6BakK3IyeS0/PR6iEnJxWG2lBihheJSCkh
 p5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2T3MRe80pK9VipLCU8CHFoaCxHfrkK4bYUI1dyRLTTU=;
 b=BpOAR1c6sEQ1zaUF9mxe6X71U9QTpkp2MgNlzYA0+QZezSmsbSjmzwX9zdc8gPSALs
 TmI3AH4DwBRRVpIUDLmrM21EzruU1JuYg0OI4MQGO0npQPMTZNNio51wH4sBa1iF1gpY
 iYccbRj8zscQr2De0Yqe63Nn3RvGoJTmJ/7eqbdIWi7/FJfhZzHpi+eSsnraanhZne4U
 kZpTyFpFGTK4M1d0d1EeXHsQNiI+0T0mV+snwR6ToI+sZ3y7JeFtVdtktjLe3RrTMynZ
 5UrbxXqAHPWE4D2wLJj6ntwyJFBPMONUcTGkxXV2A3sJz7erPWV/SAPP1j4XCqkV+2qb
 g9/w==
X-Gm-Message-State: AOAM530VwEW5a00Zb//KUbJqJ516QJnnNzaKDNyviyuk8fmQMadv4E9S
 Z9plkzn6Ca4O8p58v+cqnA6N9xlFZ2LpSw==
X-Google-Smtp-Source: ABdhPJxAMDjHQVhATCD4g7Se7pvyTq7vaaOZnPwyM/iZVxX/mK2SNKMAy3tVF+kNL+32EScGQus2IA==
X-Received: by 2002:adf:c843:: with SMTP id e3mr1522238wrh.25.1624471249830;
 Wed, 23 Jun 2021 11:00:49 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s16sm820956wrm.36.2021.06.23.11.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] tests/acceptance: Use image_expand() in
 test_arm_orangepi_uboot_netbsd9
Date: Wed, 23 Jun 2021 20:00:17 +0200
Message-Id: <20210623180021.898286-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NetBSD OrangePi image must be at least 2GiB, not less.
Expand the SD card image to this size before using it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 61069f0064f..b10f7257503 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -868,7 +868,12 @@ def test_arm_orangepi_uboot_netbsd9(self):
         :avocado: tags=device:sd
         :avocado: tags=os:netbsd
         """
-        # This test download a 304MB compressed image and expand it to 2GB
+        # This test download a 304MB compressed image and expand it to 2GB,
+        # which is the minimum card size required by the NetBSD installer:
+        # https://wiki.netbsd.org/ports/evbarm/raspberry_pi/#index7h2
+        # "A 2 GB card is the smallest workable size that the installation
+        # image will fit on."
+        NETBSD_SDCARD_MINSIZE = 2 * 1024 * 1024 * 1024
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20200108T145233Z/pool/main/u/u-boot/'
                    'u-boot-sunxi_2020.01%2Bdfsg-1_armhf.deb')
@@ -886,7 +891,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
         image_path = os.path.join(self.workdir, 'armv7.img')
         archive.gzip_uncompress(image_path_gz, image_path)
-        image_pow2ceil_expand(image_path)
+        image_expand(image_path, NETBSD_SDCARD_MINSIZE)
         image_drive_args = 'if=sd,format=raw,snapshot=on,file=' + image_path
 
         # dd if=u-boot-sunxi-with-spl.bin of=armv7.img bs=1K seek=8 conv=notrunc
-- 
2.31.1


