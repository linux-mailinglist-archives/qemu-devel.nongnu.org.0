Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D733C63D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:59:52 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsRT-0008Rw-U7
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEU-00076O-7r
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:26 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEQ-0001Yo-87
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:25 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 101-20020a9d04ee0000b02901b506659320so5632696otm.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=wZm8jMEdbTSmXDM5ChDmW3ArJseKfZTcYwJM1P1DAihYWVCqXw36xC4bEibf5uVmoU
 cdrTRDXlZjAvY6rFD2/Xpn2d0wCD+5oXGRYgQIlp+ASp0aJm7zGHcHH9kaNmpk8XqBM3
 8LoP5WgglDWk98iJXF+sxPKxjbFb5VUD+HoxlCaJOIANHmo7hI5Obn0Aq4/4ywwDfu9s
 V0yuXXDq0W7bHlIqI+Qx+ocGClent/iRcT7/jaSseLGvofmbK5CDxih7nF39SPpJzh5i
 czZN0t8PFsMejx+ZK12XMQmz2ZAGAh8Sgi5+KN85acaf+H+DKgLUj/GZdpFi5y5X+HK4
 yjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rBNBEOcSDYR+VlJXpnn63cl+iKupYCFGcFqK74D/RBs=;
 b=EvOLMBxqKj4MV1Xwoqf7PuNaZv9K4f+MjIbfUPs1vVfMTwAfs+7zPFDjutp4CpiYNX
 pzujNmrSFGAabUofLpavebsR2C7Fh/Z017AA6xa9o0j1mIj39wEvswz2kNoM1RB4SfhC
 mqfL9Yimug8B1uayLeVhxTIIxRmQ430iERXJ23nn2iBMVQsvaribGDZGOqdeO5zJackx
 iaBsasMpmkepsUgGJ/fxRgGBPhKYzNKO0db6VDBU396+HbqkjoZWiGU8/Sa17zCvFRAO
 9KQ5UPBhSDVxC+nPca+4lefZ6h7ud+9+pZ0ZyimQP8ffu1Mq9eAvODTazEPimi0X0+Xv
 +thA==
X-Gm-Message-State: AOAM532hEQzQSBxtpQO0YWj+QutP6irTogNRxwX5scOvTAniyBWLz75a
 k2MQGf1nKjG7916rw9ZItei2Pne25oy/xbxX
X-Google-Smtp-Source: ABdhPJw1mEbM6a/aHkNU4/m6iZsynYKoN4EGyT2iuurvLpS5pnf3yPzUKc6GxhGIvGMFMnAScf+WJg==
X-Received: by 2002:a9d:6013:: with SMTP id h19mr442782otj.72.1615833981207;
 Mon, 15 Mar 2021 11:46:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/17] target/ppc: Properly sync cpu state with new msr in
 cpu_load_old
Date: Mon, 15 Mar 2021 12:46:01 -0600
Message-Id: <20210315184615.1985590-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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


