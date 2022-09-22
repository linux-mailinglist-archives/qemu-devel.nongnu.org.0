Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D227F5E668C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:14:31 +0200 (CEST)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obNuI-0002pb-UW
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNex-0001Gy-Vy
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNev-0000vT-G4
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bq9so16012515wrb.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YKM2ZiZJEuj1wibh8vFIzYPJZk1x6Iy9eIeHxWyBWSg=;
 b=UUl0NRMW76ATJOVDBxs/bZ53hyu4SvAXOns4fl5fcwi9zDl6BH94J60uV4Xs040zYB
 Jk8E8iEPMTLUZWRFwLZoe0nzvYDByKsRMDxfnioxr47n5jhzopkUQO79XJGjYQrjdb9o
 3NMj90jxf036bd9CLm9v46j54XdVE0ZXTxnGsZzVCTnXGanClftCMR7/BCjfhIZJh5G3
 2f8RB1XvIcpIETg7wHmXOxjaV/r+M/A/3Fh5uvqswENdaWA4fz5KXqpvOzYF5Rlbk+4m
 gwPGC9WegOJej81eeIen/ephROvOI8DU3t/tV4Oeex6em6N2GZIkjfnUkkbjk5wQ92k5
 nngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YKM2ZiZJEuj1wibh8vFIzYPJZk1x6Iy9eIeHxWyBWSg=;
 b=T98DUERUQVOa/38zkpad9aKoSqx0yNhbDWc8cRK1D6eiH2+aZWiL8OYC5K84zg+1l0
 IS7nNdLhxd67TXAdcneTIUHKd8SvIbspstjRmh8uFyg9ziOfKYgzHAR/2JbWGDoVQ8n7
 FFyM39J+MMDfSWB9dX9Xfm4XFzRvYKy66x8a2zUDRmEJzRzgUw+WZC0M3OqwjIFpd4lw
 ZRHNcFxe6PAtkbo7Z5zC6FysoIBXNkW42qw2mzuLHREBMMAYf3AL0cYqCe3Rb4diLSxZ
 EzU848cOLk54L6t/p0/kk0DLztEfkCxLjZYk4Q4XwX4YXfjD2FsS35SuFk3X4CGbKvRv
 bB3Q==
X-Gm-Message-State: ACrzQf1vUjjPgx6tKOlgknKp3x2EnECHyGJHrGXToNWUch8E1N8RSl8v
 2PivxaEd2xQyCg6QOQk3CjdlRg==
X-Google-Smtp-Source: AMsMyM4qUSYDQQ2ivcNZMMWrurtnLkUPKi+NJ/xKclar9akJGtkYwUD/vZgqTiXG3XjXrbGGXKVIAg==
X-Received: by 2002:adf:df82:0:b0:228:e2cf:d20f with SMTP id
 z2-20020adfdf82000000b00228e2cfd20fmr2529039wrl.356.1663858715304; 
 Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a05600c358400b003b4935f04a4sm8198683wmq.5.2022.09.22.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85AD01FFBA;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v1 2/9] qtest: make read/write operation appear to be from CPU
Date: Thu, 22 Sep 2022 15:58:25 +0100
Message-Id: <20220922145832.1934429-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use a common macro instead of specific MEMTXATTRS_QTEST
---
 include/exec/memattrs.h |  4 ++++
 softmmu/qtest.c         | 26 +++++++++++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index e83a993c21..021b68dd06 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -70,6 +70,10 @@ typedef struct MemTxAttrs {
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
 
+/* Helper for setting a basic CPU id */
+#define MEMTXATTRS_CPU(id) ((MemTxAttrs) \
+                            {.requester_is_cpu = true, .cpu_index = id})
+
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
  * of some kind. The memory subsystem will bitwise-OR together results
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index f8acef2628..3aa2218b95 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -520,22 +520,22 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][5] == 'b') {
             uint8_t data = value;
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                 &data, 1);
         } else if (words[0][5] == 'w') {
             uint16_t data = value;
             tswap16s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                 &data, 2);
         } else if (words[0][5] == 'l') {
             uint32_t data = value;
             tswap32s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                 &data, 4);
         } else if (words[0][5] == 'q') {
             uint64_t data = value;
             tswap64s(&data);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                 &data, 8);
         }
         qtest_send_prefix(chr);
@@ -554,21 +554,21 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
 
         if (words[0][4] == 'b') {
             uint8_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                &data, 1);
             value = data;
         } else if (words[0][4] == 'w') {
             uint16_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                &data, 2);
             value = tswap16(data);
         } else if (words[0][4] == 'l') {
             uint32_t data;
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                &data, 4);
             value = tswap32(data);
         } else if (words[0][4] == 'q') {
-            address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                &value, 8);
             tswap64s(&value);
         }
@@ -589,7 +589,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(len);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index), data,
                            len);
 
         enc = g_malloc(2 * len + 1);
@@ -615,7 +615,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         g_assert(ret == 0);
 
         data = g_malloc(len);
-        address_space_read(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_read(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index), data,
                            len);
         b64_data = g_base64_encode(data, len);
         qtest_send_prefix(chr);
@@ -650,7 +650,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
                 data[i] = 0;
             }
         }
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index), data,
                             len);
         g_free(data);
 
@@ -673,7 +673,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         if (len) {
             data = g_malloc(len);
             memset(data, pattern, len);
-            address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED,
+            address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index),
                                 data, len);
             g_free(data);
         }
@@ -707,7 +707,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             out_len = MIN(out_len, len);
         }
 
-        address_space_write(first_cpu->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+        address_space_write(first_cpu->as, addr, MEMTXATTRS_CPU(first_cpu->cpu_index), data,
                             len);
 
         qtest_send_prefix(chr);
-- 
2.34.1


