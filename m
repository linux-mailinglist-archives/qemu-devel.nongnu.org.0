Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BE34659A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:45:27 +0100 (CET)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk9m-0002K1-E3
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjK7-0005ZT-Pa
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJy-0003W0-KT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id k128so8929151wmk.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xlrza0FHUl6O6MRZC048Y58WGtevu1iQWGx1G1PP0b8=;
 b=M5s7BDesr9n/fcqdR8XA3FdkmrMwQjVPKsNdfrb8E4ymGYMZSFjzlI/ezMH8gxP020
 EIYfYj6DC1NfN+596MwRtvLugJN9l3VA0q5biqrAFNRTj0qvsf/WIuXn0JauN5lJO7LK
 ZB1TCrGRJUyo3rWYR53CrwvRHO2288ZcJKAhxjcf4l1n5HWIC8hKJ2c3ptKDNNaeZBNj
 e1xlXA5hg0omBxpATMpuOoAoWH9i8ubO34eHYc2ufVe5LY86Fcmm5qx3W4R8XZVs0m7a
 aAddBQnoxL9NQRH6X0zkFLDPI9EilVhM+fHMqNQ9H3gcTn+qfg/scuusb/VwQzWzk/rH
 s8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xlrza0FHUl6O6MRZC048Y58WGtevu1iQWGx1G1PP0b8=;
 b=UQB9NoTyQgZmjgpkp1xmVv9Mht99+7D+VASkGyhVgRVdQUFgFfD854j+CnNvCpFTrF
 Uf7a53T8fxvrdZuz24PUVE6Ly16CZumA3IITNhkMXT+4aLP/7kUiDhelqZ46tYw5Q5ll
 PCCEjqCOhKh0wkcE4c9U8NvL6TpYveaf8/dl3KEAQeZ7pvrLSjH5rmPwvNzYwL5Mbv/S
 Zn1nLqUS2rGwRs2/7+SIZDDnGWpe8idmh3O+PReSbKtucW28WMTG5K8UF9ZCg5Lcql2Q
 ngFIF6Uq4WBUYRy5Da629MJHFvuOvIgFrFC3RGDhTMYG/GbCVKab0BYQZ9f/qd7SC+5C
 qgLw==
X-Gm-Message-State: AOAM532+huXF81HaFfqOJCqoNZal8bTb2iSKyRCFIAaJzaFnVt1WmbWC
 +amkYNMweLnfE32aVDIFIDEHCkyjcmBLEA==
X-Google-Smtp-Source: ABdhPJyxM8GcniHnluGCTOVDXOjS0D0s+1+XCMwFk/e9NEQJreVqEBnHHDnb+O5hHlPys4qeRLsg8Q==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr3854910wmc.119.1616514712931; 
 Tue, 23 Mar 2021 08:51:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c8sm25823800wrd.55.2021.03.23.08.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/13] blobs: Only install PALcode blob if alpha system
 target is built
Date: Tue, 23 Mar 2021 16:51:23 +0100
Message-Id: <20210323155132.238193-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 5c85a15364d..b5b8892fe7a 100644
--- a/meson.build
+++ b/meson.build
@@ -93,9 +93,11 @@
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
+install_blobs_alpha = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
+    install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 007cf9d2afb..29085912d7d 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -73,7 +73,6 @@
   's390-netboot.img',
   'slof.bin',
   'skiboot.lid',
-  'palcode-clipper',
   'u-boot.e500',
   'u-boot-sam460-20100605.bin',
   'qemu_vga.ndrv',
@@ -91,6 +90,12 @@
   ))
 endif
 
+if install_blobs_alpha
+  blobs_ss.add(files(
+    'palcode-clipper',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


