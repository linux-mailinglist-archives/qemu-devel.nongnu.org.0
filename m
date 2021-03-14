Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0433A8A9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 23:55:52 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLZeI-0004bP-HP
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 18:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLZbm-0003vK-VV
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:53:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:32917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLZbk-0003cj-EY
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 18:53:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id 7so7774360wrz.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 15:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=phsPrYfKakOJB7z0iRcHLh8T8bwjcghz3J5ilQl+um8=;
 b=i628NyHHNLUnHj63FkvFAwfRAqTr/Ylonf9NGSus30gLsc+fIYxzR9vd+iAYElGTcU
 5yPaAM64djs2mMvlS0L8Emrmbjb5AYZubOOL7RSLdCnXulI/ljjvP2O54wQBkLKKAUMb
 cuIz3YBlmCZWwhMvFwFdoH/mci3d6aO2mPAxMB3SLNrFmXXtphkVcl9jeKsRD0QUA6tT
 ukCwMxj6Cz9dXmg9OcN7AYkEjuhamW/DVipeFSE7ifZX5zlth4KBC7IWnzDYzLZAvfSu
 6VbSNKQwwot5Fik+5aTGeZeWLk98VEx+T8+LAfX34kHrJ+mWycmkwrF3ePH6AVSBdgzU
 1J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=phsPrYfKakOJB7z0iRcHLh8T8bwjcghz3J5ilQl+um8=;
 b=RzcP2//jTzarMJmHpxRxokQMC5DjhFHMLNj4ZHDja7I0VXIzvVZNznPTznBAPgziPt
 qhPNiGjlcLpVYYYmm5oLP1ORBrEIbz+zDjq9PuYO4PURb/wXoMipyxhPpy7ybzeYKKpW
 U+wnnr+5RWGZTrzuWVwhz7rw/OJ+DD/FfNKbi+8VQW3NeUc5aR6jqLWlGcWc8++5VNwW
 ExY90mciVKJCvPk0iuv1BPMccxgeyCYWZ/8rYzML3M8KJideCc221DvkLFbc6hoN79eH
 rugNTcTz2erMH7fFAPoq55vfYXnQl/cf36Dk0xrw11/7xhW9hIdywEmdJnac1vIfdO8V
 Ggtw==
X-Gm-Message-State: AOAM531T8L1OKelfxo25KGLeR3dvErgoHIdUm75IX+L3MzfZomapNvBZ
 yY1z6liZ1q3vfE2e08fOjN/esRUNth+DcQ==
X-Google-Smtp-Source: ABdhPJwzrYiQUztinlmZOMjcLoDHDNrXXuJTAPAT3V+KGZySVBcsZgBX9sNL76nFpkMgCXSle7RE/g==
X-Received: by 2002:a5d:4fc5:: with SMTP id h5mr25329669wrw.33.1615762390782; 
 Sun, 14 Mar 2021 15:53:10 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i3sm17502299wra.66.2021.03.14.15.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 15:53:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] qtest/libqos/meson: Restrict architecture specific objects
Date: Sun, 14 Mar 2021 23:53:08 +0100
Message-Id: <20210314225308.2582284-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various libqos files are architecture specific.
Restrict the ARM/PPC/X86 units to their targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/qtest/libqos/meson.build | 51 ++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 1cddf5bdaa1..817c2cc2c20 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -1,4 +1,8 @@
-libqos_srcs = files('../libqtest.c',
+libqos_ss = ss.source_set()
+
+libqos_ss.add(genh)
+
+libqos_ss.add(files('../libqtest.c',
         'qgraph.c',
         'qos_external.c',
         'pci.c',
@@ -6,18 +10,6 @@
         'malloc.c',
         'libqos.c',
 
-        # spapr
-        'malloc-spapr.c',
-        'libqos-spapr.c',
-        'rtas.c',
-        'pci-spapr.c',
-
-        # pc
-        'pci-pc.c',
-        'malloc-pc.c',
-        'libqos-pc.c',
-        'ahci.c',
-
         # usb
         'usb.c',
 
@@ -39,7 +31,28 @@
         'virtio-rng.c',
         'virtio-scsi.c',
         'virtio-serial.c',
+))
 
+libqos_ss.add(when: 'TARGET_I386', if_true: files(
+        'pci-pc.c',
+        'malloc-pc.c',
+        'libqos-pc.c',
+
+        'ahci.c',
+
+        # qgraph machines:
+        'x86_64_pc-machine.c',
+))
+libqos_ss.add(when: 'TARGET_PPC64', if_true: files(
+        'malloc-spapr.c',
+        'libqos-spapr.c',
+        'rtas.c',
+        'pci-spapr.c',
+
+        # qgraph machines:
+        'ppc64_pseries-machine.c',
+))
+libqos_ss.add(when: 'TARGET_ARM', if_true: files(
         # qgraph machines:
         'aarch64-xlnx-zcu102-machine.c',
         'arm-imx25-pdk-machine.c',
@@ -49,11 +62,15 @@
         'arm-smdkc210-machine.c',
         'arm-virt-machine.c',
         'arm-xilinx-zynq-a9-machine.c',
-        'ppc64_pseries-machine.c',
-        'x86_64_pc-machine.c',
-)
+))
+libqos_ss.add(when: 'TARGET_AARCH64', if_true: files(
+        # qgraph machines:
+        'aarch64-xlnx-zcu102-machine.c',
+))
 
-libqos = static_library('qos', libqos_srcs + genh,
+libqos_ss = libqos_ss.apply(config_host, strict: false)
+
+libqos = static_library('qos', libqos_ss.sources() + genh,
                         name_suffix: 'fa',
                         build_by_default: false)
 
-- 
2.26.2


