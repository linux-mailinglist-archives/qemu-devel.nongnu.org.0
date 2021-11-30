Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6B463CE7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 18:35:24 +0100 (CET)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms72G-0000Ra-5J
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 12:35:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms705-000658-RE
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:33:05 -0500
Received: from [2a00:1450:4864:20::430] (port=44726
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ms702-0006Z6-6a
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 12:33:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id l16so46101853wrp.11
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 09:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rfQ+RiViECLNtr/c9/my/pnagCNTFLLUTJEjsLwzVUY=;
 b=uFz57qVY2nGIQxKRDHFsX5iWPlQRq4UCCXirYYe+qmq2XlygKjwUqUJDBYrrMXBWL5
 D8TUWimoGiu7VmsTQuqeGeQ0MYUaG9/UJxU3SQ8uzOGw0HWNp1hLaKDlseccRMukxxir
 E5GIVyepQveIIw9jvu5OVI7T+8baLEUCILqiviBxa/rlYK8Zl0A09lobAAeNt72fstQ5
 h5i/9g47E7AKcsx/xhddrJYwMxy4vMHxckzsfPEo5emYYzmvpdZS05O4xtxDtoHc+ad3
 SQYGDi+XXx3pK3+Ofy5APUbWR5T2RMzP/RI7bH1MrpQ1cbvqs2JCrPtXYQEtrzS5w3uz
 FIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rfQ+RiViECLNtr/c9/my/pnagCNTFLLUTJEjsLwzVUY=;
 b=VzVZLyvfd3BrKJDldiFISgy2uyTjemGDLQGoAJ1B2/ncSJdKiiV0MkCeu293dSvh0t
 9LwRjvRX0L2leP1rbUzP9YPmssTr35LrmieY5knJ85IsUU6G7apGZLftX2kNurLa0yzv
 ngE7Q5o8iBZpIY/TSy/7+QYRvKL9e+ddRPJQVCsZKmDVY9g5J9/NEuqR1rHlEi5uP41C
 FisAi7KzIYM9CPs1mAgWfCr6T7PGP1XpLP9o/fWKCdfAiZS93IPd0nqz+EG419JgEv8j
 qs1V9B54RvHl2EFAiVmJh+fSbTk3Cs+dH2/L9CFD4razSiT19lNld6D7t5wgC3p+38Qs
 4Ssg==
X-Gm-Message-State: AOAM531qbpGddsU2Yr7yW8BCyZibV/w0rVrgk+SXkYc9zpvC/+9YhQC0
 PngW9XU/0TA9X1JXVbispTUP8g==
X-Google-Smtp-Source: ABdhPJzkXphSJFrNz/ZWQ+1ddK4OGdr4oBiMeWFA6UDrslaqpN6qzPXkaxEtjZ5VWVnrvXcdHrkvJA==
X-Received: by 2002:adf:c605:: with SMTP id n5mr365321wrg.564.1638293580202;
 Tue, 30 Nov 2021 09:33:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r8sm21583972wrz.43.2021.11.30.09.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:32:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct calculation of tlb range invalidate length
Date: Tue, 30 Nov 2021 17:32:57 +0000
Message-Id: <20211130173257.1274194-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The calculation of the length of TLB range invalidate operations
in tlbi_aa64_range_get_length() is incorrect in two ways:
 * the NUM field is 5 bits, but we read only 4 bits
 * we miscalculate the page_shift value, because of an
   off-by-one error:
    TG 0b00 is invalid
    TG 0b01 is 4K granule size == 4096 == 2^12
    TG 0b10 is 16K granule size == 16384 == 2^14
    TG 0b11 is 64K granule size == 65536 == 2^16
   so page_shift should be (TG - 1) * 2 + 12

Thanks to the bug report submitter Cha HyunSoo for identifying
both these errors.

Fixes: 84940ed82552d3c
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not marked for-6.2 because this isn't a regression: we
shipped the TLBI range invalidate support in 6.1.
I have no repro case for this issue, but this doesn't break
booting an aarch64 kernel, at least.
---
 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b317899a66..db837d53bd9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4519,18 +4519,18 @@ static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
     uint64_t exponent;
     uint64_t length;
 
-    num = extract64(value, 39, 4);
+    num = extract64(value, 39, 5);
     scale = extract64(value, 44, 2);
     page_size_granule = extract64(value, 46, 2);
 
-    page_shift = page_size_granule * 2 + 12;
-
     if (page_size_granule == 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
                       page_size_granule);
         return 0;
     }
 
+    page_shift = (page_size_granule - 1) * 2 + 12;
+
     exponent = (5 * scale) + 1;
     length = (num + 1) << (exponent + page_shift);
 
-- 
2.25.1


