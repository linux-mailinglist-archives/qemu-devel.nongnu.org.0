Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23511552924
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 03:53:20 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3T4x-0001LX-8Q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 21:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0Y-0003VQ-1T
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:46 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3T0U-0001tu-LT
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 21:48:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id q140so11747792pgq.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 18:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBQ+kqYkpbLgtv+WWFdZqAHxgkdKeAvGA4OIxoJYS3s=;
 b=FrjhT/hcROvAqbDtmVHCj5H/y+MsD9/vID6h/78dVv9qKhqjgNxer/h2y/vhdGKmME
 ehTjWhPPueqfzIP+ydcEuLX/XQFHKKFaA0rozMBKFo4CDBMAt+MLdv1n6jy+E9y3Y1/o
 yc8CI/TWOJWQ4qAtaOsUdrdKaQDZNXOh3gC8pq/2hdlXxHJOYlinQH3FFmjqVZAJ4szG
 MUEFzjiQdIQknYStqaMQbJzDXfMdSuwrWEGEmBlhs7lf/QAZWc57vkLcNTdjO+wUvsgv
 qtsQFVG4tLMMcLKUP2FD3kSWE4rbB43gUeEL1uOKQybQrkoD2Oju0kjdw6HrK6ex2m47
 XGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBQ+kqYkpbLgtv+WWFdZqAHxgkdKeAvGA4OIxoJYS3s=;
 b=CqC1kmOVc5sU8gzsBc2DaB8HLmOgqDPfr0e/2av4HHIAnkItNHQwTTkK9MZOoUAZK7
 tqTYq1m+o461IPEAqlnJ5Jm+o65j1iks0KF2uvbSAjQR/yH2Q8M2JL3HuqlBu816KLns
 Rc2w11WfmXt2SxJhOn0Sn4Oc+3xH1jrmN5c8mivvBWjtQPqDSCaLEK4Iw5MRtWBqIB7P
 cEQOUtkP69zB7tD7q1246RV4VRvpDgZGhPaaFdU2Yr+VtOc2LYEkj01qoCG8sHDMblg+
 vI0eENT1rvCaV+fmKI7/pWMGAFxVzJRTajAgCFpztCTdO5CNQdZ/vh4hcJWe/u2zPtoq
 hNXQ==
X-Gm-Message-State: AJIora8R2nMiImOFJjkJ+l2vztBscnM38tVbIhrsCbkho/cIH6EXRlMv
 LFADM3B07I51g86PPKVfatSTXlGSQ9Emqg==
X-Google-Smtp-Source: AGRyM1vhVHQ4lpRwllfEGyihaeV3XlOcqjc6RLTiFBweQhBA3uSOdPcNRjarjT9W43eBMCLxtYccaw==
X-Received: by 2002:a05:6a00:16c7:b0:520:6ede:2539 with SMTP id
 l7-20020a056a0016c700b005206ede2539mr27321525pfc.46.1655776121220; 
 Mon, 20 Jun 2022 18:48:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056a00084b00b0051bc3a2355csm9907875pfk.64.2022.06.20.18.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 18:48:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: npiggin@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 3/3] util/cacheflush: Optimize flushing when ppc host has
 coherent icache
Date: Mon, 20 Jun 2022 18:48:37 -0700
Message-Id: <20220621014837.189139-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621014837.189139-1-richard.henderson@linaro.org>
References: <20220621014837.189139-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Nicholas Piggin <npiggin@gmail.com>

On linux, the AT_HWCAP bit PPC_FEATURE_ICACHE_SNOOP indicates
that we can use a simplified 3 instruction flush sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220519141131.29839-1-npiggin@gmail.com>
[rth: update after merging cacheflush.c and cacheinfo.c]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/cacheflush.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/util/cacheflush.c b/util/cacheflush.c
index 01b6cb7583..2c2c73e085 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -117,6 +117,10 @@ static void sys_cache_info(int *isize, int *dsize)
  * Architecture (+ OS) specific cache detection mechanisms.
  */
 
+#if defined(__powerpc__)
+static bool have_coherent_icache;
+#endif
+
 #if defined(__aarch64__) && !defined(CONFIG_DARWIN)
 /* Apple does not expose CTR_EL0, so we must use system interfaces. */
 static uint64_t save_ctr_el0;
@@ -156,6 +160,7 @@ static void arch_cache_info(int *isize, int *dsize)
     if (*dsize == 0) {
         *dsize = qemu_getauxval(AT_DCACHEBSIZE);
     }
+    have_coherent_icache = qemu_getauxval(AT_HWCAP) & PPC_FEATURE_ICACHE_SNOOP;
 }
 
 #else
@@ -298,8 +303,24 @@ void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 void flush_idcache_range(uintptr_t rx, uintptr_t rw, size_t len)
 {
     uintptr_t p, b, e;
-    size_t dsize = qemu_dcache_linesize;
-    size_t isize = qemu_icache_linesize;
+    size_t dsize, isize;
+
+    /*
+     * Some processors have coherent caches and support a simplified
+     * flushing procedure.  See
+     *   POWER9 UM, 4.6.2.2 Instruction Cache Block Invalidate (icbi) 
+     *   https://ibm.ent.box.com/s/tmklq90ze7aj8f4n32er1mu3sy9u8k3k
+     */
+    if (have_coherent_icache) {
+        asm volatile ("sync\n\t"
+                      "icbi 0,%0\n\t"
+                      "isync"
+                      : : "r"(rx) : "memory");
+        return;
+    }
+
+    dsize = qemu_dcache_linesize;
+    isize = qemu_icache_linesize;
 
     b = rw & ~(dsize - 1);
     e = (rw + len + dsize - 1) & ~(dsize - 1);
-- 
2.34.1


