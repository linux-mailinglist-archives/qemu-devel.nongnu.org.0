Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450734D4774
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:56:53 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSILc-0007bj-B6
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9j-0006jT-Cz; Thu, 10 Mar 2022 07:44:35 -0500
Received: from [2a00:1450:4864:20::330] (port=55847
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9h-0005Cr-U8; Thu, 10 Mar 2022 07:44:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id i66so3152097wma.5;
 Thu, 10 Mar 2022 04:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s2YITzhm5qYQs7ILNbrpRvxFL3ZwbyQCG5BGW9zcwqo=;
 b=H3x0GDSwAvHUXDOS+pASrLON+bOZ4CvO04rWjHybUuYo/zRGSxtHupPvbYUV6+M9q3
 YJDKLmVa2ESEPTNvrmv4ElasbNzb1kL4d+6xvfayiJEg/tXDa02D9Cf36DyUzXKSs2JU
 DZx40y7avhyUJQnuCeZRZIPulheLvg1t49m15wKASd+7XEWf+LUjGapwJ/l3VeXfBxGP
 RtCXzUwBAM4rVN6XfzLqQN+GEDGkUV3FKdWhZNsCT7JZrJ04rIJFfxphaHHjtMZ4+bca
 4tfkmdPxvF84hWV2KN8iG0DlTuWfQXr8G/PUEl+/mo/kvXgQDVcLtGpDQHC7rSnihrKk
 G4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s2YITzhm5qYQs7ILNbrpRvxFL3ZwbyQCG5BGW9zcwqo=;
 b=6nbAcSUJpkJFt/WDXmQFXb8ROYXJuYzgSMGQuUhPqgdTGt51oLThkteaELRjE8xR9z
 DbEREVyWWKn9awsXdGUa6pP+aN+fccStVSNYikLf2wTmISRs8Wu4I+sZqBgeRZD/2XpQ
 REUupWvvxRDvFeJHnXpvjtrILU0idsm5x/BP/gF6zdFVFgw0Hmbx/64r8KCpTbWWBLoH
 F5/x7p5atSKhcWF1hSE0c5OPanzm2I5Kd3dmPVFWCyP6jcg5JAmhwN/Ke4nFWhTfHV/i
 LvLh5C8PYW0HEWMONrQSDZyo1k25sB2T282DJt9w0qapon7X7XCTbyHks14yFKQHor7g
 /qcQ==
X-Gm-Message-State: AOAM530fVqbTm7hS52nZKJJCKvdLO/IvPZfKdkHnIzOV8WVPgFsnE4Q/
 fCuFxDriOeBKJkr45dcnxvO61b7fRqc=
X-Google-Smtp-Source: ABdhPJwlHoUFYYTKR0fYEmHJtHntcPx/AHexdX0ohTo8+qcxw48NBgAt3Pk0LMQrw0RrAEy4P2hEDA==
X-Received: by 2002:a05:600c:1d19:b0:389:bd65:34c8 with SMTP id
 l25-20020a05600c1d1900b00389bd6534c8mr3504469wms.89.1646916272206; 
 Thu, 10 Mar 2022 04:44:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/35] /basic/yield
Date: Thu, 10 Mar 2022 13:43:51 +0100
Message-Id: <20220310124413.1102441-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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
 tests/unit/test-coroutine.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 3670750c5b..ae06e97c95 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -141,15 +141,33 @@ static void test_nesting(void)
  * Check that yield/enter transfer control correctly
  */
 
-static void coroutine_fn yield_5_times(void *opaque)
+#endif
+CO_DECLARE_FRAME(yield_5_times, void *opaque, int i);
+static CoroutineAction co__yield_5_times(void *_frame)
 {
+    struct FRAME__yield_5_times *_f = _frame;
+    CO_ARG(opaque);
     bool *done = opaque;
-    int i;
+    CO_DECLARE(i);
 
+switch(_f->_step) {
+case 0:
     for (i = 0; i < 5; i++) {
-        qemu_coroutine_yield();
+CO_SAVE(i);
+_f->_step = 1;
+        return qemu_coroutine_yield();
+case 1:
+CO_LOAD(i);
     }
     *done = true;
+    break;
+}
+return stack_free(&_f->common);
+}
+
+static CoroutineAction yield_5_times(void *opaque)
+{
+    return CO_INIT_FRAME(yield_5_times, opaque);
 }
 
 static void test_yield(void)
@@ -166,6 +184,7 @@ static void test_yield(void)
     g_assert_cmpint(i, ==, 5); /* coroutine must yield 5 times */
 }
 
+#if 0
 static void coroutine_fn c2_fn(void *opaque)
 {
     qemu_coroutine_yield();
@@ -659,8 +678,8 @@ int main(int argc, char **argv)
 #endif
 
     g_test_add_func("/basic/lifecycle", test_lifecycle);
-#if 0
     g_test_add_func("/basic/yield", test_yield);
+#if 0
     g_test_add_func("/basic/nesting", test_nesting);
     g_test_add_func("/basic/self", test_self);
     g_test_add_func("/basic/entered", test_entered);
-- 
2.35.1



