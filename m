Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834214021BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:59:53 +0200 (CEST)
Received: from localhost ([::1]:48432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPSq-0000yo-JY
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHk-0002c5-IR; Mon, 06 Sep 2021 20:48:26 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHh-0003t8-OV; Mon, 06 Sep 2021 20:48:24 -0400
Received: by mail-qv1-xf32.google.com with SMTP id 93so4846179qva.7;
 Mon, 06 Sep 2021 17:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jv/FTCfQ2t/c85uXR7JxDxmo4FnVjkbZPHxekYv/OSU=;
 b=IrcDk3Xm4O59Wo+hyTPugrw6iAA9/fStPZg6DxNoPSj7B80/o9TQltV2i0dExwgibq
 xLMTfusd65Va2NnGzm14tIpwL+m5UTNqfzBHTYdUL57Btr6RXNNCUf+cZqjopXZxz2nN
 uSC6otDKlfe5TFpBmGRKEYJAxD81N96pdoQBA2A/c7UNeeG4CPZNx9NJqUzmF0qZSkbO
 PxBSPSfEqTnl5HP5TZ8T4XOtyQnSiQVHvHKS7UNflac49RVrB9kzyC8KTcsoLnMyiZ4x
 aOhS6Awb18X0sowAkpfpR8lGaOLYpbMJdjQsBm/JavGSn1On6qCxYdiV8Gn4/3T0THnT
 AnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jv/FTCfQ2t/c85uXR7JxDxmo4FnVjkbZPHxekYv/OSU=;
 b=bkF0AiFCa8TTZFfasYfxxBi3gaV2xK2tnLy5MryQt+FrnxUQFRMkxevhUR/E/UWVid
 /v2lzFnYOFznH/fwuGSjQ2s1dXlw59iM2EngDOf//8qycOPRdbfmjk+4v+oE7+BQa7lS
 ijRe3YF4SA5LG9xYpqvT1dphxryICPK68pcbI7G7Hk8UMYtlMtO8COfqqzV+K7YFBBWa
 RN11bLiORS5Hd7MWuQV6F4A9BghAcQDLQk9Klgh48yGrN8Q8JEbfpq3jgStpKzBfmsYE
 uZodsTs5eUHTrqF9mkfskfZJwW5DciLXldz+dqRZF/o3GKuvGCZhwHPark+tJuR5RAWS
 eVlA==
X-Gm-Message-State: AOAM533ryt1YG6GGkT2lcVUX9Pjr0lGUcZxpBTyg8eW2OqJqWSOt9tdd
 LCdpHvWNN7ovj616oJkjFbg8jOvM3PQ=
X-Google-Smtp-Source: ABdhPJxLbxBLgyWlIGrOm6mw5NBwyXLjv3wTYmlWuUZxtpHKvN1V4/Ja8DNLxSxuXMISDf275jiKng==
X-Received: by 2002:a0c:8150:: with SMTP id 74mr14235196qvc.31.1630975700121; 
 Mon, 06 Sep 2021 17:48:20 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/7] qapi/qdev.json: add DEVICE_UNPLUG_GUEST_ERROR QAPI
 event
Date: Mon,  6 Sep 2021 21:47:53 -0300
Message-Id: <20210907004755.424931-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf32.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
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

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 qapi/machine.json         |  7 ++++++-
 qapi/qdev.json            | 27 ++++++++++++++++++++++++++-
 stubs/qdev.c              |  7 +++++++
 4 files changed, 49 insertions(+), 2 deletions(-)

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


