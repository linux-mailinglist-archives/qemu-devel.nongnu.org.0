Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD63465B0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:52:43 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkGn-0003uc-00
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKf-0006DY-HG; Tue, 23 Mar 2021 11:52:39 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKS-0003m6-28; Tue, 23 Mar 2021 11:52:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so11120325wmj.2; 
 Tue, 23 Mar 2021 08:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DqJW1hILC/ty2QB5cQctASJtlCb2+R3sgj4EuGmuys=;
 b=GJSEbMUHcK7MG1bOkO17yk6KMdusvFzkeFNWiEp6u+TCKUQoQrhc9vdCdLw6TJcKZu
 sqSHy76uPlx6PCStqBAPlfv+yay+T8WSseU/POu6j3/yi83CJpPyyBd5P6rSD5zPPE6x
 Izrv/0cJpGVP71l8hsVFA/o9KTSMeAbQqMu5/5vf8mzB8NO3sBwafzXk/72jqFpbll6T
 Y1KZ/pSYWcoZqM/sLnhxf+8PYVGA8XxV4h1wvJC+WQcwC2XOSQn77YsomE73V7BWUDiV
 /Cf9l9D4if/Tb6+qHJKWH8hEAUuWHqptn8lcnV8ZCzYL4eV4PNuK1VINYg4Cx+YgeX0Z
 H6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+DqJW1hILC/ty2QB5cQctASJtlCb2+R3sgj4EuGmuys=;
 b=aHDVY4YMHzIGtUjVAlRroHOFkzUUSVb6kCBPzCOPIUQsVJuqibHuMt8hAbf+yNMq5f
 yFoQIcyktJ8z5lSWcXnDmCehPS9HtExzZybtzrPilRWFdGezHPwwkNf46NfxD8oSoUam
 oE6e+xe1X0zHGz0xe0cJNlHTLdDFRYB0PClml4gDe2SsEuEW/xKehujqYHXkM9KBmsqi
 w72xpTklUoPYeRPd80HtqyqWb8uMU5PVWi1yLEmWF5ftisbkeYXRQ8KJIrlb2Dms9a0k
 2dI6XEcKh3nBrbXmsU2sEKb7uGhxslA4BnA5WuhtAn845yGZAyiyDVsE//e+tso6FsnI
 Z7Hg==
X-Gm-Message-State: AOAM532vii4mkeLgc6ogWezhXgsz8QAQurCSlhc/tBU1VsKZB/PzN2qk
 Hr7s0wuMvfCg5Er1bxq/ML1eBJ3N76nHaA==
X-Google-Smtp-Source: ABdhPJxQV4LtGiyYIBigA5Cb8mTzHIyoyQnjdxfUMhiJPQLhBx2aMWa4nwF3yrCztkKPhc/cJ7AEuw==
X-Received: by 2002:a1c:bb0b:: with SMTP id l11mr4126287wmf.150.1616514742008; 
 Tue, 23 Mar 2021 08:52:22 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c131sm3108481wma.37.2021.03.23.08.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/13] blobs: Only install s390x firmwares if s390x system
 target is built
Date: Tue, 23 Mar 2021 16:51:29 +0100
Message-Id: <20210323155132.238193-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org
---
 meson.build         | 2 ++
 pc-bios/meson.build | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 4b614b30ed9..fccda30ffc7 100644
--- a/meson.build
+++ b/meson.build
@@ -99,6 +99,7 @@
 install_blobs_microblaze = false
 install_blobs_ppc = false
 install_blobs_riscv = false
+install_blobs_s390x = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
@@ -108,6 +109,7 @@
     install_blobs_microblaze = install_blobs_microblaze or target in ['microblaze-softmmu', 'microblazeel-softmmu']
     install_blobs_ppc = install_blobs_ppc or (target.startswith('ppc') and target.endswith('softmmu'))
     install_blobs_riscv = install_blobs_riscv or target in ['riscv32-softmmu', 'riscv64-softmmu']
+    install_blobs_s390x = install_blobs_s390x or target in ['s390x-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 504f03ec925..27c0f316dee 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -64,8 +64,6 @@
   'linuxboot_dma.bin',
   'kvmvapic.bin',
   'pvh.bin',
-  's390-ccw.img',
-  's390-netboot.img',
 ))
 
 if host_machine.system() == 'windows'
@@ -121,6 +119,13 @@
   ))
 endif
 
+if install_blobs_s390x
+  blobs_ss.add(files(
+    's390-ccw.img',
+    's390-netboot.img',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


