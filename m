Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6070502B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 15:52:03 +0200 (CEST)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfMMd-00009d-5X
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 09:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsY-0007fE-Ty; Fri, 15 Apr 2022 09:20:50 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nfLsX-0008VG-Bi; Fri, 15 Apr 2022 09:20:50 -0400
Received: by mail-ej1-x630.google.com with SMTP id g18so15317956ejc.10;
 Fri, 15 Apr 2022 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1ImhP8nQI3nDHWkOKXvAHXmp0Nf/es+1XlM7xHuiCI=;
 b=arcCmDy5WCYZ2ZdSMJE+bWZ5jtI/JVG7ypPLKnVIa1Bk1eK9gXmLAFgK3Hb0WaIMaC
 Z6PGj0fffdS9AEcNUXtE5VyVLD1PX5VRm5tUtwCsrIRhfOBApk3o5563Ni1Gor8/seXh
 inpTto+AnHNMMfQBPnUP5yp0cJ2bvmxKkIMsClV25h7OtFr1qjK7G56+LD4ImT42cODs
 nTJfBRgDcGFzF9/l2kJJxg2H9BRJoA5Zns4QcIRXXoPki9bWSIV8lKdzXdR92H/cfMba
 G54Pp04JJjGYcn99woOptt7rl5Us3gTdTw4NsUwc7kxqNrbuCLiptw8v/rCHcZSqs+qt
 7QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V1ImhP8nQI3nDHWkOKXvAHXmp0Nf/es+1XlM7xHuiCI=;
 b=eizhKeG6O6fhDTtL9V5vQ3BlBWi8XalUoV3srULALtquVkDPDtnY6Rhmvku5d+hOlY
 6XjE0mFSDvTTeuFwxaaX/GQDDsmlRiQCvyYWH5ov/FlW32LBUR6KK/ICjKO4wmJUGD8w
 pZzxrxqm1rL8zer434D1DaBvddh+2HiRL9dW37XAdz7SQbCMf4YNmtBeN4fy50mOZiUD
 zdLJjKNh+f4b1uc6Pq22a0nffu/oGQMj8r7SNxIXGGq4t5RDLzbpeHT7T5edXzExDmlM
 F6x9/0wWI731KTpZJaUO2dG+WF/fE1BGIxJPI1Gsjx8ls9BEc40SiDVFY1zVbO5niiV2
 EvfQ==
X-Gm-Message-State: AOAM532ZYigaifpBZxmPnhDLZJxkPQDfln1uPyrI5izhHIam7oT9HQbG
 HRGfZ8u3Zi37PUaJ5RZVQMaeFCOAiFM3Yw==
X-Google-Smtp-Source: ABdhPJyhbVDtm9ER3GYOx/tWRKV1QJMIiQ3qB4kxNO+IAvzNFxXdIodpIvMGf6t8rU2z6exbGLktOA==
X-Received: by 2002:a17:906:a2c2:b0:6e7:efc2:17f2 with SMTP id
 by2-20020a170906a2c200b006e7efc217f2mr5984664ejb.542.1650028847662; 
 Fri, 15 Apr 2022 06:20:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 dn7-20020a17090794c700b006e8b176143bsm1683529ejc.155.2022.04.15.06.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 06:20:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/26] coroutine-lock: add missing coroutine_fn annotations
Date: Fri, 15 Apr 2022 15:18:56 +0200
Message-Id: <20220415131900.793161-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415131900.793161-1-pbonzini@redhat.com>
References: <20220415131900.793161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: malureau@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..ec55490b52 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -144,7 +144,7 @@ typedef struct CoWaitRecord {
     QSLIST_ENTRY(CoWaitRecord) next;
 } CoWaitRecord;
 
-static void push_waiter(CoMutex *mutex, CoWaitRecord *w)
+static void coroutine_fn push_waiter(CoMutex *mutex, CoWaitRecord *w)
 {
     w->co = qemu_coroutine_self();
     QSLIST_INSERT_HEAD_ATOMIC(&mutex->from_push, w, next);
@@ -341,7 +341,7 @@ void qemu_co_rwlock_init(CoRwlock *lock)
 }
 
 /* Releases the internal CoMutex.  */
-static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
+static void coroutine_fn qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
 {
     CoRwTicket *tkt = QSIMPLEQ_FIRST(&lock->tickets);
     Coroutine *co = NULL;
@@ -374,7 +374,7 @@ static void qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
     }
 }
 
-void qemu_co_rwlock_rdlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_rdlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -399,7 +399,7 @@ void qemu_co_rwlock_rdlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_unlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_unlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -417,7 +417,7 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_downgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners == -1);
@@ -427,7 +427,7 @@ void qemu_co_rwlock_downgrade(CoRwlock *lock)
     qemu_co_rwlock_maybe_wake_one(lock);
 }
 
-void qemu_co_rwlock_wrlock(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_wrlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
 
@@ -447,7 +447,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
     self->locks_held++;
 }
 
-void qemu_co_rwlock_upgrade(CoRwlock *lock)
+void coroutine_fn qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
     assert(lock->owners > 0);
-- 
2.35.1



