Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E6451C9AE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:54:36 +0200 (CEST)
Received: from localhost ([::1]:41190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmhYZ-0003NP-OR
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZG-0003Yf-Ur; Thu, 05 May 2022 14:51:14 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgZF-0004oH-Bv; Thu, 05 May 2022 14:51:14 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 z15-20020a9d65cf000000b00605f064482cso3519111oth.6; 
 Thu, 05 May 2022 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=muPBgEzm7e+VquRbAm5msMUbmbtWtrchg3IRMQerwGM=;
 b=Yg9UDIQ4LfpZl0oL3M5VjE1WP7gmpNuLH0yE6FKTdnmZpP9k+G5fQtsF/Y4IteWYXM
 /D9DZsnv0wKO8KW1XzKDojL3zj1ayzh6KgkACdjUjB6DfTv9mDHwcInodWl2e9XAMfbT
 Gzri6XalEfrQ8iNRN/n98+bLK6yGQKbJCjTR3fLo6ZHqOABEFzrdlO4Fv9v/vy3E8iDl
 1JcAM39oI1aLy4WF5DaaXptz2WUSO2UT1cfoNoE5+8i6IlJNegjLeQfiVn/CWieM4Vjv
 kLabJJPjCC+SLpvgY+h5b9Rno7NryaSNlNcZ1g8JAjlW86LMM+/XYfHxVNma/ccFyXx4
 BNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muPBgEzm7e+VquRbAm5msMUbmbtWtrchg3IRMQerwGM=;
 b=OOJQQhy/Qld14Z8TziHR39XGUu8Ih22h41CVkzO7WkfmhdNz7wQm1Hjuffs68TP8Rs
 2wl8DeBYf7kZrC5BDVAWftGo9oIu15+giCPLCVUPmJRh7zcRGdlZR9q8XVwRL088MusB
 FoXyOotTnpo/ncW0Lz5xg/CLEBRPbYzGvq0kHi/N7hM965yzzUZjaD89f7hkoHaMWq3n
 kt8HoEczmv7xV9dUumXv2X09d4f/nb+B4zcdGP4bQY4n8kUOlbYATYHjNMkdPfkHp5Lu
 kgNkwT31b/vv5L4TW1E3BsepBRviJZIBmv5bGW1NLqZ1Dz+qWG521GTL+olRK6nzr00n
 A8iA==
X-Gm-Message-State: AOAM533feG0/6kTXgNMhqIfFQ+lBb9bUH0UaId+Hduc8B/E0c1lKZIZc
 xMw8r4RNacljNfzOfM6wvGQL8SKE6d0=
X-Google-Smtp-Source: ABdhPJw7WzU5tfHEC7ZZbilspfIdJ88u6zi96WV8hvof+xGHqzeocs5nuzG0So/S83CM0Cit9k/lVA==
X-Received: by 2002:a05:6830:90b:b0:606:3c4b:8efe with SMTP id
 v11-20020a056830090b00b006063c4b8efemr4453443ott.103.1651776671169; 
 Thu, 05 May 2022 11:51:11 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:51:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 21/30] target/ppc: Remove msr_cm macro
Date: Thu,  5 May 2022 15:49:29 -0300
Message-Id: <20220505184938.351866-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505184938.351866-1-danielhb413@gmail.com>
References: <20220505184938.351866-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

msr_cm macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220504210541.115256-14-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h        | 2 +-
 target/ppc/mmu_common.c | 2 +-
 target/ppc/mmu_helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 17b7f5f6d9..75a81d4304 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
@@ -480,7 +481,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #else
 #define msr_hv   (0)
 #endif
-#define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 7e77b9b84a..031bb4493b 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -692,7 +692,7 @@ int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
     hwaddr mask;
     uint32_t tlb_pid;
 
-    if (!msr_cm) {
+    if (!FIELD_EX64(env->msr, MSR, CM)) {
         /* In 32bit mode we can only address 32bit EAs */
         address = (uint32_t)address;
     }
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 5bb5c71038..15239dc95b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1003,7 +1003,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     /* Add a mask for page attributes */
     mask |= MAS2_ACM | MAS2_VLE | MAS2_W | MAS2_I | MAS2_M | MAS2_G | MAS2_E;
 
-    if (!msr_cm) {
+    if (!FIELD_EX64(env->msr, MSR, CM)) {
         /*
          * Executing a tlbwe instruction in 32-bit mode will set bits
          * 0:31 of the TLB EPN field to zero.
-- 
2.32.0


