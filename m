Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEA14D47F1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:19:37 +0100 (CET)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIhd-0000xH-1u
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA2-0007Ac-0M; Thu, 10 Mar 2022 07:44:54 -0500
Received: from [2a00:1450:4864:20::433] (port=43714
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA0-0005HC-F7; Thu, 10 Mar 2022 07:44:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id e24so7742511wrc.10;
 Thu, 10 Mar 2022 04:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rIL44VOkxzwidSkVK2Nn32gV754faOsKItwpY0xf3aU=;
 b=eF3VEvCK1idjXjtTtWCelgwB3C5fNo8btjWHUQK7yStCVM/HXCxaj0FsZAwFTWmPFz
 FTK+WSPg2Sf1Xo6WpZtGG5Je2Km+H/6yHBNf8haRV6wLMdQ6Ufm3vqtE/iQ9KAyyXD2r
 GXNuD1Gi9g5PDNg7umbhXaWpF6RmHMP/+TQ4G2yk0CxwiOTa7gLAlHFNpjYQWi0EX0+R
 NULHRfTejXQxFGkIzF68P0MSxi7pBtKw4Ud3nEN+0eiDtFQowjz5C7QdtqZBHTZgHj4t
 7KoLaPKbIF4TBno2DAKz3Jt//Ktfsiu8HtnK+hM/fqaxXsRprs5+1E78jBZtg8mqNOer
 hxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rIL44VOkxzwidSkVK2Nn32gV754faOsKItwpY0xf3aU=;
 b=bFG2UrJ6M91mWaoZ0X5L4euBYVQBwnhy/VY0wQqkIhjr5LrvJNKO6ElonDcnCjcNQp
 XwONjMCkzBftRKXgU7m0KKwhDEgCA4MynGNRNcQbil2DdqXf1ayqdmOP1PY7NLoefunU
 QTBEL8G0bkqrM4E0NHSLXDX7hn9DdiUZs4qK9magY5xNsomQMdf8jrwC3o8CPqtz6bJM
 ako8NLx+yDYqsl+OEpC2xONN1auGdD5FcSzt+UM5inEpcYW+XNpy6n9/SWJO2i5qEUbv
 Qyz1lCKTwpJFFHoX9Je9+NoDrKod1IrWMq5sX7njMZ519x5e3XRXERCjQiCU6FIFrmQd
 gwgg==
X-Gm-Message-State: AOAM53147GEEHL5b4EwotskBUx3sYXHvj7nfEUSE1/hqwPD7WkOrCNYE
 4W1kAh32Wq74q5uObT1ueN0uaWpFwBA=
X-Google-Smtp-Source: ABdhPJyX0Z/LH33PHav4kq5fZzUn6pspPJnjk/c3+DyQaoEbkqeRl1yrmmx1otluxta0hmF8+oGU4g==
X-Received: by 2002:adf:e5cf:0:b0:203:7a50:98bd with SMTP id
 a15-20020adfe5cf000000b002037a5098bdmr3439068wrn.416.1646916290847; 
 Thu, 10 Mar 2022 04:44:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/35] qemu_co_rwlock_rdlock
Date: Thu, 10 Mar 2022 13:44:07 +0100
Message-Id: <20220310124413.1102441-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 40 +++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 3b50e1dd5b..e7eb446566 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -402,32 +402,54 @@ static CoroutineAction qemu_co_rwlock_maybe_wake_one(CoRwlock *lock)
     return COROUTINE_CONTINUE;
 }
 
-#if 0
-void qemu_co_rwlock_rdlock(CoRwlock *lock)
+CO_DECLARE_FRAME(qemu_co_rwlock_rdlock, CoRwlock *lock, Coroutine *self, CoRwTicket my_ticket);
+static CoroutineAction co__qemu_co_rwlock_rdlock(void *_frame)
 {
+    struct FRAME__qemu_co_rwlock_rdlock *_f = _frame;
+    CO_ARG(lock);
     Coroutine *self = qemu_coroutine_self();
 
-    qemu_co_mutex_lock(&lock->mutex);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+CO_SAVE(self);
+    return qemu_co_mutex_lock(&lock->mutex);
+case 1:
+CO_LOAD(self);
     /* For fairness, wait if a writer is in line.  */
     if (lock->owners == 0 || (lock->owners > 0 && QSIMPLEQ_EMPTY(&lock->tickets))) {
         lock->owners++;
         qemu_co_mutex_unlock(&lock->mutex);
     } else {
-        CoRwTicket my_ticket = { true, self };
+        _f->my_ticket = (CoRwTicket){ true, self };
 
-        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &_f->my_ticket, next);
         qemu_co_mutex_unlock(&lock->mutex);
-        qemu_coroutine_yield();
+
+_f->_step = 2;
+        return qemu_coroutine_yield();
+case 2:
         assert(lock->owners >= 1);
 
         /* Possibly wake another reader, which will wake the next in line.  */
-        qemu_co_mutex_lock(&lock->mutex);
+_f->_step = 3;
+        return qemu_co_mutex_lock(&lock->mutex);
+case 3:
+CO_LOAD(self);
         qemu_co_rwlock_maybe_wake_one(lock);
     }
-
-    self->locks_held++;
 }
 
+    self->locks_held++;
+return stack_free(&_f->common);
+}
+
+CoroutineAction qemu_co_rwlock_rdlock(CoRwlock *lock)
+{
+    return CO_INIT_FRAME(qemu_co_rwlock_rdlock, lock);
+}
+
+#if 0
 void qemu_co_rwlock_unlock(CoRwlock *lock)
 {
     Coroutine *self = qemu_coroutine_self();
-- 
2.35.1



