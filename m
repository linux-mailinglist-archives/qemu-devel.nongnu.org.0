Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 854474757C7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:31:54 +0100 (CET)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSVl-0000U2-JH
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRih-0007Id-UC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: from [2a00:1450:4864:20::32f] (port=54817
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRib-0008WT-NB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i12so16260237wmq.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jRMpMS/CyWONQSCDvYHRycsqwdxA5hg+1aajGuji4ZE=;
 b=Dj2nkxX/sfvbRz0hW4cokfHkIzo4FlsKY7EIO5XgNxkE9zQqyCoTLH9jSHCDCHYZuz
 /YD39vL3My2VzIxfpbmIHnDgOMFydO0QQiSb7zMSmaLJyvXc1oAiPN+3tzHAFI2vT4uC
 n1v3RqT/PFhwhwgROlSPf9ynEwF5nrDts9frqCHhqr7JNPQp9GF3ebqb+VzAgLNMi94l
 hVJbN8dQJeDGYp/vc8Mcf1YFPs0HOKZ4jAhjOuoSZq27QgYvA8ZMhsgnsRBkDmShKO8w
 pDArb7cYcO9faBeUDsp6xHYULjq8uBysNYEV3s/b2DFNCtzWynCHat2gDlYXIaFsDpIs
 Em8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRMpMS/CyWONQSCDvYHRycsqwdxA5hg+1aajGuji4ZE=;
 b=HamSOM2xwlL84rU0SNwSNQeXknLTG4XNrgwb/I/g0XwaAZggUlXHQSEXxuoa/uV8Qb
 Q3YTKjDOnBwM12IiNdtWT3u9uz/XFcgvz3NOqy/jBwKn5xPZ5Id9w2ZiGXWQR2WjmI/n
 AXiVGX2cWDqQN7x+YBGz7rv+rPL+ABDpkRbCgvRfkRmOUKuAjZFa+RNvcBMYU8UGnMH8
 Q/Etbn38E/aDRVH4p7HxugufojkEdOU8PNiT6tG1XLIAIxT+VML7K4/kWa5Fn4YtM76c
 cdK5WAbh+3ssz7HdJCBXLVEESwKDHSEdpb0t3iz2y+14/cakd2sXgi2PXzEAs1c+wWiE
 t4Fg==
X-Gm-Message-State: AOAM530o4GLOCkCnoA+J0Q/J3DrA6laKcZwyLETkHNvqKRVAuqY8o1aQ
 hPqRfuYPVA8HoGkETn6EOly30TLfBCbwkg==
X-Google-Smtp-Source: ABdhPJzfoJLpiPFBHY6txQqKEmcxOv45DnI7yWQXZkW4MK10LdnUMNkty4rx4Q9dS8OfPiQckwn2sg==
X-Received: by 2002:a05:600c:220a:: with SMTP id
 z10mr4163776wml.20.1639564864415; 
 Wed, 15 Dec 2021 02:41:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] target/arm: Correct calculation of tlb range invalidate
 length
Date: Wed, 15 Dec 2021 10:40:40 +0000
Message-Id: <20211215104049.2030475-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Fixes: 84940ed82552d3c ("target/arm: Add support for FEAT_TLBIRANGE")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/734
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20211130173257.1274194-1-peter.maydell@linaro.org
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


