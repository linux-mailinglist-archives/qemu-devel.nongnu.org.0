Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E25EC85A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:45:05 +0200 (CEST)
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCla-0002cs-OL
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMl-00055t-MX
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMf-0005y0-En
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id l8so6632993wmi.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=zdiXkimx6yrJ4O6i51JAC+sskNh3W/xe5mevtbdNW+o=;
 b=LePijOWUPexf3+OU1xXnquCjeWfd63FHeBihImHGiYuB4AMAjmBGhT8W08qy4PHLel
 d4JKYK93UY7jJfeAXiGF82Uq3MeIZ//zrXXhdPHJKFnNork1QDDzrikzeJdtUk+zteeq
 IS+ZspLabI7ogNU0enuXdeb5rqBdLHPvZIm4TYdHAKzwqUrox8zPHzAboZPw+0DlOXQS
 1KpxObQXCLyst+3FEwHGjqQrtNvUWHLaaIzyCFta5QlqFwUqFLjfPLqDUVU+H4mps9rX
 IaqvM+pRrLxy3Hkq7POu7XtPDHcTQgQPTkSw1LyHelsNscANXGVYmL18CpGrK/beB9q6
 K7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zdiXkimx6yrJ4O6i51JAC+sskNh3W/xe5mevtbdNW+o=;
 b=pVZNH05DAj68WKQG6LJnu2p3RBGAyWjh0tHFAEgoSkMboIKS88QfiKEzneCddKz3Ca
 r6MIxNLylwz4RPkA6EZ+O+tSYLuwmPlRb1Zc+LPcMar6u0bliSbcHO2MRXKEmNX3tzPM
 w2DBqGmwVirdgH6vx+h9KFqlgJC32Mwd6o7FdmCQU1RZvia6BuRJxYgV20J+A0pyml3d
 fqKAK1fjaUCuLNDc3KCwJr7cvVdrtWqPEyABK+eGImLbgcaO9CgDMecIPP5btA0yKqNe
 85PUON/J7OX0vYMj5i5ZCWhsdKF5aJuWPYmnuLDjwv+duoPN/Bkh7vBUkEtPpqTZsxOP
 REXQ==
X-Gm-Message-State: ACrzQf2GviKo4ueYB5SXNqnaC5TSP64iFR3rcNk7qqCZiIBM1OXUFe7H
 fODmDymCZKkHXMRbRUrm0GalWA==
X-Google-Smtp-Source: AMsMyM4QjceifBNjzzxbcEYOnFW3NgznswRL0odnOrzZknokwfJy4j5JAuEBA+zhlu449v9ib7tpIg==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1dd with SMTP id
 h17-20020a05600c351100b003b4bb85f1ddmr2991289wmq.42.1664288112703; 
 Tue, 27 Sep 2022 07:15:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a05600c34c600b003b49ab8ff53sm1978578wmq.8.2022.09.27.07.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6508B1FFBF;
 Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 07/15] qtest: make read/write operation appear to be from
 CPU
Date: Tue, 27 Sep 2022 15:14:56 +0100
Message-Id: <20220927141504.3886314-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The point of qtest is to simulate how running code might interact with
the system. However because it's not a real system we have places in
the code which especially handle check qtest_enabled() before
referencing current_cpu. Now we can encode these details in the
MemTxAttrs lets do that so we can start removing them.

Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use a common macro instead of specific MEMTXATTRS_QTEST
v3
  - macro moved to earlier patch
---
 softmmu/qtest.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..7d29d54a4c 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -520,22 +520,22 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][5] == 'b') {
             uint8_t data = value;
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                 &data, 1);
         } else if (words[0][5] == 'w') {
             uint16_t data = value;
             tswap16s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                 &data, 2);
         } else if (words[0][5] == 'l') {
             uint32_t data = value;
             tswap32s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                 &data, 4);
         } else if (words[0][5] == 'q') {
             uint64_t data = value;
             tswap64s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                 &data, 8);
         }
         qtest_send_prefix(chr);
@@ -554,21 +554,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][4] == 'b') {
             uint8_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                &data, 1);
             value = data;
         } else if (words[0][4] == 'w') {
             uint16_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                &data, 2);
             value = tswap16(data);
         } else if (words[0][4] == 'l') {
             uint32_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                &data, 4);
             value = tswap32(data);
         } else if (words[0][4] == 'q') {
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                &value, 8);
             tswap64s(&value);
         }
@@ -589,7 +589,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(len);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu), data,
                            len);
 
         enc = g_malloc(2 * len + 1);
@@ -615,7 +615,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(ret == 0);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu), data,
                            len);
         b64_data = g_base64_encode(data, len);
         qtest_send_prefix(chr);
@@ -650,7 +650,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                 data[i] = 0;
             }
         }
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu), data,
                             len);
         g_free(data);
 
@@ -673,7 +673,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (len) {
             data = g_malloc(len);
             memset(data, pattern, len);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu),
                                 data, len);
             g_free(data);
         }
@@ -707,7 +707,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             out_len = MIN(out_len, len);
         }
 
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu), data,
                             len);
 
         qtest_send_prefix(chr);
-- 
2.34.1


