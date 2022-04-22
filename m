Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A650BA2A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:33:33 +0200 (CEST)
Received: from localhost ([::1]:59110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuLk-0004M6-Ma
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhuHU-0000gO-Qk
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:29:08 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nhuHS-0002OM-0Q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:29:08 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id ABBE620896;
 Fri, 22 Apr 2022 14:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650637741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dg6ZoGYW1ucOZ9wEmIs6mylNYgHMzfX8KtIB2nqo6zc=;
 b=shPgrnapmQjEKREJ0ui4a49lUvuAhhdRkFhJIqVMT/PJfwswkcSrwgyzbUgzAC7UH/ThKF
 kLDJeph4r9Vh6skqPve1YKHRHRkIwU8Id3JrcOG9yjWoidsY4NcDiV6qZnuGvKYy6FG0vX
 Wb+Se8HwNvWfMsPNjU5vrx8LtK0xll8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: add doc about device life cycles
Date: Fri, 22 Apr 2022 16:28:51 +0200
Message-Id: <20220422142851.28128-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document the 3 life cycles cases that can happen with devices.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Hi all,

It's been a few weeks I wanted to propose this in order to sort
out what should be done to make a 'user-creatable' device.

This is a follow up of [1] in which Peter asked for this point to
be clarified.

[1]: https://lore.kernel.org/qemu-devel/a2967493-fd00-8f9b-29bd-56baaae9f89a@greensocs.com/

Thanks,
Damien
---
 docs/devel/device.rst          | 111 +++++++++++++++++++++++++++++++++
 docs/devel/index-internals.rst |   1 +
 MAINTAINERS                    |   1 +
 3 files changed, 113 insertions(+)
 create mode 100644 docs/devel/device.rst

diff --git a/docs/devel/device.rst b/docs/devel/device.rst
new file mode 100644
index 0000000000..80e3016e80
--- /dev/null
+++ b/docs/devel/device.rst
@@ -0,0 +1,111 @@
+QEMU device life-cycle
+======================
+
+This document details the specifics of devices.
+
+Devices can be created in two ways: either internally by code or through a
+user interface:
+
++ command line interface provides ``-device`` option
++ QAPI interface provides ``device_add`` command
+
+Error handling is most important for the user interfaces. Internal code is
+generally designed so that errors do not happen and if some happen, the error
+is probably fatal (and QEMU will exit or abort).
+
+Devices are a particular type of QEMU objects. In addition of the
+``instance_init``, ``instance_post_init``, ``unparent`` and
+``instance_finalize`` methods (common to all QOM objects), they have the
+additional methods:
+
++ ``realize``
++ ``unrealize``
+
+In the following we will ignore ``instance_post_init`` and consider is
+associated with ``instance_init``.
+
+``realize`` is the only method that can fail. In that case it should
+return an adequate error. Some devices does not do this and should
+not be created by means of user interfaces.
+
+Device succesfully realized
+---------------------------
+
+The normal use case for device is the following:
+
+1. ``instance_init``
+2. ``realize`` with success
+3. The device takes part in emulation
+4. ``unrealize`` and ``unparent``
+5. ``instance_finalize``
+
+``instance_init`` and ``realize`` are part of the device creation procedure, whereas
+``unrealize`` and ``instance_finalize`` are part of the device deletion procedure.
+
+In case of an object created by code, ``realize`` has to be done explicitly
+(eg: by calling ``qdev_realize(...)``). This is done automatically in case of a
+device created via a user interface.
+
+On the other hand ``unrealize`` is done automatically.
+``unparent`` will take care of unrealizing the device then undoing any bus
+relationships (children and parent).
+
+Note that ``instance_finalize`` may not occur just after ``unrealize`` because
+other objects than the parent can hold references to a device. It may even not
+happen at all if a reference is never released.
+
+Device realize failure
+----------------------
+
+This use case is most important when the device is created through a user
+interface. The user might for example invalid properties and in that case
+realize will fail and the device should then be deleted.
+
+1. ``instance_init``
+2. ``realize`` failure
+3. ``unparent``
+4. ``instance_finalize``
+
+Failure to create a device should not leave traces. The emulation state after
+that should be as if the device has not be created. ``realize`` and
+``instance_finalize`` must take care of this.
+
+Device help
+-----------
+
+Last use case is only a user interface case. When requesting help about a device
+type, the following life cycle exists:
+
+1. ``instance_init``
+2. Introspect device properties
+3. ``unparent``
+4. ``instance_finalize``
+
+This use case is simple but it means that ``instance_finalize`` cannot assume that
+``realize`` has been called.
+
+Implementation consequences
+---------------------------
+
+A device developer should ensure the above use cases are
+supported so that the device is *user-creatable*.
+
+In particular, fail cases must checked in realize and reported using the error
+parameter. One should particularly take care of cleaning correctly whatever has
+been previously done if realize fails. Cleaning tasks (eg: memory freeing) can
+be done in ``realize`` or ``instance_finalize`` as they will be called in a row by
+the user interface.
+
+To this end ``realize`` must ensure than no additional reference to the device is
+dangling when it fails. Otherwise the device will never be finalized and deleted.
+
+If a device has created some children, they should be deleted as well in the
+cleaning process. If ``object_initialize_child()`` was used to create a child
+hosted into the device structure, the child memory space will disappear with the
+parent. No reference to such child must be dangling to ensure the child will
+not survive its parent deletion.
+
+Although it is not asserted by code, one can assume ``realize`` will not be tried
+again in case of failure and that the device will be finalized if no references
+have been added during ``realize``.
+
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.rst
index bb118b8eaf..57a5136b6e 100644
--- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -11,6 +11,7 @@ Details about QEMU's various subsystems including how to add features to them.
    atomics
    block-coroutine-wrapper
    clocks
+   device
    ebpf_rss
    migration
    multi-process
diff --git a/MAINTAINERS b/MAINTAINERS
index 8bab48cf1e..c5fa80adf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2853,6 +2853,7 @@ R: Daniel P. Berrange <berrange@redhat.com>
 R: Eduardo Habkost <eduardo@habkost.net>
 S: Supported
 F: docs/qdev-device-use.txt
+F: docs/devel/device.rst
 F: hw/core/qdev*
 F: hw/core/bus.c
 F: hw/core/sysbus.c
-- 
2.35.1


