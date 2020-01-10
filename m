Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E47136AA3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:09:38 +0100 (CET)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprEX-0000L2-B1
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34479)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pizhenwei@bytedance.com>) id 1iprBr-0005pD-Dw
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1iprBq-0003ke-4q
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:51 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:37260)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1iprBp-0003hM-UB
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:50 -0500
Received: by mail-pf1-x442.google.com with SMTP id p14so907579pfn.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 02:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fshKwfwt9Dp2Wq1APH+4/EX0Jo99Mva81d26eLwAGKU=;
 b=jTrvQEzMTwHn/rWFhNwVM3gC79UFrZ/uuP6zVfefiRKyeh6bVS+DfyZq4ZpMFxAuSe
 1sCkq2WvZGSqXTrGJBG4fDnmxo0m2PVk393Z/TFpNMJfTTiRL9GhM+0SHSxyfubHEOk+
 DyWl6eTdDLnRzPxmZp4oRpXVUzoAnox6e4WERP30vR/ESaDHWvxdNos1OqI/y6eaVUnK
 qwOEgTgZ+jLO/O3SnN/HPWCVZw3gq5uDXZeFHcR5nhr5mLU56KGPZza7wr6AL6pKowR5
 U8uTcXnGClHKTqT3UMes3pza4JtmMH32jHzLMNJ2oNlnfUW9BUHun5Q3OLtVbPDGlceM
 XGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fshKwfwt9Dp2Wq1APH+4/EX0Jo99Mva81d26eLwAGKU=;
 b=sG+k/8vpxEROvVjaNrZAEvCEIoeTZhJDBL427FXKXQIq5JoHAJiviyOkgIceLRH8Fu
 GETDFQaIvodi/oAfrAQuS6+CFQQJULOeT9GF6XDCOKLPmFFtfsZuQH9XYElajVtq79RG
 dtudgbeISMIuDFUfhJiS31CjIVQMU68ZFfrjJT5frOOJeJCgBjdfvxXggeLEgBRf6sYE
 G1pdDp+4HDxGb78BsGFwkb5ZWQ0BkDCLbIKYkRZ/BbW/B3patoYjRcCbsKivm07cgbNs
 CelBR+syEEIpA408TTRlsN1dkRePQgoT3UfCpUQWk3jqnnuzyivcqI32Og7hTVgwkToh
 HRmQ==
X-Gm-Message-State: APjAAAV2pOzAX3QGnUyPITAVCQFWFIbMm4FbUl8QREKO5h6rSHiL4NlZ
 ZhgwMln2yQNjjVqmrCQGr1uaeQ==
X-Google-Smtp-Source: APXvYqwLM80h5i/WiPXHqIG/DdJ1TUWK+d+JqiEcoNNkviF23F6YROu6y6DgPL2cKbxCTsnfqsFYxg==
X-Received: by 2002:a63:201d:: with SMTP id g29mr3428289pgg.427.1578650808856; 
 Fri, 10 Jan 2020 02:06:48 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id q21sm2179039pff.105.2020.01.10.02.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Jan 2020 02:06:48 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: pbonzini@redhat.com
Subject: [PATCH 2/2] pvpanic: implement crashloaded event handling
Date: Fri, 10 Jan 2020 18:06:34 +0800
Message-Id: <20200110100634.491936-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200110100634.491936-1-pizhenwei@bytedance.com>
References: <20200110100634.491936-1-pizhenwei@bytedance.com>
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: yelu@bytedance.com, libvir-list@redhat.com, gregkh@linuxfoundation.org,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 linux-kernel@vger.kernel.org, mprivozn@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle bit 1 write, then post event to monitor.

Suggested by Paolo, declear a new event, using GUEST_PANICKED could
cause upper layers to react by shutting down or rebooting the guest.

In advance for extention, add GuestPanicInformation in event message.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/misc/pvpanic.c         | 11 +++++++++--
 include/sysemu/runstate.h |  1 +
 qapi/run-state.json       | 22 +++++++++++++++++++++-
 vl.c                      | 12 ++++++++++++
 4 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index d65ac86478..4ebda7872a 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -21,11 +21,13 @@
 #include "hw/qdev-properties.h"
 #include "hw/misc/pvpanic.h"
 
-/* The bit of supported pv event */
+/* The bit of supported pv event, TODO: include uapi header and remove this */
 #define PVPANIC_F_PANICKED      0
+#define PVPANIC_F_CRASHLOADED   1
 
 /* The pv event value */
 #define PVPANIC_PANICKED        (1 << PVPANIC_F_PANICKED)
+#define PVPANIC_CRASHLOADED     (1 << PVPANIC_F_CRASHLOADED)
 
 #define ISA_PVPANIC_DEVICE(obj)    \
     OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC)
@@ -34,7 +36,7 @@ static void handle_event(int event)
 {
     static bool logged;
 
-    if (event & ~PVPANIC_PANICKED && !logged) {
+    if (event & ~(PVPANIC_PANICKED | PVPANIC_CRASHLOADED) && !logged) {
         qemu_log_mask(LOG_GUEST_ERROR, "pvpanic: unknown event %#x.\n", event);
         logged = true;
     }
@@ -43,6 +45,11 @@ static void handle_event(int event)
         qemu_system_guest_panicked(NULL);
         return;
     }
+
+    if (event & PVPANIC_CRASHLOADED) {
+        qemu_system_guest_crashloaded(NULL);
+        return;
+    }
 }
 
 #include "hw/isa/isa.h"
diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index 0b41555609..f760094858 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -63,6 +63,7 @@ ShutdownCause qemu_reset_requested_get(void);
 void qemu_system_killed(int signal, pid_t pid);
 void qemu_system_reset(ShutdownCause reason);
 void qemu_system_guest_panicked(GuestPanicInformation *info);
+void qemu_system_guest_crashloaded(GuestPanicInformation *info);
 
 #endif
 
diff --git a/qapi/run-state.json b/qapi/run-state.json
index d7477cd715..b7a91f3125 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -357,6 +357,26 @@
   'data': { 'action': 'GuestPanicAction', '*info': 'GuestPanicInformation' } }
 
 ##
+# @GUEST_CRASHLOADED:
+#
+# Emitted when guest OS crash loaded is detected
+#
+# @action: action that has been taken, currently always "run"
+#
+# @info: information about a panic (since 2.9)
+#
+# Since: 5.0
+#
+# Example:
+#
+# <- { "event": "GUEST_CRASHLOADED",
+#      "data": { "action": "run" } }
+#
+##
+{ 'event': 'GUEST_CRASHLOADED',
+  'data': { 'action': 'GuestPanicAction', '*info': 'GuestPanicInformation' } }
+
+##
 # @GuestPanicAction:
 #
 # An enumeration of the actions taken when guest OS panic is detected
@@ -366,7 +386,7 @@
 # Since: 2.1 (poweroff since 2.8)
 ##
 { 'enum': 'GuestPanicAction',
-  'data': [ 'pause', 'poweroff' ] }
+  'data': [ 'pause', 'poweroff', 'run' ] }
 
 ##
 # @GuestPanicInformationType:
diff --git a/vl.c b/vl.c
index 86474a55c9..5b1b2ef095 100644
--- a/vl.c
+++ b/vl.c
@@ -1468,6 +1468,18 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     }
 }
 
+void qemu_system_guest_crashloaded(GuestPanicInformation *info)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded");
+
+    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN,
+                                   !!info, info);
+
+    if (info) {
+        qapi_free_GuestPanicInformation(info);
+    }
+}
+
 void qemu_system_reset_request(ShutdownCause reason)
 {
     if (no_reboot && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
-- 
2.11.0


