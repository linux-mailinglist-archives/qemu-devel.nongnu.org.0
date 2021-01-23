Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170D3015E5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:34:01 +0100 (CET)
Received: from localhost ([::1]:55668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3JzE-0005Iq-Hd
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx2-0003Sw-DL
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jwt-0005lz-8r
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJ1fRXEWgZK75YL4NKJ8vwrp8nC0K49Fqdf/B6+qbaU=;
 b=Zg9eCgMOsKfulT2O/D0mzNbfgnwKwlS+14sFTPZyai1K1dsJ/4PUggmOshpwbZyxNPmGt+
 1lhT+Kn8/RQNrx2voI0kM/Nms2KWEWWInMm6HHW43zGCVBbWnHCWk5ruVDwUK6I8VqIZ+u
 EKUpwz18J5GA1fag+b9iDg7HI4MNdYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-TM-skCEKNDiLCszdsfEoKA-1; Sat, 23 Jan 2021 09:31:30 -0500
X-MC-Unique: TM-skCEKNDiLCszdsfEoKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6AD5180A093
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:29 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 732915D9D0;
 Sat, 23 Jan 2021 14:31:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/31] runstate: cleanup reboot and panic actions
Date: Sat, 23 Jan 2021 09:30:58 -0500
Message-Id: <20210123143128.1167797-2-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The possible choices for panic, reset and watchdog actions are inconsistent.

"-action panic=poweroff" should be renamed to "-action panic=shutdown"
on the command line.  This is because "-action panic=poweroff" and
"-action watchdog=poweroff" have slightly different semantics, the first
does an unorderly exit while the second goes through qemu_cleanup().  With
this change, -no-shutdown would not have to change "-action panic=pause"
"pause", just like it does not have to change the reset action.

"-action reboot=none" should be renamed to "-action reboot=reset".
This should be self explanatory, since for example "-action panic=none"
lets the guest proceed without taking any action.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/run-state.json       | 10 ++++++----
 qemu-options.hx           |  8 ++++----
 softmmu/runstate-action.c |  4 ++--
 softmmu/runstate.c        |  7 ++++---
 softmmu/vl.c              |  2 +-
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/qapi/run-state.json b/qapi/run-state.json
index 1f3b329f05..43d66d700f 100644
--- a/qapi/run-state.json
+++ b/qapi/run-state.json
@@ -330,14 +330,14 @@
 #
 # Possible QEMU actions upon guest reboot
 #
-# @none: Reset the VM
+# @reset: Reset the VM
 #
-# @shutdown: Shutdown the VM and exit
+# @shutdown: Shutdown the VM and exit, according to the shutdown action
 #
 # Since: 6.0
 ##
 { 'enum': 'RebootAction',
-  'data': [ 'none', 'shutdown' ] }
+  'data': [ 'reset', 'shutdown' ] }
 
 ##
 # @ShutdownAction:
@@ -360,10 +360,12 @@
 #
 # @pause: Pause the VM
 #
+# @shutdown: Shutdown the VM and exit, according to the shutdown action
+#
 # Since: 6.0
 ##
 { 'enum': 'PanicAction',
-  'data': [ 'poweroff', 'pause', 'none' ] }
+  'data': [ 'pause', 'shutdown', 'none' ] }
 
 ##
 # @watchdog-set-action:
diff --git a/qemu-options.hx b/qemu-options.hx
index 62791f56d8..9172d51659 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3900,12 +3900,12 @@ SRST
 ERST
 
 DEF("action", HAS_ARG, QEMU_OPTION_action,
-    "-action reboot=none|shutdown\n"
-    "                   action when guest reboots [default=none]\n"
+    "-action reboot=reset|shutdown\n"
+    "                   action when guest reboots [default=reset]\n"
     "-action shutdown=poweroff|pause\n"
     "                   action when guest shuts down [default=poweroff]\n"
-    "-action panic=poweroff|pause|none\n"
-    "                   action when guest panics [default=poweroff]\n"
+    "-action panic=pause|shutdown|none\n"
+    "                   action when guest panics [default=shutdown]\n"
     "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
     "                   action when watchdog fires [default=reset]\n",
     QEMU_ARCH_ALL)
diff --git a/softmmu/runstate-action.c b/softmmu/runstate-action.c
index 99ce880886..ae0761a9c3 100644
--- a/softmmu/runstate-action.c
+++ b/softmmu/runstate-action.c
@@ -13,9 +13,9 @@
 #include "qapi/error.h"
 #include "qemu/option_int.h"
 
-RebootAction reboot_action = REBOOT_ACTION_NONE;
+RebootAction reboot_action = REBOOT_ACTION_RESET;
 ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
-PanicAction panic_action = PANIC_ACTION_POWEROFF;
+PanicAction panic_action = PANIC_ACTION_SHUTDOWN;
 
 /*
  * Receives actions to be applied for specific guest events
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 6177693a30..beee050815 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -471,14 +471,15 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
     }
     /*
      * TODO:  Currently the available panic actions are: none, pause, and
-     * poweroff, but in principle debug and reset could be supported as well.
+     * shutdown, but in principle debug and reset could be supported as well.
      * Investigate any potential use cases for the unimplemented actions.
      */
-    if (panic_action == PANIC_ACTION_PAUSE) {
+    if (panic_action == PANIC_ACTION_PAUSE
+        || (panic_action == PANIC_ACTION_SHUTDOWN && shutdown_action == SHUTDOWN_ACTION_PAUSE)) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
                                         !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
-    } else if (panic_action == PANIC_ACTION_POWEROFF) {
+    } else if (panic_action == PANIC_ACTION_SHUTDOWN) {
         qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
                                        !!info, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7ddf405d76..59304261cf 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3202,7 +3202,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_no_shutdown:
                 olist = qemu_find_opts("action");
-                qemu_opts_parse_noisily(olist, "panic=pause,shutdown=pause", false);
+                qemu_opts_parse_noisily(olist, "shutdown=pause", false);
                 break;
             case QEMU_OPTION_uuid:
                 if (qemu_uuid_parse(optarg, &qemu_uuid) < 0) {
-- 
2.26.2



