Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BE74D47C3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:10:05 +0100 (CET)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIYO-0006uI-Vb
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:10:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA6-0007EH-By; Thu, 10 Mar 2022 07:44:58 -0500
Received: from [2a00:1450:4864:20::336] (port=45573
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA4-0005Ia-Fx; Thu, 10 Mar 2022 07:44:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so3287689wms.4; 
 Thu, 10 Mar 2022 04:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r2jDEb+fQm79ZJXGhBcmAyaMICDBYPXvzMm0Xp2UO7o=;
 b=M2Qvm+uRj6PfwreH80nS5UJEnUF+iYaW2MLQLFT1rAXuV1/cActPRc+RhW4S2mn3CN
 3DdTIeUPwzgXky0xT4FA455/bfvLhcCg/Aruw/a6zY0W7ksSwcQZfKthMJzAkA2kLg2S
 xIytQMKOkjJ7ag6T99mTgSjD/IlCtHxR8zJB6/Bi4OtzWXWVDFdMxj85xp6vSO77FHD/
 w+OMzHqW2iowUEqhqT0oQ69Ddcw0I1NxjKb6MqlmCeLI7dgDihkZv7EUDJrTgoIGVapb
 8A3xWhMNkSFNTEFYYv/WrmHJ4wqDB/LBJ+JeYmxXqKLEgSy2CmvcnQ5CoMbaTpo37ocz
 4tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r2jDEb+fQm79ZJXGhBcmAyaMICDBYPXvzMm0Xp2UO7o=;
 b=ArVnIAg97OgX580lCP6Cew1IDCWCBrBzbpwi5fxURXQflh+X8tP8YQRM2KBo3rNfNh
 boZGXRa2OYmanw1vrcltxNadErom/XpVtynO08rgNFUM0hg2m+nH3SV+5CsUzHM4zHbs
 1wgH3z3TgNQnNHtXl2fQ5lorDFn+k7WcyLS4zOaH4h6pq6tr63E46KlAXG2JBtN/UEES
 16JUQpNjjtBRw7/Pb/2FHUd6V2H2joOuwviFCklKxs2bQGVP2+2oynUQuxklWyZLHNGI
 2zZPK/iK6o4otsp9ML6G83N4bqtawr38677Y0Pkm9irY7eqC/qJ1dtNerFLwGTAkzTJH
 Fxeg==
X-Gm-Message-State: AOAM532yyc888PBF8kWm1i9zKPch9f5StmmY21PC1aLixa0TG+ZCrFsV
 DOS49+feDGVge8m7S5IE0yRg5Xtwa4Q=
X-Google-Smtp-Source: ABdhPJz/iqZ3ZxorO7rL/4gV8TpN86OYwwRP2TFUVyHkAxT9Yq+PzeTYSKkYnRRNPDnDJnE2X9t86g==
X-Received: by 2002:a05:600c:3b21:b0:389:9738:be0f with SMTP id
 m33-20020a05600c3b2100b003899738be0fmr3348946wms.9.1646916294875; 
 Thu, 10 Mar 2022 04:44:54 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/35] qemu_co_rwlock_wrlock
Date: Thu, 10 Mar 2022 13:44:10 +0100
Message-Id: <20220310124413.1102441-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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
 util/qemu-coroutine-lock.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5a7b99cfaf..c0541171d4 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -512,27 +512,47 @@ CoroutineAction qemu_co_rwlock_downgrade(CoRwlock *lock)
     return CO_INIT_FRAME(qemu_co_rwlock_downgrade, lock);
 }
 
-#if 0
-void qemu_co_rwlock_wrlock(CoRwlock *lock)
+CO_DECLARE_FRAME(qemu_co_rwlock_wrlock, CoRwlock *lock, Coroutine *self, CoRwTicket my_ticket);
+static CoroutineAction co__qemu_co_rwlock_wrlock(void *_frame)
 {
+    struct FRAME__qemu_co_rwlock_wrlock *_f = _frame;
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
     if (lock->owners == 0) {
         lock->owners = -1;
         qemu_co_mutex_unlock(&lock->mutex);
     } else {
-        CoRwTicket my_ticket = { false, self };
+        _f->my_ticket = (CoRwTicket){ false, self };
 
-        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
+        QSIMPLEQ_INSERT_TAIL(&lock->tickets, &_f->my_ticket, next);
         qemu_co_mutex_unlock(&lock->mutex);
-        qemu_coroutine_yield();
+_f->_step = 2;
+        return qemu_coroutine_yield();
+case 2:
+CO_LOAD(self);
         assert(lock->owners == -1);
     }
-
-    self->locks_held++;
+    break;
 }
 
+    self->locks_held++;
+return stack_free(&_f->common);
+}
+
+CoroutineAction qemu_co_rwlock_wrlock(CoRwlock *lock)
+{
+    return CO_INIT_FRAME(qemu_co_rwlock_wrlock, lock);
+}
+
+#if 0
 void qemu_co_rwlock_upgrade(CoRwlock *lock)
 {
     qemu_co_mutex_lock(&lock->mutex);
-- 
2.35.1



