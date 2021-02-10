Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D1315A9F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:08:40 +0100 (CET)
Received: from localhost ([::1]:56974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d3f-0000FP-Ay
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxx-0003UC-SL
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:45 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxn-0007yz-Tu
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gx20so115050pjb.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=vrY7tm5ACMVi/IWqFORkL7V5t6qpGs1bmyRi5cyYLOBBvp1TQfbqfXBshGU94oZ4GR
 RbGBJFppwtEaTPrvvUtOSYzEIvz6YhJgsIN73NmpuGnMDLxgOF6C5icLuxUPTX2v846G
 HzrXEt6pTBmfmH9K9aQVc8OXTRN7WPDLkVPoI+K7RafhEjeJLrT65etCW0VAqm2/uZaF
 zbnBbUAZMLDf89Rf9YUAfoX5fRBPdv6Bh2gdlh0oWmtprmI9VGnaxxVMRHnOULVq0FUM
 soK0hBZ+RgkntYXLKbxe2niZkO2cSLG8VP07eFCbahHnKHsnw2SCrmEoXGm8g27Sw0ts
 1FTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhhF4cnD2bQGGauP5wAsskp8GPwXgWKUSZeMzfZve48=;
 b=FSwMOrJ4+IsC1a6LHEw6vVb55No5I2ySgOVeuWZGPYbMokqJ8Bw0cx+9lcJ4tPLQ2g
 F4OGDZTvz//fZiyTzwOw/6OSjVtQRe6vq6Y0sHdwCf7Zz89REjJn64U8x8NeO5O3Y4Kk
 wCokP7J3sbLPPHqw/2iOCoE2wdOFL0lMnw76K0CZdtIgIsjWl/LhDQ9QMYvl+MnKU+w1
 z/Yeq3pBoQJrAE9Vb+14Qij/qrJPwNSOO+XYpleMcorsQUbKpU44ly+eegTVrmGHgwEq
 0KfXgVDIw3Js2CTdgqhPQDT3/YrI2N8BN3r+DogYNCC2B3zvSITuRS+uXsFGEgfI3u1s
 eHDg==
X-Gm-Message-State: AOAM532GaNwK4+Bqego7viLNBQlJAiox3wixWc523H3N8HmVpaQDZYWP
 ViZnBIcunn48C9lDy9yqR1xK47MzRrHrFQ==
X-Google-Smtp-Source: ABdhPJyPnjO4FFHvGAmDv2N5VXPvEynpumWuCewZAIC7tRfcfEWHmnvX9PVpvMf2MtEk6DQBC94OnA==
X-Received: by 2002:a17:90b:1495:: with SMTP id
 js21mr353567pjb.127.1612915352139; 
 Tue, 09 Feb 2021 16:02:32 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/31] exec: Improve types for guest_addr_valid
Date: Tue,  9 Feb 2021 16:01:57 -0800
Message-Id: <20210210000223.884088-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aade..5e8878ee9b 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.25.1


