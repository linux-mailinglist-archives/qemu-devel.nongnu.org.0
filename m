Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFF633A750
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:12:09 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVDk-0003kX-Ri
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1T-0002AV-2H
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:27 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1G-00027Y-MP
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:25 -0400
Received: by mail-qt1-x832.google.com with SMTP id g24so7648033qts.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=hogfgALtGlsqQ5w1/cHzG6Sv1M3ALoCmPautd4DpBsiThPtn1As+Fakcz+BEEroTeu
 PaW8DLplFHSB8MlKs0SpustMFygWNCBTTSDM2IsjVzb1UDCzIre/h1D2uBGvENNzWA9g
 lBZVY3AhQL2uNIzAJ4G2dYK9WICEnZz8VvWbaGul+4m92iStQnZiXkHitCnMGmB2/MyN
 qbOJyIkdpwHrrIzoyFTUjpDAaAI7VSPSoYB5q0/NvzMFTpXy5R5HAqfefPXWS1VDXTAh
 KtOwD27LO/oNGlaZv9X15lajvVl/76ydWjejkfVdjB4jOm8ufyhPTI4rvA5O5sCwuBKV
 TvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=p3p7o0zsCRj6RpN1QAtM4gD8rfwMXKEwm2zyofkSwi3Em0/+arZUw4JARErjtbJgd6
 TAkkW4sfTYbKpIWOMVzNIay5/DuBWoIBCpIBU72B3ImxNVhkqOb57GxW2DtataIde94R
 ny9/h/JQpemB/QjpjMS4ESX7G0uqCfuHJhg2CC7fcgvs1qfAMstFfAaYhwhXhHrQvKII
 aJrnRQn/LMIdktwnUTz7XSik0aVMGJcs9eimb/v0BXC7KbNS8SxfmpTF/2+vDBAszeT6
 0l3URKqDZJ/AsdOxL3ICZgAxXKeJYoTtAEU/DeOlqBfqMYf8PzcUc3pfOKR5JYpVOPy+
 RqHw==
X-Gm-Message-State: AOAM533kvq3r59iDgdqwd3dp2+r4QleEPWMVrZEx8Su9iS2zxLREJVKg
 7pIOvGeFNuKssNGGsTtezp5VzCbRF+6OUOjz
X-Google-Smtp-Source: ABdhPJwJ6eqa0ABUY1ijndWisriuVaMD09E4wzojT2UatYVgRNwc8RgJzjhe7i6BPZyGjD5i1lNUhA==
X-Received: by 2002:aed:2c61:: with SMTP id f88mr19747491qtd.337.1615744752778; 
 Sun, 14 Mar 2021 10:59:12 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/16] target/ppc: Properly sync cpu state with new msr in
 cpu_load_old
Date: Sun, 14 Mar 2021 11:58:53 -0600
Message-Id: <20210314175906.1733746-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
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


