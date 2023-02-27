Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE046A4F14
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:59:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmSB-0001PZ-HP; Mon, 27 Feb 2023 17:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS9-0001OZ-EV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmS6-0008Uo-PS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:58:41 -0500
Received: by mail-pl1-x644.google.com with SMTP id ky4so8513669plb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0fgtLVdBUMwB3yUfv+ziuHCcXc1on+zqZqgclTP9ko=;
 b=J9DPPP0suABEI6AAP/0AxcqBSDcv2wwGPNnys3hbNp/6g9qWO6J45t5/sxA4Q7yvvN
 RlA5s2R+DgWJzGREp7V9we7YUuSfB8tM4aoGUWS+q7etimdcy3nqpI9/FZ4mAzbIJZpP
 M+IvHP8XoUjy7l9HCqeCKMSK4knSKVCWPhbStpRX0SONbD3cCUqGl50p+7aHanfN4bHp
 SGti50OODFC6Ts1hDw89Y68Iuilt8Y596e4UFzXTxHAEFidg084PznZszsu2metDvnRc
 Tk15ETQ12JCebVvsnqLykFZ6qulFTZ/YA0L64HLoc+fQih4HbGNKiv4se5rbmLU6evqG
 V8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0fgtLVdBUMwB3yUfv+ziuHCcXc1on+zqZqgclTP9ko=;
 b=iZgcGsJqUvu2r8GU7e3rjVCvfcRaI1WmCKubRgoTHsj42CJDcPCnVZ0dUJibBl5moP
 hMyKbpjYvqC6h7TdzUdPz9z2Uix76HKmQtYKnAQS2tVU10w3NDP+td/0w2w+VIJfGlHv
 dZfWdFALU4hyxhWFl6pMgP5lkDcwDV6OUEMVHCQdftfIa4gf0DCB0Dc6undzGYQsLvAy
 KY7cQqDTt7ofBtvaAnlF1cAPujtLwweNX0wcbJRWNBHkYyiP5+KbZLWwg1rEOxd+H8eP
 3voZPX/ERyspp8ZxgOMjUGq5XCVKy0YQZjdS2j+/w57ocwgg3Nx5ynAbdThJJX6Bj83N
 Yjyg==
X-Gm-Message-State: AO0yUKWGVwcXzOU/ycmDpaut30sU43Z5z9a2Ba8Cpa1jZKgQbjpX9RwH
 q6ci4oeYEqC84i1Kp5ju0xptH4efLz5s0wWnUU3T+w==
X-Google-Smtp-Source: AK7set/xctpDdfXTPcQmx99FkP06/VAYBYOjwQ6bR9YtsLVde1SgYgirW6SH8ErP2wrBWyLZZATlBA==
X-Received: by 2002:a17:90b:2248:b0:237:8c42:27bc with SMTP id
 hk8-20020a17090b224800b002378c4227bcmr978712pjb.13.1677538717315; 
 Mon, 27 Feb 2023 14:58:37 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a6566c2000000b00503000f0492sm4441050pgw.14.2023.02.27.14.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 14:58:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 1/4] target/arm: Handle m-profile in arm_is_secure
Date: Mon, 27 Feb 2023 12:58:29 -1000
Message-Id: <20230227225832.816605-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227225832.816605-1-richard.henderson@linaro.org>
References: <20230227225832.816605-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..7a2f804aeb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2426,6 +2426,9 @@ static inline bool arm_is_el3_or_mon(CPUARMState *env)
 /* Return true if the processor is in secure state */
 static inline bool arm_is_secure(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return env->v7m.secure;
+    }
     if (arm_is_el3_or_mon(env)) {
         return true;
     }
-- 
2.34.1


