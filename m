Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC634D47AF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:06:11 +0100 (CET)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIUc-0000el-LR
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:06:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSIA0-00077K-9x; Thu, 10 Mar 2022 07:44:52 -0500
Received: from [2a00:1450:4864:20::433] (port=42871
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9y-0005Gh-Je; Thu, 10 Mar 2022 07:44:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id u10so7752295wra.9;
 Thu, 10 Mar 2022 04:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BXL2jinMbEzupMfdEPM3XNAu06eQUhqHpIIRQqS3zRU=;
 b=mWLBgw5M4sEElGVI6dlgGo/EmkHZ+och0JMPqlZXw/NR8+vbCNHBZ8RGu9VJ5Ri60j
 mD41k79Qj4tU37thFiDDMbl1tQSBuu6k1heKCtwSFsYkVmviJYMP/Ux+/EiNKYJTea1c
 q2m0nPV/jL/v/moPvtgEpDryfd3Iomi8FDdLZjqZI5KrTGxuLIS1B7hFf8ZwR81rm9Ep
 EYFeAJOb5q92ZydEavGMuvpQgI8kEn6d1BItdIq1SgOGY/y8arpCzlUohshrMWA+/QOC
 IZw0K5HEfME3mtPRSTMOABdEShZQbgp8DqYAF/SW2Op+OqGMC2CJJVJv6pJOQozoQbW7
 H1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BXL2jinMbEzupMfdEPM3XNAu06eQUhqHpIIRQqS3zRU=;
 b=bjMduk0A4CvtuocG642FN+lRS/IV12Vl/ZxshxX8vqdXltOAbY2WCfB7An4DTsDAK8
 IMMljXmJeYHL7UM7f8ixbgOeIV5XUY/k9eou6qAgeAXkAxLIodPS4orxbK/iXQhwZuzV
 2QlqPZ0LXxBuMmpiuS29nN0GUFgGI0JVGQtDNr7oiUApPzNFxOU0JMn0Ft8r3i3Ojw5j
 Mp//g/O8zk7vL3CJ18/XV2ZImwcN0tFpqZyJFzqrW+2pGAGMeC1+U1EdcLBkrFl/y3D7
 l/CvRNAGagY8YZgM7hkQ1TCQYbVKVbwpd4qhpv0M6QJTFc1kTHq8ePchHvaUl5GbrB5W
 FlLA==
X-Gm-Message-State: AOAM533cgoPf5Rcif5ARMui3lKDJYAg5oQfxw66IdRAZMHBypEkimvXd
 nXxDq+ICEkMpG2la6x3ZLzPB6WcOmSw=
X-Google-Smtp-Source: ABdhPJxqhG4plQ7gnYxUVm+UCZMWM6cP/f73FsGvCbHPYVJj3xOucoAVmc79RsXi+AoM2uELVEAZSg==
X-Received: by 2002:a05:6000:1689:b0:203:71fb:3930 with SMTP id
 y9-20020a056000168900b0020371fb3930mr3366255wrd.122.1646916288972; 
 Thu, 10 Mar 2022 04:44:48 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:48 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/35] /locking/co-mutex/lockable
Date: Thu, 10 Mar 2022 13:44:05 +0100
Message-Id: <20220310124413.1102441-28-pbonzini@redhat.com>
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
 tests/unit/test-coroutine.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 642ef36bc3..db6718db40 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -283,19 +283,36 @@ static CoroutineAction mutex_fn(void *opaque)
     return CO_INIT_FRAME(mutex_fn, m);
 }
 
-#if 0
-static void coroutine_fn lockable_fn(void *opaque)
+CO_DECLARE_FRAME(lockable_fn, QemuCoLockable *x);
+static CoroutineAction co__lockable_fn(void *_frame)
 {
-    QemuCoLockable *x = opaque;
-    qemu_co_lockable_lock(x);
+    struct FRAME__lockable_fn *_f = _frame;
+    CO_ARG(x);
+switch(_f->_step) {
+case 0:
+_f->_step = 1;
+    return qemu_co_lockable_lock(x);
+case 1:
     assert(!locked);
     locked = true;
-    qemu_coroutine_yield();
+_f->_step = 2;
+    return qemu_coroutine_yield();
+case 2:
     locked = false;
-    qemu_co_lockable_unlock(x);
+_f->_step = 3;
+    return qemu_co_lockable_unlock(x);
+case 3:
     done++;
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction lockable_fn(void *opaque)
+{
+    QemuCoLockable *x = opaque;
+    return CO_INIT_FRAME(lockable_fn, x);
 }
-#endif
 
 static void do_test_co_mutex(CoroutineEntry *entry, void *opaque)
 {
@@ -327,7 +344,6 @@ static void test_co_mutex(void)
     do_test_co_mutex(mutex_fn, &m);
 }
 
-#if 0
 static void test_co_mutex_lockable(void)
 {
     CoMutex m;
@@ -339,6 +355,7 @@ static void test_co_mutex_lockable(void)
     g_assert(QEMU_MAKE_CO_LOCKABLE(null_pointer) == NULL);
 }
 
+#if 0
 static CoRwlock rwlock;
 
 /* Test that readers are properly sent back to the queue when upgrading,
@@ -811,8 +828,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
-#if 0
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
+#if 0
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
     g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
 #endif
-- 
2.35.1



