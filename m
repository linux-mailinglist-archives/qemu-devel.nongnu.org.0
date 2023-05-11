Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C36FED75
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:06:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Il-0006R3-IK; Thu, 11 May 2023 04:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IJ-0006IP-MX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:00 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IG-0000wG-Ic
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:57 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so14640593a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792294; x=1686384294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/cqb6SMgF1kpXdbzqQmLZE9A6UROEDFcMPbJJOQUicI=;
 b=Xs02Be5cmIK9kX9TFgLLekEfry3HIJctMtTxyqZGQzdcLH8nu2vMtCxHaEumu1zALa
 x5kQ98Tsvz9CT5u6klgt8UrYdfLltC7GSVFECc0BDklP1IOq2/vyJQOw2XCsWumACQ4L
 bIVf56cAEgwHYl8tAnEecERvwD9UE4v6zyh+Syj2WX+3m5THJnGr3AhrI2ZeNA3xwfCt
 4UzhDRGxyE/NGXbiORcH8Ve7wseMgqdV//9Aw+UbMex0OfzVxtAn4N/J33fVA0NcfF9L
 zmNsCbJjf117CCzeIV85blFUHltEnU5TlC2bh97uTt2vDqawkNDVIRj00HiNpm8zkpBZ
 QuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792294; x=1686384294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/cqb6SMgF1kpXdbzqQmLZE9A6UROEDFcMPbJJOQUicI=;
 b=OsExUxxA85LS4aQmbQxG7xUT/RNDC17RW8/SWWJULuruUe55PvtJLpEc192NlrxGkB
 wZyPXGZdBJLhbGRRRX8hIa+muaLmfldAOtxW/BNCmifyaKBjhEoamXfVWCMuSfiOPkub
 vYASpG+KkWp34LgzMa5bari7cdyspfQjQjSm/nSuCQa/AqxNW+hDRKz3qhbuTlDANqqF
 FDP+k1TH0eSgVTKa13wRDwY61fm5Or/LKewvEYLL4ZqPi9cIEb5whSj+fBsKzbaUp+RB
 g17FH+2BntARWAkj27vGxvXznCqmTwYcb5daXmisHrrQesZIRSCR1HX3IHMnuC74WuGc
 dBBg==
X-Gm-Message-State: AC+VfDyIr4lti4xCDxfL8/jKAtNyv+4nWeOozj/piRiQEc9zCIg8+2vX
 RtAlUSHW2/A+fp4sbExJ7bpqJjS55wWGU+U3qoh4qg==
X-Google-Smtp-Source: ACHHUZ5YDMP07NB8B96BMMQ2A3Lol1WEtKSwEtVV9ZY307tqXrgnMuFwaXY1Wp0pWbB6mugwYvldEQ==
X-Received: by 2002:aa7:d982:0:b0:509:f221:cee2 with SMTP id
 u2-20020aa7d982000000b00509f221cee2mr17314994eds.32.1683792294188; 
 Thu, 11 May 2023 01:04:54 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 02/53] accel/tcg: Fix atomic_mmu_lookup for reads
Date: Thu, 11 May 2023 09:03:59 +0100
Message-Id: <20230511080450.860923-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

A copy-paste bug had us looking at the victim cache for writes.

Cc: qemu-stable@nongnu.org
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Fixes: 08dff435e2 ("tcg: Probe the proper permissions for atomic ops")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230505204049.352469-1-richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3117886af1..0b8a5f93d2 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1835,7 +1835,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
         if (!tlb_hit(tlb_addr, addr)) {
-            if (!VICTIM_TLB_HIT(addr_write, addr)) {
+            if (!VICTIM_TLB_HIT(addr_read, addr)) {
                 tlb_fill(env_cpu(env), addr, size,
                          MMU_DATA_LOAD, mmu_idx, retaddr);
                 index = tlb_index(env, mmu_idx, addr);
-- 
2.34.1


