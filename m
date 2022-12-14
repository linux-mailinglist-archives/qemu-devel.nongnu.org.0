Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059A64C47D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 08:50:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUh-0003bJ-CJ; Wed, 14 Dec 2022 02:47:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUO-0003Tg-50
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUK-0003gB-0r
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j7/IgEQgH174r0eepRmeSiDMMpDJmclgd8GirNkaJiE=;
 b=Q7sGJNwPR91mej7nVsk99PNrWHB3JtF5i7D3Eyp3KJE9CuOk3dKMTd7XtxmSRRmYmElXnd
 ydWBzGoulXMzTU4yYjwWZZLE5xrWl0maM+v2upNEQFu/AWAti2vkdWZplx4pQlhV8CGIhf
 6S46khbidanZlL+gaKloYYhQYicwJCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-I73bqVBqOBa8ZcJl4yu6wQ-1; Wed, 14 Dec 2022 02:47:31 -0500
X-MC-Unique: I73bqVBqOBa8ZcJl4yu6wQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD2F101A521;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 776027AE5;
 Wed, 14 Dec 2022 07:47:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8729D21E60C9; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 23/30] qapi run-state: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:14 +0100
Message-Id: <20221214074721.731441-26-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104160712.3005652-24-armbru@redhat.com>
---
 softmmu/runstate.c     | 18 +++++-------------
 scripts/qapi/schema.py |  1 -
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 3dd83d5e5d..cab9f6fc07 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -484,18 +484,15 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
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
@@ -522,13 +519,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
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


