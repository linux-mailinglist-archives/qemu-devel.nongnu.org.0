Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D84D4786
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:01:00 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIPb-0006zs-Bh
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:00:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9s-0006ti-GY; Thu, 10 Mar 2022 07:44:44 -0500
Received: from [2a00:1450:4864:20::435] (port=40798
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9p-0005Dy-Tm; Thu, 10 Mar 2022 07:44:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id k24so7763016wrd.7;
 Thu, 10 Mar 2022 04:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ftsEDbeWlZ8knEuqLSqyr0cJ8reRYQXZ8KdP5LCtFtY=;
 b=h7vfPV4a6i/Pi0kVL1v5uu6WcQ8DTmxkHNEayAh817hNeuCAXjeapnsO8VABU4wNp8
 gj4Q2+6lYkdGrW3a7rhDeIJDh+gcRsoIkpa31Ik7tYZ5/9jcJtEOL/dotCnB4iMT8PGZ
 nRO7Koz9Vhxstf560ZSnuBXPsNQCHJSwOga5rgoR8/doDXEDJ6/mgUmuOIKIAHKbi316
 6el17qfOVuLgTht5idROvVnv2Kkb7cX+NpL1vN8XrBSpni2+gxxH8+NRq52zF+XzG/XJ
 2nDGUoSk3mSTU/VVJsu3WDf3BLx9fSSkbSSFgzOdmhSbS24mHbQQqtIx4pW2YFW4k7FO
 oWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ftsEDbeWlZ8knEuqLSqyr0cJ8reRYQXZ8KdP5LCtFtY=;
 b=gUnyJFH/wGAUq2Gahza/9LtJg1/r5EW9e/KDp7eFeQf1yK6eH5cr3byO64V11k5A4p
 1Xuz1cntMGRi3o8caWgKmw5egNwZyZiMp40ch/o+02gFN5u+7ZA8Scyu0je/CluZPc6R
 OhTZgK5UsoolGckD0TZWleuidGsa60lvX/EbtEKpxXFNYwBw7JtplJAsqMRK3iU4t98B
 ClskalTZuEGWXbeJSlBumajaHy9m0Bx9QmYKun3sWm3y54hYluPP2oz2DazkGKcX+xuY
 yR+63yjlfneYV92Wx4KjwehRdsN1dWCl1ahYqGxP9avHuzcleOflIyb9B74DTAOo85MX
 TSrg==
X-Gm-Message-State: AOAM531PTwIRWRyZ79n0nNJcYvX8V+xuM3lOOzPPU2CxBVmroRiW+U4t
 25oFVtTcWnqgsjF8i4Gu8CD5eQg/08A=
X-Google-Smtp-Source: ABdhPJxXsvRm4OjNwIQA4INcIpPy/BzFa22chKsWZIl2NJLx2ksAufjr201aWY504pSVUROmO9Q/DA==
X-Received: by 2002:a5d:6c68:0:b0:203:691f:b95b with SMTP id
 r8-20020a5d6c68000000b00203691fb95bmr3442456wrz.375.1646916277702; 
 Thu, 10 Mar 2022 04:44:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/35] /basic/order
Date: Thu, 10 Mar 2022 13:43:56 +0100
Message-Id: <20220310124413.1102441-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
 tests/unit/test-coroutine.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 6ad653adda..3d898d50c6 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -490,8 +490,6 @@ static void test_lifecycle(void)
     g_assert(done); /* expect done to be true (second time) */
 }
 
-#if 0
-
 #define RECORD_SIZE 10 /* Leave some room for expansion */
 struct coroutine_position {
     int func;
@@ -508,13 +506,27 @@ static void record_push(int func, int state)
     cp->state = state;
 }
 
-static void coroutine_fn co_order_test(void *opaque)
+CO_DECLARE_FRAME(co_order_test);
+static CoroutineAction co__co_order_test(void *_frame)
 {
+    struct FRAME__co_order_test *_f = _frame;
+switch(_f->_step) {
+case 0:
     record_push(2, 1);
     g_assert(qemu_in_coroutine());
-    qemu_coroutine_yield();
+_f->_step = 1;
+    return qemu_coroutine_yield();
+case 1:
     record_push(2, 2);
     g_assert(qemu_in_coroutine());
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction co_order_test(void *opaque)
+{
+    return CO_INIT_FRAME(co_order_test);
 }
 
 static void do_order_test(void)
@@ -544,6 +556,7 @@ static void test_order(void)
         g_assert_cmpint(records[i].state, ==, expected_pos[i].state);
     }
 }
+#if 0
 /*
  * Lifecycle benchmark
  */
@@ -700,8 +713,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/self", test_self);
     g_test_add_func("/basic/entered", test_entered);
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
-#if 0
     g_test_add_func("/basic/order", test_order);
+#if 0
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
-- 
2.35.1



