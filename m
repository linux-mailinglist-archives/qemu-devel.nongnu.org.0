Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33F5318C08
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:31:47 +0100 (CET)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC4Q-0004LK-PI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:31:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZ3-0008Ev-Vj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYz-0008S4-9v
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id n10so3779353wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=efv+EhfVcvK/k/9b5RYb8iS1WEkIs2L9Rka7/t1fQqQ=;
 b=GRBBFLaKmfGoCcbYqCC9eCt9BmTwpnCXcsPeX8swUYoKx/3wfeLq28t0aIp7DiVTeB
 zPN01L8Vv+bfDBHjgZL3fqFhY8AF4jr5bhCKiF1x4nL5RxvmFAlUky1GT2NXPo9xQ9SN
 jwgUSGICPl0yqKgqd0eOYY+Gh4k5mgOp+ebd1fNORNOHEnWBSau+Bjd5Zjkcpy4JOVrA
 1LDSfg+oWac3H1Wt/mk0t1yUvT7ySelaU5l2qKhk5oY3WpkmrSC1KjfLclCFDa2T2tiZ
 wtuoRVzNvdALUxd2o8LlyyjZfRf3lijTvub5BG9uJEdaKgWbOU7DIfuWlev98pUBDVLp
 NY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efv+EhfVcvK/k/9b5RYb8iS1WEkIs2L9Rka7/t1fQqQ=;
 b=WBezaCMTGEvtXS53PAKS84sCE+dI5GPmEIn1kEp4r33OUUKK+lt5YvFUTDsSVSV/P+
 lihUKAzaxP32qBzQAKrqXaoYLWxKaKVFMVNa4Hb9OfUq613tmwnZXxoWoGKnOYIRJebK
 u0pmYjm//oI0Xn5+OZN2H4iLMBza3mkMWhj2LH+vt+I0jvvJIHLtY+ni95CFEcFw3XtQ
 qcl40NIpAni93ksNFIBTR/QhH7/kFyMK/d6vQVk8rLlX70lYw328VeP6eClCx300E5YT
 4kjTGD/qT2HMLqtcTNDf/DVchJpUd8Nmb47tD89DUYL3+PZ9Dz38rcogQXfYY3bu+K7s
 sM6w==
X-Gm-Message-State: AOAM531z339z8LmiZ9p9EKfqRVCqkp8D9pzRcLkI/j+xpGg33wHc6kLG
 PRTAAVZIyL3nlqOLMvV3IyygRic/vwLfNg==
X-Google-Smtp-Source: ABdhPJxZbL1n38DPsQAh6xbUpnntioftMWLVR3Dfak9ua7uItGU2CiUZ+nRciQ9BIAuxu9xnQ65ZgQ==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr5181492wmd.105.1613048356016; 
 Thu, 11 Feb 2021 04:59:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/45] linux-user: Do not use guest_addr_valid for h2g_valid
Date: Thu, 11 Feb 2021 12:58:33 +0000
Message-Id: <20210211125900.22777-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is the only use of guest_addr_valid that does not begin
with a guest address, but a host address being transformed to
a guest address.

We will shortly adjust guest_addr_valid to handle guest memory
tags, and the host address should not be subjected to that.

Move h2g_valid adjacent to the other h2g macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 5e8878ee9b1..4e6ef3d5429 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -77,13 +77,16 @@ typedef uint64_t abi_ptr;
 #else
 #define guest_addr_valid(x) ((x) <= GUEST_ADDR_MAX)
 #endif
-#define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
 
+#define h2g_valid(x) \
+    (HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS || \
+     (uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
+
 #define h2g_nocheck(x) ({ \
     uintptr_t __ret = (uintptr_t)(x) - guest_base; \
     (abi_ptr)__ret; \
-- 
2.20.1


