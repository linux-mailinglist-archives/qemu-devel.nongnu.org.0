Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082E462E26
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:02:41 +0100 (CET)
Received: from localhost ([::1]:40912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mry62-0006Hm-Ro
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mry4H-0005XI-Di
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mry4D-00065U-SD
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638259240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=evFLkv18hyccbZOnahGP0QqG9sho133XHOle2LaIaLc=;
 b=bakvIbLinSpUsGia4PlGzeeb5bZuAPbuFn73o6vofI2dcSGKj1q2YGtYlC943uq72lejWH
 uHXn8o/SDRlxOFlfEt6bAsuqGVKHi7QoUZn5cCuAHYu4k9Vy/bt7ZblsPFEbP5L7SWKbkQ
 k5VuSX+pt87JNnD6Q1X0ywDWg23e8R8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-sF5LWV3MN6aDRdG-KHkWfw-1; Tue, 30 Nov 2021 03:00:39 -0500
X-MC-Unique: sF5LWV3MN6aDRdG-KHkWfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m18-20020a05600c3b1200b0033283ea5facso5881672wms.1
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 00:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=evFLkv18hyccbZOnahGP0QqG9sho133XHOle2LaIaLc=;
 b=j6lrJkEeZH/EruB6XB47q+MqTSAkfy7BEAoT3tV/aWvIp9k5hrWa1nm17VF2E2YwVF
 DOS2lkCG90ay5Km5Rxkx+lOMrO1SCjyN2pO5L7F72xyghoNDxLjoTy7VNiNqTwVKyLl7
 B4772uErBAH5dSEaf967lcG57LA/v3c6rCKedpdfZZ5uFLinUeFhEE/QoM4inTX3YFtD
 oYkrxnn324dfZ+UpPWB8seljCUED3b72nMwe1waRjsU2omg3YpML5NFMPj8wCAXikcl+
 nh7Dy0BhUjYY+9YOS/VYVD1jlc0afoZ9TRFJb45GAVrPU2fsbcyNUCLl3XwxJWj103Ea
 +5gg==
X-Gm-Message-State: AOAM532MgR8kt2JnB0AQq4NYOeDN2y45R2MxECdyOiqza0Ctv7KrvCYh
 JUHBypfwXL5CTQlOk/+NWOubpThUdec9hFIpPhn77wNKxL6YtdK92WV92UmBLVu6Xo4AIs1T/kO
 g9Jv+oRYl4j4d6pzmJ/Iev/ZQSKe2QR+qwj0Xt9IqVT5W2giixvlqsCvqCODh8g9v
X-Received: by 2002:adf:d844:: with SMTP id k4mr39048771wrl.622.1638259237686; 
 Tue, 30 Nov 2021 00:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8TFwxjjlXgaviRnKkn2Bj9sNmnLSpxAUmc1oTnrLakPWeK2eKQaqkoNJdk9BFvQionAJnhw==
X-Received: by 2002:adf:d844:: with SMTP id k4mr39048736wrl.622.1638259237350; 
 Tue, 30 Nov 2021 00:00:37 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.194])
 by smtp.gmail.com with ESMTPSA id a1sm20181369wri.89.2021.11.30.00.00.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:00:36 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] memory: Fix incorrect calls of log_global_start/stop
Date: Tue, 30 Nov 2021 16:00:28 +0800
Message-Id: <20211130080028.6474-1-peterx@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should only call the log_global_start/stop when the global dirty track
bitmask changes from zero<->non-zero.

No real issue reported for this yet probably because no immediate user to
enable both dirty rate measurement and migration at the same time.  However
it'll be good to be prepared for it.

Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
Cc: Hyman Huang <huangy81@chinatelecom.cn>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..81d4bf1454 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2773,6 +2773,8 @@ static VMChangeStateEntry *vmstate_change;
 
 void memory_global_dirty_log_start(unsigned int flags)
 {
+    unsigned int old_flags = global_dirty_tracking;
+
     if (vmstate_change) {
         qemu_del_vm_change_state_handler(vmstate_change);
         vmstate_change = NULL;
@@ -2781,15 +2783,14 @@ void memory_global_dirty_log_start(unsigned int flags)
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
@@ -2800,12 +2801,12 @@ static void memory_global_dirty_log_do_stop(unsigned int flags)
 
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
2.32.0


