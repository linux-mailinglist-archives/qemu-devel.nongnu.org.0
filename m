Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097403636DC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:54:19 +0200 (CEST)
Received: from localhost ([::1]:36926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAgc-0005va-15
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALw-0003UX-ES
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALu-0004js-KG
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:32:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so6802355wmf.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iawceQB+YzWpPUYuRuuHHdhUzAeY/bBfFbTGCKH/tLs=;
 b=DuEi9hQ3pXnsito8xcsWRiiiNDqdRGWjXYmr9LzLU5OgitGv6EZwemPMBuq87m19Vt
 6hACayLQnFguOXKPjscIWU2rYGuDduRsArd5yAVEkLpKM1ZZ+I4yipv7h3FnBiN1ViAV
 dhpS6k154YStZKCtVtq/zzcEzExKA7dR+G+6Fs/j6NqL5nJfCdEEOs97Ks5R520lKjJK
 O837gP3JovCI8Q5vpKUwq/zDrLo81Knp7PNO4KFFPwfMnJmDBKjhnOxEOHa3Tkq7JKrc
 BX8kN8H3w8Q6isvPILOTnGXFOg0uhIRuKEfk0da83hi/INOZj6wKgeIOo3d5fTLXpF7P
 VsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iawceQB+YzWpPUYuRuuHHdhUzAeY/bBfFbTGCKH/tLs=;
 b=syuCvgnPbCpVZ/EMzp0mv6u8EB+EZnLIzPWxc3Xd5iYBBYs3ZfVkItXPhG5zqIIkji
 PdB28iVDOaJEYlHbAv9+4/OMVS4fCzd5sOlCm+/Y6zZrfTYR+DGvW7YKioyGEqhrJtYo
 YZXOA2dNFA8w12cDMEydcE2Nru4L1VoobIZW2Z4zt/GpMWTavEwMwHy+GLzfPbpv0tMZ
 C03fvnQ5WSXvXC6D37qZC+RQNi6mQHUrgfyKEgouHKEWRCnyN5LqLBqp85GpBu6q9LnO
 Nb5aDkq8EqgzB89OK2Fk75XaxwDIR6fz2co9bhu/yYQ4DHnIQSi3Jjs8N0kb+b9Hb6oH
 5EWA==
X-Gm-Message-State: AOAM530IVVlN0GwBdQEebxuixr9McU7iI4tr+UX5iiW8Ix0kgpelX+qW
 v4OIAt0qWqnohLJYzBC2lxM08HWfli6gPw==
X-Google-Smtp-Source: ABdhPJyv8qkZv44al7L6zewPQVenJJvLVr9/ox0DeUUJvdE8Z/lRJL1Nw3qRzvK+s2ukPkfKvgo0Gg==
X-Received: by 2002:a1c:4089:: with SMTP id n131mr17771042wma.77.1618763572897; 
 Sun, 18 Apr 2021 09:32:52 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m67sm19284706wme.27.2021.04.18.09.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/26] target/mips: Move tlb_helper.c to tcg/sysemu/
Date: Sun, 18 Apr 2021 18:31:24 +0200
Message-Id: <20210418163134.1133100-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h                    | 5 -----
 target/mips/tcg/tcg-internal.h            | 5 +++++
 target/mips/{ => tcg/sysemu}/tlb_helper.c | 3 ---
 target/mips/meson.build                   | 1 -
 target/mips/tcg/sysemu/meson.build        | 1 +
 5 files changed, 6 insertions(+), 9 deletions(-)
 rename target/mips/{ => tcg/sysemu}/tlb_helper.c (99%)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 13f8e421662..b1b1681bf8d 100644
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
-                                  MMUAccessType access_type);
-
 extern const VMStateDescription vmstate_mips_cpu;
 
 #endif /* !CONFIG_USER_ONLY */
@@ -413,7 +409,6 @@ static inline void compute_hflags(CPUMIPSState *env)
     }
 }
 
-void cpu_mips_tlb_flush(CPUMIPSState *env);
 void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
 void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
 void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 70655bab45c..6615151cba2 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,8 +24,13 @@ void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
+void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
+hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
+                                  MMUAccessType access_type);
+void cpu_mips_tlb_flush(CPUMIPSState *env);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
diff --git a/target/mips/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
similarity index 99%
rename from target/mips/tlb_helper.c
rename to target/mips/tcg/sysemu/tlb_helper.c
index 2304fff4c42..82cfb0a9135 100644
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
@@ -1071,4 +1069,3 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
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


