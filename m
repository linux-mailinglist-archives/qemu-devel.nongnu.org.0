Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBECE6ADDD0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjk-0007LL-KA; Tue, 07 Mar 2023 06:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjU-0006yd-F6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjS-0008GW-PF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOHH4yPNJZf+Sa0450BcZZrU7cumuCnXGhvsXLoiMX8=;
 b=U5EIGzrtlBL59jl9SK45aorfOWeJgp9MEWv+7KNMH4ZMXEWwHdeB3vZgKqu+TrXXNgf3JG
 FVzeFS0MO7zWYMZWc1Lc+ZE4O23cJJ5zzDp186HFr0emauH84g3L25uukuxLwitWhbykUy
 XJ6YCG1IpFdKTKw2wJ60+V4F8qgWbzM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-bHbYQNCFNR2YqqfUYmBHyg-1; Tue, 07 Mar 2023 06:43:49 -0500
X-MC-Unique: bHbYQNCFNR2YqqfUYmBHyg-1
Received: by mail-ed1-f70.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso18377645edb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOHH4yPNJZf+Sa0450BcZZrU7cumuCnXGhvsXLoiMX8=;
 b=Z+iU387kvfC3MMJlK1aBjkUfUDN3Gw4VHLd85+KDjcNadNjhSWA28EySrn6spAiaw2
 CUcF1q9ki9ZRHIegffegEi2IX/XSqMZPVLTIlUi/1mYFx9Cp+tDClUEj1GuEiZUtXBw/
 ehnWrbjeDXULnn0Xbx6+oBXeZx8zFNk2eCyJKufyynYRT/PXRyldGDMmXXCDbN08Sdwa
 FcYWtojz841uL84DI8nEed3sO0NrlIhFXVGo6LF8aT1JK66wjO7OkPI128nq3neAJ+EK
 4m1jB+c9xqlq7ndB9i4K9PnIq1Grztelets4UW7D6TeP96gs/wnqOk0TigjZnFbtVAGy
 9V4g==
X-Gm-Message-State: AO0yUKX7C4H+jyKzraIZhVAF1tPTPLQWdHrwhmWbzkRn07O5Iq7jr9Gm
 s5wFGSR0wfs7GE2Gkg1n7uu8NSNtYLlOBlhrzrrK+2oR8hI8X9dmG6/dktnjOg4G+onhlsW5F4i
 PGA1ETaWE7KvfTSd8cnp7mGZ0bx++X7+p6EU2Ja0/xo/cd3DZ83yEc3ZUNWBQJ7WZ9NXGXLbVtk
 U=
X-Received: by 2002:a05:6402:1512:b0:4c2:6b68:c126 with SMTP id
 f18-20020a056402151200b004c26b68c126mr2552735edw.8.1678189427739; 
 Tue, 07 Mar 2023 03:43:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8mcojLQGQaSxAYVd0sM+ib1urtx2YnLxAxjAKG02qGISXdOG9CBlYRqdqQ/rHH2BZwv0LpTg==
X-Received: by 2002:a05:6402:1512:b0:4c2:6b68:c126 with SMTP id
 f18-20020a056402151200b004c26b68c126mr2552718edw.8.1678189427387; 
 Tue, 07 Mar 2023 03:43:47 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a17090622db00b008b1787ce722sm5948250eja.152.2023.03.07.03.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 6/9] qemu-coroutine-lock: add smp_mb__after_rmw()
Date: Tue,  7 Mar 2023 12:43:26 +0100
Message-Id: <20230307114329.158094-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

mutex->from_push and mutex->handoff in qemu-coroutine-lock implement
the familiar pattern:

   write a                                  write b
   smp_mb()                                 smp_mb()
   read b                                   read a

The memory barrier is required by the C memory model even after a
SEQ_CST read-modify-write operation such as QSLIST_INSERT_HEAD_ATOMIC.
Add it and avoid the unclear qatomic_mb_read() operation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 58f3f771817b..84a50a9e9117 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -201,10 +201,16 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     trace_qemu_co_mutex_lock_entry(mutex, self);
     push_waiter(mutex, &w);
 
+    /*
+     * Add waiter before reading mutex->handoff.  Pairs with qatomic_mb_set
+     * in qemu_co_mutex_unlock.
+     */
+    smp_mb__after_rmw();
+
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
      * a concurrent unlock() the responsibility of waking somebody up.
      */
-    old_handoff = qatomic_mb_read(&mutex->handoff);
+    old_handoff = qatomic_read(&mutex->handoff);
     if (old_handoff &&
         has_waiters(mutex) &&
         qatomic_cmpxchg(&mutex->handoff, old_handoff, 0) == old_handoff) {
@@ -303,6 +309,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
         }
 
         our_handoff = mutex->sequence;
+        /* Set handoff before checking for waiters.  */
         qatomic_mb_set(&mutex->handoff, our_handoff);
         if (!has_waiters(mutex)) {
             /* The concurrent lock has not added itself yet, so it
-- 
2.39.1


