Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F0C5B8DF3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:16:51 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYW0H-00050O-PP
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxj-0005lK-9D
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxd-0004PM-6E
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id l8so6559849wmi.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DSnARNU2MU0jNZ2gpMOycqSlPYInAf2rUpygqpHvJec=;
 b=NrhpHyC/C30GdbtjwiynuPlZprkDVioQN27V824W0gMI2jWm44inUfFBK7N7cmjyj1
 qHgHdFnUcBMfmIZr5U3I5/369Wiiwj5Mjrdrcq026HNps688dh6q6OA+VhapHSsQ2+7P
 VuUUjyxyC6fjVFf7oqTH9FsTBgWT+Mf+/9j+1s6q+yah1EQ9V8Xoad7JuxFqdCToI3UV
 DQPMC0dj3nIR2RM/hxJWdj3i/32q75gKf/yF+ThTTasavmfn7vi8YObFpgFJUd4LJP4J
 fbC7NZEH3QPoF9wN1frUtZFdEvmwa0NPVbsFVEfdb1FW1vW/RsIwwWQFbKWtC7LMGl5r
 EHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DSnARNU2MU0jNZ2gpMOycqSlPYInAf2rUpygqpHvJec=;
 b=nfc5hJRz7NJGXn0lejXodt3y3AZMeosAycEZMNK1xCyo/cIHnwRzMeWkomPA3XSWh5
 iHd6UUV7uNP0N7zL3eOB1/gfGI1gffFg0U1F8KU7w7/dU6uEZAk0915HDKjJvOpY8O07
 zYuRIp3nWf+pDi+0Av4tyVg1rjP1bl9Yz16vcLuFsTaJqO3aTsLb7mH1xSIOFEz6iHdv
 fMvVqAwfJ721EmFzZnVnCDFTHHaudj66uJ3ubxB3sbtvRWSb8p6SBSJDXbU21QDKw6w6
 A/2+Bl3rq/PNleodYIXgDy8Gxm4b83bi2exM3320eeEQu7Dsnl+oT/9PgTD33KssJVCp
 aHfA==
X-Gm-Message-State: ACgBeo0YbH3OJ8yfQBn0IqfNwVdbwkUFHnfNS4IVpYdGjmuexGvL0A40
 7FbnWx/3NRLSNZL2ctJaCGg4+g==
X-Google-Smtp-Source: AA6agR6koNiHCRC6J8SezZEikY8zgHmPYlJg3++L8s/TznP+6DjncLgbmdQzzHAjmiITP0Zvsng/Yg==
X-Received: by 2002:a05:600c:2181:b0:3b4:74e4:16f8 with SMTP id
 e1-20020a05600c218100b003b474e416f8mr3547393wme.174.1663171797984; 
 Wed, 14 Sep 2022 09:09:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a05600002a100b00228d183f9c2sm15739754wry.89.2022.09.14.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 554C51FFBA;
 Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH 2/4] qtest: make read/write operation appear to be from CPU
Date: Wed, 14 Sep 2022 17:09:53 +0100
Message-Id: <20220914160955.812151-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The point of qtest is to simulate how running code might interact with
the system. However because it's not a real system we have places in
the code which especially handle check qtest_enabled() before
referencing current_cpu. Now we can encode these details in the
MemTxAttrs lets do that so we can start removing them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 softmmu/qtest.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..c086bd34b7 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -362,6 +362,13 @@ static void qtest_clock_warp(int64_t dest)
     qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
 }
 
+/*
+ * QTest memory accesses are treated as though they come from the
+ * first (non-existent) CPU. We need to expose this via MemTxAttrs for
+ * those bits of HW which care which core is accessing them.
+ */
+#define MEMTXATTRS_QTEST ((MemTxAttrs) { .requester_cpu = 1 })
+
 static void qtest_process_command(CharBackend *chr, gchar **words)
 {
     const gchar *command;
@@ -525,17 +532,17 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else if (words[0][5] == 'w') {
             uint16_t data = value;
             tswap16s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 2);
         } else if (words[0][5] == 'l') {
             uint32_t data = value;
             tswap32s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 4);
         } else if (words[0][5] == 'q') {
             uint64_t data = value;
             tswap64s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 &data, 8);
         }
         qtest_send_prefix(chr);
@@ -554,21 +561,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][4] == 'b') {
             uint8_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 1);
             value = data;
         } else if (words[0][4] == 'w') {
             uint16_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 2);
             value = tswap16(data);
         } else if (words[0][4] == 'l') {
             uint32_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &data, 4);
             value = tswap32(data);
         } else if (words[0][4] == 'q') {
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                &value, 8);
             tswap64s(&value);
         }
@@ -589,7 +596,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(len);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                            len);
 
         enc = g_malloc(2 * len + 1);
@@ -615,7 +622,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(ret == 0);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                            len);
         b64_data = g_base64_encode(data, len);
         qtest_send_prefix(chr);
@@ -650,7 +657,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                 data[i] = 0;
             }
         }
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                             len);
         g_free(data);
 
@@ -673,7 +680,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (len) {
             data = g_malloc(len);
             memset(data, pattern, len);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST,
                                 data, len);
             g_free(data);
         }
@@ -707,7 +714,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             out_len = MIN(out_len, len);
         }
 
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_QTEST, data,
                             len);
 
         qtest_send_prefix(chr);
-- 
2.34.1


