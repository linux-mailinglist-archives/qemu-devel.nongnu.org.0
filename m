Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF52FD2CD
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:37:59 +0100 (CET)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EcQ-0001Pb-K4
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Ebg-0000zB-N4
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:37:12 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l2Ebe-0002PF-WF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:37:12 -0500
Received: by mail-ed1-x530.google.com with SMTP id p22so25991831edu.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9SLTOgqEC/ea1YmXMKuLW8lFu+zw7LsfQZSniI12A9Q=;
 b=NSnpPs4lVrqcY3iR7XbSFLMHQuq5A610jK/Bo1/aqvZWdQUwbVDaj1Kvd7c6ZTUigH
 jwIXBmQcKXTOkZH295ZE7MuG3MB61Fb5+MuzfSSn2JwuIYr8m2qi7jWOCx9A6vsA7m0v
 rTfsQRAv0RTn2TGi5yOaEIV9LnwgJUakNiCcUzm2x/tPYAb/3HX92HWWgQteMACPcx7o
 dfqXOgCdSVTORxAjx4Yb1ALpacDc11d8GsRYFP+XFkXNpOCENFXWvsQiViMnfvbBTBUh
 HNyviMKwcNek/m9Qdpa3skx/FFLJNw9pMh49cGtDaB6rfdeIIuIaiKmtdkBKzsZvcD4E
 tY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9SLTOgqEC/ea1YmXMKuLW8lFu+zw7LsfQZSniI12A9Q=;
 b=oCoPSyQlfFUzgL9WFIO7pkCp0cC/gR3zspq0SgkwHpGG5Wi2nDQ6lfqbDHIEsN11E9
 20imdqT85K6smkgmRy/EFoBF6GSTmiOlFY1jFcyfsKBdixcWBjmRmY5dZMR8qZrElb2d
 2dFqDERMm403a/EOAUwCli6q4lwdrT+Zj58fg64+qRhR22ZYBFKcvRDeh3g/0xdjqdat
 H+0crtgRJSjz328tuLoxYiaJV4ySJQwIdJ5jhqlP1Ay3VpB3TY2HiY7MNfKR2b6O1u3R
 fI1s3PDlZ7Oe81yzIQGjANWNPA9534fynywMfYadtBO0da/owHDUkqch0ag/uxIMGhju
 tZJQ==
X-Gm-Message-State: AOAM530kSXQe5AuvSkNlWt25kX4V2ISaB63q1UnP4NgV5XBZTCFElDK4
 crgznoUEcLuLqR9q58ucHTjd5/uQMZSpeA==
X-Google-Smtp-Source: ABdhPJzpSSCv0v0lQ5YibsXEw17TwjrjMjlz2SFwdssaD8BODutTdp0wTTTkyhTFtq3BlLwDuCYSjQ==
X-Received: by 2002:aa7:d610:: with SMTP id c16mr7757365edr.354.1611153428898; 
 Wed, 20 Jan 2021 06:37:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id gj9sm288774ejb.107.2021.01.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 06:37:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] runstate: cleanup reboot and panic actions
Date: Wed, 20 Jan 2021 15:37:06 +0100
Message-Id: <20210120143706.345821-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
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
2.29.2


