Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D8585735
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:11:53 +0200 (CEST)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZ95-00051K-3c
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3l-0002wC-69
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:21 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oHZ3j-0001r0-Lr
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:06:20 -0400
Received: by mail-pg1-x534.google.com with SMTP id 12so5073707pga.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TfhTaKLipR7ZnPNEZbMG+vKVDM09H6zgRLcLiJBdoNc=;
 b=OZhVs519WgLdi5RziBRJJZoA8/bWA/aUD7of7Eb9uR6Jql3lkm6tOTKChBIsh1L8CZ
 XZWacKNDLmHwQsX0uGCd7KyCaaxKI9JNd9GdOMqo4d0yio27Vrj3CnVtP+RZfMGw2Ueq
 mJlBEf73ARKVq/cBbLVLNd+5jbnMBRolucGMtpgB8DKnmZY8tSd2Mdq4bkc6178uLnQB
 Zjtc4IJ99ujXSG+Icu432hjEU1Kg/aSuBepUs/iw7kNGuvypgGygA5uBwOpjxYsmZz6q
 gUcssID4czv60wiaOJN5IjO8Dawiaop0nP0DYGX3Q4ZLKAMeUQtPPpjZ6HE4S0mMLu6V
 obCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TfhTaKLipR7ZnPNEZbMG+vKVDM09H6zgRLcLiJBdoNc=;
 b=cA/KHTZ7YQFDh1EodtXVDucRA/Emva7adBhwet2ZxPASKCiNj7MYNa5tTydz54n9m4
 sxZEZQQLBHDfBVpbBhQDlxhA2NyI+CDLPvmVW4NfP4VghruF+Eu2/j0bw4ULSN9kJCWF
 lmvgS5mf0oLkHoNwOm0VwT46RFQIuFgovqYZlAWAT/B/UvdueoI62k3KWQECLRUP2ye8
 Og8Vn/8wVEIleIsQ6teZnL3R9qBCQFRGUebfZojTdLtRNuJb03ER0RjeQLAPkeJ5HPcj
 2d/3j2zI3Zc8AhyFG59CfBqxGi56HQMw5ayydoWYIcU0iNAB8Zo+ZGNJnIzEX3n/I5ms
 rv/Q==
X-Gm-Message-State: AJIora+oL2szOIS2Spz1exUIDBKyYIesF6sg1lx3x3zkSFRl0NNI/B9F
 IMnPr4ikQ9OLsKeNxYzW8QzKfc/OH6K2tQ==
X-Google-Smtp-Source: AGRyM1uPIPjtPZ6Rchwe23IWOZgfe9sKMu87ZkdW97D/i2152jhZuRU7rvGhvneC3EwkkIJCGyTyOQ==
X-Received: by 2002:a05:6a00:815:b0:52b:8895:a0bd with SMTP id
 m21-20020a056a00081500b0052b8895a0bdmr5621588pfk.57.1659135978168; 
 Fri, 29 Jul 2022 16:06:18 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a170902860b00b0016be9d498d0sm4083896plo.211.2022.07.29.16.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 16:06:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v3 02/11] target/openrisc: Fix memory reading in debugger
Date: Sat, 30 Jul 2022 08:01:08 +0900
Message-Id: <20220729230117.3768312-3-shorne@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220729230117.3768312-1-shorne@gmail.com>
References: <20220729230117.3768312-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

In commit f0655423ca ("target/openrisc: Reorg tlb lookup") data and
instruction TLB reads were combined.  This, broke debugger reads where
we first tried to map using the data tlb then fall back to the
instruction tlb.

This patch replicates this logic by first requesting a PAGE_READ
protection mapping then falling back to PAGE_EXEC.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v2:
 - No changes, added Reviewed-by

 target/openrisc/mmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index d7e1320998..0b8afdbacf 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -148,7 +148,13 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     case SR_DME | SR_IME:
         /* The mmu is definitely enabled.  */
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
-                            PAGE_EXEC | PAGE_READ | PAGE_WRITE,
+                            PAGE_READ,
+                            (sr & SR_SM) != 0);
+        if (!excp) {
+            return phys_addr;
+        }
+        excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
+                            PAGE_EXEC,
                             (sr & SR_SM) != 0);
         return excp ? -1 : phys_addr;
 
-- 
2.37.1


