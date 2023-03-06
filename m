Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897DA6AD1A8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOZ-0004KN-S2; Mon, 06 Mar 2023 17:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOY-0004Jw-F4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOX-0003WV-6x
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GB/aIT12DbaEHGWq5+K6q22+aJN75bKBTA3rUyP93OQ=;
 b=Sv5Cy95W3dmfhtGTM2Cc55dDi6XI9kP9/ZvQWy73+LTKAGM7PeMzjxq89NHC0I/Ki252Xf
 8cIDAPJ6dd4LYENUzvs6MqEj15kiOiAXE4PDHGc2PRPE53rF0g4KAzJybDbP7LHO/0gvmC
 tof3VtnPeGjMT4W/XdfrzHK5q7umyY4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-BXTIud4LNIy5ZqvI1bLCEg-1; Mon, 06 Mar 2023 17:33:22 -0500
X-MC-Unique: BXTIud4LNIy5ZqvI1bLCEg-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso15893287edb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678141996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GB/aIT12DbaEHGWq5+K6q22+aJN75bKBTA3rUyP93OQ=;
 b=NjhmPu19kEDqRCXuDbOgtCHNLFid/6Gy7slOfmSK63MvRJIPBiYekb2AJ7WjB4Cmu3
 cND2x/qdJLj27SoG5DNLqfT/0XLWSzWSSiTW1Ptf8cLA/gPllKTjEyRp/dj7nI27Kl7T
 7Vp4f1fxO22l9N9yEiX/OZKBsSjieks12RTbmBH3N06BF2CKkZYKI2gXGyjoASP/HD50
 rJ4EFyievCfKuGapndvmZiV+KvX392AmVaV6z3r1UnbDjfsYEN0T652hUO8nK49hZ8zc
 HI+O516kXuyAn0XThvXQprbGXQCdn8t2IoYu7iIy4HBu6OvLV3/F0JCItR/Z7yr340EW
 1fpA==
X-Gm-Message-State: AO0yUKW65d5hQABHyhaXG+L4EzFOkVImykd+E4GooByB/leP2zHaUff+
 EMFg1r9qrn2Scl9ujy2BjcZLpG4TqOP+ZeyklPcxxVWZlXfWn3a9NKmwf5xzOS1bWEXA5EezxaH
 ITMKzkbIhjz2EhEc+S8uC3+lfMdoLy5ns7Dg9nbQ3EeOuH1lflUZAgmSY+yjjpUf6gW8o9lHYfO
 U=
X-Received: by 2002:a05:6402:1506:b0:4ac:c7b3:8c27 with SMTP id
 f6-20020a056402150600b004acc7b38c27mr11397646edw.28.1678141996650; 
 Mon, 06 Mar 2023 14:33:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+1PUB99owqGLZbY5HtyeUmr+oXHKPNfsARiRrh+urcWVgcEf70EWrJGpVA450CIczlJKBjxg==
X-Received: by 2002:a05:6402:1506:b0:4ac:c7b3:8c27 with SMTP id
 f6-20020a056402150600b004acc7b38c27mr11397619edw.28.1678141996344; 
 Mon, 06 Mar 2023 14:33:16 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a50c40c000000b004bb810e0b87sm5798597edf.39.2023.03.06.14.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 2/9] qemu-thread-posix: cleanup, fix, document QemuEvent
Date: Mon,  6 Mar 2023 23:32:59 +0100
Message-Id: <20230306223306.84383-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
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
is going on.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 69 ++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 93d250579741..02f674b207cc 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -384,13 +384,21 @@ void qemu_event_destroy(QemuEvent *ev)
 
 void qemu_event_set(QemuEvent *ev)
 {
-    /* qemu_event_set has release semantics, but because it *loads*
+    assert(ev->initialized);
+
+    /*
+     * Pairs with both qemu_event_reset() and qemu_event_wait().
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
@@ -418,20 +427,40 @@ void qemu_event_wait(QemuEvent *ev)
     unsigned value;
 
     assert(ev->initialized);
-    value = qatomic_read(&ev->value);
-    smp_mb_acquire();
+
+    /*
+     * qemu_event_wait must synchronize with qemu_event_set even if it does
+     * not go down the slow path, so this load-acquire is needed that
+     * synchronizes with the first memory barrier in qemu_event_set().
+     *
+     * If we do go down the slow path, there is no requirement at all: we
+     * might miss a qemu_event_set() here but ultimately the memory barrier in
+     * qemu_futex_wait() will ensure the check is done correctly.
+     */
+    value = qatomic_load_acquire(&ev->value);
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
+             * This cmpxchg doesn't have particular ordering requirements if it
+             * succeeds (moving the store earlier can only cause qemu_event_set()
+             * to issue _more_ wakeups), the failing case needs acquire semantics
+             * like the load above.
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


