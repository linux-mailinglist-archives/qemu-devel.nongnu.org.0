Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038393CEC37
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:13:37 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zdw-0002qV-1z
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZL-0003Kp-PF; Mon, 19 Jul 2021 16:08:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZK-0002Af-38; Mon, 19 Jul 2021 16:08:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 jx7-20020a17090b46c7b02901757deaf2c8so948719pjb.0; 
 Mon, 19 Jul 2021 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRTyJX79s/HDaNt8NBw5GvLa+nVW9LgMXvditrXvD6U=;
 b=k354Lz7qQoZpKdp37z8n6d2nXjsHnCwW0ZZh0xmapslvTNY1SpD+FViVUhlIYydSFm
 VaHZoboK4bSCeDb6s5iSB/A1pp5Lmigo3hRRQvr3ACjH3qVJysFc0XKZqABlxh9O69Cf
 sgdKUG7SpUxKap7SImf9It06BfuKg5pxkIe/kDWgZe4Vxu7ARMhxj93xQv1q2lZcIiMP
 JoNe3ZlRuJl7CQNsNHeJUUbGmrH1VrVQHQJ+s/PcpYXKPetSukN9BxhTOi/ok4XvR8Jm
 aEdPq5bp/b/Slm61RVqmNW0i17IBkY4FctMPJ7b/XyU5NETCJ55e8fBUsztJAhcrT/Bk
 Ufvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRTyJX79s/HDaNt8NBw5GvLa+nVW9LgMXvditrXvD6U=;
 b=HV+93Lm8HpCxRVV8FlWD0iUNmqjThLGhEAYHYAh0wmHkOwOlIMCLzCCNvT20SLcmom
 e7vt4Y/MbEhYmedcIYmfKZaAdmE/I7b+PjFdPw6xJzRqhx4Fvd+3iTrghEdLAMmQTqJp
 YqR32qLlUqeBCpejBR1QShzB0o+70LdNbMgwApr1pm/b9LCfInQLwJzgUAPxUmM8+mQb
 UT1sl5StuiZKNpkR0VFoZOoTAPOKCwUEQHM28pxUK3Yhy6NN2Oi44MYZVvj5ZzhIY1ZI
 iGJalu6DFB7O8KVrQ1UVx+k3a51CpL2OGJKdbq6sGe2BbiIbyOS4BctS4yLx3EDH3VFW
 WlPg==
X-Gm-Message-State: AOAM531aJu7cKlRcLRAb6Ywz9QNRPGXhJc6Rj8iI0AW91eM/oF9n3Ypq
 hjiJJpCZVJLf/BGdDi5zVP6VC/eMv41TNw==
X-Google-Smtp-Source: ABdhPJw5AHVCRSq/uWyv5knnUv7znE/DIZekp5mQbqfyKZVirSkyENLFmbsgQ5FEWWM3Vs4PkzWMtQ==
X-Received: by 2002:a17:90a:6c03:: with SMTP id
 x3mr12382661pjj.195.1626725326959; 
 Mon, 19 Jul 2021 13:08:46 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:46 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 5/7] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI
 event
Date: Mon, 19 Jul 2021 17:08:25 -0300
Message-Id: <20210719200827.1507276-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x102f.google.com
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
create a generic DEVICE_UNPLUG_ERROR event that can be used by all
unplug errors in the future. This event has a similar API as the
existing DEVICE_DELETED event, with an extra optional 'msg' parameter
that can be used to explain the reason for the error.

With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 qapi/machine.json         |  6 +++++-
 qapi/qdev.json            | 30 +++++++++++++++++++++++++++++-
 stubs/qdev.c              |  7 +++++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6d438f1c8d..c0c3431ada 100644
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
+Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
+
+
 System emulator machines
 ------------------------
 
diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb..a595c753d2 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1271,6 +1271,9 @@
 #
 # @msg: Informative message
 #
+# Features:
+# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instead.
+#
 # Since: 2.4
 #
 # Example:
@@ -1283,7 +1286,8 @@
 #
 ##
 { 'event': 'MEM_UNPLUG_ERROR',
-  'data': { 'device': 'str', 'msg': 'str' } }
+  'data': { 'device': 'str', 'msg': 'str' },
+  'features': ['deprecated'] }
 
 ##
 # @SMPConfiguration:
diff --git a/qapi/qdev.json b/qapi/qdev.json
index d1d3681a50..52c36c7b9c 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -84,7 +84,9 @@
 #        This command merely requests that the guest begin the hot removal
 #        process.  Completion of the device removal process is signaled with a
 #        DEVICE_DELETED event. Guest reset will automatically complete removal
-#        for all devices.
+#        for all devices.  If an error in the hot removal process is detected,
+#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
+#        sent.  Some errors cannot be detected.
 #
 # Since: 0.14
 #
@@ -124,3 +126,29 @@
 ##
 { 'event': 'DEVICE_DELETED',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_UNPLUG_ERROR:
+#
+# Emitted when a device hot unplug error occurs.
+#
+# @device: the device's ID if it has one
+#
+# @path: the device's path within the object model
+#
+# @msg: optional informative message
+#
+# Since: 6.2
+#
+# Example:
+#
+# <- { "event": "DEVICE_UNPLUG_ERROR"
+#      "data": { "device": "core1",
+#                "msg": "Device hotunplug rejected by the guest for device core1",
+#                "path": "/machine/peripheral/core1" },
+#      },
+#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
+#
+##
+{ 'event': 'DEVICE_UNPLUG_ERROR',
+  'data': { '*device': 'str', 'path': 'str' , '*msg': 'str' } }
diff --git a/stubs/qdev.c b/stubs/qdev.c
index 92e6143134..ffa8f7b59e 100644
--- a/stubs/qdev.c
+++ b/stubs/qdev.c
@@ -21,3 +21,10 @@ void qapi_event_send_device_deleted(bool has_device,
 {
     /* Nothing to do. */
 }
+
+void qapi_event_send_device_unplug_error(bool has_device, const char *device,
+                                         const char *path,
+                                         bool has_msg, const char *msg)
+{
+    /* Nothing to do. */
+}
-- 
2.31.1


