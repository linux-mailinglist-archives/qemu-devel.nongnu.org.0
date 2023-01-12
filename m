Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9415966705F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:01:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuO8-0004i4-4B; Thu, 12 Jan 2023 05:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNq-0004ge-Tx
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:31 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNp-0004tj-0k
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:30 -0500
Received: by mail-pl1-x636.google.com with SMTP id jn22so19695615plb.13
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gSY901PYjolzNvyaNXv/rSq1CXtHrnASnZQFkxUeWZc=;
 b=em432JZqPo9yeAUertheP0wDHLUyPDssLwGppYvCO2gGRbSI/m61wSeLYMrYr2ZE+9
 vJ4qb5BEcKE58cMr0SrEBf+A9B5dPSYl82PdfH9Yj25I1M8xgenUAIh0C/UGhCnc+2KV
 YNOyXDps7Xv8wIkltsNJ27ttxcYY8BJG7pbziihwboKZTVpvbY4TkDsJElx4FrqaRguR
 C4XMG31e6e21i0NZNJsU0dNoXUr8vcGNj4xB10xGY6HPDMDgabszppUTzhVj8pKxxqxV
 r/DfMaKvx3iwcl1itNz4zqpEVf6GI2l0h+LT2hLKix69Y5FWFRmu6QhVe0Xd+4dgfBHV
 6izA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gSY901PYjolzNvyaNXv/rSq1CXtHrnASnZQFkxUeWZc=;
 b=UUD2VllQL8HW6TP26Ip0gI+U26y8sc3l8Xzo07afcputXw4yXq28OQPCIn6qInAmis
 NrhJVmTh/691vXgbUS/ndydyCDwZzqzXLSxR5dl0bk4gz5KyGkcDWYVm9hdBHxVsX3GS
 OgOZyXfiah3yNXwiGGYge9jTAFVv4M7vslN2ttVg+lS6VVxGOfOyDR+WinrIl1mY947I
 EGv4uQ4VH/MUAq+g5NRl9wqaSRnN0AursEjsleGnDFNJO5N4kRdx/X9HsfE5q6Jc1iCE
 hU+8Ez2auGDuw9hrDsU9WEqEosb+36chn3yJu4m9ZYMH/y0nkHN5f2Fo6UY8ugM2q1gL
 pw2Q==
X-Gm-Message-State: AFqh2ko0WuLGnY7C16pseKXc115DhcBobVg6l+UhyxBoha1qyfCRZbPg
 857KLnvEIGv/UVuVR5x8kxHrmw==
X-Google-Smtp-Source: AMrXdXsp0O9BvF7dKgsQzXOq0IkWAx8gxHXkVmcykq7AfP+Sg4KiKfG/noy0kLYuqyfbONlXx2Bflg==
X-Received: by 2002:a17:90a:f191:b0:226:fbcc:2c1a with SMTP id
 bv17-20020a17090af19100b00226fbcc2c1amr18215466pjb.3.1673517627634; 
 Thu, 12 Jan 2023 02:00:27 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.02.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:00:27 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 30/31] tests/avocado: Add igb test
Date: Thu, 12 Jan 2023 18:57:42 +0900
Message-Id: <20230112095743.20123-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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
---
 MAINTAINERS                                   |  1 +
 .../org.centos/stream/8/x86_64/test-avocado   |  1 +
 tests/avocado/igb.py                          | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 tests/avocado/igb.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d4a3b4f6db..5301c1908f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2212,6 +2212,7 @@ igb
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
2.39.0


