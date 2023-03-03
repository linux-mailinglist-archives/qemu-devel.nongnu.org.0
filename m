Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A06A9D15
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94Z-0005XB-Ur; Fri, 03 Mar 2023 12:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94X-0005Wc-L0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94W-0003Sy-1i
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TNbxaEYT2yUK3nTXHv39n1PC3lTAJOLL2zJjKFygI8g=;
 b=Dl6+k36RTdUJvpxuy9FTSppI2FCkzuCi27gaAdBs/KAe5nqs7Qe6hlrvKJcZvsGQGNAUJi
 oU4hiDFq+Bpc7q2Ahws5Jxba/plSmspUBZ/eefb39TiZD//jzsd5wzgxZrxEHrBfXgHOKL
 Akyo3Oyulub5VwoVKQIVroZmjp4tX4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-x9K7Jv2GMvmneDDkdvTsZQ-1; Fri, 03 Mar 2023 12:19:54 -0500
X-MC-Unique: x9K7Jv2GMvmneDDkdvTsZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso1299130wmh.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNbxaEYT2yUK3nTXHv39n1PC3lTAJOLL2zJjKFygI8g=;
 b=n8bD4goanswscOH2k86H4nYE/n/9j+rT1mBTlgUgRuiwUy7FKLYvNx3M2r6vFHUx0w
 Q402T6s6SfpyDIzKBv7a2Fo5ilhTQjXAQtjxhF/Y23MibIQExwQvRk8vAA479fEIiFWk
 mRrTFUas1BSpQ3DEfUQDuo0or+mgITnfS6w6cjlLDZuLYpReMd00jmQioTxDY/2u9xgB
 wt0ONeC9bZ+v2wEqxmIM6DavHc0yKojRTIJ8Mcc3OZqkPRNgI9NbtlbWrt58mx6zscdz
 oPhOjiscT0nQeGRnl1JoSIJakG6v75UapfKIFqc5/hktyCtC4rP7ufnnGFQRzLgPuaXC
 zDKA==
X-Gm-Message-State: AO0yUKUB7aUZvjnj5SWAbTGdjYwjPLHNw5MOnu0xMGxmkNL0u3OgeV6i
 rsVnbYPmlBSMyITUI0kd40207fDIFCzTkRUFVmre2iEZ5ULp+Ig/BuSnSYUDr+v1gaGbyEuvWPf
 OyXlLm4WTLNa9mxHk+dswDpG/jtmMDIWKGUe6HwOTaqEAArZZ3hWQLYoDeL6r/CXV1BQUtGgR
X-Received: by 2002:a05:600c:1d0e:b0:3eb:fc6:79cf with SMTP id
 l14-20020a05600c1d0e00b003eb0fc679cfmr2538188wms.6.1677863992577; 
 Fri, 03 Mar 2023 09:19:52 -0800 (PST)
X-Google-Smtp-Source: AK7set964RHi8HpWlNWftOqusP6XqUnpMuNUzDyEDH9rHQEb8dHIQ5BCY/56lKWyXqiHTmxF1z+fgw==
X-Received: by 2002:a05:600c:1d0e:b0:3eb:fc6:79cf with SMTP id
 l14-20020a05600c1d0e00b003eb0fc679cfmr2538166wms.6.1677863992203; 
 Fri, 03 Mar 2023 09:19:52 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003eb2e33f327sm10353881wmc.2.2023.03.03.09.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 3/8] qemu-thread-win32: cleanup, fix, document QemuEvent
Date: Fri,  3 Mar 2023 18:19:34 +0100
Message-Id: <20230303171939.237819-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

QemuEvent is currently broken on ARM due to missing memory barriers
after qatomic_*().  Apart from adding the memory barrier, a closer look
reveals some unpaired memory barriers that are not really needed and
complicated the functions unnecessarily, as well as some optimizations
that I couldn't quite prove to be correct.

Finally, the code is relying on a memory barrier in ResetEvent(); the
barrier _ought_ to be there but there is really no documentation about
it; it only affects the slow path, so make it explicit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-win32.c | 78 +++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index 69db254ac7c1..eff664ae6b31 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -272,12 +272,20 @@ void qemu_event_destroy(QemuEvent *ev)
 void qemu_event_set(QemuEvent *ev)
 {
     assert(ev->initialized);
-    /* qemu_event_set has release semantics, but because it *loads*
+
+    /*
+     * Pairs with memory barrier in qemu_event_reset.
+     *
+     * qemu_event_set has release semantics, but because it *loads*
      * ev->value we need a full memory barrier here.
      */
     smp_mb();
     if (qatomic_read(&ev->value) != EV_SET) {
-        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
+        int old = qatomic_xchg(&ev->value, EV_SET);
+
+        /* Pairs with memory barrier after ResetEvent.  */
+        smp_mb__after_rmw();
+        if (old == EV_BUSY) {
             /* There were waiters, wake them up.  */
             SetEvent(ev->event);
         }
@@ -286,17 +294,19 @@ void qemu_event_set(QemuEvent *ev)
 
 void qemu_event_reset(QemuEvent *ev)
 {
-    unsigned value;
-
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
-    if (value == EV_SET) {
-        /* If there was a concurrent reset (or even reset+wait),
-         * do nothing.  Otherwise change EV_SET->EV_FREE.
-         */
-        qatomic_or(&ev->value, EV_FREE);
-    }
+
+    /*
+     * If there was a concurrent reset (or even reset+wait),
+     * do nothing.  Otherwise change EV_SET->EV_FREE.
+     */
+    qatomic_or(&ev->value, EV_FREE);
+
+    /*
+     * Order reset before checking the condition in the caller.
+     * Pairs with the first memory barrier in qemu_event_set().
+     */
+    smp_mb__after_rmw();
 }
 
 void qemu_event_wait(QemuEvent *ev)
@@ -304,29 +314,47 @@ void qemu_event_wait(QemuEvent *ev)
     unsigned value;
 
     assert(ev->initialized);
+
+    /*
+     * This read does not have any particular ordering requirements;
+     * if it moves earlier, we might miss qemu_event_set() and go down the
+     * slow path unnecessarily, but ultimately the memory barrier below,
+     * plus the internal synchronization of the kernel event, will ensure
+     * the check is done correctly.
+     */
     value = qatomic_read(&ev->value);
-    smp_mb_acquire();
     if (value != EV_SET) {
         if (value == EV_FREE) {
-            /* qemu_event_set is not yet going to call SetEvent, but we are
-             * going to do another check for EV_SET below when setting EV_BUSY.
-             * At that point it is safe to call WaitForSingleObject.
+            /*
+             * Here the underlying kernel event is reset, but qemu_event_set is
+             * not yet going to call SetEvent.  However, there will be another
+             * check for EV_SET below when setting EV_BUSY.  At that point it
+             * is safe to call WaitForSingleObject.
              */
             ResetEvent(ev->event);
 
-            /* Tell qemu_event_set that there are waiters.  No need to retry
-             * because there cannot be a concurrent busy->free transition.
-             * After the CAS, the event will be either set or busy.
+            /*
+             * It is not clear whether ResetEvent provides this barrier; kernel
+             * APIs (KeResetEvent/KeClearEvent) do not.  Better safe than sorry!
+             */
+            smp_mb();
+
+            /*
+             * Leave the event reset and tell qemu_event_set that there are
+             * waiters.  No need to retry, because there cannot be a concurrent
+             * busy->free transition.  After the CAS, the event will be either
+             * set or busy.
              */
             if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
-                value = EV_SET;
-            } else {
-                value = EV_BUSY;
+                return;
             }
         }
-        if (value == EV_BUSY) {
-            WaitForSingleObject(ev->event, INFINITE);
-        }
+
+        /*
+         * ev->value is now EV_BUSY.  Since we didn't observe EV_SET,
+         * qemu_event_set() must observe EV_BUSY and call SetEvent().
+         */
+        WaitForSingleObject(ev->event, INFINITE);
     }
 }
 
-- 
2.39.1


