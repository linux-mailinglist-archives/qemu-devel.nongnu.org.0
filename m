Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4257632FB65
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:38:27 +0100 (CET)
Received: from localhost ([::1]:42914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ0c-0001VG-79
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyz-0008Uu-JI
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:45 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyx-000896-Uz
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d15so5891001wrv.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WejqOAHjA3UzJ3SVMVB/jAcdaKSxmT5Co5pSURdVUwM=;
 b=nd7fwvfV/0u3V4/EciJEFb55QJpCFx62kh3ZcbY9dh8CkZ61t95OrCKwhmFxS/5QsV
 sXcLUUxk3afkP5ZtANgUUE5ECt4tjZLRRP56maJAm6G2TgEDZtVSW0V+WXh+3FPTTUUm
 Dhtr4h+rAjuKylBjv0toRn5WkylethpoSHeGn2wIBrej3+XDQ5vVg1YyMLiZzBvFusbC
 hlGDRtHlSBMwbp+OIADm3e7NxQ4MV3OT/lmXgLGLQLBZghtOKvJB8Nwl/cbjlGTTgSAy
 9awyzeCzZeJhhOJZfCeO5dgwRVAZzB7aO2jBf2Dm9sdlMRDertAOjS+5+Uv1TzowKoz3
 ayIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WejqOAHjA3UzJ3SVMVB/jAcdaKSxmT5Co5pSURdVUwM=;
 b=XGaD5fYoKHGjEPPkbcOCnFIOcNz3ebOrBEy50SrLTL9Beo3SYztI7ItvZD1sS/8EtC
 0BX3IvTGMdpuSRnNn3zRd437ku360fVs1/LeGwIewYmLzPD6Ln1Y81f+AscwXN0ckr0R
 EqL6ipilEQkSaQtBc9kOlQnx9d1EselkPCznMmTbfgbrE3kIPYzWqyyLc+0xmLzHF/yw
 iSaq7wiJD+eMCdio1LhNBgs+65n+nn3KwlsWKddErAQhRQk95xA9TifybJpR0IMxHHO8
 aeHyArQmwBbhxOmnYTIT5H7QumB6HaQ7PN/eb/wYyRQhKI4Dg2sWMLGYH9KKcYPyIDai
 Zlig==
X-Gm-Message-State: AOAM532MyeYRh2GLjisBSLejjxGGZ+EVDQI7rSc/76h5cDPKcNIR+3QE
 vOsoNyJvPW5ZYh9ANUPp12Ylpwf8XEk=
X-Google-Smtp-Source: ABdhPJxyYm+AUdzzQYEdrpaIO/oWJqnfaZ5aLZWW8CpQBa/KY8e2aWIM26ZuNKTDXDh6flRxTtQ3HQ==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr14814045wru.305.1615045002295; 
 Sat, 06 Mar 2021 07:36:42 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d13sm9419140wro.23.2021.03.06.07.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/14] target/sh4: Let get_physical_address() use MMUAccessType
 access_type
Date: Sat,  6 Mar 2021 16:36:11 +0100
Message-Id: <20210306153621.2393879-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

superh_cpu_tlb_fill() already provides a access_type variable of
type MMUAccessType, and it is passed along, but casted as integer
and renamed 'rw'.
Simply replace 'int rw' by 'MMUAccessType access_type'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210127232151.3523581-5-f4bug@amsat.org>
---
 target/sh4/helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index b49efe84916..bd8e034f174 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -331,14 +331,14 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                            int *prot, target_ulong address,
-                           int rw)
+                           MMUAccessType access_type)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
 
     use_asid = !(env->mmucr & MMUCR_SV) || !(env->sr & (1u << SR_MD));
 
-    if (rw == MMU_INST_FETCH) {
+    if (access_type == MMU_INST_FETCH) {
         n = find_itlb_entry(env, address, use_asid);
         if (n >= 0) {
             matching = &env->itlb[n];
@@ -371,11 +371,11 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
         if (n >= 0) {
             matching = &env->utlb[n];
             if (!(env->sr & (1u << SR_MD)) && !(matching->pr & 2)) {
-                n = (rw == MMU_DATA_STORE)
+                n = (access_type == MMU_DATA_STORE)
                     ? MMU_DTLB_VIOLATION_WRITE : MMU_DTLB_VIOLATION_READ;
-            } else if ((rw == MMU_DATA_STORE) && !(matching->pr & 1)) {
+            } else if ((access_type == MMU_DATA_STORE) && !(matching->pr & 1)) {
                 n = MMU_DTLB_VIOLATION_WRITE;
-            } else if ((rw == MMU_DATA_STORE) && !matching->d) {
+            } else if ((access_type == MMU_DATA_STORE) && !matching->d) {
                 n = MMU_DTLB_INITIAL_WRITE;
             } else {
                 *prot = PAGE_READ;
@@ -384,7 +384,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                 }
             }
         } else if (n == MMU_DTLB_MISS) {
-            n = (rw == MMU_DATA_STORE)
+            n = (access_type == MMU_DATA_STORE)
                 ? MMU_DTLB_MISS_WRITE : MMU_DTLB_MISS_READ;
         }
     }
@@ -398,7 +398,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
 static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int *prot, target_ulong address,
-                                int rw)
+                                MMUAccessType access_type)
 {
     /* P1, P2 and P4 areas do not use translation */
     if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
@@ -406,9 +406,9 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                 && (address < 0xe0000000 || address >= 0xe4000000)) {
             /* Unauthorized access in user mode (only store queues are available) */
             qemu_log_mask(LOG_GUEST_ERROR, "Unauthorized access\n");
-            if (rw == MMU_DATA_LOAD) {
+            if (access_type == MMU_DATA_LOAD) {
                 return MMU_DADDR_ERROR_READ;
-            } else if (rw == MMU_DATA_STORE) {
+            } else if (access_type == MMU_DATA_STORE) {
                 return MMU_DADDR_ERROR_WRITE;
             } else {
                 return MMU_IADDR_ERROR;
@@ -432,7 +432,7 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     }
 
     /* We need to resort to the MMU */
-    return get_mmu_address(env, physical, prot, address, rw);
+    return get_mmu_address(env, physical, prot, address, access_type);
 }
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-- 
2.26.2


