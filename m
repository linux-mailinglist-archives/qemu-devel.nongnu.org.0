Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3134D487C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:59:34 +0100 (CET)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJKH-0002wz-Uy
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:59:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA1-000792-2O; Thu, 10 Mar 2022 07:44:53 -0500
Received: from [2a00:1450:4864:20::42e] (port=36532
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9z-0005Gy-Lx; Thu, 10 Mar 2022 07:44:52 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r10so7800494wrp.3;
 Thu, 10 Mar 2022 04:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CoYUWeJfp1u68l+ilOCM3xBlf1E8aY0U6SOmZUzPt1o=;
 b=aeDa1KF6CLIPSOPbuY4rPaIirID3ooQKWTbqNU+ae6rSMfXifUi3fBqgONSHVXE6XH
 Aj5Qx5Nb3f+zOgWHHi5vV8kMiBeyiYBCbYsZFUrdv2I4GQwLGqywhTQCJjQiBM+d2v/b
 +MlXQ7eLvxAtyRNnTm7Uz3dQqff2DrG5wEjc0CsnVmQTUCNHt3or8o96xrrUj0bXklm9
 HyXC0IV6G9eQ2/oKZlud5kg+0nlFdtOUEx+dxRnTtWYFtgPAziQ63LYFuRKRI5nEk710
 H15rYh8qJ7pkrJNIe9y4RkBEst69fBAxNnKJGFA77IK+ouWmg853GKtZBAS3oBJvFVVS
 hr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CoYUWeJfp1u68l+ilOCM3xBlf1E8aY0U6SOmZUzPt1o=;
 b=D0TRpKiTETBelnVT4rVHnKjKxST0Zh9kBzG5+w7r29outKcOfXMMPNyA2zaNk2MtDQ
 U2InK+JYTWskwj8V71dOPAt7VeA8FT2O9Ik/ZFpyAYtjgEj43WEmZ/bVrIiS6A3+XLX/
 k0VcbjQpu0adPUX6PXazwquq3NOeVtYvVrwNyWqYWB4urHFm7+mRBPoZJdgEwJq+IDWo
 Uczz331MhcD79zvEJd+13EAnS45013LNrW7rN53/d6ACTyBVXsgW/jZBe26jBa19K39P
 osCaVOP3/bI8Qj/YoBAS9zYYSfyU3KxZ9yUXGZckhrwWTHgUkWHaiwq+V5tl8wqXIPvy
 iRLQ==
X-Gm-Message-State: AOAM533Z92DvspNUkX3QBVR172AJ+1SOkmVbHwdEo+5EzZLznB/E5KgV
 iR+Ks2LRN5wE2CJJHN25R1Qtbs8nzwM=
X-Google-Smtp-Source: ABdhPJw06OOcNdfK1B6R1+mlXeo1f8dPFJj4g8cHZWwhZyqJNrbOeNmnagzzNOlDe289h/l32oBI5A==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr3378672wrb.514.1646916290007; 
 Thu, 10 Mar 2022 04:44:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/35] qemu_co_rwlock_maybe_wake_one
Date: Thu, 10 Mar 2022 13:44:06 +0100
Message-Id: <20220310124413.1102441-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is optimized a bit based on the assumption that
qemu_co_mutex_unlock() never yields.  In other words,
qemu_co_mutex_unlock() and qemu_co_rwlock_maybe_wake_one()
could be declared coroutine_only_fn instead of coroutine_fn.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 51f7da8bda..3b50e1dd5b 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -352,7 +352,6 @@ CoroutineAction qemu_co_mutex_unlock(CoMutex *mutex)
     return COROUTINE_CONTINUE;
 }
 
-#if 0
 struct CoRwTicket {
     bool read;
     Coroutine *co;
@@ -367,7 +366,7 @@ void qemu_co_rwlock_init(CoRwlock *lock)
 }
 
 /* Releases the internal CoMutex.  */
-static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+static CoroutineAction qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 {
     CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
     Coroutine *co = NULL;
@@ -393,13 +392,17 @@ static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 
     if (co) {
         QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
-        qemu_co_mutex_unlock(&lock->mutex);
+        int action = qemu_co_mutex_unlock(&lock->mutex);
+        assert(action == COROUTINE_CONTINUE);
         aio_co_wake(co);
     } else {
-        qemu_co_mutex_unlock(&lock->mutex);
+        int action = qemu_co_mutex_unlock(&lock->mutex);
+        assert(action == COROUTINE_CONTINUE);
     }
+    return COROUTINE_CONTINUE;
 }
 
+#if 0
 void qemu_co_rwlock_rdlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
-- 
2.35.1



