Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F03D056F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:31:58 +0200 (CEST)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zDR-00034R-RL
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8r-00038A-3b
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8p-0005aK-Bx
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id w13so286338wmc.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkwgpt6wENAxEhm+bv1Rjetwu3EU3B/BVjqRfhhq3Pc=;
 b=oPwz/aJvcZxjW6fZQD4vBP0X2qH3W9qMvsogqJEnVLaN0A54K3lOGmo/BkuikWKqhZ
 IrSv0kBBWTk5w+WuXYXlUwO1H2s6Fw2HIv8XgLnjzRuao/IWl/dHQ0E8+Cv5SHTtf3dm
 yXbP0i44JXlBc6RjJDiqhgPf7f02R7tguDIisIbG0nIG0IzWfr4BQet5TcMjr4Ohn/je
 UgWVqIII7oVap3mAo6W3jpvMKvxdjIXzyC35mZnWa6JtZKXiYUOpwGCrANHx5I4J4Hcc
 YmyyUNOEdeWpLWDltVYhw6/qF38CpKQHJ87z5FD0thwerjW1CEoYeVY+HODjII9daE0f
 LCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkwgpt6wENAxEhm+bv1Rjetwu3EU3B/BVjqRfhhq3Pc=;
 b=ByfmlYd/6G/90hxbync7W9zLdUxnA91ONE9fSnwclyUanhTKpUmEntlMr1RwaMKmCh
 gtGmPSMR9X7tTUHK2dtWi99QeUZHGiEw2O+H5ro+IDJJJREOblWHTE1HxFVq+bm3EE2i
 cdInUZqnNSupsZzNbSRPmyBOeYkjVeDT6EpvdTSfu14VcP1qjYEwJH9YZZiBEn543jkh
 US4J4XtcBaGwolLlNt5i7SjBt2pNtdj9fOmVKbm87jVa+t3gMNg2NN39GOZDB9XT8cTy
 N/XtlNJnxHQf0luuzdDdHdIe0sVO+5aaVovBC4xDw/Qtza3fE7HxCpnVetGvIDhLFMPq
 f3Tg==
X-Gm-Message-State: AOAM532uCFSAO0FGluKoeJfWC0zG0aKyuOuPzJ4nmsgkdXlKDa/NeGbP
 Lu/vMkn4qijSY9SfaTozAixA9w==
X-Google-Smtp-Source: ABdhPJzgz2aHOVtiPQl9Yz7NwodefFL/T7woEsM23hIoh8yjHs5xu1QMdpNkNv4+zUctRD/49RZJpw==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr937221wme.42.1626823629901; 
 Tue, 20 Jul 2021 16:27:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b6sm3608729wmj.34.2021.07.20.16.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 175C71FF8F;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/29] docs: add a section on the generalities of vhost-user
Date: Wed, 21 Jul 2021 00:26:37 +0100
Message-Id: <20210720232703.10650-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we do mention some of this stuff in the various daemons and
manuals the subtleties of the socket and memory sharing are sometimes
missed. This document attempts to give some background on vhost-user
daemons in general terms.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210714182056.25888-4-alex.bennee@linaro.org>
---
 docs/interop/vhost-user.rst        |  2 +
 docs/system/device-emulation.rst   |  1 +
 docs/system/devices/vhost-user.rst | 59 ++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 docs/system/devices/vhost-user.rst

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..7fc693521e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1,3 +1,5 @@
+.. _vhost_user_proto:
+
 ===================
 Vhost-user Protocol
 ===================
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 7af5dbefab..3bebb862b9 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -86,4 +86,5 @@ Emulated Devices
    devices/net.rst
    devices/nvme.rst
    devices/usb.rst
+   devices/vhost-user.rst
    devices/virtio-pmem.rst
diff --git a/docs/system/devices/vhost-user.rst b/docs/system/devices/vhost-user.rst
new file mode 100644
index 0000000000..86128114fa
--- /dev/null
+++ b/docs/system/devices/vhost-user.rst
@@ -0,0 +1,59 @@
+.. _vhost_user:
+
+vhost-user back ends
+--------------------
+
+vhost-user back ends are way to service the request of VirtIO devices
+outside of QEMU itself. To do this there are a number of things
+required.
+
+vhost-user device
+===================
+
+These are simple stub devices that ensure the VirtIO device is visible
+to the guest. The code is mostly boilerplate although each device has
+a ``chardev`` option which specifies the ID of the ``--chardev``
+device that connects via a socket to the vhost-user *daemon*.
+
+vhost-user daemon
+=================
+
+This is a separate process that is connected to by QEMU via a socket
+following the :ref:`vhost_user_proto`. There are a number of daemons
+that can be built when enabled by the project although any daemon that
+meets the specification for a given device can be used.
+
+Shared memory object
+====================
+
+In order for the daemon to access the VirtIO queues to process the
+requests it needs access to the guest's address space. This is
+achieved via the ``memory-backend-file`` or ``memory-backend-memfd``
+objects. A reference to a file-descriptor which can access this object
+will be passed via the socket as part of the protocol negotiation.
+
+Currently the shared memory object needs to match the size of the main
+system memory as defined by the ``-m`` argument.
+
+Example
+=======
+
+First start you daemon.
+
+.. parsed-literal::
+
+  $ virtio-foo --socket-path=/var/run/foo.sock $OTHER_ARGS
+
+The you start your QEMU instance specifying the device, chardev and
+memory objects.
+
+.. parsed-literal::
+
+  $ |qemu_system| \\
+      -m 4096 \\
+      -chardev socket,id=ba1,path=/var/run/foo.sock \\
+      -device vhost-user-foo,chardev=ba1,$OTHER_ARGS \\
+      -object memory-backend-memfd,id=mem,size=4G,share=on \\
+      -numa node,memdev=mem \\
+        ...
+
-- 
2.32.0.264.g75ae10bc75


