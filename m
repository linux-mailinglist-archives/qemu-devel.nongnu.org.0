Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0982430E9DD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:55 +0100 (CET)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tzu-0000xN-2P
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiz-0005Hr-Ew
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:25 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tis-0003vf-8p
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:25 -0500
Received: by mail-pj1-x1030.google.com with SMTP id my11so4244205pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ybRVe+0cbcMgdImiuixof8hM4eoxKsh03sT+tgpyyEY=;
 b=GHN3icFQ6n/hCBrkLU111p16ZGoNy4IkqtDhhAhxbQ4VUvo0h7i1xVaTA8/P1JFqgk
 TObgtqagdhV6fvK5mm7HVMAkm8y5Hc5d0vzIRSqYama9vfdgYT5ncAwJ9M2ynPj9gOrw
 PFGrdlQlJipd8fjw9et4Hzu/pUsB8ja+2HzuFms7OMco2NUJ15Eh6SfQLrr22Ofrd11d
 z/vpESOUsbdCGob9a8g/ndbJjlG9yj43m0kOG/CzRmLxGEaHDek6o27Bj6bmj3CSR62c
 /WP/KFnDIhO1Mbfm5QvBU0WW5vdowqu8jCr49cRn44AsZPAO88DId3tgAFxgvuWIJdj9
 Ga/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ybRVe+0cbcMgdImiuixof8hM4eoxKsh03sT+tgpyyEY=;
 b=SZu24ANiQaNtaRDcZbu02FSuT2Z7MO7X5vDvVG7DiE115UUPTFIz43kBaOMtRr2j5/
 zV3JwY2fFJGhWBR99PsvECSyePFuojFSOUbTZp1D1IGvKUYd1W264WD2Bih2l3qojSW6
 MQGI2ks8PItbAmQd8PnN/eLEps5YP1RXYCiRn/O1DUIOuD+rehDhxgBl66mB2XK1zVnQ
 7LyyaRt6s3wmMDj9IeE0CZI6mSRFQIkORBXbBPjk7uzowbhAFDeH8bo+rNvkmoORiwso
 s2P3/Jc4xfODY8G51Pqo/g9gADU7rSBEoj9csV4/5J5T5hGUi2p0Txl4Trn91kMdA9iw
 bHBQ==
X-Gm-Message-State: AOAM530zx9ocM5GeWL0KG1j7hgwi6syCAOR3f2qh8Q2R41YIBG397hFg
 Uhgo+dYqlwWxoJaoaXYNbYp0+8opETyrXQh0
X-Google-Smtp-Source: ABdhPJz1i04Y1KVn1EKFb576LT8Z6I8pISzzXGFfWUtOEzSTH1YRMwExES7JsxFvselz1L5I6m+9mQ==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr5790883pjb.116.1612403175863; 
 Wed, 03 Feb 2021 17:46:15 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/93] tcg/tci: Remove tci_read_r32s
Date: Wed,  3 Feb 2021 15:44:11 -1000
Message-Id: <20210204014509.882821-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext32s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 72ec63e18e..9c8395397a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int32_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static uint64_t tci_read_reg64(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -149,15 +142,6 @@ static uint64_t tci_read_r64(const tcg_target_ulong *regs,
     return tci_uint64(tci_read_r(regs, tb_ptr), low);
 }
 #elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register (32 bit signed) from bytecode. */
-static int32_t tci_read_r32s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int32_t value = tci_read_reg32s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 /* Read indexed register (64 bit) from bytecode. */
 static uint64_t tci_read_r64(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -887,8 +871,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r32s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int32_t)t1);
             break;
 #if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-- 
2.25.1


