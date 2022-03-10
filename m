Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51444D4808
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:27:59 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIpi-0002m9-DB
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:27:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIAB-0007Ls-7k; Thu, 10 Mar 2022 07:45:03 -0500
Received: from [2a00:1450:4864:20::329] (port=40815
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA8-0005JX-KH; Thu, 10 Mar 2022 07:45:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 i9-20020a1c3b09000000b00389d0a5c511so979572wma.5; 
 Thu, 10 Mar 2022 04:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtYdT8RKivvEG07Jq6tvA5wlDPXFZUyMGRT+nhiso34=;
 b=gzcNsYE+RBd5MyAIS5jS/+y4OySY7mNgQkm+9y/7w0wLCGo94BwquhgOkBStTvjQdL
 UN/zEQaYA67DX5JwOoRxsrmYOftmOluhOQyxLNdtklHMdtGKpvAYSKd3WRQl7dO5yjtD
 hzYpo+uWzgJABn2/RpAUSYdx0tyi2ugXeCLF6OLQtagh6vwZkxcR3N7Gg6ZUecBlGcqw
 smDj23b9iagt6GE/jyjqG1wVdOWkSFMmFjAV54+j3qNlJdtUX0uzJ9x7qYglXko9y039
 8KlYB/8tdFMQ2LWsQixxNm69PSpkaIKBzJRGZyJJWYVl/jt56jTmMZimobv44RnlQEwh
 veAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AtYdT8RKivvEG07Jq6tvA5wlDPXFZUyMGRT+nhiso34=;
 b=wG7tGZT4bhNjEjLb91+WWZvSTGYrwIve4jICw/pwk0SVEj7gcjn1cjjI+np8M7W1lw
 kjBMFipltstL0nHTljFvu9qcxwWMf9YEgzsyGOE8ndYr6iw1oSFqxN2YfAP2lH1oElJC
 PIc/Gaz0jGHjUMDJFb4eDsj/6mJ8u4cQMLsE8tIS9rN1tamL8xi+Yf7mYx+mcHwE/4gq
 LbAbN4L8+5pa1YpBGM76CyGq9qpLlITc1j4QCkjws8FCmm4vOVUZ5wvzSP7t1GjqIihT
 Ebqru+NBF84j+IOliXZ1klwpO2kDTt0V9ejEyrsmkmVa8HPsgmwlnYlRVAsZksJGGP4b
 u82Q==
X-Gm-Message-State: AOAM533DtxPIylDjIsUqwHNBq8BUO2yCHe1sfc87CYCQ2yqSDAi/cJ7m
 KD2iQPsV+0KUlTVIj7E2CjcHmTHbFUs=
X-Google-Smtp-Source: ABdhPJxAIHfpt27WvFbaq2ppZ5FNusxMYCQ4BLM3x/Zr2q/z+ciZkwpnkG7yXmgU5+nuxSwUMj112Q==
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr3401470wmk.62.1646916298914; 
 Thu, 10 Mar 2022 04:44:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/35] /locking/co-rwlock/downgrade
Date: Thu, 10 Mar 2022 13:44:13 +0100
Message-Id: <20220310124413.1102441-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
 tests/unit/test-coroutine.c | 123 ++++++++++++++++++++++++++++--------
 1 file changed, 98 insertions(+), 25 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 39d0f31492..174ea8d579 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -458,41 +458,117 @@ static void test_co_rwlock_upgrade(void)
     g_assert(c2_done);
 }
 
-#if 0
-static void coroutine_fn rwlock_rdlock_yield(void *opaque)
+CO_DECLARE_FRAME(rwlock_rdlock_yield, bool *done);
+static CoroutineAction co__rwlock_rdlock_yield(void *_frame)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
-    qemu_coroutine_yield();
+    struct FRAME__rwlock_rdlock_yield *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_rdlock(&rwlock);
+case 1:
+_f->_step = 2;
+    return qemu_coroutine_yield();
 
-    qemu_co_rwlock_unlock(&rwlock);
-    qemu_coroutine_yield();
-
-    *(bool *)opaque = true;
+case 2:
+_f->_step = 3;
+    return qemu_co_rwlock_unlock(&rwlock);
+case 3:
+_f->_step = 4;
+    return qemu_coroutine_yield();
+case 4:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
 }
 
-static void coroutine_fn rwlock_wrlock_downgrade(void *opaque)
+static CoroutineAction rwlock_rdlock_yield(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
-
-    qemu_co_rwlock_downgrade(&rwlock);
-    qemu_co_rwlock_unlock(&rwlock);
-    *(bool *)opaque = true;
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_rdlock_yield, done);
 }
 
-static void coroutine_fn rwlock_rdlock(void *opaque)
+CO_DECLARE_FRAME(rwlock_wrlock_downgrade, bool *done);
+static CoroutineAction co__rwlock_wrlock_downgrade(void *_frame)
 {
-    qemu_co_rwlock_rdlock(&rwlock);
+    struct FRAME__rwlock_wrlock_downgrade *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_wrlock(&rwlock);
 
-    qemu_co_rwlock_unlock(&rwlock);
-    *(bool *)opaque = true;
+case 1:
+_f->_step = 2;
+    return qemu_co_rwlock_downgrade(&rwlock);
+case 2:
+_f->_step = 3;
+    return qemu_co_rwlock_unlock(&rwlock);
+case 3:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
 }
 
-static void coroutine_fn rwlock_wrlock(void *opaque)
+static CoroutineAction rwlock_wrlock_downgrade(void *opaque)
 {
-    qemu_co_rwlock_wrlock(&rwlock);
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_wrlock_downgrade, done);
+}
 
-    qemu_co_rwlock_unlock(&rwlock);
-    *(bool *)opaque = true;
+CO_DECLARE_FRAME(rwlock_rdlock, bool *done);
+static CoroutineAction co__rwlock_rdlock(void *_frame)
+{
+    struct FRAME__rwlock_rdlock *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_rdlock(&rwlock);
+
+case 1:
+_f->_step = 2;
+    return qemu_co_rwlock_unlock(&rwlock);
+case 2:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction rwlock_rdlock(void *opaque)
+{
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_rdlock, done);
+}
+
+CO_DECLARE_FRAME(rwlock_wrlock, bool *done);
+static CoroutineAction co__rwlock_wrlock(void *_frame)
+{
+    struct FRAME__rwlock_wrlock *_f = _frame;
+    CO_ARG(done);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_rwlock_wrlock(&rwlock);
+
+case 1:
+_f->_step = 2;
+    return qemu_co_rwlock_unlock(&rwlock);
+case 2:
+    *done = true;
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction rwlock_wrlock(void *opaque)
+{
+    bool *done = opaque;
+    return CO_INIT_FRAME(rwlock_wrlock, done);
 }
 
 /*
@@ -556,7 +632,6 @@ static void test_co_rwlock_downgrade(void)
 
     g_assert(c1_done);
 }
-#endif
 
 /*
  * Check that creation, enter, and return work
@@ -872,9 +947,7 @@ int main(int argc, char **argv)
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
-#if 0
     g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
-#endif
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/lifecycle/noalloc", perf_lifecycle_noalloc);
-- 
2.35.1


