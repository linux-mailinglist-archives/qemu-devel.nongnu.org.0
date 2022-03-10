Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7484D47B1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:06:35 +0100 (CET)
Received: from localhost ([::1]:42314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIV0-0001Lt-KP
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9r-0006rg-IL; Thu, 10 Mar 2022 07:44:43 -0500
Received: from [2a00:1450:4864:20::433] (port=38441
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9p-0005E6-Tl; Thu, 10 Mar 2022 07:44:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id t11so7757361wrm.5;
 Thu, 10 Mar 2022 04:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1noevvk+yS6kDKEd3uTDKlqenqWqhhk+85B17SAY4IQ=;
 b=dnNHBQ/KKYIQNsXAWYc6MJyRQ5i2ZO7SJFZwTzECEugtDOmUaf0E5A8OhQYgfXCEIl
 B+w7ZenUS2EILzuu5T8Ffmfl9Kur4qVm8vWFRQgYIup8GALo7tyxZ8dRxyJQcQVMMRNQ
 7RNrNY2O0lBE0trd65V1uAPtLMkyPPDaWkiKzNHpJvIUCnxI3omkgMBaNOopMAhheXe9
 kGwDPeGBlmkPRI74yg9By870hXHaQUCj1W9x137lBsR4/oDNt3pY0yYYHjMqYdXPOs0c
 j1197XdpaGIUqqzEg7HlmS89cX1QLwunrFR/mmk47P64udqfZ7yzD5KCQGRmGjGzj5gu
 uZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1noevvk+yS6kDKEd3uTDKlqenqWqhhk+85B17SAY4IQ=;
 b=2H8KOdm2iYesZcQQScbWI8y1ZXF5JlCvinzh/Fz3Xpkk5albkSlMvdXt3R2Y39n/d2
 NzT941mO+nnSPL4GgsZFL76/pyk/lc78/6hOHD7fKMBoBD45pG+jf/GdOhHkoEKK8KS/
 ieRV5SpycXDM1E2UWJeu6IlC3kazZ8mAT5Rv5zugJFnX+KYnTqj2UqD8EBkaNv5LsNPn
 7hcLa1ZbDFqYLL/sBICuEowSigLRSfxTJ27RgwpoFyWNrdrlx72UToCOxCwUXlXbfUsF
 eL0iqZBgQgAF/HjrFhQq4EOb8bsLLRGjfP3q+eJWW7afa/PUghXFCniKO0yYiG35CvUZ
 Fo9w==
X-Gm-Message-State: AOAM533wPtM7LhW1gtB3DNRqCb60QIR6xTLrVPkTgiNOkJx6ViHpKpCw
 8PX93ADFvGPLs3rjlfJjVgDO0ZPi1u4=
X-Google-Smtp-Source: ABdhPJwF6XvuwJX0nL63t5uyx0rQt/w1MpWArmXESBnLorpj6ve+4PbJs4bc6JZ6Lhbt7NHxy8+qjQ==
X-Received: by 2002:a05:6000:1689:b0:203:71fb:3930 with SMTP id
 y9-20020a056000168900b0020371fb3930mr3365734wrd.122.1646916279102; 
 Thu, 10 Mar 2022 04:44:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/35] /perf/lifecycle
Date: Thu, 10 Mar 2022 13:43:57 +0100
Message-Id: <20220310124413.1102441-20-pbonzini@redhat.com>
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
 tests/unit/test-coroutine.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 3d898d50c6..439bd269c9 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -556,14 +556,21 @@ static void test_order(void)
         g_assert_cmpint(records[i].state, ==, expected_pos[i].state);
     }
 }
-#if 0
+
 /*
  * Lifecycle benchmark
  */
 
-static void coroutine_fn empty_coroutine(void *opaque)
+CO_DECLARE_FRAME(empty_coroutine);
+static CoroutineAction co__empty_coroutine(void *_frame)
 {
-    /* Do nothing */
+    struct FRAME__empty_coroutine *_f = _frame;
+    return stack_free(&_f->common);
+}
+
+static CoroutineAction empty_coroutine(void *opaque)
+{
+    return CO_INIT_FRAME(empty_coroutine);
 }
 
 static void perf_lifecycle(void)
@@ -572,7 +579,7 @@ static void perf_lifecycle(void)
     unsigned int i, max;
     double duration;
 
-    max = 1000000;
+    max = 10000000;
 
     g_test_timer_start();
     for (i = 0; i < max; i++) {
@@ -584,6 +591,30 @@ static void perf_lifecycle(void)
     g_test_message("Lifecycle %u iterations: %f s", max, duration);
 }
 
+static CoroutineAction empty_coroutine_noalloc(void *opaque)
+{
+    return COROUTINE_CONTINUE;
+}
+
+static void perf_lifecycle_noalloc(void)
+{
+    Coroutine *coroutine;
+    unsigned int i, max;
+    double duration;
+
+    max = 10000000;
+
+    g_test_timer_start();
+    for (i = 0; i < max; i++) {
+        coroutine = qemu_coroutine_create(empty_coroutine_noalloc, NULL);
+        qemu_coroutine_enter(coroutine);
+    }
+    duration = g_test_timer_elapsed();
+
+    g_test_message("Lifecycle %u iterations: %f s", max, duration);
+}
+
+#if 0
 static void perf_nesting(void)
 {
     unsigned int i, maxcycles, maxnesting;
@@ -719,13 +750,16 @@ int main(int argc, char **argv)
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
     g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
+#endif
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
+        g_test_add_func("/perf/lifecycle/noalloc", perf_lifecycle_noalloc);
+#if 0
         g_test_add_func("/perf/nesting", perf_nesting);
         g_test_add_func("/perf/yield", perf_yield);
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
-    }
 #endif
+    }
     return g_test_run();
 }
-- 
2.35.1



