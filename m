Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3333636D0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:47:30 +0200 (CEST)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAa1-0007Yt-W0
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAM0-0003ed-UF
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYALz-0004kx-Bu
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id x7so31477365wrw.10
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N5k78fRA0nra+VbPuCAyAs9Q3C25mTx/9Lz4UoRw3W4=;
 b=cId7VKM0tChz9lIx+AomFv7/jXrlvqRysbpdwVanfRUhDfrbXUUcfMakkbSspC4896
 +bOT1ue4vaJqO8uIMr2c7Yelk0MkNjgWb+7vhetMo5r9strbo9G/Z6p5TKNukew3aC9G
 Mgqhr4VYTRLfJUH4wPb/BHqyXuvZNaCxmNg0V7utQHfkRNJurrCQduNCYbL+M757AClx
 Mq3EqXeSC8Sce9z8tfNZVUlnorOqSKsPZ/A8yXHdWZZLJT8qTLBvWFgk8bGJ4zzJEldv
 LSpufDyLVir/RVBB9X+YAWgk7nJSkf3KBzZe//7s/lS6pMDj/dhv6iksmMNNoOEG8/oX
 /KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N5k78fRA0nra+VbPuCAyAs9Q3C25mTx/9Lz4UoRw3W4=;
 b=SrpG5duCW+ggNxrv+8GON5i45gk5X/0B0ss8sXTpHgHuIif28j9w4zd/8LtE4eSrTC
 LxPYDANV2nq7ZfWqZ6M1yrNkVITYmI9vi91U28fcmFV6Ct9O0E/AT059NrePMx9zAVJj
 Bl2QdnP/5iW3oUsbFHCI9st/dYPNHd7wO2tnOt8QBiP1Gf8DwZUbZ1wypQN/T5wuhlIV
 gonit5z7dfCO/SGiBGEnyOYRidhEFJUBA/0G5g+VZyvlA5acjBBja5pW7vDeugcaU9/V
 J+zyKdMtpVK+8NKK84ifzDiXrqnKxf1F4sa85We6Tja3iISlpTj/CuioszPlPmur0I39
 rk/g==
X-Gm-Message-State: AOAM530z5VKGkrF+VIo7ELBjQa2QqorCeMqBW9UVkoTkDx/h5r3Jsc8L
 g+M6PsSBluqqJAsT2N22l4jJESEgaMb6kQ==
X-Google-Smtp-Source: ABdhPJzikpj83JjHxvi76vmx3BUn9NG0WIjpLGUJ7Rtw8rMjaivTWy3muvw/+AvJZDSURzuW0uvITA==
X-Received: by 2002:adf:f0cc:: with SMTP id x12mr10068827wro.16.1618763577556; 
 Sun, 18 Apr 2021 09:32:57 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y11sm17072854wro.37.2021.04.18.09.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:32:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] target/mips: Restrict CPUMIPSTLBContext::map_address()
 handlers scope
Date: Sun, 18 Apr 2021 18:31:25 +0200
Message-Id: <20210418163134.1133100-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

The 3 map_address() handlers are local to tlb_helper.c,
no need to have their prototype declared publically.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h              |  6 ------
 target/mips/tcg/sysemu/tlb_helper.c | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index b1b1681bf8d..2fdb7d9cd12 100644
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
index 82cfb0a9135..cbb4ccf0dac 100644
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


