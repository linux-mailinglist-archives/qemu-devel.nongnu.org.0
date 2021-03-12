Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E522338F4F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:01:51 +0100 (CET)
Received: from localhost ([::1]:40004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiMQ-0005mT-Fy
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD3-00030g-JZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:09 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCr-0001xu-WF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:09 -0500
Received: by mail-wr1-x42f.google.com with SMTP id j2so4841198wrx.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6fDdrR9WOa5+xYNyVXA0v2UZHrXBRHVTM/hJJzhmfuk=;
 b=AA0sk8/0eHsTJHQNIimB+ZLCS8R0y4PAFLF785VVDu3AybmSli2/h2Ab1uROVfIXnq
 rnnNkA6DxomZM0UlHqj6TjWdvSd4bdbpcNSXpe3Z38SxPYC3dQ1z5mqRz+hmT9xNsO0+
 tEPs/ZIIsUCqkC79hU9meqzk84cr+74dyiioKWVqEcQ53BUMR1chJvT+q0QU/LViRncI
 1B++bO0U3MEfkFZ7GtKBkUSKCDtzMxj/g9RDjPSSi/MBxlP3fUikZ3sqH1zVXmUNELtX
 8GsTjDSoaYB/0WVdLkp24qDpSmhOSxLay9ZAzrQ08ZRQSzutfSC7pHs81cKTHhFYFiED
 qv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fDdrR9WOa5+xYNyVXA0v2UZHrXBRHVTM/hJJzhmfuk=;
 b=agDVQdNlW/01OIepdwiXB1VPhQ8hQTX805LOE6hS62mDDh8A1AAvxzNnYR3gvG07y1
 yfFSo/IC6xHFBsY3LT07cCQ1hE6pdvC2y391UyZ34CIwvXj2yU3xTIrIGE0BTPs/3U8Z
 cGJWmFCGt8D9oWM6A300yrWMW4p1OF5Ju1QTUP4vKXZyi8wyw5FSUTWSRxa1ZVhHI5Kl
 xnaZjsbPBM54QVnFULTUUT7Syeo28o0Eo6z3k7f5YlQdvJYSqGXXD4JZKLCO8/pUVOA8
 KC/d5plLHgKudbZFljvCU14Y9sIxMqlqxVPIfh5IenhkIM8G2vOWYSv6YB2bk7i11xgO
 3ugA==
X-Gm-Message-State: AOAM531IpQRpT5x05Itn2C8+2MzCMa6MydCQvLpqLuIuj3oNV5xaOnX8
 efyZzwq5GPhjQvpnu7hLGVhK4xtKwcP+T51F
X-Google-Smtp-Source: ABdhPJycfpCubRVJrFBWNdVZeY+AWGBT+/1iQzMSeFPtgGGlu4E8KIM+wDZ8trLb9YUob1Q0Rizzmg==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr14048044wry.173.1615557110758; 
 Fri, 12 Mar 2021 05:51:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/39] target/arm: Fix sve_punpk_p vs odd vector lengths
Date: Fri, 12 Mar 2021 13:51:13 +0000
Message-Id: <20210312135140.1099-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Wrote too much with punpk1 with vl % 512 != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210309155305.11301-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2fb4b2c1ea2..981895a17c6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2105,11 +2105,11 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
             high = oprsz >> 1;
         }
 
-        if ((high & 3) == 0) {
+        if ((oprsz & 7) == 0) {
             uint32_t *n = vn;
             high >>= 2;
 
-            for (i = 0; i < DIV_ROUND_UP(oprsz, 8); i++) {
+            for (i = 0; i < oprsz / 8; i++) {
                 uint64_t nn = n[H4(high + i)];
                 d[i] = expand_bits(nn, 0);
             }
-- 
2.20.1


