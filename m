Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC903C6423
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:49:24 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31vf-0008Sn-Kc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qe-0001jz-H9; Mon, 12 Jul 2021 15:44:13 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m31qd-0002k4-1L; Mon, 12 Jul 2021 15:44:12 -0400
Received: by mail-pg1-x534.google.com with SMTP id v7so19407640pgl.2;
 Mon, 12 Jul 2021 12:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRfDFV6yTB2ZuXd+VVBhYM2WQzFkI+90BZxZxc0QIw0=;
 b=qpxtvA9xDey7WszVaV7/wLwJnu6rwnvx/IDi0b3D8FBinUfkRWcLa1/dGw6T3hhzTB
 VMdLOUNmj9wp0VYBhBFEBIUmhO0sTjsfPNXRPxhA0QN9jm2yD24Cd8b+8lqC2W6X20T4
 8kmgXNeDtFLQ3Rj/IrWbp2yLvWSGJyW+fRTib9YtN6EztKS5y4m9MZMgUs5uo4qYJX/n
 Wlr8vsr4Dd5+TO1AeahCcG8N7OZLpAL5HnnfSLyvlRSoyzqicBiDmVAM6JnzYHTv5Qzw
 mgmsTux+TAQOwe+qrCkxoUO1hONKyTgVTY7jIhw9cDf9R811TWwhquP5O/33Q7zrCK3U
 kPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRfDFV6yTB2ZuXd+VVBhYM2WQzFkI+90BZxZxc0QIw0=;
 b=qJHXWXHZglBnz/I5pef5Dg/tXovT9NmWmIQIxiz1g9NGQLUHEM67v8Bb7kNXaq13ki
 2W1LGEC7iY3OKM4720AUeCpnCiHATx5W+hZKeX2LmPOiyYe5CFMsFCkdEGeam+r9zK3d
 +rDz4s8F/Xn1IMDop8CJY4InECAuwSLzGPAYJE9ur9HOTL9HJiSk7ZY9QpTSKGDeCHY2
 5BCp2W+aZBrSfj4k5bWt9PA7q9HJP56yo6wgf+3YguwtsPRFcfvotrHLYuP2JQlPlC+M
 F7XIQlaj7sPQn51Gi6Zt/j/ojpeN5tojLHvux5IRbEoUvmj4Ga8s3wGwCHRLjsJpXjz3
 5UnQ==
X-Gm-Message-State: AOAM533W5hp8tYBq0t7nNtxS7+DTO/87lCGDChEIcBSR2j+g2wWFhqbj
 GSWGV6qblz7Gg+CKsxWaKIWfsDTJ1cE=
X-Google-Smtp-Source: ABdhPJw4T8E0W6MHig0LxCOCZ6wGhs5iOe16WOzvRAZm0QsQ24Ck27NAs6lq4FDw+bhNnqeQ/sGbzA==
X-Received: by 2002:a63:d80a:: with SMTP id b10mr688159pgh.47.1626119049436;
 Mon, 12 Jul 2021 12:44:09 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:a7d9:90df:d3f0:78a8:2eb9])
 by smtp.gmail.com with ESMTPSA id e21sm17075088pfc.172.2021.07.12.12.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:44:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/7] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
Date: Mon, 12 Jul 2021 16:43:37 -0300
Message-Id: <20210712194339.813152-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712194339.813152-1-danielhb413@gmail.com>
References: <20210712194339.813152-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, armbru@redhat.com,
 groug@kaod.org, qemu-ppc@nongnu.org, eblake@redhat.com,
 david@gibson.dropbear.id.au
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/deprecated.rst | 10 ++++++++++
 qapi/machine.json          |  6 +++++-
 qapi/qdev.json             | 30 +++++++++++++++++++++++++++++-
 stubs/qdev.c               |  7 +++++++
 4 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 6d438f1c8d..c0c3431ada 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
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


