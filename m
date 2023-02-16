Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DE3699F86
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 22:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSmEf-0002w1-1w; Thu, 16 Feb 2023 16:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEY-0002tN-Bm
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:06 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSmEW-0001tk-Jf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:56:06 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16debd2786aso4269266fac.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 13:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpDj8k3lJo/XtW4BCH3Fxn4DtHHE56QhiG1q9jXxaq4=;
 b=gPI1AiytdMXSABrJXdbN9mx/efsPw1coxf9Tn7s7Dh45oX/agETYF0pegdKAseAI5m
 jma4oFGO15GCxehxGPic8mTgPMafv6ZR7lIpaPCniU8/4T5jnIQWbgKyIjltVvetcgRX
 uxpoOxYpkcxSPR8KVP/SL4k2KRyyKRltfMlRpF6+yKT+tE9twwgX/aYVbWiQFLFEPIeu
 nsutwTY0bjGu7/tMFQ7RYesGwNF5Qjgep9sYK5cR+N/5Fu+N7/htE0AiT3EuYBZn0VkW
 Jjw6CI4UWoLG26nrSSSCxYott1gsEhpH+6+P0T43Pv0d6FlmftqyExHNhwykSnbcDdLu
 WCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpDj8k3lJo/XtW4BCH3Fxn4DtHHE56QhiG1q9jXxaq4=;
 b=W6LWetWFik8m3eL7j71wONHSPY1ODHPIcANMh6x1iblej+nzkO1FYvZRV9p7snbPKf
 4VgP4YlmdjEm1DbuqZG5KtS88wP0r53FO3KmwDTw7G5r5VBeXC18LWxwWphG55M78ECa
 drm7ZC/UGuLSzOtgTFALLUwY83Dzf2rdIhQu7lpEW4jsgZdmUkVHOxg9yB5PzAsXQ6Lz
 htp9fR1YOtGmiwuZaxqVaICNYvjmlz4OAmkDcGwECSDcphGbPJrujZ+e/aHE7U+r1lQ3
 SaL5L1cgMWp3BEGNlkDXZ9S5kHpQ074gxUQXSkmWmVLcCoFKFlbcebKJtKg+hb/oG3zH
 umDw==
X-Gm-Message-State: AO0yUKXms2xIGTtcHnbgiB6kYY4ObLKt3BGO3ih1Fkl1Lzada6Krg+3F
 JO3ot7a61Tf1VgkN2pXxuL4WcHEXLhQkDmgg
X-Google-Smtp-Source: AK7set9UNP4yCVZA/e5O+IQVD8Nk6jNiD9kL5TyhNQXNd/sxSaBoIb0iPNbHrx61wFiy+yt2W1SHiA==
X-Received: by 2002:a05:6870:d0c4:b0:169:c244:8a07 with SMTP id
 k4-20020a056870d0c400b00169c2448a07mr4366594oaa.58.1676584563206; 
 Thu, 16 Feb 2023 13:56:03 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i132-20020acaea8a000000b0037d7f4d0890sm1047570oih.26.2023.02.16.13.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 13:56:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 2/9] target/riscv: introduce riscv_cpu_cfg()
Date: Thu, 16 Feb 2023 18:55:43 -0300
Message-Id: <20230216215550.1011637-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
References: <20230216215550.1011637-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 01803a020d..5e9626837b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline const RISCVCPUConfig *riscv_cpu_cfg(CPURISCVState *env)
+{
+    return &env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


