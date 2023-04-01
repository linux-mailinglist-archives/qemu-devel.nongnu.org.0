Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634BA6D2E36
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 06:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTCt-0003r4-OD; Sat, 01 Apr 2023 00:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCr-0003qY-E1
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:13 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCp-0003PJ-L2
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id u10so23318833plz.7
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680324670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bGxmCesttnNxUtKHDP3pWQs68ofrrfygUflIUG0Pek=;
 b=t/izS8NMP7K+fItsIFZdOqlV+fhWYjouDJCX21+WtsH8jm1BAjOvd9xLUaU908Ktq6
 xtx1RShsy5Vxjz0nXL81Jc1k3qzPPotq4gNwn2/WZD7Twl5xv2ss3+4dwrBRDjjX7pkG
 uFTDLuaPU8n9A+2MT08cxsdC928n+eGWFnkSJXG6QgYNBXnDMxzhnW16AK+RRJ+CVIJD
 M3qLZXalnzfWoboYVRJBRwkgiX6z0FVQxuRhBd5P0w++2CJdTofcOZr31Q18z9EWH2yp
 CoJ267vkVpIdEPFIwf2/iFwP8ycHAaAAFx1y9lj9bJwPFWKUhyNsRZIQXzU/7DWDeRDq
 OoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680324670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bGxmCesttnNxUtKHDP3pWQs68ofrrfygUflIUG0Pek=;
 b=BtRlHDLV5mV9jo1msP4Camto/JgAr4j/qdLYFgeGek2Y3+N/75JSJgbCLVXJfn7h+/
 BAFpy68aEAg3JvMCFt9l2vyDWDYYqHsgPYxIMhiWnr94BTim5xf9UEmqK4xgNLlbgyZs
 F8C8N8JEN3nqOPSBzLkvnAynCPCNSMT64nNaE1/SmeW1J4PCLPH+YD7PI4e3VHvqBIB8
 6mxL/9CRbEqVVn2qQ8LvPYgt0r0srG44mwL3K9l1CPxNKPJS1LMPGVE30a/lG8FRNzTD
 H/u510dTxaHWGKfxCCFPEv1qFKUMYezbg9192f1AquW3Jj3BF0/A5g7mreZ1rF1H4WOM
 IcAQ==
X-Gm-Message-State: AAQBX9dN42NHFb4EahbdHlar3Wr95jQtZ57IE92cJgwgUGBYBcbEQG7s
 EzzjqOEmVUW0DmCJDv/43v9k5dGHvZlx2ZxdWsQ=
X-Google-Smtp-Source: AKy350bhMJvj/jNPox5UtLhzjSED9Z/Hh0Ocy0Lw/4derAMyOG3929bEq7oeHQ6ryo5NKYNIoShwBg==
X-Received: by 2002:a17:903:2290:b0:1a1:a727:a802 with SMTP id
 b16-20020a170903229000b001a1a727a802mr13180560plh.19.1680324670262; 
 Fri, 31 Mar 2023 21:51:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001a24cded097sm2360122pld.236.2023.03.31.21.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 21:51:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH 3/3] accel/tcg: Fix jump cache set in cpu_exec_loop
Date: Fri, 31 Mar 2023 21:51:06 -0700
Message-Id: <20230401045106.3885562-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401045106.3885562-1-richard.henderson@linaro.org>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Assign pc and use store_release to assign tb.

Fixes: 2dd5b7a1b91 ("accel/tcg: Move jmp-cache `CF_PCREL` checks to caller")
Reported-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c815f2dbfd..8370c92c05 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -257,7 +257,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
 
     if (cflags & CF_PCREL) {
         /* Use acquire to ensure current load of pc from jc. */
-        tb =  qatomic_load_acquire(&jc->array[hash].tb);
+        tb = qatomic_load_acquire(&jc->array[hash].tb);
 
         if (likely(tb &&
                    jc->array[hash].pc == pc &&
@@ -272,7 +272,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
             return NULL;
         }
         jc->array[hash].pc = pc;
-        /* Use store_release on tb to ensure pc is written first. */
+        /* Ensure pc is written first. */
         qatomic_store_release(&jc->array[hash].tb, tb);
     } else {
         /* Use rcu_read to ensure current load of pc from *tb. */
@@ -971,18 +971,27 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                CPUJumpCache *jc;
                 uint32_t h;
 
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
+
                 /*
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                /* Use the pc value already stored in tb->pc. */
-                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
+                jc = cpu->tb_jmp_cache;
+                if (cflags & CF_PCREL) {
+                    jc->array[h].pc = pc;
+                    /* Ensure pc is written first. */
+                    qatomic_store_release(&jc->array[h].tb, tb);
+                } else {
+                    /* Use the pc value already stored in tb->pc. */
+                    qatomic_set(&jc->array[h].tb, tb);
+                }
             }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


