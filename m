Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A12346589
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:42:33 +0100 (CET)
Received: from localhost ([::1]:52118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk6y-0005pU-FO
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKT-0005sa-Ti
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:25 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjKD-0003ge-R5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:52:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id x16so21275808wrn.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3IX+oBABgBBJ8mTl0P2HqszyCFPQo6B03YV79rC/Ew=;
 b=icUzzGertqWYPLF4W66cq4Z6N2ToMOze1yjvujttzLn3w/GxATWwKv2eR5on3dddQi
 Nt/LKRW75MOpBoAAMoV0age91NwdNIDYumzDwYIuMuTInbxrWeZmILZCDuIgGaXc3/wy
 kMqCW2c62yJcSz5W6LOvhK9+9sNjbm+eme1D5r3bzWuD0rmVW3Yz+RtCY0hHe/gpjDRk
 86BMyIa4AM1OE24N3H5lBU5VAj1+YRjptBUN/hnetRoEl4n1z7PsWrA6u92k5kALIITG
 HrJe5c2OMUvAyTYzJpvnovQeK9zMxsR3RtBboDFE/EZ5CS+vyMWKwXyirW+9QI08dSGj
 Xbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=f3IX+oBABgBBJ8mTl0P2HqszyCFPQo6B03YV79rC/Ew=;
 b=dlotjaFI+yY+mD/EKyfIhbK3JEPTYPEzFMUW2h0WidzQTx/cyJD3VV+OXgkHU22fEw
 8WMDjXZOxBiOiAQh2fT3+yO9ZegNuU+bMxQ7TzdE8p1+avXe/8bgxGPocKhBfBQkx28y
 noL6M77CcwxE3Ny14bW0X8XYR7gjF+5s/OmJYhY5BHIWa3CCNj+MtOm0gvZBwfzD6Aao
 F3DNInY8JkDEga+JbMvGwLK/SbAdOCamyYMmUegQqiQiIDBg7Hs92WjmyZ91PQqjjGqK
 0fdUf/0n4Tkat3XW0mZBPfsIAf1gPb/AopqKMLryG1YLM91/GpRnru3gryE4661iHtC+
 6RJw==
X-Gm-Message-State: AOAM530hpa2W0B/GiChQ6vxAs9wLnUF9d7mWBHwaY6xKpOD7wPa1yVcI
 uF0XvHzEvKCPWlEIFVz471+T0h4U318Aww==
X-Google-Smtp-Source: ABdhPJwL87VZN28mpG4DMw3vJmkCO557fI13g/NgbBU8yfRPdFu25VdjJEo2bvXbKcGhXX6v2leNcQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr4850901wrj.310.1616514727405; 
 Tue, 23 Mar 2021 08:52:07 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p16sm28402059wrt.54.2021.03.23.08.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:52:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/13] blobs: Only install DT blobs if microblaze system
 targets are built
Date: Tue, 23 Mar 2021 16:51:26 +0100
Message-Id: <20210323155132.238193-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323155132.238193-1-f4bug@amsat.org>
References: <20210323155132.238193-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
---
 meson.build         | 2 ++
 pc-bios/meson.build | 9 +++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index a7f3b60d08e..e3418815b04 100644
--- a/meson.build
+++ b/meson.build
@@ -96,12 +96,14 @@
 install_blobs_alpha = false
 install_blobs_arm = false
 install_blobs_hppa = false
+install_blobs_microblaze = false
 if get_option('install_blobs')
   foreach target : target_dirs
     install_edk2_blobs = install_edk2_blobs or target in edk2_targets
     install_blobs_alpha = install_blobs_alpha or target in ['alpha-softmmu']
     install_blobs_arm = install_blobs_hppa or target in ['arm-softmmu', 'aarch64-softmmu']
     install_blobs_hppa = install_blobs_hppa or target in ['hppa-softmmu']
+    install_blobs_microblaze = install_blobs_microblaze or target in ['microblaze-softmmu', 'microblazeel-softmmu']
   endforeach
 endif
 
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index c494c334e26..a6185feff58 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -62,8 +62,6 @@
   'efi-vmxnet3.rom',
   'bamboo.dtb',
   'canyonlands.dtb',
-  'petalogix-s3adsp1800.dtb',
-  'petalogix-ml605.dtb',
   'multiboot.bin',
   'linuxboot.bin',
   'linuxboot_dma.bin',
@@ -106,6 +104,13 @@
   ))
 endif
 
+if install_blobs_microblaze
+  blobs_ss.add(files(
+    'petalogix-s3adsp1800.dtb',
+    'petalogix-ml605.dtb',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


