Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16448307899
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:51:09 +0100 (CET)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58dY-0003Gc-2n
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:51:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uk-0000nA-QW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:02 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58Uj-0007MO-6T
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:42:02 -0500
Received: by mail-ej1-x629.google.com with SMTP id g3so8115397ejb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2njBE1pZa8pdGTXYyGM0UyS69kKbQOe35lfLGNmI8lg=;
 b=Kjq4IIdAyNk1GKAkP94Zx4QNrLi+ttIR6FC7OG59OarYeiLLCJua1iI7LRDpPc9dhL
 UCQ+NMRhzYJXizi1Vy5hvxKoutpLpg/n15rNnrr+PSY4V0YGnGTFPKbzy6SPTcvbvY9e
 Fq8SESnfwni0BJZ8XVqhXCluxozuvmFJSry0hlQsER1C8QJMbvZ6BrXMW/8aBvPXq2EW
 kZaY6kNh3IHSwX2TysXhIwWN54s3dBLXOaD80oxdqacCcqa8OeKjn4uTZHMBLNKNda5R
 VzdXFwQv8XCmdxdAEuvAlrenzduFPkYYt/YXi4195hMfJ3ydSbA1q0Fcg75uocavr3KJ
 8Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2njBE1pZa8pdGTXYyGM0UyS69kKbQOe35lfLGNmI8lg=;
 b=q0pH41aTymg1twJ11NDpQfqkYhv1zIWuCUqMQWJdSv1kASG7l+nmuCZGfGpT2GFacz
 aOA1yV1OAAi2Lk3lu5eD9v5NEZaCXPA3H3ANHkGzCCFsDSA8noYK42tCR4H8FW5cpisk
 TB/nit3xXYc/OkaqFkXO7r15Inf5XSfjwX3BuE1XKLBOO78f5Wa+JjCYzGrxQSNP+Fzj
 UQn0+6TTDHhnOvnhT1+zqrJ8ZYg2PfXUqOuFzQMm26HPgWAg7G/ljy3Dub5DsNOJKZ8r
 mo2ZsiTyeBi1KvIlHw5X2dX3pm+tQuU1bd+Vz/gh+Q3irhtQMJmX/UUs8j2GRDOu+tBK
 eLYg==
X-Gm-Message-State: AOAM533moTw2/WPDH9YM8qB4wYx2nY4XICDVtKDHViPM2U1AagHpdai8
 4sy1i/pO9/5jI3Cj0tyVTPWuCfcZc9U=
X-Google-Smtp-Source: ABdhPJyx6ScR6irYIpLmtuUEXqmRcjO6xQLpv7LiDpIDcQPIv9rZBrRWwgQdN/b4V1Xb3um40LY6SQ==
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr11467750ejc.29.1611844919665; 
 Thu, 28 Jan 2021 06:41:59 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r7sm2369694ejo.20.2021.01.28.06.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:41:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/mips: Replace magic value by MMU_DATA_LOAD
 definition
Date: Thu, 28 Jan 2021 15:41:18 +0100
Message-Id: <20210128144125.3696119-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128144125.3696119-1-f4bug@amsat.org>
References: <20210128144125.3696119-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
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
 Joe Komlodi <komlodi@xilinx.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/op_helper.c  | 2 +-
 target/mips/tlb_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 89c7d4556a0..9fce0194b3e 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -312,7 +312,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong arg, int mem_idx)  \
         }                                                                     \
         do_raise_exception(env, EXCP_AdEL, GETPC());                          \
     }                                                                         \
-    env->CP0_LLAddr = do_translate_address(env, arg, 0, GETPC());             \
+    env->CP0_LLAddr = do_translate_address(env, arg, MMU_DATA_LOAD, GETPC()); \
     env->lladdr = arg;                                                        \
     env->llval = do_cast cpu_##insn##_mmuidx_ra(env, arg, mem_idx, GETPC());  \
     return env->llval;                                                        \
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index c9535b7f72f..9216c7a91b3 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -492,7 +492,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     hwaddr phys_addr;
     int prot;
 
-    if (get_physical_address(env, &phys_addr, &prot, addr, 0,
+    if (get_physical_address(env, &phys_addr, &prot, addr, MMU_DATA_LOAD,
                              cpu_mmu_index(env, false)) != 0) {
         return -1;
     }
-- 
2.26.2


