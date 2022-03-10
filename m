Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB314D4889
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 15:04:11 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJOk-0005Jl-0A
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 09:04:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA3-0007BH-1w; Thu, 10 Mar 2022 07:44:56 -0500
Received: from [2a00:1450:4864:20::42e] (port=39559
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA1-0005HX-CI; Thu, 10 Mar 2022 07:44:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h15so7758136wrc.6;
 Thu, 10 Mar 2022 04:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7/i4QQ/tXgODsjwuJBS5kQ2OleKE7n7aRV1qWEFjdo=;
 b=EHzidgYzHZIxuuzy/14d2bpfR18xIQve1KVZdqH7gHCtFrqkGDx5FZBOgwevQJqGuP
 HtnC99ton+G+Xd855Gajtc2r4+OmNBE7a7kSH8sLObBWMcAAc3RXJmOy+68GBvOU0HJT
 AcfgpcWXJJfWD0OZTo7M81hNmSwQxTKJr042kq71G8qTHhmV31FxG9mntqk/a2XxsreR
 Mrbe2MfShP4Z0g+dXfjJf10IFUQvXvqsOyzuVf8byvwwZ4Fo0WR2gKsYlJBT/gjTNEfV
 iimHujRi9G0qJgu981f6WSDfAf3QIOMVxwTaxgO8Nxdd0ieHRQ+aKTlnWNyKhbtF/Cll
 govw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m7/i4QQ/tXgODsjwuJBS5kQ2OleKE7n7aRV1qWEFjdo=;
 b=PRAofXXUYSu+b5agFlGZVS/qD07ioKpF0ExPBXZk3Czfs3withCLi1bAeNl3dHZ5IO
 BwqzhPs0dqAY2Q6FJlfdtvpUU4x6D4ppVU/SRJkmdLfwh5rtnpoXddPzMu0wwWlITXR8
 Yw5buyrytTtOHB6Bk5VoaEYiVgXClizRh0O80k8kB6pp55yfkimH5bSYeCHCs9HGTxhH
 J5Hupm2AO8/RrtQYjVoFq3layLy6+1kVJdBZ9wygh/IV4sCxURXBIVBI1UXsEs3KU/Mq
 JjaDhkRerOhxWklN2YZ6DHWJRu49NtRvqH2FKSyop18dAdkR7B3oFs++zoFdsgoUnC7Z
 1aTg==
X-Gm-Message-State: AOAM533GLEDYEh1g+CaRrmFx/ztcs36E2FtliM4fIJz0O7B0wjV+pTDy
 b8Sd/koqyw9zkli64EoZqFiWJQUvQ0M=
X-Google-Smtp-Source: ABdhPJz9/uSwZI9bd9Pv4LCf9RwJzsDsm/hLqbtREjvFl3IhKPNmw9oSQ6pxnR0vyIystbxxGG98yw==
X-Received: by 2002:a05:6000:1786:b0:1f0:36a5:e573 with SMTP id
 e6-20020a056000178600b001f036a5e573mr3441167wrg.428.1646916291765; 
 Thu, 10 Mar 2022 04:44:51 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/35] qemu_co_rwlock_unlock
Date: Thu, 10 Mar 2022 13:44:08 +0100
Message-Id: <20220310124413.1102441-31-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index e7eb446566..c164cf6b15 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -449,15 +449,21 @@ CoroutineAction qemu_co_rwlock_rdlock(CoRwlock *lock)
     return CO_INIT_FRAME(qemu_co_rwlock_rdlock, lock);
 }
 
-#if 0
-void qemu_co_rwlock_unlock(CoRwlock *lock)
+CO_DECLARE_FRAME(qemu_co_rwlock_unlock, CoRwlock *lock);
+static CoroutineAction co__qemu_co_rwlock_unlock(void *_frame)
 {
+    struct FRAME__qemu_co_rwlock_unlock *_f = _frame;
+    CO_ARG(lock);
     Coroutine *self = qemu_coroutine_self();
 
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
     assert(qemu_in_coroutine());
     self->locks_held--;
 
-    qemu_co_mutex_lock(&lock->mutex);
+    return qemu_co_mutex_lock(&lock->mutex);
+case 1:
     if (lock->owners > 0) {
         lock->owners--;
     } else {
@@ -465,9 +471,20 @@ void qemu_co_rwlock_unlock(CoRwlock *lock)
         lock->owners = 0;
     }
 
-    qemu_co_rwlock_maybe_wake_one(lock);
+_f->_step = 2;
+    return qemu_co_rwlock_maybe_wake_one(lock);
+case 2:
+    break;
+}
+return stack_free(&_f->common);
 }
 
+CoroutineAction qemu_co_rwlock_unlock(CoRwlock *lock)
+{
+    return CO_INIT_FRAME(qemu_co_rwlock_unlock, lock);
+}
+
+#if 0
 void qemu_co_rwlock_downgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
-- 
2.35.1



