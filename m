Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0CE40049E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:09:49 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDdM-00027Q-R0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHg-0001NS-5p
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDHb-0002H2-Po
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Opy48p+U/1m19PPU36BLWzc0HjoV+sfbnePbr/WuVoc=;
 b=T1OsbebQV0TbWEzfkHEcCSsRmGrv++LToSoYkAya/rBG5zg2/+GskmttXVuvGZpCBcq7TU
 h7cDXaFGlIhhOLWb0zarZhkYJbicEM0p5n1QC5UI6L153tVTYe2xXTKhgF4/Bg6j59V9uO
 ExFNdBJ68EWr/l6rhBNg1TCpFqrtqkk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-LcE1r0YvPJ6qaeWXTCTTMA-1; Fri, 03 Sep 2021 13:47:17 -0400
X-MC-Unique: LcE1r0YvPJ6qaeWXTCTTMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p18-20020a5d4e12000000b0015940dc586aso1822558wrt.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Opy48p+U/1m19PPU36BLWzc0HjoV+sfbnePbr/WuVoc=;
 b=RCLTbxilPicltQTxdB8HMm2epaUkr4q7138vuxtA50OLyk5SaVYs2cDGs4C9LKxvTx
 yZiEusSlmY4ARgoO5Rk6zBQCR3p1vXtsyZokF37bcn8YIjIOd0fmfyRpJEvWV0w0bSlP
 K1z0LNIENUYMYxNYUi7fuc0OQo18rJU8Urw2m/uxcwqbKNRTVCLZ2UA2ozY/HlzJ1ydA
 52R4w9J318Oo9wW17prsLmoGSBgoSJGntuxZtEcHBCRwtSJT4LeqLZphmy82/6IZ1SSN
 Asno/rH41KkFM0So7h9yXWYBsrP+WBV9AH34+HXBzIanXBE022oEG8pI1+1Kn3rviYon
 fR7w==
X-Gm-Message-State: AOAM530Zhpw90Z9475NojvUrGis6NtUetwEgSmz367iPynnWtbQi2h6g
 QK4bQgfwCAcD8XrR/CEepMhOibvzE5RnGo5svvuglwEV+NS3N8OcF9vYDwYMw5rxtawPshfWlLD
 lLJKg+f/tSj3bs1YiNBWRruXSzNzsH96wj3sUHQuw98nmNqTVY5mAUEJlngQdObO8
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr28891wmm.19.1630691235820; 
 Fri, 03 Sep 2021 10:47:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJg+qZ6BEtxbNy7Lg4PurxBeihaAX8ItzuPREESTcffBSoIFZqpAWJ0xG3KqpBv44WbAumMA==
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr28842wmm.19.1630691235390; 
 Fri, 03 Sep 2021 10:47:15 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id f5sm19441wmb.47.2021.09.03.10.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:47:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/28] tests/unit: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:05 +0200
Message-Id: <20210903174510.751630-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tests/unit/ptimer-test.c | 22 +++++++++++-----------
 tests/unit/test-iov.c    | 26 +++++++++++++-------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 9176b96c1ce..9ba5ffe273b 100644
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
index 5371066fb6a..aa679b56131 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -173,7 +173,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
 
-    siov = g_memdup(iov, sizeof(*iov) * niov);
+    siov = g_memdup2(iov, sizeof(*iov) * niov);
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
@@ -350,7 +350,7 @@ static void test_discard_front_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, 0, &undo);
@@ -361,7 +361,7 @@ static void test_discard_front_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -373,7 +373,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -385,7 +385,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov->iov_len);
@@ -397,7 +397,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, iov->iov_len, &undo);
@@ -408,7 +408,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within second element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov->iov_len + g_test_rand_int_range(1, iov[1].iov_len);
@@ -499,7 +499,7 @@ static void test_discard_back_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, 0, &undo);
     iov_discard_undo(&undo);
@@ -509,7 +509,7 @@ static void test_discard_back_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size + 1, &undo);
@@ -520,7 +520,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -531,7 +531,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov[iov_cnt - 1].iov_len);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -542,7 +542,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -553,7 +553,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within second-to-last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len +
            g_test_rand_int_range(1, iov[iov_cnt - 2].iov_len);
-- 
2.31.1


