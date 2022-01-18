Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04C49257A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:11:19 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nKY-0004Vm-CW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEJ-0006C0-6m; Tue, 18 Jan 2022 07:05:00 -0500
Received: from [2a00:1450:4864:20::332] (port=50712
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEC-0005r6-Pt; Tue, 18 Jan 2022 07:04:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id w26so27155447wmi.0;
 Tue, 18 Jan 2022 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hxLa1Ic+oybIIaxhFPog8XM4Pmte85GJPK9MXeVj63o=;
 b=O7bd4EtLj01BUr/Jqa34IHAsVt/KzxBcUJPmhU15WC1wLvTX178Bx2nhzYsIvSX+9X
 sEl9ljNKBiRe/xy8TS0W3O5gmpFvjfS45cQpClUqJxY/2G8RI63EIlzSAT3DHnzalRFi
 ioCU9gk6A5r4fqlnr3V054N8A+wWcGAmv28uJyegrgqhLjjFq3wBSqifU5MNFpq/8zJW
 avH7HdlQExwhsJ6iGQPqWzwZyeKOwoGkBct0aHPBSoPWUxzeOKXD6CsS4AIxLHn341qe
 5KLBKP5Zqw2I1ec/dT6/YqoQjiZ8xYZALQqTjLAqq/Tw6NcGBYRhhJLsjSKXT/YRwOcY
 LGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hxLa1Ic+oybIIaxhFPog8XM4Pmte85GJPK9MXeVj63o=;
 b=PfLBy31aFxqgg3X1fYfFrwUOZeUT8KyRfacz/Yy6DU+Av6wgGStMVSjHMCtspN7ul9
 K3TM118og/3tOQ6ugT1RJzmizQMshFBkixRxQ71+cnzUKGvvaIHhFjUipvu4wEZNcZV8
 GAhXlTOC7ujMhtD9zqAOjZpxDMGuB0M0lpCIqPYq+n/tfHo9+rIudXvzxgc5lG4WcQBp
 SB9YBEnMrcymXI9Ost2Kvl8l65ggDX7JoEAEbGnjuZmeH88trQnxqJtOk6N0rt7woySC
 JXwiaFJ3sbYwg7QEUQwSPR/s8QwH9yNzdqlXEWZ+ZXF4uJDPYwsus03yszgiOopxknDY
 KHxQ==
X-Gm-Message-State: AOAM532naPKs6ieZ4PQoWjEAnUUgJEz5qBQKyuCtdxbg0uRGU6JtrTBU
 VR9JT5zXBvVS5uswQKRmKhE6BzQTPDg=
X-Google-Smtp-Source: ABdhPJwEvKgmumh8Nh1oK47qDO3VUsxvWAXlDjZ8f1E11pgk6ACQR+tBRNhlCLT0tOcXFXPFQq3Zyg==
X-Received: by 2002:a05:6000:1ac7:: with SMTP id
 i7mr6381681wry.491.1642507385380; 
 Tue, 18 Jan 2022 04:03:05 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 y13sm10157596wry.111.2022.01.18.04.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 07/19] memory: Fix incorrect calls of log_global_start/stop
Date: Tue, 18 Jan 2022 13:02:17 +0100
Message-Id: <20220118120229.196337-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Peter Xu <peterx@redhat.com>

We should only call the log_global_start/stop when the global dirty track
bitmask changes from zero<->non-zero.

No real issue reported for this yet probably because no immediate user to
enable both dirty rate measurement and migration at the same time.  However
it'll be good to be prepared for it.

Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
Cc: qemu-stable@nongnu.org
Cc: Hyman Huang <huangy81@chinatelecom.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211130080028.6474-1-peterx@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/memory.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index e37a4b8ae39..678dc62f069 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2794,6 +2794,8 @@ static VMChangeStateEntry *vmstate_change;
 
 void memory_global_dirty_log_start(unsigned int flags)
 {
+    unsigned int old_flags = global_dirty_tracking;
+
     if (vmstate_change) {
         qemu_del_vm_change_state_handler(vmstate_change);
         vmstate_change = NULL;
@@ -2802,15 +2804,14 @@ void memory_global_dirty_log_start(unsigned int flags)
     assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
     assert(!(global_dirty_tracking & flags));
     global_dirty_tracking |= flags;
-
     trace_global_dirty_changed(global_dirty_tracking);
 
-    MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
-
-    /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
-    memory_region_transaction_begin();
-    memory_region_update_pending = true;
-    memory_region_transaction_commit();
+    if (!old_flags) {
+        MEMORY_LISTENER_CALL_GLOBAL(log_global_start, Forward);
+        memory_region_transaction_begin();
+        memory_region_update_pending = true;
+        memory_region_transaction_commit();
+    }
 }
 
 static void memory_global_dirty_log_do_stop(unsigned int flags)
@@ -2821,12 +2822,12 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
 
     trace_global_dirty_changed(global_dirty_tracking);
 
-    /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
-    memory_region_transaction_begin();
-    memory_region_update_pending = true;
-    memory_region_transaction_commit();
-
-    MEMORY_LISTENER_CALL_GLOBAL(log_global_stop, Reverse);
+    if (!global_dirty_tracking) {
+        memory_region_transaction_begin();
+        memory_region_update_pending = true;
+        memory_region_transaction_commit();
+        MEMORY_LISTENER_CALL_GLOBAL(log_global_stop, Reverse);
+    }
 }
 
 static void memory_vm_change_state_handler(void *opaque, bool running,
-- 
2.34.1


