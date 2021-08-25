Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AF3F6CD2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:56:12 +0200 (CEST)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIhCy-0004n7-To
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6Q-0001s6-7M; Tue, 24 Aug 2021 20:49:15 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6K-00072I-MJ; Tue, 24 Aug 2021 20:49:13 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id z2so8241973qvl.10;
 Tue, 24 Aug 2021 17:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YeLh4JoP3qFvWikRn+t/HSY17cM7BWFnCcXRhKf9+eE=;
 b=fwi9ZuVAbPpCH3JIkka8DfiSLKIWpUy2iLwokjdA/KUteAOjKQqge6u1wYVY6nBruy
 x7g34E4bHPUfqUgN1r8BHdCwqNtGoayuKOF2ZYggZaL350J5wPKrCAQHBTwWHcMzBjQn
 fkkx5sHryWdjmolgsN3VeTBdQkkMIvg2Tz7R4OjbmrR+VvdA1XQ2qptJyB07+Mv/D376
 jBO2ScltOURg3F4xviK5wW87rdR5bxnHhxmCh1kWuAMVjDDkq0C9Iu9IA2nQ3+4+k4uM
 qrUVugpi0v6ZDdVOdrUL+VD8PVazF1h3Ye4Zu0KS/N5y5JWxoex8lBr8Hfjsa0qiOHcK
 Z87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YeLh4JoP3qFvWikRn+t/HSY17cM7BWFnCcXRhKf9+eE=;
 b=swUtmHf0BAMDPhjsiwhZkBGWllsbV7qifweWpLo95ZNSeJEM3rW+/F2eP2eD1itA7F
 QSiBnUMfX4VDzDR8ErsZJ/81XkByvWzCH+ugwKO228PLn+BjwONAaiwjVN/5JYzgnDMU
 1qGg5kmb4BA01ZFPyo6WrGA9Kf5z6eDOOqrBp4c/wIAAc/hDSxVcp5K0fdoO3lyb2FRT
 rNfPosvaRQXW3VG1HxLbGrLcST5f0vXrmjImUb2FkXbpQE36MeZDTmTHIl83HIP0xv//
 xiflRToEcmTa7Dri6DBy7krfFcBLkRf/xvTPnfJ5BWhezMLInjhuZqtvPdXNLQp8xhlo
 ttJw==
X-Gm-Message-State: AOAM532IcVz0Gu7tyKLFRZtvpiJxv76pnNPMC+bIKANFTO+PpRoNExFb
 Xx+1GtQvxp/hZtbTnQ9ZNpSOjZHS3qM=
X-Google-Smtp-Source: ABdhPJwjr2IiFEV8h60r82KDrjNlTN7CSQM1I3oYgzyBDg9WIh5EvMz+sEchAOSfe6UDq4DZXPT2AQ==
X-Received: by 2002:a0c:aa55:: with SMTP id e21mr810278qvb.41.1629852547454;
 Tue, 24 Aug 2021 17:49:07 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:49:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI
 event
Date: Tue, 24 Aug 2021 21:48:33 -0300
Message-Id: <20210825004835.472919-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 qapi/machine.json         |  7 ++++++-
 qapi/qdev.json            | 28 +++++++++++++++++++++++++++-
 stubs/qdev.c              |  7 +++++++
 4 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6d438f1c8d..1a8ffc9381 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
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
index 157712f006..cd397f1ee4 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1271,6 +1271,10 @@
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
@@ -1283,7 +1287,8 @@
 #
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
-  'data': { 'device': 'str', 'msg': 'str' } }
+  'data': { 'device': 'str', 'msg': 'str' },
+  'features': ['deprecated'] }
 
 ##
 # @SMPConfiguration:
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 0e9cb2ae88..8b1a1dd43b 100644
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
@@ -124,3 +126,27 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_UNPLUG_GUEST_ERROR:
+#
+# Emitted when a device hot unplug fails due to an internal guest
+# error.
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
index 92e6143134..28d6d531e6 100644
--- a/stubs/qdev.c
+++ b/stubs/qdev.c
@@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
 {
     /* Nothing to do. */
 }
+
+void qapi_event_send_device_unplug_guest_error(bool has_device,
+                                               const char *device,
+                                               const char *path
+{
+    /* Nothing to do. */
+}
-- 
2.31.1


