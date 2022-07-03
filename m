Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508495645EF
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:50:45 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vJU-0002K7-DW
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvO-0008F3-MQ
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvN-0006Cj-6I
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so6726828pjz.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f33EhXDWkHjxsmDh1J20IKySocqOzXPOfiocCVykyDU=;
 b=lq70iUy0Hv805W0w2eGiA/Irj3gUkmwej/K2uc+xXgnnvDpeUPd8o5B2Umnl+u8pZH
 NWHXfIrIfDBD3JT+sC2gI0zdNiKXMnPT0Hi2EEhIxLWZs7Eh/XFPLvy10SOdM0m5PgvF
 vqJbFd0A9UKi1nUgtWOGf/IWQe8VZ65s0l4rlK6tIDWMqdNEvNy69P/J+4Ez+GoIuJh5
 O+Vkc/If2uCaa3NC56ZWla+4HOym+Q8Z7u6Od3d0dv3nZcCkhitTta59ARq4YPTXzpVs
 RLzESkKmyQYVckKjrZ6IVty2k5RiqzgsR/Qmoy6oVMlFNjFZqxfxXGadaeotffTqlvrN
 5tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f33EhXDWkHjxsmDh1J20IKySocqOzXPOfiocCVykyDU=;
 b=mMj6YBGipgMeJpoS5OPePvtyUmAYGt7VDrGjk7MEDBjsQxtPx+O9Ou7BROpw1z0d0p
 wOJsr5KaZEyGc93RKH651R+jMzdrtY+svXB5oVJydLLQYAavguI43go92uUpE0ZsoM/I
 YMpvigjsY06nGuwPggYTtmQtXwWDQOIoKxy1UmTJpYq26RF1pKxIDLXNILaSJiIiHMWQ
 crSvweYTccjxy7mnG1WvHCsYmvfGmL4M/fGc8ts8MK4H3bjXJxKC/KtkZqr/gSOvISpa
 msa/rn+KknhBeYtdxpMpR11eYsMJtIwqHB7Pu5VvgJ5xpF7AVcqfhZ8PmJr0TD0ZkL7c
 Kw+w==
X-Gm-Message-State: AJIora9vgN5Brg9Hz1tAKsKqXhzhlV2BhIZKJiblFGGWi9035eIh6aM3
 WlvZpKrWc2JrHImTdLOdn2Fj99tNT+hLoAra
X-Google-Smtp-Source: AGRyM1uva0DNFNFoAXwqMigPBHvPkyDg9dQVflpvYo2QYdWRvYjteCwa5KLplqXm6KHr09xEjqbP/w==
X-Received: by 2002:a17:90b:35c9:b0:1ef:2242:1838 with SMTP id
 nb9-20020a17090b35c900b001ef22421838mr25799849pjb.114.1656836747834; 
 Sun, 03 Jul 2022 01:25:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 27/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav5
Date: Sun,  3 Jul 2022 13:53:44 +0530
Message-Id: <20220703082419.770989-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8313a2d74a..340f73997a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1346,13 +1346,12 @@ do_fault:
 
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
@@ -2417,7 +2416,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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


