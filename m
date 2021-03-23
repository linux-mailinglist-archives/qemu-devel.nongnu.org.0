Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC63465C1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:58:25 +0100 (CET)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkMK-0004KI-39
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKp-0006Hm-LE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKb-0003sy-0y
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id o16so21304661wrn.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3ya2mpgZhcVqx9JPWm06XsQMNNZjAdoDpK4jTVD5vk=;
 b=rhUUrbPH+U/TaeN9ncE8F+Gr8h0PPiDq4DiVNUz+MlAzrZn+cu4DB2DnLFlHi99Rev
 lKcyAxC49uifFWt9YglgBLqEZ7kELScYDCrubIcPCfvl2TbrS4GA3zWSqcMIe8059Iuc
 I5zYKNkiEpHBXkEo5EFOCyOr/k3xRXFQMZlontVMzKKChLIn//BHvGZeecYEDu74QYRs
 W2KpblOBoaMQqQrqhE8VUHvsmIgT7O+R573SNCw53EGyWeW598tYGbXBPAtsaKNjCGoN
 9zyk7kCe63TgQr89PqS+xcXcq1mH87htrB9Rn5Eu7Jdb3txPwrx5thTrKAlLLi4knG/u
 oocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p3ya2mpgZhcVqx9JPWm06XsQMNNZjAdoDpK4jTVD5vk=;
 b=OO+rjj2fWC9gy++MjE+vSCmxJxod4S8PVHiahJ3ovVbogUpRnAVmmSpIP+f9Y4MPIs
 7NmwIg86FESCXqZ1ez4M3Dq2bA7Iitb6/6V4hel6GUEL01g9b0kA3mran6S02tk9GkmH
 SRELdvqPMqBK4xv26afv0Iqc2cJg8didowdVbU7ywOVK8I4qAjOpMrvRcvdXuHBa22Yd
 SKyMeB6T7Cog/iVUSZjELcPdlB3VATC5Ef5yfCe00csf+A+8OgZcOZ+sOb8VjytCa7r9
 0XcfmVnH8HEScwY+53WaZ6xAq25O4oc6GFN51AllRPboMHOAfuUOOPar92kgwvSUacm7
 ZqpQ==
X-Gm-Message-State: AOAM5336/O7n7W0mEbVmHxvatAFI5hUt0F3dxGqwvyZ8L1sn7TRd/8HV
 svJFqufOWfaSfz6h0Wpo85pAc7Xd49AclA==
X-Google-Smtp-Source: ABdhPJwo7VdX41AiAnvdLmOfh2xss/4KkF2bIxKuGgYqwZqwAHX+1HxxwSiq4hWu+86jtw6Cye1Aiw==
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr4640676wrr.280.1616514751554; 
 Tue, 23 Mar 2021 08:52:31 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm23900591wrr.58.2021.03.23.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/13] blobs: Only install x86 blobs if x86 system targets
 are built
Date: Tue, 23 Mar 2021 16:51:31 +0100
Message-Id: <20210323155132.238193-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 meson.build         |  2 ++
 pc-bios/meson.build | 23 ++++++++++++++---------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index addea8c39d7..e484670c5b7 100644
--- a/meson.build
+++ b/meson.build
@@ -101,6 +101,7 @@
 install_blobs_riscv = false
 install_blobs_s390x = false
 install_blobs_sparc = false
+install_blobs_x86 = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
@@ -112,6 +113,7 @@
     install_blobs_riscv = install_blobs_riscv or target in ['riscv32-softmmu', 'riscv64-softmmu']
     install_blobs_s390x = install_blobs_s390x or target in ['s390x-softmmu']
     install_blobs_sparc = install_blobs_sparc or target in ['sparc-softmmu', 'sparc64-softmmu']
+    install_blobs_x86 = install_blobs_x86 or target in ['i386-softmmu', 'x86_64-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 89efe4359e4..d21187545cf 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -27,10 +27,6 @@
 endif
 
 blobs_ss.add(files(
-  'bios.bin',
-  'bios-256k.bin',
-  'bios-microvm.bin',
-  'qboot.rom',
   'sgabios.bin',
   'vgabios.bin',
   'vgabios-cirrus.bin',
@@ -57,11 +53,6 @@
   'efi-virtio.rom',
   'efi-e1000e.rom',
   'efi-vmxnet3.rom',
-  'multiboot.bin',
-  'linuxboot.bin',
-  'linuxboot_dma.bin',
-  'kvmvapic.bin',
-  'pvh.bin',
 ))
 
 if host_machine.system() == 'windows'
@@ -131,6 +122,20 @@
   ))
 endif
 
+if install_blobs_x86
+  blobs_ss.add(files(
+    'bios.bin',
+    'bios-256k.bin',
+    'bios-microvm.bin',
+    'qboot.rom',
+    'multiboot.bin',
+    'linuxboot.bin',
+    'linuxboot_dma.bin',
+    'kvmvapic.bin',
+    'pvh.bin',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


