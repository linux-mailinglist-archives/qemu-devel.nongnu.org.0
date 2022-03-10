Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8B4D47B4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:06:45 +0100 (CET)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIVA-0001hr-CR
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9y-00072t-CP; Thu, 10 Mar 2022 07:44:50 -0500
Received: from [2a00:1450:4864:20::429] (port=37520
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9w-0005GE-FJ; Thu, 10 Mar 2022 07:44:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id q14so7788906wrc.4;
 Thu, 10 Mar 2022 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xf/ySd1tCWK85nEqkcIPE9vKNo3doFLcngkawPWCtQU=;
 b=f5NudKZxYfHEermi1OWmK4w7ssfU28WVWX32xgGVCQMswLRlMODemkgXDq/rdm4odM
 4ouxKsbbT5dqO6WRP8RDWLMuQn8lVD/165zeT4CvaThmpWs1yqa0l3mi47Y1sUrqJ5Iq
 CkhuosZBIeApqc0v/3t3vsCLseVXF2RM/xD12y4odcGOckTcumTOppkdhIjyXmbklBv0
 P7ERY4VcbznrUAAjK6Pxvv+wAbv7A4EoL7k2CQku2Bl9LC3eKhkuwwKPB4sF+IICK5IT
 Y8A5YAmpZsbdW3BXvq49eIcE6U3Gq73gaasvEZNn1TBHeiFmoWMcp+glyffYyHGy6cDo
 seEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xf/ySd1tCWK85nEqkcIPE9vKNo3doFLcngkawPWCtQU=;
 b=Vjp1CwlQSwIy2/vjO64/cmt3bSSA81zjZg8CtIbt3cwsnq+catNPN1spP3bL/0oCOG
 xYTXm4ig59shOQmwqyjVnYnkyDjs280+yxrYvOQOUTlIlnqE5PnIz/zLO+FKqO+ICPDB
 piPiBcLxh5eELeEum9vBD9062OsG9yL+X7V2QlfqgzMywnBwHMFh1ftbtlsBbzHLwdXC
 i5BQVit63AZoc6f3JQn+fcEL0TUB5fXZfokVDUgiV/QK5nm+Wv6gOAwyfRv2BcETJmkB
 PgXCMC1TjNXUylRdqAxM6hdNP0Zi3XojfYed7qOe3ciadTbynYbyD0QIxyjPSlB+lQ0L
 9cSg==
X-Gm-Message-State: AOAM531tP0Qq3xECe0pKlyCW0JayhBbyecVC1WTsuXxlIvwjmGp2WMFk
 j7foLxkYXDe7sLruFCOrAMTKLPWdXkM=
X-Google-Smtp-Source: ABdhPJwlk5Okh4UhDMijuRK1yLjskWSjjkxRXp+VFAQnhCYEojff2FMStXdi6iy57tfu/8fH6O9pnw==
X-Received: by 2002:a5d:4d4b:0:b0:1f1:d99e:1122 with SMTP id
 a11-20020a5d4d4b000000b001f1d99e1122mr3479177wru.604.1646916286843; 
 Thu, 10 Mar 2022 04:44:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/35] /locking/co-mutex
Date: Thu, 10 Mar 2022 13:44:03 +0100
Message-Id: <20220310124413.1102441-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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
 tests/unit/test-coroutine.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 0fe9226b86..642ef36bc3 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -249,22 +249,41 @@ static void test_no_dangling_access(void)
     *c1 = tmp;
 }
 
-#if 0
 static bool locked;
 static int done;
 
-static void coroutine_fn mutex_fn(void *opaque)
+CO_DECLARE_FRAME(mutex_fn, CoMutex *m);
+static CoroutineAction co__mutex_fn(void *_frame)
 {
-    CoMutex *m = opaque;
-    qemu_co_mutex_lock(m);
+    struct FRAME__mutex_fn *_f = _frame;
+    CO_ARG(m);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_mutex_lock(m);
+case 1:
     assert(!locked);
     locked = true;
-    qemu_coroutine_yield();
+_f->_step = 2;
+    return qemu_coroutine_yield();
+case 2:
     locked = false;
-    qemu_co_mutex_unlock(m);
+_f->_step = 3;
+    return qemu_co_mutex_unlock(m);
+case 3:
     done++;
+    break;
+}
+return stack_free(&_f->common);
 }
 
+static CoroutineAction mutex_fn(void *opaque)
+{
+    CoMutex *m = opaque;
+    return CO_INIT_FRAME(mutex_fn, m);
+}
+
+#if 0
 static void coroutine_fn lockable_fn(void *opaque)
 {
     QemuCoLockable *x = opaque;
@@ -276,6 +295,7 @@ static void coroutine_fn lockable_fn(void *opaque)
     qemu_co_lockable_unlock(x);
     done++;
 }
+#endif
 
 static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
 {
@@ -307,6 +327,7 @@ static void test_co_mutex(void)
     do_test_co_mutex(mutex_fn, &m);
 }
 
+#if 0
 static void test_co_mutex_lockable(void)
 {
     CoMutex m;
@@ -789,8 +810,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/entered", test_entered);
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
     g_test_add_func("/basic/order", test_order);
-#if 0
     g_test_add_func("/locking/co-mutex", test_co_mutex);
+#if 0
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
     g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
-- 
2.35.1



