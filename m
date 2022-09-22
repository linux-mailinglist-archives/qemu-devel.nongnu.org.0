Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58645E692C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:08:01 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPg8-0002WZ-9y
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB8-0002C8-MC
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB2-0005Np-3p
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id ay36so7182552wmb.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=aCTJbIT8uO+HceBgWHPJKhsRADhgD74hU3NYWDoWeL4=;
 b=KviiahCsT9elya7/QG2Ndv9rakhOxG4zyjAYDzP2xOvz1lfDgrhrzUpPn0peSgtaxQ
 yc4jTGCIj7VPhIkk+7anSv/VIy2oLVpoT4Rwp1aDwO5NBcMbnGoCe4cTKId08lfcgA9T
 tknHRX6AhlMmFlQEELZRDrkAiGq/OCzTDQg0NA5MRKRjMOkfDtyjwclQ4t42lTsnUQLQ
 PidfEYSk0UCkzItZw7cMhKHgOTJRJ7Y0sxy27ftSvLaV07A0F3Hizbsmqz4iE8p710/D
 3Pd4+lBkmv20LwTizKg+KBIJ6ivrr2a/t6QblV8F57fPA1y5j/tcmxblV2YZZ9B1Ni/9
 0t5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aCTJbIT8uO+HceBgWHPJKhsRADhgD74hU3NYWDoWeL4=;
 b=L3b7xt16eYKugM/6M57IlhRBuDGl6m1CVyud3CKiw3o9wpnS1OTfG0AEeoBW563V9y
 8//3cITMyuJdoAk2+R1zyAJnL8shF/ajh+/Aj2/6mLigaKLq9lAzqH41di8DI2N63ii0
 bFjtRlFlNgWPk5blLSO7MZXnAsY0eWPK0tzxQSSYxnTQ9Kbz1mA4bFsROkNDUj0tchMp
 f2+tnjIhPoG3BhG/WjRaGJIJuK1Gugf1MQgV20X9UTW0N5ZpkiwdUUqh4+eibt2lJL9x
 D/Chir4a38R+k4ow8CZ8+jB8a6pU4V7kbKNJcfJLPrO7MKuyaryGaCDDvAfsglasmgwU
 p+pQ==
X-Gm-Message-State: ACrzQf3TddaHg0N2l9XZ4sQ4H3lXGCe6dc1kjFCt+ZDA61vswwl/RDRP
 eAsPr2O+OxuE0jaa0nFG7myJK+FoG6x34A==
X-Google-Smtp-Source: AMsMyM5cEQPoIgyVulyEzNSDs6AwpPHfDZUSfodmwTTmfvUgfGvXVuq5UlFyBfRNRL4m8C2/GFCjVA==
X-Received: by 2002:a05:600c:350f:b0:3b4:c5f2:4295 with SMTP id
 h15-20020a05600c350f00b003b4c5f24295mr3098059wmq.200.1663864551125; 
 Thu, 22 Sep 2022 09:35:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/39] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
Date: Thu, 22 Sep 2022 17:35:16 +0100
Message-Id: <20220922163536.1096175-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remove the use of regime_is_secure from get_phys_addr_pmsav5.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-21-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1e81eefa47a..2ddfc028abb 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1349,7 +1349,7 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool is_secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
@@ -2421,7 +2421,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.25.1


