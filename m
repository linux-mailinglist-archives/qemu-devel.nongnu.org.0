Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D3681133
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUr1-0003Gw-Rt; Mon, 30 Jan 2023 09:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqt-00033N-Ad
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:44 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqr-0007tY-Ha
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:43 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b5so4479420plz.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2qTfeWrJluLuVNB72grEFW1qk7ta0SqRfMD7BVVAZw=;
 b=CP6Ga1YhypXLH3WKFLg9naRMPMW2Zm7YYdMgn7IR0/fMkInDLW17r2kyoGd/qAKXkz
 P0X9HfmqzdGDTqxEMunRe8xcsQmV7yK8GA/TcjybC9Y7mivu09CG35s/DE+CqZk/ch+K
 HU6OiTqukLwbATOkghoKddpFlaPihPOEAwUdF0EBjOTGlSyiXIDoBiElFLi7WdIDMgCb
 PQlVaEciWTTak5pu1ciraY8fgwrDdNRyx8uklPAdlMi5kOkid4x6HAQJCMPmmUVXBtmL
 eW/OBCp0uUa0M/yfZUeMG6af0k7qwTSCQOcp27RD70hFVAja5/2NMhtHeG1vvIFVE1c/
 gVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y2qTfeWrJluLuVNB72grEFW1qk7ta0SqRfMD7BVVAZw=;
 b=cBnc/gYQsJHmwLrFJuPHBT+o1Ztu6M4tP4XNObgcH2E3jZZZZMBjEH1ZvIycmIaP3B
 Z7YRJGw9aNnfFbqWC9Ny/q/rAgEk0CpbUwK9nWU8Ca6pf91xi4sURt1GhjwbCSRj52/X
 Wp++dduej+EzD9NEaU4VZKvOgZI4PyueJZXje6/YbE9EFxab7B5unTLKy2l7IL3hRBpr
 KxDcJGLGo9yVrWBOungzSTUpqAt4gw6Z4YaAc9YUPeazF39oFoal9En93D0GPZssU8Ik
 o/UxFLhl5EzhH97e/YqFpvCg/lA8/5a0bJn/CN2HLs29t+nG8+sqm01dn066smkJbPUv
 P6fA==
X-Gm-Message-State: AFqh2krzkJznMeP449jfMN2g24NI3DraB/EHIqbmdxWsJMphUY7S4I9M
 C+gYslSHODzZgBOOipE9yyrZTQ==
X-Google-Smtp-Source: AMrXdXtgIyXYvgxxioveKnJlPZjVugXkHbKHz+aGaoIi7MB3zSDx4xX8AehK8VG7fT+ecoCpZtr9eA==
X-Received: by 2002:a05:6a20:7fa5:b0:b9:4afb:1472 with SMTP id
 d37-20020a056a207fa500b000b94afb1472mr60678547pzj.13.1675087780174; 
 Mon, 30 Jan 2023 06:09:40 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u70-20020a638549000000b004468cb97c01sm6962977pgd.56.2023.01.30.06.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:09:39 -0800 (PST)
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
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v5 9/9] docs/system/devices/igb: Add igb documentation
Date: Mon, 30 Jan 2023 23:08:09 +0900
Message-Id: <20230130140809.78262-10-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130140809.78262-1-akihiko.odaki@daynix.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 MAINTAINERS                      |  1 +
 docs/system/device-emulation.rst |  1 +
 docs/system/devices/igb.rst      | 71 ++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 docs/system/devices/igb.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index c0831aeb56..e85957e37f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.*
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
+F: docs/system/devices/igb.rst
 F: hw/net/igb*
 F: tests/avocado/igb.py
 F: tests/qtest/igb-test.c
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 0506006056..c1b1934e3d 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -93,3 +93,4 @@ Emulated Devices
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
    devices/canokey.rst
+   devices/igb.rst
diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
new file mode 100644
index 0000000000..70edadd574
--- /dev/null
+++ b/docs/system/devices/igb.rst
@@ -0,0 +1,71 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+.. _igb:
+
+igb
+---
+
+igb is a family of Intel's gigabit ethernet controllers. In QEMU, 82576
+emulation is implemented in particular. Its datasheet is available at [1]_.
+
+This implementation is expected to be useful to test SR-IOV networking without
+requiring physical hardware.
+
+Limitations
+===========
+
+This igb implementation was tested with Linux Test Project [2]_ and Windows HLK
+[3]_ during the initial development. The command used when testing with LTP is:
+
+.. code-block:: shell
+
+  network.sh -6mta
+
+Be aware that this implementation lacks many functionalities available with the
+actual hardware, and you may experience various failures if you try to use it
+with a different operating system other than Linux and Windows or if you try
+functionalities not covered by the tests.
+
+Using igb
+=========
+
+Using igb should be nothing different from using another network device. See
+:ref:`pcsys_005fnetwork` in general.
+
+However, you may also need to perform additional steps to activate SR-IOV
+feature on your guest. For Linux, refer to [4]_.
+
+Developing igb
+==============
+
+igb is the successor of e1000e, and e1000e is the successor of e1000 in turn.
+As these devices are very similar, if you make a change for igb and the same
+change can be applied to e1000e and e1000, please do so.
+
+Please do not forget to run tests before submitting a change. As tests included
+in QEMU is very minimal, run some application which is likely to be affected by
+the change to confirm it works in an integrated system.
+
+Testing igb
+===========
+
+A qtest of the basic functionality is available. Run the below at the build
+directory:
+
+.. code-block:: shell
+
+  meson test qtest-x86_64/qos-test
+
+ethtool can test register accesses, interrupts, etc. It is automated as an
+Avocado test and can be ran with the following command:
+
+.. code:: shell
+
+  make check-avocado AVOCADO_TESTS=tests/avocado/igb.py
+
+References
+==========
+
+.. [1] https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eb-gigabit-ethernet-controller-datasheet.pdf
+.. [2] https://github.com/linux-test-project/ltp
+.. [3] https://learn.microsoft.com/en-us/windows-hardware/test/hlk/
+.. [4] https://docs.kernel.org/PCI/pci-iov-howto.html
-- 
2.39.1


