Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68CE669E4A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:38:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHa-0002Vt-C4; Fri, 13 Jan 2023 10:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHZ-0002VL-0w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHX-0006US-07
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q10so2139136wrs.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtdqQxMj5WaUzOLBOctCzxB17/kRHA+6/4w50t6C8Lo=;
 b=dCX41eY9gYmNgiHnsIm1jG+rOHxr4t5dQxXfHnCo57wQvNGI5hJoebf24/XwtWIcte
 0Ne/hCHosju9Ta9M1J9mVv2cP47hp9CuvwOGH6dJsMySccfNsCG3wvGiCUranxGuKRGp
 9SOOZcpGVdQVtLGziOPjGu3r3FV2B/d9zYpUpRXaSn4/EaLbmLIeYv+EUmN3qcteoict
 FDQQ4N0UVM77YcUhLu2oDfCk2Bvw2LHyh+CBOi9wg+wZemtRyEbDEI50qCvmR9ClvHNS
 +09p+enenB4YOZdS6ABRm7dvUnWRWmDiiKEBjPRWEEkoLXdessro6xi9UfjpFruvaCrG
 Y5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jtdqQxMj5WaUzOLBOctCzxB17/kRHA+6/4w50t6C8Lo=;
 b=nybCsAF5aBuCraFmvzAA7w3SKUGxOsR8B+XGraPRW96efHLRyT18UYqmY4fyg4ftRU
 NeJHwHby5g8kelOKkuv76TR86SRAlJxaFeXOObmu482RTu0pqrceIC2otyL4BZMLeAzS
 p0W7c1ffoyLWhkrHxiCCY7YCeEl+I0eVV/WaEamWXeEV3fp/VXi90otI/hG78MzlRckC
 +CseqP/KqR1CpvtBc1D2UfCJz/8wyN6gLojLQ3WuER67dZyVZa06DTP7k6xj90LkY8CW
 yAuSTWiC5dOzD1Yn7FnPS6tdO3tlTP9nc44epzkc+UX/1HPNyvYfgu7/T2yvtRLr2pn8
 KJlQ==
X-Gm-Message-State: AFqh2koZaw2w3P3/9DqIQ2ydfXGaik31zonSclUpBq+nWMeilWYz3Y3R
 1/xCVzRso4qc9zeUJCGDVTmSBJmzr4HvryVY
X-Google-Smtp-Source: AMrXdXsxhWLWoBJWCzKNAIRdP+SLCViv2DEbwx6ZtglguvClhTxA5Szporq/gRNGrj+TIOYLQ64QTg==
X-Received: by 2002:adf:f2cc:0:b0:2bb:4628:c02c with SMTP id
 d12-20020adff2cc000000b002bb4628c02cmr19107705wrp.53.1673624869462; 
 Fri, 13 Jan 2023 07:47:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adff982000000b002bde537721dsm1221156wrr.20.2023.01.13.07.47.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 28/46] mips: Always include nanomips disassembler
Date: Fri, 13 Jan 2023 16:45:14 +0100
Message-Id: <20230113154532.49979-29-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

Since the nanomips disassembler is not C++ code anymore, it need not
depend on link_language == cpp.  Always include it and remove the
CONFIG_NANOMIPS_DIS symbol.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110084942.299460-1-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/meson.build     | 3 +--
 include/exec/poison.h | 1 -
 meson.build           | 5 -----
 target/mips/cpu.c     | 2 --
 4 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/disas/meson.build b/disas/meson.build
index 1977f5cd92..c865bdd882 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -4,8 +4,7 @@ common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
-common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
+common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c', 'nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/include/exec/poison.h b/include/exec/poison.h
index f0959bc84e..140daa4a85 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -74,7 +74,6 @@
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
-#pragma GCC poison CONFIG_NANOMIPS_DIS
 #pragma GCC poison CONFIG_NIOS2_DIS
 #pragma GCC poison CONFIG_PPC_DIS
 #pragma GCC poison CONFIG_RISCV_DIS
diff --git a/meson.build b/meson.build
index 175517eafd..5d68a8fd23 100644
--- a/meson.build
+++ b/meson.build
@@ -2490,11 +2490,6 @@ disassemblers = {
   'xtensa' : ['CONFIG_XTENSA_DIS'],
   'loongarch' : ['CONFIG_LOONGARCH_DIS'],
 }
-if link_language == 'cpp'
-  disassemblers += {
-    'mips' : [ 'CONFIG_MIPS_DIS', 'CONFIG_NANOMIPS_DIS'],
-  }
-endif
 
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 052e54bda3..f995e88776 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -434,9 +434,7 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
         info->print_insn = print_insn_little_mips;
 #endif
     } else {
-#if defined(CONFIG_NANOMIPS_DIS)
         info->print_insn = print_insn_nanomips;
-#endif
     }
 }
 
-- 
2.38.1


