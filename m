Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD63E4680
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:26:35 +0200 (CEST)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5IO-00057o-H0
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54C-0003Hq-KR; Mon, 09 Aug 2021 09:11:44 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:43646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54B-0001dF-4I; Mon, 09 Aug 2021 09:11:44 -0400
Received: by mail-qk1-x72b.google.com with SMTP id f12so17071424qkh.10;
 Mon, 09 Aug 2021 06:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbWRJ2VzCyHQZuKAHuSZYu7+bSZoPl1YGCIQUZf3v1A=;
 b=Cv1Hh7S8/iV/hH+L8CA6A9aTAwgCSLfN26oSAPU/fp01k5wA1nPrh7eBYVMeL01cTA
 19AAq9X+MHsqYtuYzMTwHxwyx3r2LWKKyZTulg/bAc0nV4TnNk9ky/WOGC9i/ieIq+LW
 LEHmY9c/mY+DNf7vA4C0XU24q1tSNepxExFViM6/VPUJ2LVjDtPtX4tcjxSn2190KTDz
 1/BEwH8gDGSrf1JLpeev6P7eOUph6WajDNDXikGkVdxk36vGJKaX1EZN2W6yzxkKqaFB
 840b+PoVBqNpfxl0oxFkazJwDCSazEIjWhUwnnp0SDbaK1aPEd/xJB+rO/7UYsVnggto
 dbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbWRJ2VzCyHQZuKAHuSZYu7+bSZoPl1YGCIQUZf3v1A=;
 b=cagWN51chlPoFoir59A9XMJZtWa9fVL7grDxoWIYvOgxVqFSxgZQ9Y7WMgZM/vhOvL
 uGgmkHAMQdQT/uZ9OWXd5NkK1cDzKlgEHj6dn15CFwEId1YbfhLABk3pTw+ezSpu26aj
 VXf6YenKldAfi5omh0hAQg1d7lomLpH4F74WbB87ZBcPbY0IKcHCHGtJLfmLoEUq4oyj
 Rc1+zm6CD6tcqJ8goFMoX80YcGK5o4TZ+BxYYlEtVxsbUIUejPuJfM6/eh1578f0NpcD
 n1rZ2qamtnFIiC2hm1Vgv1axqheQVEJncUUu6MWvUn8r9wCuFJG5doMC46uRZrD5lfl0
 Lwgw==
X-Gm-Message-State: AOAM532MU8p363UWdiu8/u4R7w7Sr+R1DdXmQPnIHtWbrtmgFC4zjpHQ
 rqBxphM9oUiqlTJTrIxZU1506VGu0AdSUw==
X-Google-Smtp-Source: ABdhPJxX4YYdux3AoXCGhqwyohdDHyMI69Z4J1EAOyBwvPidYOyHDfZDPvR92TZWHPcy8r6Be/xefQ==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr22774818qkd.72.1628514701773; 
 Mon, 09 Aug 2021 06:11:41 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/19] target/ppc/pmu_book3s_helper.c: add generic timeout
 helpers
Date: Mon,  9 Aug 2021 10:10:52 -0300
Message-Id: <20210809131057.1694145-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before adding counter negative condition support for the other 5
counters, create generic helpers that retrieves the elapsed timeout to
counter negative based on the event being sampled.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/pmu_book3s_helper.c | 41 +++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index e7af273cb6..7126e9b3d5 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -111,23 +111,52 @@ static void update_PMCs(CPUPPCState *env, uint64_t icount_delta)
     update_PMC_PM_CYC(env, SPR_POWER_PMC6, icount_delta);
 }
 
+static int64_t get_INST_CMPL_timeout(CPUPPCState *env, int sprn)
+{
+    int64_t remaining_insns;
+
+    if (env->spr[sprn] == 0) {
+        return icount_to_ns(COUNTER_NEGATIVE_VAL);
+    }
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    remaining_insns = COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    return icount_to_ns(remaining_insns);
+}
+
+static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
+{
+    int64_t remaining_cyc;
+
+    if (env->spr[sprn] == 0) {
+        return icount_to_ns(COUNTER_NEGATIVE_VAL);
+    }
+
+    if (env->spr[sprn] >= COUNTER_NEGATIVE_VAL) {
+        return 0;
+    }
+
+    remaining_cyc = COUNTER_NEGATIVE_VAL - env->spr[sprn];
+    return muldiv64(remaining_cyc, NANOSECONDS_PER_SECOND, PPC_CPU_FREQ);
+}
+
 static void set_PMU_excp_timer(CPUPPCState *env)
 {
-    uint64_t timeout, now, remaining_val;
+    uint64_t timeout, now;
 
     if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_PMC1CE)) {
         return;
     }
 
-    remaining_val = COUNTER_NEGATIVE_VAL - env->spr[SPR_POWER_PMC1];
-
     switch (get_PMC_event(env, SPR_POWER_PMC1)) {
     case 0x2:
-        timeout = icount_to_ns(remaining_val);
+        timeout = get_INST_CMPL_timeout(env, SPR_POWER_PMC1);
         break;
     case 0x1e:
-        timeout = muldiv64(remaining_val, NANOSECONDS_PER_SECOND,
-                           PPC_CPU_FREQ);
+        timeout = get_CYC_timeout(env, SPR_POWER_PMC1);
         break;
     default:
         return;
-- 
2.31.1


