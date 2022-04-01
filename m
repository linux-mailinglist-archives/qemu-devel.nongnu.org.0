Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A634EF8B2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:11:39 +0200 (CEST)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKoE-0005go-So
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:11:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naKkg-00017X-Ps
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:07:58 -0400
Received: from [2a00:1450:4864:20::62d] (port=41720
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1naKkf-0000A3-7V
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:07:58 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bh17so7149844ejb.8
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ol6Iq8HzMeCSHquBXp+1jGoaZTsZL4o5pi/zGZ5C2uI=;
 b=YBlLGR3uYGmUjnjKB7ldpl1Vay/UlQyNNav9fCqrbMCkcIwTjIxyV6aSuGde77vuHL
 f4XnSxmkWcyP8DimHv0h5XMapAQ2Fiwkq48hCBIFPIno9idrhAx3rEbhYKoXC1ms1ZX9
 hKN9QjSsAut9ZXMIcV/WnJUlE9xGbSFHJlxM876WH5tVsY4gH96ndwcSOSBjms02ErNr
 robr+zx7HF1xWbi7TjShvJByNWV5h7VYCL7ms2LLiYKDajZ6zrR1P7QKWKIQnaRJPzEX
 Hxw3utfPsfOdTAMMgquPTXeUGQNg7+2sbLnRow9BpCYkbCiAIRd/RtwCWg2Ru9hkiEwb
 iUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ol6Iq8HzMeCSHquBXp+1jGoaZTsZL4o5pi/zGZ5C2uI=;
 b=f3r3NMMBV8jiO+tgeMTklqpER3oKCJpaZpTXZPUSCBhdyZOCJTdB9aJz9ntkm6swJ8
 Arr/NUAx5VIO812MjUTMwPT4iDydOaDgynhKn1szI5b4p+D8UUQEHgSszgQXx34vVB5l
 DAmKY5OF9rz2GshhlxuRnxxUv5Kx4Y4m5DmD00wLKOIII6FS3keczxtWIZ2X4ecBLqBY
 oWRq8dd6ejyhaDvQxvxN996mNwW2bkRsvqUj1zGkDN98oRpbfXQGowT/NmJalwK9QBue
 LktOYJ5Gsm1TsMoYsFtbohGV3u/Ml4mcc5RPFeLoGiCRI1hSqlHPmf1oijfaqDF3/Kth
 SB8Q==
X-Gm-Message-State: AOAM531XWtFtb+JeX/mS7gE8cTqrgL3JZFNcysJYssBXStLNur94hgqM
 wk2Tbm8euMkZ+Ws05OKUuWuCvaS131pkSN9Sp2g=
X-Google-Smtp-Source: ABdhPJxirYFpz7xPEI+/9B4BnqVdLI7mYF57R1WBcj6zrJi5HjyQfN93MYEzed56Ap1Ppxf97FXEDA==
X-Received: by 2002:a17:907:980a:b0:6db:799c:cb44 with SMTP id
 ji10-20020a170907980a00b006db799ccb44mr651058ejc.485.1648832875634; 
 Fri, 01 Apr 2022 10:07:55 -0700 (PDT)
Received: from localhost.localdomain ([185.81.138.17])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709067a4300b006dd879b4680sm1248506ejo.112.2022.04.01.10.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] accel/tcg: Remove ATOMIC_MMU_IDX
Date: Fri,  1 Apr 2022 11:07:47 -0600
Message-Id: <20220401170747.318545-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last use of this macro was removed in f3e182b10013
("accel/tcg: Push trace info building into atomic_common.c.inc")

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c    | 1 -
 accel/tcg/user-exec.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2035b2ac0a..dd45e0467b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2552,7 +2552,6 @@ void cpu_stq_le_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 
 #define ATOMIC_MMU_CLEANUP
-#define ATOMIC_MMU_IDX   get_mmuidx(oi)
 
 #include "atomic_common.c.inc"
 
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 8edf0bbaa1..ac57324d4f 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -506,7 +506,6 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
 #define ATOMIC_NAME(X) \
     glue(glue(glue(cpu_atomic_ ## X, SUFFIX), END), _mmu)
 #define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
-#define ATOMIC_MMU_IDX MMU_USER_IDX
 
 #define DATA_SIZE 1
 #include "atomic_template.h"
-- 
2.25.1


