Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B8741D2F0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 07:56:57 +0200 (CEST)
Received: from localhost ([::1]:43510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVp3w-0001gN-Os
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 01:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosD-00018y-WE; Thu, 30 Sep 2021 01:44:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:50397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosC-0003ZR-14; Thu, 30 Sep 2021 01:44:49 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR1rhCz4xbj; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=5qFVfzEv1+tW0bK1z92S00JbMeVTqwJH9QWjYK1rGRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SzKL/KeQBu1cQQ7ZoYEB7ZRd35wCgj2rvYtK+PilhajGFj/pvtNXOtdJxdHCzHM3Q
 0mYVtG/YOYdOIai5gb1I/mR+Whs7ImVBglJWGScQw9H4GE1C33FhDdihRfIIakIbWu
 rjOouM69sSfmEh6Vtcl0pTU5/HeqilWCIeR8Vk+Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 18/44] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI event
Date: Thu, 30 Sep 2021 15:44:00 +1000
Message-Id: <20210930054426.357344-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

At this moment we only provide one event to report a hotunplug error,
MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
machine is now able to report unplug errors for other device types, such
as CPUs.

Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
create a generic DEVICE_UNPLUG_GUEST_ERROR event that can be used by all
guest side unplug errors in the future. This event has a similar API as
the existing DEVICE_DELETED event, always providing the QOM path of the
device and dev->id if there's any.

With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210907004755.424931-6-danielhb413@gmail.com>
[dwg: Correct missing ')' in stubs/qdev.c]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/about/deprecated.rst | 10 ++++++++++
 qapi/machine.json         |  7 ++++++-
 qapi/qdev.json            | 27 ++++++++++++++++++++++++++-
 stubs/qdev.c              |  7 +++++++
 4 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 3c2be84d80..2f7db9a98d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -238,6 +238,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
+
+QEMU API (QAPI) events
+----------------------
+
+``MEM_UNPLUG_ERROR`` (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use the more generic event ``DEVICE_UNPLUG_GUEST_ERROR`` instead.
+
+
 System emulator machines
 ------------------------
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 32d47f4e35..66bc34ed8b 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1305,6 +1305,10 @@
 #
 # @msg: Informative message
 #
+# Features:
+# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_GUEST_ERROR
+#              instead.
+#
 # Since: 2.4
 #
 # Example:
@@ -1317,7 +1321,8 @@
 #
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
-  'data': { 'device': 'str', 'msg': 'str' } }
+  'data': { 'device': 'str', 'msg': 'str' },
+  'features': ['deprecated'] }
 
 ##
 # @SMPConfiguration:
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 0e9cb2ae88..d75e68908b 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -84,7 +84,9 @@
 #        This command merely requests that the guest begin the hot removal
 #        process.  Completion of the device removal process is signaled with a
 #        DEVICE_DELETED event. Guest reset will automatically complete removal
-#        for all devices.
+#        for all devices.  If a guest-side error in the hot removal process is
+#        detected, the device will not be removed and a DEVICE_UNPLUG_GUEST_ERROR
+#        event is sent.  Some errors cannot be detected.
 #
 # Since: 0.14
 #
@@ -124,3 +126,26 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_UNPLUG_GUEST_ERROR:
+#
+# Emitted when a device hot unplug fails due to a guest reported error.
+#
+# @device: the device's ID if it has one
+#
+# @path: the device's QOM path
+#
+# Since: 6.2
+#
+# Example:
+#
+# <- { "event": "DEVICE_UNPLUG_GUEST_ERROR"
+#      "data": { "device": "core1",
+#                "path": "/machine/peripheral/core1" },
+#      },
+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
+#
+##
+{ 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
+  'data': { '*device': 'str', 'path': 'str' } }
diff --git a/stubs/qdev.c b/stubs/qdev.c
index 92e6143134..187659f707 100644
--- a/stubs/qdev.c
+++ b/stubs/qdev.c
@@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
 {
     /* Nothing to do. */
 }
+
+void qapi_event_send_device_unplug_guest_error(bool has_device,
+                                               const char *device,
+                                               const char *path)
+{
+    /* Nothing to do. */
+}
-- 
2.31.1


