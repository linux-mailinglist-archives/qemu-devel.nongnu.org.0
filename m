Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BF5EA867
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:30:20 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp7j-0004KB-Ns
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-00021Z-R4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:15 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKE-0005eg-Q8
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id cc5so10284043wrb.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Wq3HlctCe78yvKE2dJl/lmSv5/GtdmA9RfU6fehuz/0=;
 b=nbf0JDLCbS7Mk6WEjkuhwiaJen9kjRaVw/QmaQWthNEq2ISdDRy1Lmux/vPiJYTJg7
 6LYrpPpF/f9fmLjyPIXdPWKROZJgCUc9QrtSGCMgM2euWeSObgjcKM7morAdA7WDPRPE
 w94t9OPUO856dscvookhz0waI/JRSkWOQNImLJshWvSDkOSzQ13VpRUhwexIEJ80dHAv
 cOYDlrdLGr37Ci+NhQTvcrQ1FVVz1t5H22H+U/chzE3FTKt2FdbljQPnL3auWx4z2ip4
 Q+c/c2GvYPS4rbBTzU4Jyaxv0zp4LC2HcejtsifBhxJhse/oUUl30JHoanGqbEX2+nX8
 877w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Wq3HlctCe78yvKE2dJl/lmSv5/GtdmA9RfU6fehuz/0=;
 b=NjOg9cr5eur5LaE6oS7FLzJbgY57Ec/ZZu5BaN9QDR79N0A5rYpi0JpdMxanBOS+mQ
 oYiuqjAcy5EWdUdoOzOU7kkWoFNutrxyVgyH659rYvEcPYZr3TJ+dBicutzC6y2oAOgp
 n5J6DiYaPPF+F7RAd1IqBI9HS/WfhDdawHsXWZ89OnHTQzT7eZMk5sPBSJd+nrLbLSNL
 GItQ/el2emIeczXNWT5yPZY8zAeDuV3td2uZYKn4tThrfxRMOYlF9HyZp0phrN8i1FNf
 Md0mzx8LPJo1AP2LNXjBDqlIyCgA426+gww8BjOhCxXTBAGwpiqqZicXZT48oXraCbS9
 BIiw==
X-Gm-Message-State: ACrzQf0gSeBRqQ4jaMF53kuxvWxxLds+81rls3LEMy/67SbR9n0LZg+R
 BsWpLRbc63xbedEGWCVTawMJRQ==
X-Google-Smtp-Source: AMsMyM4647eYqlDR8NdhuI7BA2qKtUTOe3rg4rPtEs5cpAgxgmiReIjpar002Qum1RL6mhxHCgGwTw==
X-Received: by 2002:a05:6000:15c2:b0:228:dc85:d1b0 with SMTP id
 y2-20020a05600015c200b00228dc85d1b0mr13467958wry.9.1664199549054; 
 Mon, 26 Sep 2022 06:39:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c2ca600b003b4c40378casm11773005wmc.39.2022.09.26.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16B9E1FFBC;
 Mon, 26 Sep 2022 14:39:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 04/11] qtest: make read/write operation appear to be from
 CPU
Date: Mon, 26 Sep 2022 14:38:57 +0100
Message-Id: <20220926133904.3297263-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v3
  - macro moved to earlier
---
 softmmu/qtest.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

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


