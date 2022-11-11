Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE9762617D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYix-00087J-Gd; Fri, 11 Nov 2022 13:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYip-00082h-3j
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005FB-AA
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:46 -0500
Received: by mail-wr1-x435.google.com with SMTP id h9so7561633wrt.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZTswvbms0KUj8W6VozmeTx2aCc51iOLIgIJjYfUOE0=;
 b=cp+zbzcBCENl3TuL293eTLggBKaTC5+aEvoXIOIvduUjNNvstpwsqt/E9nuMiIKfSt
 K9RsJSi00fZQlBUW9B/XwL7ON1yZFT0mewLYIK9TNtzcfgD8BsR66K0zqmL8SeESa1xd
 UMQpA0fUt2ssfBw1dLuqPdNOxw3eTSeoNPBIVECFQowic1/H9YrBRsNYEwy0IBdS+uVO
 OC6s6xdrgzAsPPlGmfsO3N5sJL298NFXVoNkySYyKkG7bKFe5QvPMkScDcQT1YZ9KB5m
 76AI5YCLkavBiP8YW2Qn8PB3JkkUftWQAf2aTNc9L0qe+TrtSDmAmOdLqBjaS1K6bq4+
 PhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZTswvbms0KUj8W6VozmeTx2aCc51iOLIgIJjYfUOE0=;
 b=iDMgUo0nTRirOuk+ZRdytxyGrahB6EwhkXK8WBAIYwFotBvUsFhPOrGimgvdb8LxYN
 ePg5PItLpXAA/dqXWxCsJNDw4GzTqaP3J5MhrwL05bCl80HV34GkoVZG+pIE6D+rD5Zw
 Qlmdu/nRho7OS5f5DAIh8OmTlYux0j26TXSjXX3D1qgnL+CYNqTy+DJ92unf5FNJYfmH
 WDmb4QU38fU8wcuKezgXf2n2j4F/gZsFsspXLJ71Sd6tsLmxhZIvV7pWDVOLZ8z2rZp3
 6i9pJ/F9p85LPJQf15Ew10uy2/xOuDF8tB82hmBbjLoY1yGNNvhfIpznlIP7SO/N0Q5T
 /6Sw==
X-Gm-Message-State: ANoB5plNUuICqGI2T1ecb3gRKPawOm3SaofyO/Vn1c7MoumeA/FMl6XF
 LtGJEBvWNDcb5duMZS0CV3hk5A==
X-Google-Smtp-Source: AA0mqf7mcWRy/crUFdFcnDA4ehU76Plm7swErVk2ObO17lWRosu3IL4ZCUQIxNJeurm9gzt8zVcYig==
X-Received: by 2002:adf:dcc3:0:b0:235:14dc:5e14 with SMTP id
 x3-20020adfdcc3000000b0023514dc5e14mr2085957wrm.252.1668191138654; 
 Fri, 11 Nov 2022 10:25:38 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a1ce913000000b003b49ab8ff53sm3748319wmc.8.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3ECF81FFBE;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 06/20] qtest: make read/write operation appear to be from
 CPU
Date: Fri, 11 Nov 2022 18:25:21 +0000
Message-Id: <20221111182535.64844-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The point of qtest is to simulate how running code might interact with
the system. However because it's not a real system we have places in
the code which especially handle check qtest_enabled() before
referencing current_cpu. Now we can encode these details in the
MemTxAttrs lets do that so we can start removing them.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index d3e0ab4eda..5e9ac234ce 100644
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


