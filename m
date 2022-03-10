Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85554D460B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:43:15 +0100 (CET)
Received: from localhost ([::1]:58816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHCM-0008T3-Qo
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxJ-0005E6-Qd
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:41 -0500
Received: from [2607:f8b0:4864:20::434] (port=45825
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxI-0007wj-BT
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:41 -0500
Received: by mail-pf1-x434.google.com with SMTP id s8so4819018pfk.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FucOuRxzk9AY38GO4hr3Q5xePPb7ussh8W5FYQ6tFWc=;
 b=zxPuKA7Hj06xHJ9eBovLJbCbsSSPPteW3CWWNEGxJ1MFPYRQ15Up0u0mCBdHZHGvtO
 DciqIydZWgrmWTGcihDoJchF1tcbSqvo1dIivGv0lUIWOgRVYMdKnRVlNdAerCi34J9G
 tsak0K0J7G4FWSONXN2c0NwGsINxFyoOVK1MOk2EFYWWyOmVCBcEMBfxAENo6K/lB/to
 GlWI0YQUT/YDAO9oOiPvAvC+6ok+9z0xXUQxdUK2spQB1lJa2fAf8cMBA3QinF4rpkAr
 g1ZKhW0UtEYJNxzOIXvVg0YPe+5iAbkOWnsdBb1KByLHTqDDH607YwabpdbGEdXCfcT0
 MO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FucOuRxzk9AY38GO4hr3Q5xePPb7ussh8W5FYQ6tFWc=;
 b=gTWKYaUS4cRWwRrPCtSQvNr+Cq9jg3FV8wQxmGnoDXe4rcRlY7I+akKzo3cQPp6VnI
 NRnbiMGJb48B4tXLd5JeKU2FhshueyOMTk/kbYqRuAoj7yAseuDmzfF0vPS5vVArDebW
 d2AeMxObrwH26gQggsvBXE6kcWsQx2wANebkL41oprfhNDaG+yKdpvL68LLgn43TNr0/
 ye5p6jph9cj6l4GTX/i58J0gkUbyku2V57uMk/DI7OrJONIOpqaIpuY19FQLeXNW/M76
 +ldz4yz0FFYyJPO2IVcymo6RPl+tS7ogiez9MVZMNO6jH5MU7snp9kKjezT3xKafbSfd
 4+lQ==
X-Gm-Message-State: AOAM5318OI6SF9bjnv105NzXsphI8e6EqG+D02aFORobqC/RODzXMBFe
 X6D6nf/8GZePg1BZCC8x53zxlwVPMQPZ6g==
X-Google-Smtp-Source: ABdhPJyETTV7aVSa2EbYGC6xipv2hloYVX89KXpLx/UgzGgpwB15XTVjJ54A/uEic7qxTlpEgHAgNQ==
X-Received: by 2002:a63:34c1:0:b0:380:c330:64c6 with SMTP id
 b184-20020a6334c1000000b00380c33064c6mr3700460pga.442.1646911659089; 
 Thu, 10 Mar 2022 03:27:39 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/48] target/nios2: Do not zero the general registers on
 reset
Date: Thu, 10 Mar 2022 03:26:48 -0800
Message-Id: <20220310112725.570053-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bulk of the general register set is undefined on reset.

The zero register is for the most part special-cased in translate,
but the slot is still exposed to gdbstub and nios2_cpu_dump_state,
so continue to make sure that's zeroed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 182ddcc18f..97bdc0a61b 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -53,16 +53,16 @@ static void nios2_cpu_reset(DeviceState *dev)
 
     ncc->parent_reset(dev);
 
-    memset(env->regs, 0, sizeof(env->regs));
     memset(env->ctrl, 0, sizeof(env->ctrl));
-    env->pc = cpu->reset_addr;
-
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
     env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
 #else
     env->ctrl[CR_STATUS] = 0;
 #endif
+
+    env->regs[R_ZERO] = 0;
+    env->pc = cpu->reset_addr;
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.25.1


