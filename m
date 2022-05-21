Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A578052F699
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:11:47 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCig-0000SV-PM
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbT-00082L-E3
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:25 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbQ-0003zT-KN
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:17 -0400
Received: by mail-pg1-x52e.google.com with SMTP id h186so8978566pgc.3
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kCDHy7lpceuAK2eVJ1Y4445ZF33BxGk4+3bwHnJ8e7o=;
 b=RfC5JEDDnCstDE1FKe79gc7KvW1iIO0/gU0ng4P9TPCdmxbsRYFtHYbcZvaLQXSERD
 kKREE09StcBztZtgaMJUKHRFqLBtcWH5cJQPup2vSyHhkf44V5dIyLphY0Yt0+K0jXOS
 pOtgp+d9zmMogOiHEjArozZ1Nx7kMlNhl4jG99Zb1b16lY5WoWb1ktp+42vywg3tSURJ
 i541OWZ9ghKmaaBS9IUMbnmJmiDAKe7JOxpY0tQatbQ1Ec0JWJhYd6uBar1tnG7c4UAj
 y96Fr4sI43PRm33xzpqkE8AB8SxxyHlITrlBmAjBqazj4U2tha3bbBUJ7IpD5U30AucZ
 U7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kCDHy7lpceuAK2eVJ1Y4445ZF33BxGk4+3bwHnJ8e7o=;
 b=Br3E7kpr+uXEs8xQAjWSmBeisWevrMa585p17R2bq9Ky3XEe8yVH1dG2kmvkkTP/mK
 B9goLaWp0y29l9lxKoD8e0sY5L0C21Gyipi9AC/eV5FgrFtwLeDXJmRedMsjaa6lETUZ
 sqyeY/jHBSLz7kBS7SjHS43AFPYRTgVh8Au4XLsLvXkLsDqzPM5UZVHNh85Vezm5ot7S
 c5JxabSau1ybB+alfLQDlWw2Ua6mMqCDYdl+hZ8ws66Hid8GWUGEjbXP4E3NL3buB8jp
 lJ0LBPrBuK+J3+wjrZ6DPkcJEofiv8v1Q9/B8aCmm7opawh/4ORhRuSAQI0HvPnXGwsF
 /Kqg==
X-Gm-Message-State: AOAM531JpGigaPGDRb10+ctblVMofNLn9atzHwyrvDl0JvDj0FqQlpIq
 VPxaZQaDF5T4eK1kUllTOJJu6UOcPbQS5A==
X-Google-Smtp-Source: ABdhPJzqTsDwjRUa//ZWVF/KXqWYnbYI7+9xrCRX1mJAN02knfB5o025m6hrA1gk6LCxZnEF84D+Tg==
X-Received: by 2002:a63:1d5f:0:b0:3c6:e822:2eb1 with SMTP id
 d31-20020a631d5f000000b003c6e8222eb1mr10566233pgm.99.1653091454946; 
 Fri, 20 May 2022 17:04:14 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 10/49] semihosting: Clean up common_semi_flen_cb
Date: Fri, 20 May 2022 17:03:21 -0700
Message-Id: <20220521000400.454525-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Do not read from the gdb struct stat buffer if the callback is
reporting an error. Use common_semi_cb to finish returning results.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 88e1c286ba..8792180974 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -346,15 +346,17 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
 static void
 common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    /* The size is always stored in big-endian order, extract
-       the value. We assume the size always fit in 32 bits.  */
-    uint32_t size;
-    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
-                        (uint8_t *)&size, 4, 0);
-    size = be32_to_cpu(size);
-    common_semi_set_ret(cs, size);
-    errno = err;
-    set_swi_errno(cs, -1);
+    if (!err) {
+        /*
+         * The size is always stored in big-endian order, extract
+         * the value. We assume the size always fit in 32 bits.
+         */
+        uint32_t size;
+        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
+                            (uint8_t *)&size, 4, 0);
+        ret = be32_to_cpu(size);
+    }
+    common_semi_cb(cs, ret, err);
 }
 
 static int common_semi_open_guestfd;
-- 
2.34.1


