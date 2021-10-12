Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2357C42AE75
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:06:07 +0200 (CEST)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maOyL-0005Jx-Tn
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrn-00060P-E8
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1maOrl-0005b1-6q
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 16:59:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so588657pjb.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 13:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpNsM5XY4rcID/wtOi7sQNeAxSi3CpYv6QrAcnaW0PY=;
 b=DYOct+Q82N0NimPcQyb6gNFGkh5UNQXH7Pbk8X+hURmXLyeLCZvYgsWVARPe7vgK8u
 3mRSo5sMXkNGmg7dekjw8VWjwUdULZykUPqy9gngU663QamtndRvrma+jdL4ikNh6ePj
 ixpRc/JemUW241LvW2x/B2kg/XfbGpRZ67Npr2TqXi+8W/p7Z7czQc/SNUlg7DTn8Rnh
 7y27WdzU3zHH7aN4mna7v7h2A26L/8WXr5qQTKj6r1g7hbrowFO/F0mdqsXDEKalB/5U
 a1E3PWk0XUwzhbUKPoJRX73yN08mVv9SBtfzS6Bhd2GfBMDhg661YlzKwxzqluOB2X87
 3mlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpNsM5XY4rcID/wtOi7sQNeAxSi3CpYv6QrAcnaW0PY=;
 b=CJxAyADiWkSo14nQRbcKACD0SvDWrXN6hBGbkRB+2elCUi8IhQkgBCK42SW0tS5Bof
 wknBkFmGfEMmz1pfbdCp59ohCZnFrc6Fv2VIw2LF5OCGG9bygukFn6M306yMxTabfESK
 n6HBcFGyIBZ7mvhkokLwKEpZlhXeeD/nsoNPLYte0SHqii4GoZANjWDt3eYv4euJzI8T
 n8Wt4ZDlrNnuYiQX70ZEjbYBuX832BA3ZUayF7RDcUT3hmtcfA/Yp1uR9+GNWFR9+4Jb
 3PRLFnabkDDYj4LpbF0DqprlTCObdsukPQJAyhO8jginmns3tcIjd9dJoLVi4e4pLL6y
 qh6Q==
X-Gm-Message-State: AOAM533/kr3yaqsQX7TpjmjbYoYssk897sKpo4xLG7qyfoOrcBOBrVZS
 OWzTJor7+pr3LI6qiGv81lTxDw==
X-Google-Smtp-Source: ABdhPJyuG5k9ZK3PwT+MOO1Zyboyv2IUrihCgtUk377C7UlOZCj4bIT33xWC0sFy9lY+efT6kIi9vA==
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr8697118pjo.243.1634072354424; 
 Tue, 12 Oct 2021 13:59:14 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id e24sm11695087pfn.8.2021.10.12.13.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 13:59:12 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v5 3/3] docs: Add documentation for vhost based RNG
 implementation
Date: Tue, 12 Oct 2021 14:59:04 -0600
Message-Id: <20211012205904.4106769-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
References: <20211012205904.4106769-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add description and example for the vhost-user based RNG implementation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/system/device-emulation.rst       |  1 +
 docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 7afcfd8064ae..19944f526cec 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -88,3 +88,4 @@ Emulated Devices
    devices/usb.rst
    devices/vhost-user.rst
    devices/virtio-pmem.rst
+   devices/vhost-user-rng.rst
diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
new file mode 100644
index 000000000000..a145d4105c1a
--- /dev/null
+++ b/docs/system/devices/vhost-user-rng.rst
@@ -0,0 +1,39 @@
+QEMU vhost-user-rng - RNG emulation
+===================================
+
+Background
+----------
+
+What follows builds on the material presented in vhost-user.rst - it should
+be reviewed before moving forward with the content in this file.
+
+Description
+-----------
+
+The vhost-user-rng device implementation was designed to work with a random
+number generator daemon such as the one found in the vhost-device crate of
+the rust-vmm project available on github [1].
+
+[1]. https://github.com/rust-vmm/vhost-device
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
2.25.1


