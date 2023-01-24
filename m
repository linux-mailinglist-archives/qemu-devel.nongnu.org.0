Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ADE678F80
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:49:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKBED-0007Zs-Lc; Mon, 23 Jan 2023 23:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBEA-0007Oe-3P
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:48:10 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKBE8-000546-7k
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:48:09 -0500
Received: by mail-pj1-x1036.google.com with SMTP id 88so2102603pjo.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2YUXT/BrHu83UWwM4P6yrBqgLIysR/wo2QN3NclKcI=;
 b=C9v6UsCuM/WAkWHEF10qzsH2eCIPshZUHARGhFVY0v5VC26Jb0qV9EpH/p8kFkwrEa
 VmtTY5tMpELT4pGm2KWz/ODzBDufaDVR6xPdrcdabfuzmFKbGmbndtCCsSdu1LFDHuGl
 W1fcEI0H4Y8S27kmK9sYZrOoBGWkvkZcyOuZQYqFAymb5VE6KCxE+KYhNXKoe63Z650D
 86DY4eAR9je5hI32a6S8DjNwHvfGEZp0WmM9OIZzBkfkvnIimKHhpzhH5fCdiw4bhVZN
 MK8FV/RE1mMdKvZIOBgEB8eTVNr9UKTLOx0YpMoyROukP1YbgwfLkbBgj7JW1uspoE5f
 4jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o2YUXT/BrHu83UWwM4P6yrBqgLIysR/wo2QN3NclKcI=;
 b=K1rDPuH4VNCJ0a3BwyfdiJD6iKkyqSCFkUZKKcIvZ6jN+8FergQzyHcsQPIJMSvOVD
 3eCr2ffwXR9AwQzAUIQI+bdccBpZUEAjWzE/ev47XqUIyRTUHA9KGJxMG5z2H/GVLf58
 h+yItv9o+2E9L6FmhFGzpLf3cRDkMKibh/mXR6y9Wph8LIXvWaIPJfRgZ/y8ay+tLwbR
 xnDbHA5R0qFzuOyo8nsKzzYJCpUe+b7tqmb5AFUQWQqSBFruu9MzRaW/Q1Kf5MnPhLxA
 YviO5L/fwKlez/e4mmwH5HhGNWaKGWA9uj3T/LqryEDylx11PC+niftNmU1u9FRtPsnW
 z8Lg==
X-Gm-Message-State: AFqh2kply6JjP4PNnIBZ7HQOh124WxhzMr2zFMCmZ7GcxUCuuxm3Y6L6
 5qnq0yj6q95M4dfldf7IKjXXDQ==
X-Google-Smtp-Source: AMrXdXuBO33lFHYgktfMC73uxw/Kbtee3nM2vvcdGHuSKbLoKOuj/2VfhAHiU9KRglg2l77WCZbJyg==
X-Received: by 2002:a17:90a:6e4a:b0:223:f234:6a3 with SMTP id
 s10-20020a17090a6e4a00b00223f23406a3mr27924608pjm.49.1674535686985; 
 Mon, 23 Jan 2023 20:48:06 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a17090a4d4600b00226f9c7474esm7324855pjh.54.2023.01.23.20.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:48:06 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 13/13] docs/system/devices/igb: Add igb documentation
Date: Tue, 24 Jan 2023 13:46:50 +0900
Message-Id: <20230124044650.14144-14-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124044650.14144-1-akihiko.odaki@daynix.com>
References: <20230124044650.14144-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
index fb36b3412d..00b6830bc4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2224,6 +2224,7 @@ F: tests/qtest/libqos/e1000e.c
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
2.39.0


