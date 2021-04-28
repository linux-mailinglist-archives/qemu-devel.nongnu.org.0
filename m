Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB136DE1B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:21:04 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnrz-0008Cp-O2
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndy-0001Qm-9E
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndw-0006hu-Bn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so51093287wrx.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yrsw7IxXDyNNt3tdDpsGCTMjH/SzXB09St0lk0R+vuk=;
 b=kU00Mh5mdjuUJuLn0yWw+0s1saUgIkmsx1dm1V7eVTJ0s576P+BsvLrR6W7BINhzfx
 1NivSpXtl2V6OzBLRzITm8e8V1M0Junwkw3sRcZQ7cLzCh9mFu4WubWx3QAt383z1H5i
 FKgjSjGk9Scm/d4pQmxFwiBEXR4S2vfYiXhmZDNOjJrT9LzjwcCDVx1va/K6lpZPY0Ll
 FSjiQv7Hh+D5uZcCJpSicMIp3bkk4Z+6k6jOMbSWpUptaGO/ZEsQataKF0kUJQbfAp5Z
 xdN6eN24ZxbKGMhrr9C4N7hcSttYHwYbjkedqVFN+Dtsio2vXXV9BC0UwoG5HG0GV9+n
 Opkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yrsw7IxXDyNNt3tdDpsGCTMjH/SzXB09St0lk0R+vuk=;
 b=I5afSEcgd22/XJx3852ITPt3NGo+QAw79SQ6QsrVVWZvVq5a+4nvqTrqC3HtIhYWxJ
 KF2xD1ugw0xhg3/OQD+QkbAmUCZIWcO/lNCmPfzw09DCo8hdNgHORf++hOAKZvRHp5nJ
 fufwKSg1s+k1141G6CuDM4B/5rDDx7NehUd42ioo14GwdmYhJQifGRJBOz/mA9qcqAXT
 gHzMssie6wGLDN4Vxv6LYbMnZl7aG6nH0JnuT8u4yPNq/hox0F4BRDvtiOLZwApWVoYK
 NrSKCiwEZcfkdwiwnYi0KMibhXjD+hj2R1rlkOV2a17uVq3coXfIuc9lbW3TQmxB4KJl
 CTsw==
X-Gm-Message-State: AOAM530nSWSD+yi9hRzZFMMseWeRP3vI5CDmfGzhwccK53ptCdg+h+KB
 s0E2GRUhS8Nq3/sEk8E+JbuzRiaKuu9nqA==
X-Google-Smtp-Source: ABdhPJwpUys3xWnUDvktoK//wy8lErbHYUp2Qfgz6eMD9Z1ioqjRSSXpsXKIl/vuSDh+3X9Z8VhlPA==
X-Received: by 2002:a5d:5444:: with SMTP id w4mr36550273wrv.202.1619629588555; 
 Wed, 28 Apr 2021 10:06:28 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i14sm7040279wmq.1.2021.04.28.10.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/30] target/mips: Restrict
 CPUMIPSTLBContext::map_address() handlers scope
Date: Wed, 28 Apr 2021 19:04:02 +0200
Message-Id: <20210428170410.479308-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 3 map_address() handlers are local to tlb_helper.c,
no need to have their prototype declared publically.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h              |  6 ------
 target/mips/tcg/sysemu/tlb_helper.c | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 558cdca4e84..c1751700731 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -152,12 +152,6 @@ struct CPUMIPSTLBContext {
     } mmu;
 };
 
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type);
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type);
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type);
 void r4k_helper_tlbwi(CPUMIPSState *env);
 void r4k_helper_tlbwr(CPUMIPSState *env);
 void r4k_helper_tlbp(CPUMIPSState *env);
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index bf242f5e65a..a45146a2b21 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -26,8 +26,8 @@
 #include "hw/mips/cpudevs.h"
 
 /* no MMU emulation */
-int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                       target_ulong address, MMUAccessType access_type)
+static int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                              target_ulong address, MMUAccessType access_type)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -35,8 +35,9 @@ int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* fixed mapping MMU emulation */
-int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                          target_ulong address, MMUAccessType access_type)
+static int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical,
+                                 int *prot, target_ulong address,
+                                 MMUAccessType access_type)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
         if (!(env->CP0_Status & (1 << CP0St_ERL))) {
@@ -55,8 +56,8 @@ int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
-int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
-                    target_ulong address, MMUAccessType access_type)
+static int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                           target_ulong address, MMUAccessType access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     uint32_t MMID = env->CP0_MemoryMapID;
-- 
2.26.3


