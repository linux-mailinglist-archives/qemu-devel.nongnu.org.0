Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF33560C6DC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:48:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFVw-0005XA-6N; Tue, 25 Oct 2022 04:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwz-0004iH-Lc
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwj-0007vo-JY
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XllueJ8W6F7wFA9Q4Nm6I5lgdAakmPWSn5ODBp+DUmM=;
 b=CDteP2Tak25JUOkrvaM1C8/M/3NcpgZaVIluPvtRqj0snbpyMdquuLi9xpHJ1oF9n8SRQY
 Eqy8Hc1WDAprWauOAJnyvPR4LW0mKWKNvj2YfarXjZ0Xh8IJr49YoQDZP8oDsYOlsfLGfq
 35eMvMbadrX0ea4nZxFtAC/zd1QhvrI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-4xxZJECuMwqEHi9O5gkreg-1; Tue, 25 Oct 2022 04:05:45 -0400
X-MC-Unique: 4xxZJECuMwqEHi9O5gkreg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1AA41C05AFA;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E64140EBF5;
 Tue, 25 Oct 2022 08:05:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C85721E60CA; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 21/28] qapi run-state: Elide redundant has_FOO in generated C
Date: Tue, 25 Oct 2022 10:05:34 +0200
Message-Id: <20221025080541.271547-22-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/run-state.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Drop a superfluous conditional around
qapi_free_GuestPanicInformation() while there.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221018062849.3420573-22-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
[Commit message tweaked]
---
 softmmu/runstate.c     | 18 +++++-------------
 scripts/qapi/schema.py |  1 -
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 1e68680b9d..682a810d3c 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -479,18 +479,15 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
      */
     if (panic_action == PANIC_ACTION_PAUSE
         || (panic_action == PANIC_ACTION_SHUTDOWN && shutdown_action == SHUTDOWN_ACTION_PAUSE)) {
-        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE,
-                                        !!info, info);
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_PAUSE, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
     } else if (panic_action == PANIC_ACTION_SHUTDOWN ||
                panic_action == PANIC_ACTION_EXIT_FAILURE) {
-        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
-                                       !!info, info);
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF, info);
         vm_stop(RUN_STATE_GUEST_PANICKED);
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
     } else {
-        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN,
-                                        !!info, info);
+        qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_RUN, info);
     }
 
     if (info) {
@@ -517,13 +514,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
 void qemu_system_guest_crashloaded(GuestPanicInformation *info)
 {
     qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded");
-
-    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN,
-                                   !!info, info);
-
-    if (info) {
-        qapi_free_GuestPanicInformation(info);
-    }
+    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN, info);
+    qapi_free_GuestPanicInformation(info);
 }
 
 void qemu_system_reset_request(ShutdownCause reason)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 1b3195bc87..f405ab7f49 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/run-state.json',
             'qapi/stats.json',
             'qapi/tpm.json',
             'qapi/transaction.json',
-- 
2.37.3


