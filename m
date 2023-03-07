Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C736ADC67
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUtn-0006Hl-QU; Tue, 07 Mar 2023 05:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUte-0006Gd-QC; Tue, 07 Mar 2023 05:50:19 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pkarthikeyan1509@gmail.com>)
 id 1pZUtc-0007vs-OU; Tue, 07 Mar 2023 05:50:18 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 130so7319110pgg.3;
 Tue, 07 Mar 2023 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678186214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6ej4/vsCVtl6r1vwYqpF6hQCd0jMrIGhlisU7rXo65Q=;
 b=o/l2WqtNXIhs/tpx7bK3kTOD0wUTW8kkGQ8J5P2rbpc6iq2ToUaOb/LT5Vl3cfqyRm
 7x3YQ/FtdATEa7U6DUCnBMqmURPV0gm9Ko/kSPTvy05dKIouQZSBnDrzuxyVEOxf8O8M
 /V2n7tleoKvWkuMoBxz+or/w+64XpYcY9EJWSVy4+f7psVWl3zBIqEbIB8G1h1/OIFd3
 lbRENFLqYeEFNfes9CJ/wInNyrTKz/00u3W/i8lFQ8Y0zyf65V5haQ8D9rKSH8h6aiT2
 GGHCF0q7mDHpmiLuvfny2vRjFh5pmMbwQp2xaYMdOQa6vFg6FFhLW1vk5D9SGYhMvchB
 ZAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ej4/vsCVtl6r1vwYqpF6hQCd0jMrIGhlisU7rXo65Q=;
 b=xU/KB3nHxEnM0Nq6/wFv9UMAsVkTks9/rIOM88xVe1TrV5TjSjlUPqG04tRYs7UyGM
 BNPE8mzZmTu6JSYTzQMZpdZRQBNfQJCMpkQ/Q7d/yoXP6UKss8Nyasd/QeuXPpPjLwLW
 TP3vPj10TkGydja5miC66emsz1DLVOAR9yIehqjNnJowenPVl5o+lkYshhNAExFamK43
 ZfigYckLXc9p+Y+/QZYhgm5LSI9XUg9W2hZyiLDkE2CXowQ+GEqMf8vx32JlmzoJrtmk
 QTV41VPkH56Vy+OYALVtifa+031djCc7aan4m39QDxZwqApNvKvfGdzJ6oRgruBpuFL0
 xCPA==
X-Gm-Message-State: AO0yUKWWyy5XBfl1hS/ZlKbiIELJG5IgbnXRwefH6JmtTYIeyy3Jiozd
 2ftY6KoYDaiD9KG4IKEGeSs=
X-Google-Smtp-Source: AK7set8wrDK5O6m4YV9Y7x7lJexxPU2Woh2uECD7h+2lzIWJWZ0cSxOfjfyMITbho1zv3sXqcA9mbA==
X-Received: by 2002:a62:7b58:0:b0:5a8:d364:62ab with SMTP id
 w85-20020a627b58000000b005a8d36462abmr12264241pfc.17.1678186214053; 
 Tue, 07 Mar 2023 02:50:14 -0800 (PST)
Received: from hcl-ThinkPad-T495.. ([2401:4900:1ce1:a87f:e556:a76c:ebd0:7cad])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a62ee05000000b00608dae58695sm7629615pfi.209.2023.03.07.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 02:50:13 -0800 (PST)
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: [PATCH v1] Modified BMC FRU byte data in yosemitev2
Date: Tue,  7 Mar 2023 16:18:34 +0530
Message-Id: <20230307104833.3587947-1-pkarthikeyan1509@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pkarthikeyan1509@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Modified BMC FRU data in yosemite v2 platform.

Tested: Tested and Verified in yosemitev2 platform.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 hw/arm/aspeed_eeprom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 2fb2d5dbb7..dc33a88a54 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -101,17 +101,17 @@ const uint8_t fby35_bmc_fruid[] = {
 /* Yosemite V2 BMC FRU */
 const uint8_t yosemitev2_bmc_fruid[] = {
     0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
-    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
-    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
-    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x61,
+    0x73, 0x65, 0x62, 0x6f, 0x61, 0x72, 0x64, 0x20, 0x4d, 0x50, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
     0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
-    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
-    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x20, 0x4d, 0x50, 0x00, 0x00, 0x00,
+    0x00, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
     0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
-- 
2.34.1


