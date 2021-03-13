Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC3339AAD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:03:04 +0100 (CET)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsgJ-00013e-Qq
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdr-00072m-NA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:31 -0500
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdl-0003OW-RA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:31 -0500
Received: by mail-qv1-xf35.google.com with SMTP id l15so5181998qvl.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=NnjdnByLo+V9QUw97TAvJrI2r18u19AsmTWKWy/tpZF3kAMXkn22ncdyAzpkUfR1jA
 c7vWAwoIXSmTbV2KtJjXgOyg08XtlvwMNNBkKKKMliCR28JKLen9jL2RxyOs6OuGMDTe
 EZQjy6JkX7aRxlj4ZwqLZRh+d+0abQeiMDpo5kyL8iDZ7wajN31u1Q9zXIcVIhoeD3Eu
 aKO+pbAX2QOLkqQxPPyEmLiKUOAme76JdpgWtrO5EsbbuYxsY5C3wTHTzQTowZa3vUMx
 3Ld2hif5wa7hbLaal6tDpmPXL8VR5wbpQvBJjh/rR+xa4BzLopZBxzM+Vo92yGR8AzSQ
 9Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=NQfvwLqL/Z2wZ64Dpf07kjALXykzJpy6Z75o+k/W3h3Poie/yOZQ5r6mkSH4lS4/TX
 HTy9Agzd40MG8unWR7kqlmDUXgDO+yt2nLKJn/JyTeQwfMLyMIeqIX7xbalPTer2PWUr
 ZCealsUgW4jESr5cn9cUNWW4kwvkwkP93RO3uV1oTnCBYQQCBzOT0oDWwcX6J08c1XnF
 UHY++2oVeabQVhjMy2LIfd1tdrbrr6YTo13FfPGw/Bx1NQ4Z7C0nwgeb9kMtQtjJ55I6
 4ZMiHb4xkZ/oLBKEyfJB/tn2mu1gy/7s+H9npBdq06esF3EwvLHwjvipPChpLzZ+W+Mt
 Za3g==
X-Gm-Message-State: AOAM5338ZpJ6ZzKMwMF3GmZOZt/CnTIply/hvAsW5FS2fNfG6lIrWW/D
 SWC5wBi1eVLpfzuevSNLhn2u4SJRAxll9Ov5
X-Google-Smtp-Source: ABdhPJyLyKZ03OQq6S/fG9lWUgsTKRI2jd98bDd+/h4ZKLRmjSZdFIpXSWL0KLxctY+gw7og5BWnoA==
X-Received: by 2002:a05:6214:1424:: with SMTP id
 o4mr979744qvx.34.1615597224884; 
 Fri, 12 Mar 2021 17:00:24 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] target/ppc: Properly sync cpu state with new msr in
 cpu_load_old
Date: Fri, 12 Mar 2021 19:00:06 -0600
Message-Id: <20210313010018.819153-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Match cpu_post_load in using ppc_store_msr to set all of
the cpu state implied by the value of msr.  Do not restore
hflags or hflags_nmsr, as we recompute them in ppc_store_msr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/machine.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 283db1d28a..87d7bffb86 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -21,6 +21,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     int32_t slb_nr;
 #endif
     target_ulong xer;
+    target_ulong msr;
 
     for (i = 0; i < 32; i++) {
         qemu_get_betls(f, &env->gpr[i]);
@@ -111,11 +112,19 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     qemu_get_betls(f, &env->ivpr_mask);
     qemu_get_betls(f, &env->hreset_vector);
     qemu_get_betls(f, &env->nip);
-    qemu_get_betls(f, &env->hflags);
-    qemu_get_betls(f, &env->hflags_nmsr);
+    qemu_get_sbetl(f); /* Discard unused hflags */
+    qemu_get_sbetl(f); /* Discard unused hflags_nmsr */
     qemu_get_sbe32(f); /* Discard unused mmu_idx */
     qemu_get_sbe32(f); /* Discard unused power_mode */
 
+    /*
+     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
+     * before restoring.  Note that this recomputes hflags and mem_idx.
+     */
+    msr = env->msr;
+    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
+    ppc_store_msr(env, msr);
+
     /* Recompute mmu indices */
     hreg_compute_mem_idx(env);
 
-- 
2.25.1


