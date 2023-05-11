Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF306FF021
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 12:50:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px3rc-0001xD-3M; Thu, 11 May 2023 06:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px3rZ-0001va-De
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:49:33 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px3rP-0001z8-UK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 06:49:26 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50db7f0a1b4so5077446a12.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683802161; x=1686394161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eVIm/LvjBJ24H9Pum25QZnkpQR/k68A0D+Z2VL214Rw=;
 b=D9aIjctIQenO3p7ZyqVhOXTIpIl3Xe+/f4YV9Wn3YqQ3lgB16o3Yx/VaCNYqy5OXQX
 ii/IqMjccSq7Nkc5OL7VXTAmGz6xlBKuVSw7uCSTFZbJInpR0WIbKqnTKS2xO8xDKK/7
 hp2Y8KFGmWz6a2XyPrlLOEEmyEWAEUGI0LHteT5QRMGqwD1lsCQ4LeprATxwGfzAiY9D
 w8BKjTMwALGSo0c+0mPzZs7yeM6wf2UBTMxOAaMthbTroUaNupFACLXnDkJHajVnVCSX
 1pd5Pv8KSCzriApwGh8i3e8To7bjlj0JcR6fYuTQ8sqjErjqyWuhCDNSSL+WtzKBR4oE
 PTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683802161; x=1686394161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eVIm/LvjBJ24H9Pum25QZnkpQR/k68A0D+Z2VL214Rw=;
 b=Vpsdue7QtLJyObUl4C+tCQ3TXvCG/PmQAABqcXGf/NI1zqAxu9u/FQniCgOjzPkLu+
 LVltlM/R9xNnLNRByEVnO3obciISh55uL/25jj6CHC9PdcXsMiAkjFu5uAFOgdWw9+L+
 +qeS1D6EDU01NtW5JH6h1wvTruJ4S2kjLUVbZ4oERLl3X/bx8nvaVDeK8+AYHCSjuI0y
 89+2nedR9GrYaMf/aOmXPnZ5CD2GGhnpn8OIOYHEMfL7UNeYUGPHcETooC+7egmalMSq
 NSh4WdOik7+cnzvPddUq3xVPyL3dQGQGCWLD4DR7XNAHZHuDpVbP2kkqxwjegeAxPeMy
 uYtA==
X-Gm-Message-State: AC+VfDxAYssw+QuiCRmMM9XKQZsZtM7KD9TtrDVs+PnWC98xKRXBoj69
 5ifZUnPEc8O7ZFggYHDSYqIl/CCOyOfCVMwLhS12Eg==
X-Google-Smtp-Source: ACHHUZ5nyIQXHledUsp1C9vPCIsh5bAk5DZQx9jQHnPlwnKWPMOZ+t2GSGMGPvChepfAa70hliRE5g==
X-Received: by 2002:aa7:c60c:0:b0:50b:d755:8acc with SMTP id
 h12-20020aa7c60c000000b0050bd7558accmr16474532edq.34.1683802161503; 
 Thu, 11 May 2023 03:49:21 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n25-20020a056402061900b0050a276e7ba8sm2914027edv.36.2023.05.11.03.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 03:49:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL v2 08/53] disas: Move disas.c into the target-independent
 source set
Date: Thu, 11 May 2023 11:49:19 +0100
Message-Id: <20230511104919.875195-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511104919.875195-1-richard.henderson@linaro.org>
References: <20230511104919.875195-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

Use target_words_bigendian() instead of an ifdef.

Remove CONFIG_RISCV_DIS from the check for riscv as a host; this is
a poisoned identifier, and anyway will always be set by meson.build
when building on a riscv host.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230508133745.109463-3-thuth@redhat.com>
[rth: Type change done in a separate patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas.c     | 12 ++++++------
 disas/meson.build |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/disas/disas.c b/disas/disas.c
index 45614af02d..0d2d06c2ec 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -122,11 +122,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#if TARGET_BIG_ENDIAN
-    s->info.endian = BFD_ENDIAN_BIG;
-#else
-    s->info.endian = BFD_ENDIAN_LITTLE;
-#endif
+    if (target_words_bigendian()) {
+        s->info.endian = BFD_ENDIAN_BIG;
+    } else {
+        s->info.endian =  BFD_ENDIAN_LITTLE;
+    }
 
     CPUClass *cc = CPU_GET_CLASS(cpu);
     if (cc->disas_set_info) {
@@ -164,7 +164,7 @@ static void initialize_debug_host(CPUDebug *s)
 # ifdef _ARCH_PPC64
     s->info.cap_mode = CS_MODE_64;
 # endif
-#elif defined(__riscv) && defined(CONFIG_RISCV_DIS)
+#elif defined(__riscv)
 #if defined(_ILP32) || (__riscv_xlen == 32)
     s->info.print_insn = print_insn_riscv32;
 #elif defined(_LP64)
diff --git a/disas/meson.build b/disas/meson.build
index f40230c58f..832727e4b3 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -11,6 +11,7 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+common_ss.add(files('disas.c'))
 
 softmmu_ss.add(files('disas-mon.c'))
-specific_ss.add(files('disas.c'), capstone)
+specific_ss.add(capstone)
-- 
2.34.1


