Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7068A836
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:38:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAIe-0005qp-L1; Fri, 03 Feb 2023 23:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAId-0005qX-8G
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:15 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAIb-00006N-GD
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:37:15 -0500
Received: by mail-pl1-x629.google.com with SMTP id k13so7262767plg.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 20:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTOJyi7EVTt6od/2zEyr3NR0+JBQ0jPNZxhqIGgUa8c=;
 b=nV6p0MeYNO/1SwwcAtkKOvjd/oTtviJ6LnvnxDfwtpp7JUXV1qyRlXCQqWW3cD4xR+
 9X4DRf0OcShXT31DuB0a1bK0y/2CRVeNEO5Yq0wgVrPYVZPzIU2AWFLOIuyAPzSOZNLJ
 nPSwkEN98H8hRPAcTcQvkG1d6OS0Hl13iwzK9HXtI8LpINbvzBGUyUnqFzHelzVL2VpL
 mfP7BpOJIZ/kvNONqqVh1jUhYjXUJAQxNKisAlVRYhkRLCjbw44Z/DBupDx0LgbjQBxk
 VX8LDZalILSgE/qy8UNhpymgTGUHAZPLF/Kg51/SywysiaskLm5XnERSxtv0pQZdtKwy
 eTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CTOJyi7EVTt6od/2zEyr3NR0+JBQ0jPNZxhqIGgUa8c=;
 b=1GoE/IGkqtHUaqtffWRfV6QoziqtpeBrm3U6mlCDm6P9+/A3TLsEWV0/Wox2kfPtj5
 FzReaVMuf7Cr3lv55LXNwiHjOXMvobHN8QBPJA4T7MOs1u8Za7PD6igcnOAROueaAu9K
 PSnF9fYVVkszoeRXrnkvK1kh02tuycOPxjpbtr/fadbl5PK705zOn4Oee+TNo7atub7/
 C5/z3ncLRuAs+AsqkUTm5syopxqrmjYc2yNPi6eHAiBuYmAI/JkvD/NHyCMVeDgDZG3r
 Cd6b1q0lV6dN1kBFpIhhkwNfds1jTtVurVrxAHGbU25BZNz6a0Ts6C0q9fo18GHJRwbW
 9BqA==
X-Gm-Message-State: AO0yUKW27isSOjGQ7szyKnBedPpwporO/JD64x4fiXY25RxLFgkDoXvy
 h/wmzDZlWGBddogOBlLF+C+pDg==
X-Google-Smtp-Source: AK7set++TB+AdByP2mZ+chu7zpREAmhxAiZ5UsdVaeV6Gi3qN91n9Da6+R5UWj2X0NSEOIioSitGrg==
X-Received: by 2002:a17:90b:4c0e:b0:229:4dcd:ff61 with SMTP id
 na14-20020a17090b4c0e00b002294dcdff61mr13121317pjb.28.1675485431335; 
 Fri, 03 Feb 2023 20:37:11 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a17090adb0700b002308f6e7f41sm225707pjv.55.2023.02.03.20.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 20:37:11 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v8 7/8] tests/avocado: Add igb test
Date: Sat,  4 Feb 2023 13:36:20 +0900
Message-Id: <20230204043621.13540-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

This automates ethtool tests for igb registers, interrupts, etc.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 MAINTAINERS                                   |  1 +
 .../org.centos/stream/8/x86_64/test-avocado   |  1 +
 tests/avocado/igb.py                          | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 tests/avocado/igb.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 127fd92541..c0831aeb56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2225,6 +2225,7 @@ igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/igb*
+F: tests/avocado/igb.py
 F: tests/qtest/igb-test.c
 F: tests/qtest/libqos/igb.c
 
diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
index 7aeecbcfb8..7e07dbcc89 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/test-avocado
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -37,6 +37,7 @@ make get-vm-images
     tests/avocado/cpu_queries.py:QueryCPUModelExpansion.test \
     tests/avocado/empty_cpu_model.py:EmptyCPUModel.test \
     tests/avocado/hotplug_cpu.py:HotPlugCPU.test \
+    tests/avocado/igb.py:IGB.test \
     tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu \
     tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt \
diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
new file mode 100644
index 0000000000..abf5dfa07f
--- /dev/null
+++ b/tests/avocado/igb.py
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# ethtool tests for igb registers, interrupts, etc
+
+from avocado_qemu import LinuxTest
+
+class IGB(LinuxTest):
+    """
+    :avocado: tags=accel:kvm
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:31
+    :avocado: tags=machine:q35
+    """
+
+    timeout = 180
+
+    def test(self):
+        self.require_accelerator('kvm')
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        kernel_hash = '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
+        initrd_hash = 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        # Ideally we want to test MSI as well, but it is blocked by a bug
+        # fixed with:
+        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28e96556baca7056d11d9fb3cdd0aba4483e00d8
+        kernel_params = self.distro.default_kernel_params + ' pci=nomsi'
+
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_params,
+                         '-accel', 'kvm',
+                         '-device', 'igb')
+        self.launch_and_wait()
+        self.ssh_command('dnf -y install ethtool')
+        self.ssh_command('ethtool -t eth1 offline')
-- 
2.39.1


