Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CDD3DE56B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:34:43 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm8Y-0006bC-OJ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlq3-0003uM-51
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlq0-0002aY-6m
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso2992380pjo.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aPacNuhmVC/YpI4klANpBu2BNMpu2g0w5eEiyYMrlus=;
 b=And1q0h5KYXz/P0COlVpj65vZEqwWFKjvlNUeVAlqN50DbUAE4upvR4euiQwHas/v0
 WzVBmaDZsyJ9M+B7Wd+hrk0pROE9JSgC1wD3JYWWt2zEhhozrqTO/p/SSxrdOknQ8bUq
 xGjL5ja1WiRnj/q9M7A1hPH95rDi0P102YUyay95HyFelFd1X+im+a2PjTSuhkUtgyOO
 g7oQ4op+pnBMGKBAnGZ9e7Ee009dpTQUrurunrEcKEhgqKJy5ndFqT+zO628Fz2rSAC6
 bZa1LLfyLJ1/dEHFMvnDYUuEs+ZkR98cJgpnhoPDwou2E3niUToqTmCgTy245NcK7CkN
 tIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aPacNuhmVC/YpI4klANpBu2BNMpu2g0w5eEiyYMrlus=;
 b=WaioeU6LUPnWbAzWsjFtT64PZuiMgzJayqX6upplDHvJju31CbrR09h6BiVokZZE1y
 NPTT+cjktmm5dwt6U42IfUrwziKMBGc435nyxEm9PaLOjKHBoY8/HTEnmvQCSEsOz2bo
 3pb1GTnaz782fxUI2WucC9oqAwDQadGaqddjjCQHyGs1O9qj1yvcJorV7UciNLrcS8nd
 6NVr2bdmOjIBisTDi7tM3eEVEwb4DU07pgDK1rr8qJYMaFGfiTyMkFO80B+2Ae8Dz5Ai
 QnZsDdzllMV9WCfY6O2M6ytZPNyoqzMYv6qQXdcu0CjeIVhAxIl5GtIvMgoblRFwoN5W
 yn4A==
X-Gm-Message-State: AOAM532VGY+EJgNkViwrBIa1WrtU9ReLhqJrQB+tBOfBv4dcMReM25YS
 2F7OKkgaZdOlt53SNUDTYiJE5Lv2phZ0yg==
X-Google-Smtp-Source: ABdhPJxYJWAJKBpSRSjyrnYmgOtC9eB5IXTi/dWZ18uGmtoh4he9B8PH59ORdbPH6TNdz99BtPbnzA==
X-Received: by 2002:a17:90a:c902:: with SMTP id
 v2mr2373858pjt.136.1627964130974; 
 Mon, 02 Aug 2021 21:15:30 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/55] target/s390x: Use cpu_*_mmu instead of helper_*_mmu
Date: Mon,  2 Aug 2021 18:14:26 -1000
Message-Id: <20210803041443.55452-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Cc: qemu-s390x@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b20a82a914..4115cadbd7 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -248,13 +248,13 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
          * page. This is especially relevant to speed up TLB_NOTDIRTY.
          */
         g_assert(size > 0);
-        helper_ret_stb_mmu(env, vaddr, byte, oi, ra);
+        cpu_stb_mmu(env, vaddr, byte, oi, ra);
         haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
         if (likely(haddr)) {
             memset(haddr + 1, byte, size - 1);
         } else {
             for (i = 1; i < size; i++) {
-                helper_ret_stb_mmu(env, vaddr + i, byte, oi, ra);
+                cpu_stb_mmu(env, vaddr + i, byte, oi, ra);
             }
         }
     }
@@ -290,7 +290,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    byte = helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
     return byte;
 #endif
@@ -324,7 +324,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    helper_ret_stb_mmu(env, vaddr + offset, byte, oi, ra);
+    cpu_stb_mmu(env, vaddr + offset, byte, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_STORE, mmu_idx);
 #endif
 }
-- 
2.25.1


