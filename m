Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0CC346577
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:39:12 +0100 (CET)
Received: from localhost ([::1]:43932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk3j-0000wm-NO
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJz-0005HW-SF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJu-0003Ss-Do
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so10969792wmd.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kuIsTlDZ9YAx5U7A0Fz+JimisCcfGpcI7V+925HgeYw=;
 b=VjIl0pDIzxV8JI7on+Lcb2/mBacxaTgoKx/OxpG+p5wBFWLFcsugNzZJU3ckzhhpjN
 RR/fo5pjUkdft+iLTWKr72NWueuuYs5Cv03886nOZYzAG+TzT+nH7RQtI1jivv2cYWwb
 xstuLkOB4024WndedevfNfFg29EEphudJYFmjEOQX+pUzoxEoxgoZ0JDwo94z7hNK7NK
 HRGX5XQuf9WfVNZtSxQ9Xjv+SzaJyDMaS55KR5EOpro26rN+cxenTSWK4tKSiYkRCrez
 nO+w2ieyyBrBJ1Q8fEsi/3aFH1bU65S0YezjOycuQRFlopCdmYdVnmdjmaK9UINsMK+/
 HEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kuIsTlDZ9YAx5U7A0Fz+JimisCcfGpcI7V+925HgeYw=;
 b=KiKM+RoVGwWIOpePS9zseVhvSNMHCGpuExN+jkVcnuTMzB35cw7v0h6pnrtjT2N9JX
 T9/BiWUkDqcfYhj/QdRN3FcIvjhQCf9Vm1Two6SJG3p3DEUSUg8/FcNgUZaN4RlYLMr+
 qQS3Dcfiyn5oiVW0jApanIR+M5AubqOXYfWoCXoQzE95Curi4NPoxtqlu8W7XbfMjw/4
 bnNWtdsxC16QeQRXCPU/7uDBz+Jt29pCSWNs/Yt/kJipsSKtBshE1aMDW+doXFjCAJF7
 6Mxoc4rsnJPp5tlH3AVMnDqnmVpPZpWqYgdCd7BF4LrkvmE3O3KNmqe9fuWLl6a02+CD
 uFng==
X-Gm-Message-State: AOAM530XkoEDNTBO8SM7o5/syC6+0d/tvqpujZFIJ1QNEN6Tjfi1ts8p
 K2sEZMdk7R0yUt6yAXjexqlUqtp7DO6FoQ==
X-Google-Smtp-Source: ABdhPJwMFD0um+mXKiAxBXT0vSiIi4eJHyjO9PzdI0Ghieyl++/7WoXSYX1kZBXy09yckcH+kTus2Q==
X-Received: by 2002:a05:600c:21d2:: with SMTP id
 x18mr3948209wmj.175.1616514708299; 
 Tue, 23 Mar 2021 08:51:48 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l8sm24467177wrx.83.2021.03.23.08.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/13] blobs: Only install qemu-nsis.bmp on Windows host
Date: Tue, 23 Mar 2021 16:51:22 +0100
Message-Id: <20210323155132.238193-4-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Stefan Weil <sw@weilnetz.de>
---
 pc-bios/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index d270d8516c9..007cf9d2afb 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -60,7 +60,6 @@
   'efi-virtio.rom',
   'efi-e1000e.rom',
   'efi-vmxnet3.rom',
-  'qemu-nsis.bmp',
   'bamboo.dtb',
   'canyonlands.dtb',
   'petalogix-s3adsp1800.dtb',
@@ -86,6 +85,12 @@
   'npcm7xx_bootrom.bin',
 ))
 
+if host_machine.system() == 'windows'
+  blobs_ss.add(files(
+    'qemu-nsis.bmp',
+  ))
+endif
+
 blobs_ss = blobs_ss.apply(config_host, strict: false)
 
 if get_option('install_blobs')
-- 
2.26.2


