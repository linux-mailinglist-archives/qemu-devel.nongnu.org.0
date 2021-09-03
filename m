Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A480E3FFF46
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:36:21 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Ua-0007Dp-Ot
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74X-0000bq-8P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM74S-0001xR-IO
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNmQn7pp74t94Lr73ldUSMDFHfSQgs8qkh8r7R4cWBA=;
 b=TYaaOXhGK1EOaNbmpZk/kVc8eC3E418M6L2k5Swp9vzSEbOC+h21cWwyPHs5GBX3wvbI6i
 bzMFuqzkKWdGDrImXMetp4K5VqtFhdwJZjzDwNw6M5xLCSEFCNZ4ucps2CzTmxZUpvHaw8
 Bb5BNJdWJyQ125vp5cAJ6PFwjgkY7ds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-saF-8ZSPOh6htx9oKovZuw-1; Fri, 03 Sep 2021 07:09:17 -0400
X-MC-Unique: saF-8ZSPOh6htx9oKovZuw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso1839979wma.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNmQn7pp74t94Lr73ldUSMDFHfSQgs8qkh8r7R4cWBA=;
 b=sYmKT6OnOKbZeDMwJOR0njofqoILGXxuIubBHPkQ7Cdi6zVE+40uio5qTN6HhKPALS
 oyt6s5hJRCFQULjTwRQlApi6iB5n6YlQfG238Qgan46LisZ5YHyV2lUwxO4mxfFc1wG9
 QH6z9mT/aNA3SDxErx5RcLEB93WwVHmTVta5GYM0YU2i3Iu4PEJsBjPGv84K53M+xqyc
 xbmDv92ay347AIIez86NeJSA16P/PyWiQqtAlwiyMeVAkalF5LpMT6UrzOTVLopLV3bR
 ecqItG1sIxFio2zWmS5+8bu6ll7mkgx2DoljkNLzwBSR8DQ4V9OvXBTniq+D07a0jV5P
 LwZw==
X-Gm-Message-State: AOAM533+udseWi6CFpildijcgaJQao26kA7babbxDtpD77vZy4Sh7pII
 P5YynuPbHB89eLLKkbfHRkk4mZJoh7ORnr7qaLl1HYBp2HVW65YnbYjrn6WaM3F0Kj+wFlcNpZE
 89mGudnvMITlbcQzXJkGIhvGja1BVqd7LglVVzoyb7vpjeAt8j5h6WJrXHY4lCdsj
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr3413408wra.245.1630667356031; 
 Fri, 03 Sep 2021 04:09:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7GNZSDtH7eNMhcSg/f8Lt0w2oSbtabaXRSOl+1qUAig28an7Yx8aZ5ZPl0WYwewdHyBWloA==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr3413326wra.245.1630667355660; 
 Fri, 03 Sep 2021 04:09:15 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 k25sm4751451wrd.42.2021.09.03.04.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:09:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/28] tests/unit: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:57 +0200
Message-Id: <20210903110702.588291-24-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
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

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/ptimer-test.c | 22 +++++++++++-----------
 tests/unit/test-iov.c    | 26 +++++++++++++-------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 9176b96c1ce..23efeb04a57 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -798,64 +798,64 @@ static void add_ptimer_tests(uint8_t policy)
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_count, g_free);
+        g_memdup2_qemu(&policy, 1), check_set_count, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_limit policy=%s", policy_name),
-        g_memdup(&policy, 1), check_set_limit, g_free);
+        g_memdup2_qemu(&policy, 1), check_set_limit, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot policy=%s", policy_name),
-        g_memdup(&policy, 1), check_oneshot, g_free);
+        g_memdup2_qemu(&policy, 1), check_oneshot, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic policy=%s", policy_name),
-        g_memdup(&policy, 1), check_periodic, g_free);
+        g_memdup2_qemu(&policy, 1), check_periodic, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_mode_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_mode_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_mode_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_period_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_period_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_period_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/on_the_fly_freq_change policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_on_the_fly_freq_change, g_free);
+        g_memdup2_qemu(&policy, 1), check_on_the_fly_freq_change, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_period_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_period_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_run_with_period_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/run_with_delta_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_run_with_delta_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_run_with_delta_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_periodic_with_load_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_periodic_with_load_0, g_free);
     g_free(tmp);
 
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s",
                               policy_name),
-        g_memdup(&policy, 1), check_oneshot_with_load_0, g_free);
+        g_memdup2_qemu(&policy, 1), check_oneshot_with_load_0, g_free);
     g_free(tmp);
 }
 
diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 5371066fb6a..19ae24adb70 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -173,7 +173,7 @@ static void test_io(void)
     }
     iov_from_buf(iov, niov, 0, buf, sz);
 
-    siov = g_memdup(iov, sizeof(*iov) * niov);
+    siov = g_memdup2_qemu(iov, sizeof(*iov) * niov);
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
@@ -350,7 +350,7 @@ static void test_discard_front_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, 0, &undo);
@@ -361,7 +361,7 @@ static void test_discard_front_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -373,7 +373,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
@@ -385,7 +385,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov->iov_len);
@@ -397,7 +397,7 @@ static void test_discard_front_undo(void)
 
     /* Discard entire first element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     iov_discard_front_undoable(&iov_tmp, &iov_cnt_tmp, iov->iov_len, &undo);
@@ -408,7 +408,7 @@ static void test_discard_front_undo(void)
 
     /* Discard within second element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_tmp = iov;
     iov_cnt_tmp = iov_cnt;
     size = iov->iov_len + g_test_rand_int_range(1, iov[1].iov_len);
@@ -499,7 +499,7 @@ static void test_discard_back_undo(void)
 
     /* Discard zero bytes */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, 0, &undo);
     iov_discard_undo(&undo);
@@ -509,7 +509,7 @@ static void test_discard_back_undo(void)
 
     /* Discard more bytes than vector size */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size + 1, &undo);
@@ -520,7 +520,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire vector */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov_size(iov, iov_cnt);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -531,7 +531,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = g_test_rand_int_range(1, iov[iov_cnt - 1].iov_len);
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -542,7 +542,7 @@ static void test_discard_back_undo(void)
 
     /* Discard entire last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len;
     iov_discard_back_undoable(iov, &iov_cnt_tmp, size, &undo);
@@ -553,7 +553,7 @@ static void test_discard_back_undo(void)
 
     /* Discard within second-to-last element */
     iov_random(&iov, &iov_cnt);
-    iov_orig = g_memdup(iov, sizeof(iov[0]) * iov_cnt);
+    iov_orig = g_memdup2_qemu(iov, sizeof(iov[0]) * iov_cnt);
     iov_cnt_tmp = iov_cnt;
     size = iov[iov_cnt - 1].iov_len +
            g_test_rand_int_range(1, iov[iov_cnt - 2].iov_len);
-- 
2.31.1


