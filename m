Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC46999E4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh0y-0008UG-BX; Thu, 16 Feb 2023 11:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0v-0008QE-Uy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:42 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSh0t-0005um-Qe
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:21:41 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16346330067so3125805fac.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=DBt5lpDBZ7FO2DzMPl3lI8+DZKd6VUUUUXznB9hQWINmzGt6ksDU4wz42HFHjNkeVS
 62r4RG3O89ZFtl9qsxQm9v8UcHhCmU/u1e91y3P3+eDMp4H499htoKsmm/gS4l+0zT9z
 B9phARzjpegQbhPpxuD/qlGuAyQKR36ZwVtKHzzf7lXvFT4tvxbVzBA5U89b7d+3NRRt
 /IqbU2MqLOBnRizKwyNoxSmgczQUNS2FRN1nTugZ7fzKKbdpxMW1I5nKtjSIRT3GWIvS
 Jahsq57XBaJrP7zt0UkntpJ0+rdrJSfV18+RVgCeN7VCZdZ2BYiPhFoc5a19AWUQJwU2
 cuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ze670EFc4knKxHYmBNv1C1tJqYk4J5P+dEI+i7TEM8=;
 b=ZcypopdFUepy2B8Mcz6yvxccFI3XxkoxtvG2tjelX/Hfr/OB3QXfb7zhmAK9fuiB2k
 HayW4eGZ1rmEsnTl+3+Ele63G24+N/zvJm9DtxGPH+nLiF9IDAGSkFokq3JQMW/zNIwk
 rdgmy428H1DoUHD70SyNXa6Tb6q1ynIHvR17kcSkfADRj10KroAN4Ga/nkQa2b7RjRc2
 CSWp8Q9C4nS5MnpkUkMT6hBgiYWA+vo3PyAEfEK5iOUkrHHpoO+Rea8EmqbNKPFqt8Yv
 iz/1Lo3y/MYoebIsX6ZAVumJrct0xjuFkX4o1TrEcU+2QtfOIbnHeEXT1yo1EHqyOSFA
 gheg==
X-Gm-Message-State: AO0yUKVDfU6b1cz01zxO6fyxOHZVMorlBhsiXS/AqYB8LFivd9KRA/oK
 kCTVP/pmLkcGBmBOi1XelJ7p9BkLjk/4MQaG
X-Google-Smtp-Source: AK7set9QKkrmUkAHlSoIoJQWteErHwPJw1hu/tbPL4y0FErnFG+CtiSMjMhoB/oojuQtzV/3orrY6A==
X-Received: by 2002:a05:6870:1718:b0:169:de47:db82 with SMTP id
 h24-20020a056870171800b00169de47db82mr3343902oae.24.1676564498681; 
 Thu, 16 Feb 2023 08:21:38 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056870e15100b001600797d1b5sm693029oaa.41.2023.02.16.08.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:21:38 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 2/9] target/riscv: introduce riscv_cpu_cfg()
Date: Thu, 16 Feb 2023 13:21:19 -0300
Message-Id: <20230216162126.809482-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216162126.809482-1-dbarboza@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 01803a020d..368a522b5b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -653,6 +653,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
 #endif
 #define riscv_cpu_mxl_bits(env) (1UL << (4 + riscv_cpu_mxl(env)))
 
+static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
+{
+    return env_archcpu(env)->cfg;
+}
+
 #if defined(TARGET_RISCV32)
 #define cpu_recompute_xl(env)  ((void)(env), MXL_RV32)
 #else
-- 
2.39.1


