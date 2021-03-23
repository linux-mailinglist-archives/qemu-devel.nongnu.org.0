Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BD346551
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:36:13 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk0q-0005jv-G5
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJz-0005G8-55
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:55 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJq-0003Rv-Ko
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso11144855wmi.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cVRTL1lCIDyPCEUdPlSzVJImpTKXfzymgaCzSitRndY=;
 b=OTV28Jkm/XIkks9iBOU+Jc5vjf6q1PrK7hdFHYFhy84v+6qBEof5uhQMArBEmjAA0L
 01ani6SZp6Hvt3X7bYRR6iucaCFnn1f1JvXzKQMmSUAKa1N8Qv0z6pyRcvy3Pkv08R9R
 yCGtvu2EvoaO9jOstQqSmoEHd6TRoWkr8xm9WD2cEyxsFUvb4ZWmGlMQPaV9DVD4ebaT
 F62vGFzaFI2K3bIjRZnxudDt+VDOyfw6hpwP0zbFtegubXjboznKidpiaBJuxgCXHizU
 xHtL6FQMhanZQC1WAe/y8F1TInqH3QeNKzwA5FFvS3lc0/UlBoeKDNDJVHUU2MPiYtDI
 WvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cVRTL1lCIDyPCEUdPlSzVJImpTKXfzymgaCzSitRndY=;
 b=c27n6R3qSZtd/UT276YCJ6dIYpnjX3CTl1HNjiAyNJwg0ZJI35b4ZCCnOxVekgDUaD
 aT8VvasHhsuIoJ4adNbowORwkADTKeziVIO8gSSpCPr7TLmfzJS5k4Bmt/kloxLbRg1N
 hfo6/afpEx2Vf9iwrOpUbmi984cVT2eLX8YqZ2CwHthdQD42DaK87THzU2Ukcdw8WXHi
 xuepBlYqyvp9u4RfkUY9s2SaQ0g1PLuPMYmaWPACaOzSY0iD5HwpnFXetf1m42Aihq9l
 umc4Olcr1ilx2WwbfKHHvPUSAkGrsNL0199cnDFw+/UTjqmMwx3X1rvMyuHOmJOpGx64
 51gQ==
X-Gm-Message-State: AOAM530lAn8/JOTbyqSpv3xEimHZsdWTMWc3tmdIPgSk1DGzGqFqTc0y
 Np/5huG8maqmVoH6oIUY24yaDdRXPoF7zQ==
X-Google-Smtp-Source: ABdhPJw+zzxeS3e4MyGh1cmSv+Xt1N/KvMaYs3R4HJaVkykMatk+Bgq2ed1ahlFfbjri+gTGxvm7IA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr4021903wmc.51.1616514703524; 
 Tue, 23 Mar 2021 08:51:43 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u2sm3963897wmm.5.2021.03.23.08.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 02/13] blobs: Only install EDK2 license file if EDK2 blobs
 are installed
Date: Tue, 23 Mar 2021 16:51:21 +0100
Message-Id: <20210323155132.238193-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Laszlo Ersek <lersek@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 pc-bios/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 1c4074bcb0d..d270d8516c9 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -22,6 +22,8 @@
                   install_dir: qemu_datadir,
                   command: [ bzip2, '-dc', '@INPUT0@' ])
   endforeach
+
+  blobs_ss.add(files('edk2-licenses.txt'))
 endif
 
 blobs_ss.add(files(
@@ -76,7 +78,6 @@
   'u-boot.e500',
   'u-boot-sam460-20100605.bin',
   'qemu_vga.ndrv',
-  'edk2-licenses.txt',
   'hppa-firmware.img',
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
-- 
2.26.2


