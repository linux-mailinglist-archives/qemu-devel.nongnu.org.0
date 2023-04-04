Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5586D67E6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:53:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjixT-00074q-2p; Tue, 04 Apr 2023 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixP-0006y0-L7
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:28 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixO-0004vC-1V
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:27 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so34438782pjb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9R9GD6a5x0X5fiS0AURv/OzVq7uoVBoB3Uzt4Bd3ql4=;
 b=vaFmB4pI4RYzmPInFTyXNrF+lN3ZDl5LPHXVm8Kw6qJ8Jc+O4tkio0h/1Sq5alpkAD
 Kv7qohpQiOirSR38gsoh+5+1seWeTtdqUhO7Y3AWiABn7s2p1uFKG0XIbaOkCoVd7h7Z
 taR99dmyTIwfSd5hFoRHjfT+tHvO7iGzzBgWz+3eLgnVQd+/4Dj4YLMzO2uNXGH8bxoD
 TUHpc2psVUosnjYGE+Y76srWxptMgaFA84ryPaElBzP86tPdEhGxhQfgXAt6HuBpvTta
 hVEtMKHHpbg69bINzBwJWh8Bkq/kVscsITEHZSxRI8EEbUo17rumkaPeCh12acCt0Z8L
 bJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9R9GD6a5x0X5fiS0AURv/OzVq7uoVBoB3Uzt4Bd3ql4=;
 b=TC+OkdZZDE3vN7q1HeseSQOE1Auf2Owtm8wgy4IM0Xtfb2OqP4LGJAnkX6d/snAYce
 iyKjlYJ0Qf/ty38YrAZHljrtgJsW7/TTOkvKRpMAApa28fWExKxJ8tez4K+gkDqe/8u9
 aW0jOBjxWqlGx/ozIDmGEGBrxOHpGJFow3AY8SBhb78CXTwiQSNh4Ec3iE5UCMut5p6X
 ZKAJhoQPN5x+/vBFhS/nUOw3ZrYDj2uMdUZGFsOZd8FSrAC8zNJWZtwIvYvXehDwQHVW
 GiPPL2ZIimPcqfXEV3UJCughIi5bLvg3m7z/B/oOy/3KrNOcK0lU9kMF8CDLSAaVsaTB
 vWaQ==
X-Gm-Message-State: AAQBX9fQ5tl073fTYvdCnVPvqYzu7zOXhLwIFT1mOSc4HeNBUPfQ1DzU
 fXTBuXwyQHc0C0suJzS565U6Wq/JAoufWSU9MyU=
X-Google-Smtp-Source: AKy350ZRfsWaOl8HhM/MPdo99FN3pm93qKKUUpslUyI0oPJzEvR8mvPAf++CwbCglMh5f0frOqJmYA==
X-Received: by 2002:a17:90b:4d0e:b0:23f:7464:ae55 with SMTP id
 mw14-20020a17090b4d0e00b0023f7464ae55mr3483187pjb.0.1680623544547; 
 Tue, 04 Apr 2023 08:52:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 nl5-20020a17090b384500b00233ccd04a15sm11562013pjb.24.2023.04.04.08.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PULL 3/4] accel/tcg: Fix jump cache set in cpu_exec_loop
Date: Tue,  4 Apr 2023 08:52:19 -0700
Message-Id: <20230404155220.1572650-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404155220.1572650-1-richard.henderson@linaro.org>
References: <20230404155220.1572650-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


