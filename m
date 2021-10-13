Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91E42B316
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:06:21 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUay-0002FY-Ia
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHv-0004vD-91
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:40 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHs-000541-TQ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id r2so870418pgl.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ou9TZeIkVFlPgVg0RJ88Oh2ksyVGkR6IUoehchstShA=;
 b=UGwFSpjuT2sipPdArEKXbNaaG6OMAitioeoMThq23Z0N9iPMzlbsS8Ihu7Dqo5bg+V
 zVv4yOtOetSRDFEngWVou4TM2TrtjVxf6dGD3cyV45mnFQkujUnrBFflmNo2TaSgtjaj
 eKBjeauLhTyRFlBjZtSO49oPliPtQBEC6ImtAW9aDMisu/AbiAjLFdw4XR9wce1wbpu9
 6em9BpU5E91KrXnthhMXuqE0zDoWNX01O72zi7AnKshRX7hGgPaTrhFoi8fs2eBhKUAC
 8x+1QhlBfmIswENFPwvpQvSVnPmNGSjSLdRD8KE0vRu7s+0+qOcAN2xBkL3QXFLq1DMa
 6R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ou9TZeIkVFlPgVg0RJ88Oh2ksyVGkR6IUoehchstShA=;
 b=vQBYte3rMiN3TTCFU6IoPW2mvH0LXyPn+CJFT/ziWdsF+GW4x1jIBlF92uYrF56L/F
 OHltskXbHVWTn1G2kTvzVGLjuZ5Gsb9OuSFmBjYk98OuVDTcBL/sXqLaUJXxb/YxmTyt
 zZiqB/7QtbCeF/uophjhjfoeB27NCbcEwJgSvEK3QIMJWaRPuPV64AuhtcqoB3ZsTp9M
 7KPdPaWxaOnqvUNaGozzRXKub0RK/7Fcw+rCQmmiqwdmjaWTRTPxchq9rGUlkwwrkKI+
 ifr8OWuGoqi5hZ/a9IETgcmsuKpwxBhPVI2abutYX72XsfM51COXZOKwnAHN8wPHza0W
 9bJQ==
X-Gm-Message-State: AOAM530InOXQMC0ztwfD+XD3WF/z3ZSRrW15zkmw3GZOhdnJN2/HdNzx
 tODFOfzXFC/QDxPB56vPkb05cH2lLohiUA==
X-Google-Smtp-Source: ABdhPJxsMu2P7RPTFdqp7vK14nTic18hTDdU1nOIXS6tKnXYdQhU80mmtEPQUD0NcaGBLtsfVraSVQ==
X-Received: by 2002:aa7:8042:0:b0:44c:78ec:c9a9 with SMTP id
 y2-20020aa78042000000b0044c78ecc9a9mr34827330pfm.45.1634093195348; 
 Tue, 12 Oct 2021 19:46:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/48] target/s390x: Use cpu_*_mmu instead of helper_*_mmu
Date: Tue, 12 Oct 2021 19:45:45 -0700
Message-Id: <20211013024607.731881-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper_*_mmu functions were the only thing available
when this code was written.  This could have been adjusted
when we added cpu_*_mmuidx_ra, but now we can most easily
use the newest set of interfaces.

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index f50c3f88a2..362a30d99e 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -241,13 +241,13 @@ static void do_access_memset(CPUS390XState *env, vaddr vaddr, char *haddr,
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
@@ -283,7 +283,7 @@ static uint8_t do_access_get_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
      * Do a single access and test if we can then get access to the
      * page. This is especially relevant to speed up TLB_NOTDIRTY.
      */
-    byte = helper_ret_ldub_mmu(env, vaddr + offset, oi, ra);
+    byte = cpu_ldb_mmu(env, vaddr + offset, oi, ra);
     *haddr = tlb_vaddr_to_host(env, vaddr, MMU_DATA_LOAD, mmu_idx);
     return byte;
 #endif
@@ -317,7 +317,7 @@ static void do_access_set_byte(CPUS390XState *env, vaddr vaddr, char **haddr,
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


