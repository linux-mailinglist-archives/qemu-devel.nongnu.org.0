Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062A677CBD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx00-0006Cw-Ue; Mon, 23 Jan 2023 08:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzj-00060i-Rr
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:23 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzg-0002Mg-Lw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:19 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so10622886wma.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t4bugJ+RO2MbQct6JNW9hnGo8RWEyhaawxl4hk6fSFE=;
 b=TxGjFB4lSqLFsidh7yoptsPDvTUNfCH+V992YeG9C/VBkayxVK1m5ml8X8pCk1LqPC
 6I5JEcKNSPXu9v1HNxEN8FzaVfFF8Uzw/bf1Fd80MSHs+tQMYj020yb1x52Tm9WvZt3I
 N2mfYOmNmXz4DX8f29jDn7Yakl2y44aea4kuxIpEtY9SAbR9DPP+Kv2pQVWRcGPVTF20
 JePZsNMS/g0S2GuRhIhty+3a9NXxhOzDsOYXboaYSm1ok6YhMtguA/XxSr8jT1zH8KMB
 Pnym2ECiBjmm/3x1YXYXOtTHDCLLQYAL4vm8LPkrg//PwurtVXvZ9VJUHPUBlk5CAKKR
 +EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4bugJ+RO2MbQct6JNW9hnGo8RWEyhaawxl4hk6fSFE=;
 b=tBXBzfEBRBnxV0ChwflLHwIQjZJq6irYe9B7cdYDrOjSTdmknTxQPUwoXZRNtws3ce
 vt0cULE5HNOHoPpKuWDe/mxYN5c67wGrpc1QVWZ9IL/TMIDSB6iOGmkn66p2esGqUk0D
 U4I6uLmv8+z8GxPnu1uoKzMX/Cr0R0dlVaivO2Pd7tgZswJFkYZWhNSn0cukdYmwWN72
 6h9R3sEhBILRZiIabmCYYUY8Z9MumMZ9o2w8/E/xAJ1OefeHegISv+dr8+8hq+n80KX1
 O6fJ5ROnjKSejUvwBRBwV0AUN4AKNJZeg5ZlGYaAU7aN5tiv3r4v5tQUWoVvOXtOEDKW
 uuOw==
X-Gm-Message-State: AFqh2krO3bNJcoqopXHUQ32Y1PfzsIW/8kzox9yV73lUEVqmm/zSYO5D
 iPwjD2Hw14W/mNU8Vl2wuthuwaLZdLpdrQZc
X-Google-Smtp-Source: AMrXdXuc54GJagnnK1NZugNbQYYFKH9QlJ3T7WjTZTKfrHSvvnL0p6U8lxFp7kqbFLVTElfJAi8Lfg==
X-Received: by 2002:a05:600c:5118:b0:3db:1e4f:7cdc with SMTP id
 o24-20020a05600c511800b003db1e4f7cdcmr16211655wms.15.1674480974548; 
 Mon, 23 Jan 2023 05:36:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] target/arm: Fix in_debug path in S1_ptw_translate
Date: Mon, 23 Jan 2023 13:35:48 +0000
Message-Id: <20230123133553.2171158-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

During the conversion, the test against get_phys_addr_lpae got inverted,
meaning that successful translations went to the 'failed' label.

Cc: qemu-stable@nongnu.org
Fixes: f3639a64f60 ("target/arm: Use softmmu tlbs for page table walking")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1417
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230114054605.2977022-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7c..57f3615a66d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -238,8 +238,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             };
             GetPhysAddrResult s2 = { };
 
-            if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                    false, &s2, fi)) {
+            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
+                                   false, &s2, fi)) {
                 goto fail;
             }
             ptw->out_phys = s2.f.phys_addr;
-- 
2.34.1


