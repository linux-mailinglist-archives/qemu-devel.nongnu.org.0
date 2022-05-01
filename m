Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD651622A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:17:32 +0200 (CEST)
Received: from localhost ([::1]:47774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2te-0005g6-Ea
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0006tD-NH
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001HG-Jm
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:49 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so1999133pjb.1
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhhRxFmH56xTpD71QaIiTZcsW/xl8vNYPr7Quyst7dg=;
 b=IoidiJAVjpYHJYpaNmM5dyMHt5gkkPKXVdHzo69NCflhxgswKv3i67XXX/DmQY/gE3
 5MhCKKxUDnhCzctCkPmRIoBvXIpccfTNme5A3NrkGtMQBBExe7y4APc/v4ydL9j6Mdj7
 f7R8GSp3f0aksfxHILCIQ6dMhC5sRR4Ug98PfTzlH1Aj9dwUWHsSPLS1ywzb4EG2QAwq
 UOp/DqZhOjUWEzRZA9MRk28JEI48o2sH8TKVT/yW9Z5VuvyYq65VZG0l8/yUasK5SbUk
 ENnrLkzcVp4fZDgHp4SZUUKVZlIJQrahipnsqc6Vy1M5gnSDoItjIJpTMQyBsXsmj/qw
 tJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhhRxFmH56xTpD71QaIiTZcsW/xl8vNYPr7Quyst7dg=;
 b=UolBCxiMjYQ31yuSWErdybpxmarGalSw7HtaRarAz029fRx6xNKFxeNsY6LuKfGQM7
 eT8dsUG4JpOUlLkeeG+2Lea2cjM5qb1mg4J8qQgrNkPtRq1MT6kgEH/IhmGggJosJR3d
 vA6v7sk7Rq/39+SDa+u+rXnTfRsVVOunWZkz3RoEQcNh38AtQNpHysUiU81/ajsTBter
 vATxeNmsQokqUosPSA5y8JQ7wUcN3TIUKCpca0N1010t1SRDCSsvCjKzYmm5//Reye9x
 5QYW6GelLLslgAK2lCM1ceMvLbGixEVEwOduAH3faS+zK43gNBZRts+GTtZIdGK+j1f2
 kNoQ==
X-Gm-Message-State: AOAM530dQBY9W5SrQLnVMZ96HqgbvhCERRZvhTZpGzgYHOjLeryLKTio
 d3iz8CzBKgFClfeFGqATgYYVzk4EfeJLKA==
X-Google-Smtp-Source: ABdhPJwlTc4jdXYI65zxfDAc3dMFRmq8uChaXImOxlVPEs6X52tBsqjGhqezdXbHitZrRK1Gfqni6Q==
X-Received: by 2002:a17:90b:3510:b0:1dc:bac:64f3 with SMTP id
 ls16-20020a17090b351000b001dc0bac64f3mr10422532pjb.137.1651384241444; 
 Sat, 30 Apr 2022 22:50:41 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/45] target/arm: Merge allocation of the cpreg and its
 name
Date: Sat, 30 Apr 2022 22:49:54 -0700
Message-Id: <20220501055028.646596-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify freeing cp_regs hash table entries by using a single
allocation for the entire value.

This fixes a theoretical bug if we were to ever free the entire
hash table, because we've been installing string literal constants
into the cpreg structure in define_arm_vh_e2h_redirects_aliases.
However, at present we only free entries created for AArch32
wildcard cpregs which get overwritten by more specific cpregs,
so this bug is never exposed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c    | 16 +---------------
 target/arm/helper.c | 10 ++++++++--
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e81d96c3c1..6e8b39dc9e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1069,27 +1069,13 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
-static void cpreg_hashtable_data_destroy(gpointer data)
-{
-    /*
-     * Destroy function for cpu->cp_regs hashtable data entries.
-     * We must free the name string because it was g_strdup()ed in
-     * add_cpreg_to_hashtable(). It's OK to cast away the 'const'
-     * from r->name because we know we definitely allocated it.
-     */
-    ARMCPRegInfo *r = data;
-
-    g_free((void *)r->name);
-    g_free(r);
-}
-
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
     cpu->cp_regs = g_hash_table_new_full(g_direct_hash, g_direct_equal,
-                                         NULL, cpreg_hashtable_data_destroy);
+                                         NULL, g_free);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index edfb5c3d38..44c05deb5b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8506,11 +8506,17 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t key;
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2;
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
+    size_t name_len;
+
+    /* Combine cpreg and name into one allocation. */
+    name_len = strlen(name) + 1;
+    r2 = g_malloc(sizeof(*r2) + name_len);
+    *r2 = *r;
+    r2->name = memcpy(r2 + 1, name, name_len);
 
-    r2->name = g_strdup(name);
     /* Reset the secure state to the specific incoming state.  This is
      * necessary as the register may have been defined with both states.
      */
-- 
2.34.1


