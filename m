Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E434ADA81
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:58:07 +0100 (CET)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHR0Q-0006CV-64
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:58:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-0000lB-Qs
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:08 -0500
Received: from [2a00:1450:4864:20::32b] (port=35358
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqi-00023h-68
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so1168429wml.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MLlizRXZn+AMzN5F3UlrBZo/pdTn0HGKf6NjWxwcDQI=;
 b=jhbzK6v/Lt4fpgFmTTr0Z6bbjv4z8NyTRdqofCZWYGKnGimIjNOMzNw3XLcjkgKthz
 vBI+SR8LRPx2CbH49WXnmNcuUWFjPpUU0Hy04yh5TwMLcihw7pZyQrMV74DwGsE660LI
 QoR0kKODhDWebG8lcmCALXs/S6FIFDQ9nj7xlvkMAFGeZCPp8047A7L2IdK+43chPLit
 zTVKg9Qkgxo2G8HawaWic2Txto3+efcbav/OhhAeofXmmhEkVvlYnjNFAVE7gybhqDDv
 AksthJ1m8mFucivIASIbCXe+NBr2h2eaIu7RN9wAuaU7eyGXHNWiG1CauBzVtjLPetCP
 lwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLlizRXZn+AMzN5F3UlrBZo/pdTn0HGKf6NjWxwcDQI=;
 b=cf30LHPu0cBbkLnbJLZh8GIBgRf4w1376d7XDpQAv+yXmCRb1YjczFIGjmjWAe7LtT
 USPoCn72a6rA5spGyIKoTRAmg2vwVNMomGYQFioDmbNzCQYnvlyaHazmc020cFFXneQJ
 pddym0FLXOHwz5m3mdRTT50vLngKAZISfKvHkPrm4VD+C5EF1f7w566p+xwK3SHXYjaG
 0svPFdCi0IBCnOFL7XjJsBxLDLuyoFqZdsbP8rWR26DAD4OiiCA0D7bRKsIXJ/4PPmFU
 0coqQFOVDHrO9MpUYxQ/R+ikUoBnSw98QWqi8WzrKq8e2FWaw2j+WZEefpIr2ORVmGOm
 sQng==
X-Gm-Message-State: AOAM530cc6SMq+s3ZRgVTy0etQDKkKca3ieIu309n+sLUzkmWQriJVnD
 nugVMC2FAgG8RHwBZspDcUCU4+566sLZqw==
X-Google-Smtp-Source: ABdhPJyldudpdpX7q9p8NBmExrHXKz8AkiBEqayPd/vggwtNi8cjstT4SUylXn6omfWxDIawWuVSpw==
X-Received: by 2002:a05:600c:1c23:: with SMTP id
 j35mr784317wms.138.1644320393071; 
 Tue, 08 Feb 2022 03:39:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.39.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:39:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/39] target/arm: Use CPTR_TFP with CPTR_EL3 in fp_exception_el
Date: Tue,  8 Feb 2022 11:39:13 +0000
Message-Id: <20220208113948.3217356-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Use the named bit rather than a bare extract32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Message-id: 20220127063428.30212-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 83bbb446e70..b5f80988c90 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13037,7 +13037,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     }
 
     /* CPTR_EL3 : present in v8 */
-    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
+    if (env->cp15.cptr_el[3] & CPTR_TFP) {
         /* Trap all FP ops to EL3 */
         return 3;
     }
-- 
2.25.1


