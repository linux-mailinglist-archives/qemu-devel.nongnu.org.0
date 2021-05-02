Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80917370E19
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:59:43 +0200 (CEST)
Received: from localhost ([::1]:44564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFRW-0001N2-Al
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnD-0006jW-Sn
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnC-0007z4-5O
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t18so3111974wry.1
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZETGpx4nbZfkaug+OflFl89N3mWc3Om9YqwBm01M7wo=;
 b=kaEi/DPSsdIDlQQdGBQDEHlHP28upTUjCWZE2JCjjRRvaZkxK8ErFtsHElkiv1plKm
 xUyuJz4qrYOBXlaXjRlyoiOrLKm88yERmcIR7NlYtvCYp8cTtsUe7Xn1LWXbSa72Cz/a
 XFxfvG5CGYV+Gs8u90FZrdfD87LtLtMUKQvyfl7Zw9Gf27xfuvY2M03yPmHbdkduEoZh
 mNIdwMKpDuvOmWk7JpRuZb1qYY1jJ2Y6LqgczIEp1EZQ7ShQGzd1lwov4w5Epz3zoG5H
 ng1SUrk3+S0sB4bp2yjMT213iB8sKbasga/HhxY6qQc5X+Yxdy26iOAvoJKljnd/qDd1
 LmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZETGpx4nbZfkaug+OflFl89N3mWc3Om9YqwBm01M7wo=;
 b=RIm1VhdfRW3sxVSaLPnBQ53u/3ehCdGaHiKLiQceoVKt9r2a4ytbnrIUd5zIsewT2V
 JfzA6bQATBtTl1J8qg/YT9UD9GrtWwnnESSfZfII1EdkS5KcboOw8T5Ebk3NJ2rwrWIi
 wrOfrevha/NnvPP5dF66QKlDuPZLENQF/+3b9zq5SRwBcZ3oIIUpTg6Cnyimvd8KYKdf
 hfCSmUyNF8foHHV4eqm16b7KR2tVduQ+z5iVtXwD8Zd1OW4yuhIxkz6CrfG+IOK4givI
 gwmplmNq+PRMnwlB/YmeSedDq91gqdH1q8aVMhZxUfxeNS3SwEIx6Kx+uADd14FjtQGt
 reEA==
X-Gm-Message-State: AOAM532cBFmU23Hi9lOTr7x68euuhyVaeu34TDB7+wZ1M7r23vJeB1V9
 8auFVhGZLeCymG/3SJjnUm786DXyu02gYv72
X-Google-Smtp-Source: ABdhPJwulmc+QzUi061YtUWveAy93AK4kEHrf45Vlm2IgKs5W8kcyrDlexGRfkGzdigloJvFAL62Mw==
X-Received: by 2002:adf:f502:: with SMTP id q2mr20100401wro.171.1619972280737; 
 Sun, 02 May 2021 09:18:00 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b6sm17735676wmj.2.2021.05.02.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] target/mips: Move tlb_helper.c to tcg/sysemu/
Date: Sun,  2 May 2021 18:15:29 +0200
Message-Id: <20210502161538.534038-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Move tlb_helper.c to the tcg/sysemu/ subdir, along with
the following 3 declarations to tcg-internal.h:
- cpu_mips_tlb_flush()
- cpu_mips_translate_address()
- r4k_invalidate_tlb()

Simplify tlb_helper.c #ifdef'ry because files in tcg/sysemu/
are only build when sysemu mode is configured.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-22-f4bug@amsat.org>
---
 target/mips/internal.h                    | 5 -----
 target/mips/tcg/tcg-internal.h            | 5 +++++
 target/mips/{ => tcg/sysemu}/tlb_helper.c | 3 ---
 target/mips/meson.build                   | 1 -
 target/mips/tcg/sysemu/meson.build        | 1 +
 5 files changed, 6 insertions(+), 9 deletions(-)
 rename target/mips/{ => tcg/sysemu}/tlb_helper.c (99%)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 2c9666905df..558cdca4e84 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -164,16 +164,12 @@ void r4k_helper_tlbp(CPUMIPSState *env);
 void r4k_helper_tlbr(CPUMIPSState *env);
 void r4k_helper_tlbinv(CPUMIPSState *env);
 void r4k_helper_tlbinvf(CPUMIPSState *env);
-void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
                                     MMUAccessType access_type,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
-hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type, uintptr_t retaddr);
-
 extern const VMStateDescription vmstate_mips_cpu;
 
 #endif /* !CONFIG_USER_ONLY */
@@ -423,7 +419,6 @@ static inline void compute_hflags(CPUMIPSState *env)
     }
 }
 
-void cpu_mips_tlb_flush(CPUMIPSState *env);
 void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
 void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
 void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 70655bab45c..a39ff45d58f 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,8 +24,13 @@ void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
+void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
+hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
+                                  MMUAccessType access_type, uintptr_t retaddr);
+void cpu_mips_tlb_flush(CPUMIPSState *env);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
diff --git a/target/mips/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
similarity index 99%
rename from target/mips/tlb_helper.c
rename to target/mips/tcg/sysemu/tlb_helper.c
index bfb08eaf506..bf242f5e65a 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -25,8 +25,6 @@
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
 
-#if !defined(CONFIG_USER_ONLY)
-
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type)
@@ -1072,4 +1070,3 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
         }
     }
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/mips/meson.build b/target/mips/meson.build
index a55af1cd6cf..ff5eb210dfd 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,7 +31,6 @@
   'msa_translate.c',
   'op_helper.c',
   'rel6_translate.c',
-  'tlb_helper.c',
   'translate.c',
   'translate_addr_const.c',
   'txx9_translate.c',
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
index 5c3024e7760..73ab9571ba6 100644
--- a/target/mips/tcg/sysemu/meson.build
+++ b/target/mips/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
 mips_softmmu_ss.add(files(
   'cp0_helper.c',
   'mips-semi.c',
+  'tlb_helper.c',
 ))
-- 
2.26.3


