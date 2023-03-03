Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F26A9D27
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94l-0005k5-Lv; Fri, 03 Mar 2023 12:20:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94k-0005fV-9z
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94i-0003gu-6A
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BoFUgybJ2RFTJiKUylassD3EZJCJvXGXsZmAgyGMEg=;
 b=SDadahCjAZGJH6+jW4/GUbpvVbdx3XOu4AK/X+g2n3xLHeB+Oa9wpEyFeoVjgJ685GxTE9
 o+G37L0BdMHiGBug70rm3l+Rvh2w1jvdWzGR/mhcsv60XJWobG/p3zWhS0TkgU9qetWx5+
 XCV+S+KC5qNNNhv1XOWiGIllyJ4ian4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-6H0Fq7hBMSqkiEwar7q_Bg-1; Fri, 03 Mar 2023 12:20:06 -0500
X-MC-Unique: 6H0Fq7hBMSqkiEwar7q_Bg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so3145162wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+BoFUgybJ2RFTJiKUylassD3EZJCJvXGXsZmAgyGMEg=;
 b=NN+8d6NJIvggTGNO5F8WQ3XF4i2H9F89EZtaPiK2jg3zgHapecIr4Z4v7w/HYpdfUf
 jFiId2GA2l6oh0XjSzB/onbu0bRpaFlGJrWrNcPKEqV9nQlzQOmt19Z3AJKS/nD+Hodj
 Cenwpkw5WnEidvb0MmA6/ctDsFzRrXU/hVvHvJO95dRCb815UHT0lNnVICCklJNOosyE
 gZxG1BOfLVeKOuRUJ+aMNpPVsnDOepU1Qlj93XrSUvyWSr+6WWlUSiFoc6S11QQ4ydvZ
 1azykvhFvgs2NVQH9fbd1pgKOZtDLuAor/i0hdaMMtNz7Wz8XHSPds7b3EDOZF9ZnHXx
 5ceA==
X-Gm-Message-State: AO0yUKXn9ztDiZm/8P7R+sRpdrXYnzEUAVt/hMIyznvIv1ALDPYpy/YD
 grE1k/p7dGX54BEa700GmiABh1s6P92wjFZm/gnhigKP6rC0K+tfA4A+6XBqG7eE7HNUBkiFwqV
 uGE7ILajPbG/pX/23gQTXv9VuonXBKzFloQHk7ICL1PbtcHAxfmwa0sUSh8r0Utt0DkqAJzP9
X-Received: by 2002:adf:e4d0:0:b0:2c7:190b:c3dc with SMTP id
 v16-20020adfe4d0000000b002c7190bc3dcmr1885237wrm.53.1677864004977; 
 Fri, 03 Mar 2023 09:20:04 -0800 (PST)
X-Google-Smtp-Source: AK7set89oWuQauyzBRCurusxBapUDofD+u4BFUzQZgKN0iRSHO1NzjDa8qWZYFlQL4nYcRu5W7nTNg==
X-Received: by 2002:adf:e4d0:0:b0:2c7:190b:c3dc with SMTP id
 v16-20020adfe4d0000000b002c7190bc3dcmr1885221wrm.53.1677864004708; 
 Fri, 03 Mar 2023 09:20:04 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm2652300wro.86.2023.03.03.09.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:20:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 7/8] qemu-coroutine-lock: add smp_mb__after_rmw()
Date: Fri,  3 Mar 2023 18:19:38 +0100
Message-Id: <20230303171939.237819-8-pbonzini@redhat.com>
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

mutex->from_push and mutex->handoff in qemu-coroutine-lock implement
the familiar pattern:

   write a                                  write b
   smp_mb()                                 smp_mb()
   read b                                   read a

The memory barrier is required by the C memory model even after a
SEQ_CST read-modify-write operation such as QSLIST_INSERT_HEAD_ATOMIC.
Add it and avoid the unclear qatomic_mb_read() operation.

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


