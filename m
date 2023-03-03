Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA46A9D0C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94W-0005WK-DA; Fri, 03 Mar 2023 12:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94U-0005Vz-PY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94T-0003SZ-2e
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEaglFNvLVCCHa29DJ9XvBF4adORWArJwgAKxmbV+/I=;
 b=ede0uvsZQn/DaiInM7oCkQtBZcfSgsJQPSPnozcGjoOk0O4cLDrXbo45BpRmUpwFVdYHL5
 LcPI70bwdK/dc+KsLmwwTDxT6ADPKK5mKcaGjs9+XQLJcpspmVy+q8lBei74+Phe5FFzTO
 vFu/h4bmpZ3u5UJRFt6tfRSJECfN4+s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-96Aao5rCMu26vuIOITgWfQ-1; Fri, 03 Mar 2023 12:19:51 -0500
X-MC-Unique: 96Aao5rCMu26vuIOITgWfQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so3144862wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEaglFNvLVCCHa29DJ9XvBF4adORWArJwgAKxmbV+/I=;
 b=Es0hSHzrij7yVaFGX+ObC9M9TrJLoXVhR7+lMQgTJNuHZpewpRdQPLqAomWKffhv5l
 mGAiyywrXWEwh07OMt7FVGLAGhOYfPY7nQiitqnV7aDbJYo/L3gE1klbhzPMsh3cpsvL
 sESNW+sbF1J21718sinJh9e3fBfufXdYBip3Af34cvGS2y/Q1epnEqwXJQQVMFKeBGt6
 UZkKEyC6lyjij0jqQF+WiZZhif/svMT6JJwuszkDpRgfs5+ecCBeLHxaevo1hPB+XBuO
 9HZMSKXV3YBIwHHZp46BCQ8pB9J91vmnw+uYI63x30RgkpRmb8USehmKXFpqUdZpHUPu
 2dJA==
X-Gm-Message-State: AO0yUKW1loPm1DTkK2uAsAsGjZxQg9s7vThyBN1vfPX9JBDuIirxp693
 XR8xQ/SNDX/L23SHvasNHrmUgmU3+SJo6YnGldi9GQckwMiDW++ykpkyI1Kx6b+JSqhUEVcAbN7
 EleHuWwTX2SOQg5uKFeHswS5cJ6CSrFrLIywcy7QbBPIm2/PU1Lq6kry0De8TZxlnP8GOYgmp
X-Received: by 2002:a05:600c:4448:b0:3dc:18de:b20d with SMTP id
 v8-20020a05600c444800b003dc18deb20dmr2353209wmn.33.1677863989522; 
 Fri, 03 Mar 2023 09:19:49 -0800 (PST)
X-Google-Smtp-Source: AK7set8ly9J7p1Cg8eQdabP7JGRzGPQ7IGIsrMOPta+3lRVuB+BI0mL0u92u/fNeprTh4kuM/91ACg==
X-Received: by 2002:a05:600c:4448:b0:3dc:18de:b20d with SMTP id
 v8-20020a05600c444800b003dc18deb20dmr2353183wmn.33.1677863989139; 
 Fri, 03 Mar 2023 09:19:49 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc015000000b003e214803343sm6520180wmb.46.2023.03.03.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 2/8] qemu-thread-posix: cleanup, fix, document QemuEvent
Date: Fri,  3 Mar 2023 18:19:33 +0100
Message-Id: <20230303171939.237819-3-pbonzini@redhat.com>
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
reveals some unpaired memory barriers too.  Document more clearly what
is going on, and remove optimizations that I couldn't quite prove to
be correct.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 64 ++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 93d250579741..06d1bff63bb7 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -384,13 +384,21 @@ void qemu_event_destroy(QemuEvent *ev)
 
 void qemu_event_set(QemuEvent *ev)
 {
-    /* qemu_event_set has release semantics, but because it *loads*
+    assert(ev->initialized);
+
+    /*
+     * Pairs with memory barrier in qemu_event_reset.
+     *
+     * qemu_event_set has release semantics, but because it *loads*
      * ev->value we need a full memory barrier here.
      */
-    assert(ev->initialized);
     smp_mb();
     if (qatomic_read(&ev->value) != EV_SET) {
-        if (qatomic_xchg(&ev->value, EV_SET) == EV_BUSY) {
+        int old = qatomic_xchg(&ev->value, EV_SET);
+
+        /* Pairs with memory barrier in kernel futex_wait system call.  */
+        smp_mb__after_rmw();
+        if (old == EV_BUSY) {
             /* There were waiters, wake them up.  */
             qemu_futex_wake(ev, INT_MAX);
         }
@@ -399,18 +407,19 @@ void qemu_event_set(QemuEvent *ev)
 
 void qemu_event_reset(QemuEvent *ev)
 {
-    unsigned value;
-
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
-    if (value == EV_SET) {
-        /*
-         * If there was a concurrent reset (or even reset+wait),
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
@@ -418,20 +427,37 @@ void qemu_event_wait(QemuEvent *ev)
     unsigned value;
 
     assert(ev->initialized);
+
+    /*
+     * This read does not have any particular ordering requirements;
+     * if it moves earlier, we might miss qemu_event_set() and go down the
+     * slow path unnecessarily, but ultimately the memory barrier in
+     * qemu_futex_wait() will ensure the check is done correctly.
+     */
     value = qatomic_read(&ev->value);
-    smp_mb_acquire();
     if (value != EV_SET) {
         if (value == EV_FREE) {
             /*
-             * Leave the event reset and tell qemu_event_set that there
-             * are waiters.  No need to retry, because there cannot be
-             * a concurrent busy->free transition.  After the CAS, the
-             * event will be either set or busy.
+             * Leave the event reset and tell qemu_event_set that there are
+             * waiters.  No need to retry, because there cannot be a concurrent
+             * busy->free transition.  After the CAS, the event will be either
+             * set or busy.
+             *
+             * Neither the load nor the store of this cmpxchg have particular
+             * ordering requirements.  The reasoning for the load is the same
+             * as qatomic_read() above; while moving the store earlier can only
+             * cause qemu_event_set() to issue _more_ wakeups.
              */
             if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
                 return;
             }
         }
+
+        /*
+         * This is the final check for a concurrent set, so it does need
+         * a smp_mb() pairing with the second barrier of qemu_event_set().
+         * The barrier is inside the FUTEX_WAIT system call.
+         */
         qemu_futex_wait(ev, EV_BUSY);
     }
 }
-- 
2.39.1


