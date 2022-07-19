Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FEC5793D4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:08:10 +0200 (CEST)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhKz-00080e-UY
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHS-0002Jw-HT
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHQ-0002zQ-Es
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZ+J5eTYyql45pUQTI+bb6rTtozajqYSloAA13RFtvA=;
 b=Cxrvdb6e7hshPiqrLCr1phb1pPsYRu1w4y5XRutC6RCli+m43CBzMRtBeN/d3DTxiZFdXY
 64o6y4SqB/+tZ/QbuWDal3aoRsf8yllyRaxLl3tZ0+UVsnQH/bhFnIje58yhFhl1FAVToW
 bhIH8xc1fAjLUEKzQr7xF80ppMpcszI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-tunZLokVO_y5mEOVbJGpIw-1; Tue, 19 Jul 2022 03:04:24 -0400
X-MC-Unique: tunZLokVO_y5mEOVbJGpIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82FFD280D217;
 Tue, 19 Jul 2022 07:04:24 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE254404C6ED;
 Tue, 19 Jul 2022 07:04:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 11/14] tests/unit: Replace g_memdup() by g_memdup2()
Date: Tue, 19 Jul 2022 09:04:09 +0200
Message-Id: <20220719070412.16757-12-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210903174510.751630-24-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/ptimer-test.c | 22 +++++++++++-----------
 tests/unit/test-iov.c    | 26 +++++++++++++-------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index a80ef5aff4..04b5f4e3d0 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -798,64 +798,64 @@ static void add_ptimer_tests(uint8_t policy)
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_count, g_free);
+        g_memdup2(&policy, 1), check_set_count, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_limit policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_limit, g_free);
+        g_memdup2(&policy, 1), check_set_limit, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot policy=%s", policy_name),
-        g_memdup(&policy, 1), check_oneshot, g_free);
+        g_memdup2(&policy, 1), check_oneshot, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic policy=%s", policy_name),
-        g_memdup(&policy, 1), check_periodic, g_free);
+        g_memdup2(&policy, 1), check_periodic, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_mode_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_mode_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_mode_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_period_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_period_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_period_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_freq_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_freq_change, g_free);
+        g_memdup2(&policy, 1), check_on_the_fly_freq_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_period_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_period_0, g_free);
+        g_memdup2(&policy, 1), check_run_with_period_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_delta_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_delta_0, g_free);
+        g_memdup2(&policy, 1), check_run_with_delta_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_periodic_with_load_0, g_free);
+        g_memdup2(&policy, 1), check_periodic_with_load_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_oneshot_with_load_0, g_free);
+        g_memdup2(&policy, 1), check_oneshot_with_load_0, g_free);
     g_free(tmp);
 }
 
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 93bda00f0e..6f7623d310 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -172,7 +172,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
 
-    siov = g_memdup(iov, sizeof(*iov) * niov);
+    siov = g_memdup2(iov, sizeof(*iov) * niov);
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
@@ -349,7 +349,7 @@ static void test_discard_front_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, 0, &undo);
@@ -360,7 +360,7 @@ static void test_discard_front_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -372,7 +372,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -384,7 +384,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov->iov_len);
@@ -396,7 +396,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, iov->iov_len, &undo);
@@ -407,7 +407,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within second element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov->iov_len + g_test_rand_int_range(1, iov[1].iov_len);
@@ -498,7 +498,7 @@ static void test_discard_back_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, 0, &undo);
     iov_discard_undo(&undo);
@@ -508,7 +508,7 @@ static void test_discard_back_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size + 1, &undo);
@@ -519,7 +519,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -530,7 +530,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov[iov_cnt - 1].iov_len);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -541,7 +541,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -552,7 +552,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within second-to-last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len +
            g_test_rand_int_range(1, iov[iov_cnt - 2].iov_len);
-- 
2.31.1


