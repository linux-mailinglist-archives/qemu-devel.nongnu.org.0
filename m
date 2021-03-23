Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D93465A0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:46:40 +0100 (CET)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkAx-0003UP-LE
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKd-0006Co-M8; Tue, 23 Mar 2021 11:52:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKJ-0003j8-Rc; Tue, 23 Mar 2021 11:52:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id o16so21303555wrn.0;
 Tue, 23 Mar 2021 08:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9TdduAEXkE1G0/WUS2DqNMa3uvOw/RYi8/uMRmuc/s=;
 b=ki8f0pTW3PRnzW8YOF6b0eG9nXiIWw5JuXR55yZgsjHRQS9NKKj55rGGjoG3MTdOUV
 wKS+DEM67kq6jMvc0F/+n8w0xuaf8yGotQQfWyujQ78Ce0PqzE5XS7wQ+VUDO87qou3P
 jnlmZLpa35O5KzKYSAJ0vKMYm30oXfJrVvcqYUFZ1f6r4LZWwPSltqpd9nL7UKoQMbSZ
 Zn51L7WsyWliavmbIdZk/gY8rw2/hm1qpDz+PA0/Q28SJ5j+6jfmvgNZEnq0xH7K9Zxz
 zxFMcKq7ceqHELqxU2CyXue/EajO2yJ2SPEDxT/ZFu/lZEXp4KgCLX4g1RPCWRbJ+B6H
 3y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D9TdduAEXkE1G0/WUS2DqNMa3uvOw/RYi8/uMRmuc/s=;
 b=LFlwqSJOAm5xMifC0oU7KrDJ+UJz6XA0j63LyNJOyCpvS1jCfQGw88wLQec3SgBIAj
 ijFmv2fSDGAEwrL61+msFl5lVei4OE27b5oe8unw3GLzJZqlRSOhW17/eS0eoFqjBviY
 yXwsMvgWDAdrKVpDPdLZEQcwYD+r3lW3Pl1s+NNA3VJvxkdnPp+XgKUbNc57zINB2lpl
 MwD7AgguPSAR7CXod07DFdH9jpKC3dp5l5NHSXFOdJS6VzH4IHprH9jygQXnbmEQEEZS
 fGStPDIhZuXJB/2d3UciMdd20JVWoVWAEZbgnBDDp1pQh3n4uNHQvah664Ng6JtcRFRm
 bK/Q==
X-Gm-Message-State: AOAM530BQD2P7XVy4uYWaF6mD//ZM8IQ5fZs7YRR+2cDKuYebTAiBuBc
 RMVmIpw7ZeRRofg3dIPw4XmLFbCUlJjHMg==
X-Google-Smtp-Source: ABdhPJxwACULQ4O1SLfu6aiv7APorb+bwuO1jJfIanMXxxcBSoM5N+gkHFiQyThXRZmZ+26FQehBIw==
X-Received: by 2002:a05:6000:1a8a:: with SMTP id
 f10mr4590294wry.232.1616514732292; 
 Tue, 23 Mar 2021 08:52:12 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j26sm24097164wrh.57.2021.03.23.08.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/13] blobs: Only install blobs if powerpc system targets
 are built
Date: Tue, 23 Mar 2021 16:51:27 +0100
Message-Id: <20210323155132.238193-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Hervé Poussineau <hpoussin@reactos.org>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>
---
 meson.build         |  2 ++
 pc-bios/meson.build | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index e3418815b04..6f5561c2212 100644
--- a/meson.build
+++ b/meson.build
@@ -97,6 +97,7 @@
 install_blobs_arm = false
 install_blobs_hppa = false
 install_blobs_microblaze = false
+install_blobs_ppc = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
@@ -104,6 +105,7 @@
     install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
     install_blobs_hppa = install_blobs_hppa or target in ['hppa-softmmu']
     install_blobs_microblaze = install_blobs_microblaze or target in ['microblaze-softmmu', 'microblazeel-softmmu']
+    install_blobs_ppc = install_blobs_ppc or (target.startswith('ppc') and target.endswith('softmmu'))
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index a6185feff58..73d02a57628 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -43,7 +43,6 @@
   'vgabios-ati.bin',
   'openbios-sparc32',
   'openbios-sparc64',
-  'openbios-ppc',
   'QEMU,tcx.bin',
   'QEMU,cgthree.bin',
   'pxe-e1000.rom',
@@ -60,8 +59,6 @@
   'efi-virtio.rom',
   'efi-e1000e.rom',
   'efi-vmxnet3.rom',
-  'bamboo.dtb',
-  'canyonlands.dtb',
   'multiboot.bin',
   'linuxboot.bin',
   'linuxboot_dma.bin',
@@ -69,11 +66,6 @@
   'pvh.bin',
   's390-ccw.img',
   's390-netboot.img',
-  'slof.bin',
-  'skiboot.lid',
-  'u-boot.e500',
-  'u-boot-sam460-20100605.bin',
-  'qemu_vga.ndrv',
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'opensbi-riscv32-generic-fw_dynamic.elf',
@@ -111,6 +103,19 @@
   ))
 endif
 
+if install_blobs_ppc
+  blobs_ss.add(files(
+    'bamboo.dtb',
+    'canyonlands.dtb',
+    'openbios-ppc',
+    'qemu_vga.ndrv',
+    'slof.bin',
+    'skiboot.lid',
+    'u-boot.e500',
+    'u-boot-sam460-20100605.bin',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


