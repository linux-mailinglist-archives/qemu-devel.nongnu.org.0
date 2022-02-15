Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAC44B67B8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:36:39 +0100 (CET)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuGF-0000Nv-2V
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCE-0003lP-Ty
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:30 -0500
Received: from [2a00:1450:4864:20::52b] (port=35653
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCC-0008PS-1F
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id f17so31127843edd.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+u0qUIogaWgGcHOtonrPExWgxK2xNivoZXLutbp5yVI=;
 b=mZVAGrx3FS07JgSa1YmWfT4qbLg1aofA717S5b5YTciblD4FqUILROU/ZV0r+oaXzv
 kZWIp0YSoLCh1cMsFHAEF0J57xzFN02eRTZr/CXgejr6ZD3pLl/e4RmPrj0jpDyGTY5J
 AWxw5HqjUGz4ChVg+KpMZvhNUwiW2TnkpXeMClDYOpDXg3jb+IIvyNXHGbUvwdFTJ4rm
 GL5YqyesL8klsJXkEcAsd55ZF8+xuJ5mnmkJU7uOuibs5jLjmDYdqk1KzKHGeXU0YOQ/
 WM4VCQhEtIWPEZzLiCE0e7BceQ50sizp0WNMZwXkJ4r7WWAhanJE4veQXvHSsrOG6qCs
 +m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+u0qUIogaWgGcHOtonrPExWgxK2xNivoZXLutbp5yVI=;
 b=HAutR+lcRVp2N6XeO7V5mdhxkoocOCRVqQgwdC8c7yATD1hsLXXptkrBkiTcgxlE06
 B/wlIRqi5zYUS7eLkrLrtj0GDELFP1PDDLQgLLWUF1nXqQ9i7LPBMzKUnw1WefPtl4YO
 rYTOUOSOhFfNfcAP/11XTXT9c5K2tQ4ap9NpatEJzJq8vnwLqF3IMgMqsR8KMpVP4NB8
 5GmlleKYiX6vVbc7x6UYwQ39h8GmIPUS1q0v96nbzT2UPuWTxih889B9YIo4COvWH7dw
 hx6PGIXIrB6MjbwXm1a5C7pYtP2o008oRPDdbIKDhqP3mBo7IM67DCG8lGt7dU+dHSRX
 J8bA==
X-Gm-Message-State: AOAM533rDs9+MirPp2WlD/tS4F/CXtBZ3SsAdHu2DmiPu5JMFJb1diuZ
 TWAqP6DCC+4R4e2T/URa+XsP1Qnb7sw=
X-Google-Smtp-Source: ABdhPJyFmf6tvksKpYoB/tb/67a0yrtzb362MTm94Ng4137K2TPelhkgYknt1bP1ZzL+kH4sJFfxVA==
X-Received: by 2002:a05:6402:b23:: with SMTP id
 bo3mr2927610edb.42.1644917546831; 
 Tue, 15 Feb 2022 01:32:26 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] memory: Fix qemu crash on starting dirty log twice with
 stopped VM
Date: Tue, 15 Feb 2022 10:31:55 +0100
Message-Id: <20220215093223.110827-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

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
Message-Id: <20220207123019.27223-1-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory.c | 65 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 18 deletions(-)

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
-
-    if (vmstate_change) {
-        qemu_del_vm_change_state_handler(vmstate_change);
-        vmstate_change = NULL;
-    }
+    unsigned int old_flags;
 
     assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
-    assert(!(global_dirty_tracking & flags));
+
+    if (vmstate_change) {
+        /* If there is postponed stop(), operate on it first */
+        postponed_stop_flags &= ~flags;
+        memory_global_dirty_log_stop_postponed_run();
+    }
+
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
2.34.1



