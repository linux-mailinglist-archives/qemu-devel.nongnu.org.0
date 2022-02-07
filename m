Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334244AB371
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 04:30:58 +0100 (CET)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGujx-0007uM-1R
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 22:30:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nGug4-0006iV-S3
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 22:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nGufx-0001GU-U2
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 22:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644204393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KnS0qOz1rV+B93dD6Ieg/TKmwRyk86bMON+oLZACjMc=;
 b=UqbvopGtem0B2NlIakptciHaKn5D0DtawxK5wqIokQ5mw8xejfIoqsZzI2yhfOnumSNF6u
 sQ11CAu83J3kQ+zBjF55gFeTrs3/5CO547fnL660scfzqdMq4+clH38W5ibYwHjWrgHSSc
 vJreHwwVn4UEjnDTs49Z4tXd27xWKYY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-oMrHLI3KNkulb7tDH8854w-1; Sun, 06 Feb 2022 22:26:32 -0500
X-MC-Unique: oMrHLI3KNkulb7tDH8854w-1
Received: by mail-pj1-f71.google.com with SMTP id
 62-20020a17090a09c400b001b80b0742b0so8298054pjo.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 19:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnS0qOz1rV+B93dD6Ieg/TKmwRyk86bMON+oLZACjMc=;
 b=H93RbJy0vABZByuPS36q7AtNFMe9X2OwDvsqDSUrUy/kGaqg5jKpP5ul9cQEDkz59G
 Z+7/BnGmvZT0KRaJl3i5OImLCgdU9Yo/u9wEJcYcN/bLNsdac89/vSyWkF7WydAmdku7
 p1vkEmj3xOdhXL2i3Bp5X3Z5fHkmlvi56X3dQQsRFqxbmArfG/dJyBt8WskFcaFCYGz0
 uyU/KYVdUyJuBz4+u4KL7X5lOmcLBcyVlGnWRBAVhXRD5Xi82Xg6swhZE54Tp1ECgUym
 /ienVKUnBuI4VFY0zw4yyhaefJ6fKvbbYsqxaxCmlwotT+2i6Dx9kvDUeMWW7Y6gilCa
 //Og==
X-Gm-Message-State: AOAM532g04tP9+t4BaxOYxnrfNPwz7ChbUkxmA9SsmdNriIvfjtc+FRj
 nyYyWOFAIzrINjLZwb91Ptird3kklSOF8/h9uSEpY56SUkV49YsDbO2+FnAYhmcqlBNIprPQpUb
 YO+KjEtHZi/z+MKY8Foxb/P/DqFKGbYhjp++yDy5B/GExZvi91zoE6jZhU9kQ1Z2N
X-Received: by 2002:a63:601:: with SMTP id 1mr7881799pgg.106.1644204390780;
 Sun, 06 Feb 2022 19:26:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTOW0HhCRYN7hMYfdznoWiqbcx7uZlO+SlxLJUOZ5Lh+uyFaFG0xorURhhEW7xWYZOlXpWOA==
X-Received: by 2002:a63:601:: with SMTP id 1mr7881776pgg.106.1644204390342;
 Sun, 06 Feb 2022 19:26:30 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id x33sm10720001pfh.178.2022.02.06.19.26.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 19:26:29 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Date: Mon,  7 Feb 2022 11:26:22 +0800
Message-Id: <20220207032622.19931-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU can now easily crash with two continuous migration carried out:

(qemu) migrate -d exec:cat>out
(qemu) migrate_cancel
(qemu) migrate -d exec:cat>out
[crash] ../softmmu/memory.c:2782: memory_global_dirty_log_start: Assertion
`!(global_dirty_tracking & flags)' failed.

It's because memory API provides a way to postpone dirty log stop if the VM is
stopped, and that'll be re-done until the next VM start.  It was added in 2017
with commit 1931076077 ("migration: optimize the downtime", 2017-08-01).

However the recent work on allowing dirty tracking to be bitmask broke it,
which is commit 63b41db4bc ("memory: make global_dirty_tracking a bitmask",
2021-11-01).

The fix proposed in this patch contains two things:

  (1) Instead of passing over the flags to postpone stop dirty track, we add a
      global variable (along with current vmstate_change variable) to record
      what flags to stop dirty tracking.

  (2) When start dirty tracking, instead if remove the vmstate hook directly,
      we also execute the postponed stop process so that we make sure all the
      starts and stops will be paired.

This procedure is overlooked in the bitmask-ify work in 2021.

Actually with the postponed stop flags, a smarter thing to do is when start
dirty logging with specific flag, we can ignore the start if the flag is
contained in the "postponed to stop" flags, however that'll slightly complicate
the code, and it shouldn't be a major use case for QEMU.  Considering that this
should also copy stable, keep it simple while fixing the crash.

Cc: Hyman Huang <huangy81@chinatelecom.cn>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2044818
Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 53 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 678dc62f06..cbb9b241ea 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2790,16 +2790,25 @@ void memory_global_after_dirty_log_sync(void)
     MEMORY_LISTENER_CALL_GLOBAL(log_global_after_sync, Forward);
 }
 
+/*
+ * Dirty track stop flags that are postponed due to VM being stopped.  Should
+ * only be used within vmstate_change hook.
+ */
+static unsigned int postponed_stop_flags;
 static VMChangeStateEntry *vmstate_change;
+static void memory_global_dirty_log_stop_postponed_run(void);
 
 void memory_global_dirty_log_start(unsigned int flags)
 {
     unsigned int old_flags = global_dirty_tracking;
 
-    if (vmstate_change) {
-        qemu_del_vm_change_state_handler(vmstate_change);
-        vmstate_change = NULL;
-    }
+    /*
+     * If there is postponed dirty log stop flags, do it, so that start/stop
+     * will always be paired.  A smarter thing to do is ignore start process if
+     * the same flag has got postponed on stop, but it shouldn't matter a lot
+     * in major user scenarios, so keep the code simple for now.
+     */
+    memory_global_dirty_log_stop_postponed_run();
 
     assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
     assert(!(global_dirty_tracking & flags));
@@ -2830,29 +2839,43 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
     }
 }
 
+/*
+ * Execute the postponed dirty log stop operations if there is, then reset
+ * everything (including the flags and the vmstate change hook).
+ */
+static void memory_global_dirty_log_stop_postponed_run(void)
+{
+    if (!vmstate_change) {
+        /* It means nothing is postponed */
+        return;
+    }
+
+    memory_global_dirty_log_do_stop(postponed_stop_flags);
+    postponed_stop_flags = 0;
+    qemu_del_vm_change_state_handler(vmstate_change);
+    vmstate_change = NULL;
+}
+
 static void memory_vm_change_state_handler(void *opaque, bool running,
                                            RunState state)
 {
-    unsigned int flags = (unsigned int)(uintptr_t)opaque;
     if (running) {
-        memory_global_dirty_log_do_stop(flags);
-
-        if (vmstate_change) {
-            qemu_del_vm_change_state_handler(vmstate_change);
-            vmstate_change = NULL;
-        }
+        memory_global_dirty_log_stop_postponed_run();
     }
 }
 
 void memory_global_dirty_log_stop(unsigned int flags)
 {
     if (!runstate_is_running()) {
+        /* Postpone the dirty log stop, e.g., to when VM starts again */
         if (vmstate_change) {
-            return;
+            /* Batch with previous postponed flags */
+            postponed_stop_flags |= flags;
+        } else {
+            postponed_stop_flags = flags;
+            vmstate_change = qemu_add_vm_change_state_handler(
+                memory_vm_change_state_handler, NULL);
         }
-        vmstate_change = qemu_add_vm_change_state_handler(
-                                memory_vm_change_state_handler,
-                                (void *)(uintptr_t)flags);
         return;
     }
 
-- 
2.32.0


