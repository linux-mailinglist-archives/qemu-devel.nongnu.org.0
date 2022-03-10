Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F14D4877
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:56:35 +0100 (CET)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJHO-0007wr-DB
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:56:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9x-00071b-6E; Thu, 10 Mar 2022 07:44:49 -0500
Received: from [2a00:1450:4864:20::436] (port=33647
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9v-0005Fy-HN; Thu, 10 Mar 2022 07:44:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id j17so7850672wrc.0;
 Thu, 10 Mar 2022 04:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Of5BOTiqOzJQASVLoGU30+VhnG3k9PQZ8CPGdOhqNg=;
 b=quB7285k6+YKR2ICfRdRAQsX45BCt1BAtfFNJqm5GgtEe549f7Vbr6mAMri14PvGGv
 FFTPnVC2qCRs7YUa5QmApAOoO+MT0NPoMlcYueXE53UfRkteh9Dw1iKlQjf4gUDHUguo
 Q/aTOAbcd4MHYMiRvB6cOHz0AaNwQ3uBcre4HS9cXO7ZIt7APetrq9ZtbOon6i7yVyRx
 sMYMevJMRRc3hbzBqEc2fnTJLVu18h1SmwhuSDhfAik6ztkD6fJtZ1d8XWNA6+bDChno
 POV3EdxccCjjTGOTjuNAA8KOn7khOMTiM7qMygk7nNqM2D9S5F/oJJE1WkWMApO3BNVi
 P06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Of5BOTiqOzJQASVLoGU30+VhnG3k9PQZ8CPGdOhqNg=;
 b=k/7+7GDjxNBylU/mzLaAZosMdc9rzdGm8N5uMfVulko5lDMBTzDYfnFRmP0dIz4Jni
 0CI4rHLqsryb6mm4/kfOeqqdtBS/IyvmtVclL0QkblYxf/x8ZoeORAJODsMwi9e54L41
 sLUZnGswjhwmwMJ4cyv3wl1u25bUcbmn9b0gtw6jTj/qYUWK1fNMm4PZySapzNuXeyv1
 3IyZU8fbAjazN11Xg6Wb15paku08GFUcm3EZ3EOugujNDsRKAIJboveTJ45QX8s+wxZe
 r8XPpx21isnsJb7XDpeKCiqCYnAbJfm+4BAu0pLk99Ggb9jJ2gaMhzjUeGB4Y8mNz789
 6PTA==
X-Gm-Message-State: AOAM532REHEw3FshHmGuv89Ld45vWcDPT4uQnlzIRl8H+ys6Rwdu4j1q
 i2Gkh7WDHcfmsGczwjbfgfcNyvblcE4=
X-Google-Smtp-Source: ABdhPJxPyzhDE7ydmGek6CXlfM7FN1BYLPY/HC4gfnKs1LVMQcUb7VyPkEdQNbxowAXAFze4V+udlA==
X-Received: by 2002:adf:f389:0:b0:1ef:5f0f:cb83 with SMTP id
 m9-20020adff389000000b001ef5f0fcb83mr3396300wro.26.1646916285940; 
 Thu, 10 Mar 2022 04:44:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/35] /basic/no-dangling-access
Date: Thu, 10 Mar 2022 13:44:02 +0100
Message-Id: <20220310124413.1102441-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
 tests/unit/test-coroutine.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 080ee76dde..0fe9226b86 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -201,16 +201,32 @@ static void test_yield(void)
     g_assert_cmpint(i, ==, 5); /* coroutine must yield 5 times */
 }
 
-#if 0
-static void coroutine_fn c2_fn(void *opaque)
+CO_DECLARE_FRAME(c2_fn);
+static CoroutineAction co__c2_fn(void *_frame)
 {
-    qemu_coroutine_yield();
+    struct FRAME__verify_entered_step_2 *_f = _frame;
+
+switch(_f->_step)
+{
+case 0:
+    _f->_step = 1;
+    return qemu_coroutine_yield();
+case 1:
+    break;
+}
+return stack_free(&_f->common);
 }
 
-static void coroutine_fn c1_fn(void *opaque)
+static CoroutineAction c2_fn(void *opaque)
+{
+    return CO_INIT_FRAME(c2_fn);
+}
+
+static CoroutineAction c1_fn(void *opaque)
 {
     Coroutine *c2 = opaque;
     qemu_coroutine_enter(c2);
+    return COROUTINE_CONTINUE;
 }
 
 static void test_no_dangling_access(void)
@@ -233,6 +249,7 @@ static void test_no_dangling_access(void)
     *c1 = tmp;
 }
 
+#if 0
 static bool locked;
 static int done;
 
@@ -757,7 +774,6 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
-#if 0
     /* This test assumes there is a freelist and marks freed coroutine memory
      * with a sentinel value.  If there is no freelist this would legitimately
      * crash, so skip it.
@@ -765,7 +781,6 @@ int main(int argc, char **argv)
     if (CONFIG_COROUTINE_POOL) {
         g_test_add_func("/basic/no-dangling-access", test_no_dangling_access);
     }
-#endif
 
     g_test_add_func("/basic/lifecycle", test_lifecycle);
     g_test_add_func("/basic/yield", test_yield);
-- 
2.35.1



