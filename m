Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9814ABEA5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:48:19 +0100 (CET)
Received: from localhost ([::1]:42970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH3RJ-0002dk-9p
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:48:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH3AD-0005an-42
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nH3A7-0002y8-N6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644237030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wI8ffeKVOlwJ6MBzimoJa94QtQ4O+eYiHVbRTJ7xNIg=;
 b=IPQhpSfrOON273S/tsNVBU5pCJ8aNRmfWrGvnrT4PGIXeEvF7mBvCJeW4dcyvDVOPDA7Nb
 fu2TgYcL7rOUDnbYb1JUus9HbbMjmJY545eDO30flWeKcAlpzBxd6wxbLTqVA1+i7GfG3n
 kpcgdB+gsgd6PB2l3D8TMB+XIEnKhSA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-FlqkPgEZOdCT8nEisl9KnA-1; Mon, 07 Feb 2022 07:30:29 -0500
X-MC-Unique: FlqkPgEZOdCT8nEisl9KnA-1
Received: by mail-pj1-f69.google.com with SMTP id
 md16-20020a17090b23d000b001b8bd5e35e2so2266615pjb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 04:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI8ffeKVOlwJ6MBzimoJa94QtQ4O+eYiHVbRTJ7xNIg=;
 b=QRLPHbgIuErN6hCksTRC6GcxWayHL2ZOdNJJ9osJ3OJ7Mll1MDuPcRfL9viwj299KO
 iODrYf1ZnusPvvgEVIXFOEBrQ65YqgmBXvxa6YsVdMsKy1Tls9kx0b2C4GBh+6tZxwFT
 ky4NtrNEJgZUtbogWHAskRFIHKzbG7L7JzMaQ+uwNbi0GtQPbLPOuM40/FCQ/J4HGGFI
 /7BhWYNsMB8cQe/vqaA68yTyAmJ3eQJrm3HGXYV+qk3gUfIhaBDmDZtwehL0Em7DzwHF
 zNX8rZAC8urpV53ZV8Kw3AM7p8ROeyfkAvCHCE8W3z78CMGDDQjQLSvR7L0xu4bs5O2V
 YlyA==
X-Gm-Message-State: AOAM532MkBkvxD7gjCJCY5C8vFTmUE3ttaD6Ehbk9w25KyuPTxqCYSI4
 q5DVjAuFlknActdy8WAK4S7+cnI3BvuKA+6S74djcUorGiHZ6x82P9DNuWNPxXf+bBlhALbcbk4
 Hfgrz5HrJzbh80fG3kcl951+YJsY48Q+xn7eVZgg8bNpNII/7op5PqFChlAnKU1Bu
X-Received: by 2002:a17:902:8c92:: with SMTP id
 t18mr15960455plo.11.1644237027922; 
 Mon, 07 Feb 2022 04:30:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwob+a8E8PtgYaccIAQdhunTRX/GbSlnsOPjhp+f2VL89Pb8eOOTAANYQuKLHqck0OiKSXGxw==
X-Received: by 2002:a17:902:8c92:: with SMTP id
 t18mr15960393plo.11.1644237027329; 
 Mon, 07 Feb 2022 04:30:27 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.121])
 by smtp.gmail.com with ESMTPSA id c7sm11946570pfp.164.2022.02.07.04.30.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 04:30:26 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Date: Mon,  7 Feb 2022 20:30:19 +0800
Message-Id: <20220207123019.27223-1-peterx@redhat.com>
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

Cc: Hyman Huang <huangy81@chinatelecom.cn>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2044818
Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 61 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 678dc62f06..8060c6de78 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2790,19 +2790,32 @@ void memory_global_after_dirty_log_sync(void)
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
-    unsigned int old_flags = global_dirty_tracking;
+    unsigned int old_flags;
+
+    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
 
     if (vmstate_change) {
-        qemu_del_vm_change_state_handler(vmstate_change);
-        vmstate_change = NULL;
+        /* If there is postponed stop(), operate on it first */
+        postponed_stop_flags &= ~flags;
+        memory_global_dirty_log_stop_postponed_run();
     }
 
-    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
-    assert(!(global_dirty_tracking & flags));
+    flags &= ~global_dirty_tracking;
+    if (!flags) {
+        return;
+    }
+
+    old_flags = global_dirty_tracking;
     global_dirty_tracking |= flags;
     trace_global_dirty_changed(global_dirty_tracking);
 
@@ -2830,29 +2843,45 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
     }
 }
 
+/*
+ * Execute the postponed dirty log stop operations if there is, then reset
+ * everything (including the flags and the vmstate change hook).
+ */
+static void memory_global_dirty_log_stop_postponed_run(void)
+{
+    /* This must be called with the vmstate handler registered */
+    assert(vmstate_change);
+
+    /* Note: postponed_stop_flags can be cleared in log start routine */
+    if (postponed_stop_flags) {
+        memory_global_dirty_log_do_stop(postponed_stop_flags);
+        postponed_stop_flags = 0;
+    }
+
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


