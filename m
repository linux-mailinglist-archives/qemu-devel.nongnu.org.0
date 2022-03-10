Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5474F4D4656
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:55:39 +0100 (CET)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHOM-0006IN-Ct
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:55:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxP-0005Ve-VF
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:48 -0500
Received: from [2607:f8b0:4864:20::102f] (port=37407
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxO-0007xx-DA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:47 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so4845918pjb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwiItv/W7hsxOLFZ9QGpLLDQ+Ql5lsRDNyYEtGuJ3Fw=;
 b=FkDhEB3IcWan3V3kWqpwhPQvXxZ2qI4GcEYWup1wW6KvBTnnpKiyMMP1gwsTn0hcZY
 HGfgSmo7T72CF37rbgV2Zvy41GktfbxgbvChpx9AEpVxFBpqzpuJ52zZ9QYRSidOVppS
 oEARLXXysz5zEPECV89fiZDAEmXH6Hg6zK8PO9HojQOh1u/FwzUjmJhGIkkvypkQIf6w
 nxoKpWbb9jVE2AqC4mllnQgheqey7kazC6VYnNOvAJ2tRA5PJ6BQAIX+ndH3AX1lDbGp
 GjbUtnowcnhlmBQubbb15+78mqYhu4KoUuXqXjKEUhEqYIgOd4gGVyaNdI5kaF0M/Ld3
 amkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwiItv/W7hsxOLFZ9QGpLLDQ+Ql5lsRDNyYEtGuJ3Fw=;
 b=1iO+j9n8kspwO4Jq53q3zWEjQHOA3Nr33mRM+D4R8qg9GaiNxf9rwvtmL/D0T0b67R
 lCbBRta9pRO8NERTLW+YMhZkOkkd7cgWDAnkhVsc1+mViuAWsz93WOLjewjbw4BtBAlo
 XDfarDNmuxbzWj7XHV1kNAPjEPqzCTrZPqTDe3Zk7PFmx85WYDNa7r98KwO4WFon5Emv
 kdBq4HDDUOdk0P4KdHWx4kSOt/jieUns0Wiv1N7cb+OueORM2d7WYB0t35jBmdBvHjno
 aizyjen3dQKyrxHpr3MGIXo9Zot9VCOfEXrWrbXno0VaTfZirpXern4QMdnEIG0/dgak
 eQ5A==
X-Gm-Message-State: AOAM531VUKibk5MUgkONr8VjWXPufeuDcjebL8DcUR2PulV/rbRUxKon
 sPkMnnipcRKy5FV7GQBNt3fB2ARD9+IszA==
X-Google-Smtp-Source: ABdhPJyHDpDpO8ZP6c0xlMir0Gu9G7YY40mnnrnUpnxcge79m2Q+Pp38VMDgGvLxl/kpYBM7gOHW9g==
X-Received: by 2002:a17:903:4a:b0:151:be09:3de9 with SMTP id
 l10-20020a170903004a00b00151be093de9mr4464030pla.138.1646911665149; 
 Thu, 10 Mar 2022 03:27:45 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/48] target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
Date: Thu, 10 Mar 2022 03:26:54 -0800
Message-Id: <20220310112725.570053-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

WE is the architectural name of the field, not WR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 2 +-
 target/nios2/helper.c | 4 ++--
 target/nios2/mmu.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 25b77916ca..81472be686 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -134,7 +134,7 @@ FIELD(CR_TLBACC, IG, 25, 7)
 #define   CR_TLBMISC_WAY_SHIFT 20
 #define   CR_TLBMISC_WAY_MASK  (0xF << CR_TLBMISC_WAY_SHIFT)
 #define   CR_TLBMISC_RD        (1 << 19)
-#define   CR_TLBMISC_WR        (1 << 18)
+#define   CR_TLBMISC_WE        (1 << 18)
 #define   CR_TLBMISC_PID_SHIFT 4
 #define   CR_TLBMISC_PID_MASK  (0x3FFF << CR_TLBMISC_PID_SHIFT)
 #define   CR_TLBMISC_DBL       (1 << 3)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index da3a289fc7..308d66ad93 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -89,7 +89,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                                  cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
 
             env->regs[R_EA] = env->pc + 4;
             env->pc = cpu->fast_tlb_miss_addr;
@@ -124,7 +124,7 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                                              cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
+            env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
 
         env->regs[R_EA] = env->pc + 4;
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 826cd2afb4..0f33ea5e04 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -95,7 +95,7 @@ void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
                                  FIELD_EX32(v, CR_TLBACC, PFN));
 
     /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
-    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WR) {
+    if (env->ctrl[CR_TLBMISC] & CR_TLBMISC_WE) {
         int way = (env->ctrl[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
         int vpn = FIELD_EX32(env->mmu.pteaddr_wr, CR_PTEADDR, VPN);
         int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
@@ -133,7 +133,7 @@ void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
 
     trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
                                   (v & CR_TLBMISC_RD) ? 'R' : '.',
-                                  (v & CR_TLBMISC_WR) ? 'W' : '.',
+                                  (v & CR_TLBMISC_WE) ? 'W' : '.',
                                   (v & CR_TLBMISC_DBL) ? '2' : '.',
                                   (v & CR_TLBMISC_BAD) ? 'B' : '.',
                                   (v & CR_TLBMISC_PERM) ? 'P' : '.',
-- 
2.25.1


