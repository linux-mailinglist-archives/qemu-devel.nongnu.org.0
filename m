Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933059C463
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:50:22 +0200 (CEST)
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAd3-00029X-4j
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LU-0007pc-6o
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:08 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LL-0000li-WA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:07 -0400
Received: by mail-pl1-x636.google.com with SMTP id p18so10225905plr.8
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QVvH22x8bUjcLYNQ/ECfXWnYzFb7GNF185+z8yEomUw=;
 b=W3fjhv9/KyxmUPFnf2hroekE3ORZzXOYdutjwT8D4mxUfi1z65uahKUMFAFi2QO5wI
 XvdGGEQUJPsPZCPYkIE0DBpA6jzanqsIMflTPPvQZJ9Dz8qgcXikdCiiKj0UOyUlklTp
 sY36A8jFkb8AhExryQxgv+XEXbyq+KZLQWCZvlcUa/k+POBkMxg6MmvmjXN3aRxU2KYZ
 5BFcYRWi4m+//Rj1xsN0PN5zVJhpJ1kG+jwzdoQkm0TLYkSTOUUscl7Xqn571OVSTx0p
 tkNIeeOSM4dfxtwl+PxbOzq4FbiNIlkPtyjxcx8D9cmTj0qcyeaiyKPyuiBaftAOGsSE
 O9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QVvH22x8bUjcLYNQ/ECfXWnYzFb7GNF185+z8yEomUw=;
 b=RVVhGZVV1T66+uzaDdgYbDQSDxc7bpWRa6GFzPObrPS5JJmaHMrokMG1f5Kw2FXo2n
 vyy5Sc6RXEYC137PbbaKEh8tm+0yDt98FfjApzNZJS4iF7Tp5dDog3HH1Poh0guQUSUU
 6KuSGOavn45AYBSP49QDVWbD3qd4xjackgSPpq6CNh7GTR9pdlgRV1KDCKyO5X6tSWs0
 JbGQlfZdbCWnQtpJRrhDwzsMTSP13Jdz2O5vSlQR1mUc2+Dz8LyODA3ZMhs7ErZNemQq
 zv3KV+b9KfcC565Rowkw+Wteci00leK2U6tJLb9YZ2oTkhOahVlJwbMbNwu6loBLRTky
 bgDA==
X-Gm-Message-State: ACgBeo10GQ33ueyaXdtfTW6+paMAvZ94xHUrfopq+6+KYBswAkVikaFU
 OAQqFoKzoQuPBTY6QNGKn1aVjubMLZ8/JA==
X-Google-Smtp-Source: AA6agR5Wv22w6M4Vg3YKjo5SCg0RabCS3SqyjHvhic38xPgSSuAPhCyXDYkuRHqzncHmewrHJIz0kg==
X-Received: by 2002:a17:902:e84c:b0:172:d932:4b11 with SMTP id
 t12-20020a170902e84c00b00172d9324b11mr9897950plg.125.1661182078683; 
 Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 20/66] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
Date: Mon, 22 Aug 2022 08:26:55 -0700
Message-Id: <20220822152741.1617527-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Remove the use of regime_is_secure from get_phys_addr_pmsav5.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eca7763367..c338e2324a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1350,13 +1350,12 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool is_secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
     uint32_t mask;
     uint32_t base;
-    bool is_secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
@@ -2420,7 +2419,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1


