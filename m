Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9E6A945C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:45:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0yt-0006f9-Tl; Fri, 03 Mar 2023 03:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yj-0006bE-Ag
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:26 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yh-0007le-Gu
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:25 -0500
Received: by mail-pl1-x62a.google.com with SMTP id v11so1964276plz.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832881;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b78UWC9uO9LxVpWkpN/xs0h4gShaH6sg+/KTvj59t3E=;
 b=EZ8I5II2oJMEU+btNsknYwfXouwIb/GFdSnde5b2ccW6zheXNAT+0U+nMrAx5sF+j6
 h6tb31w8BSno946APJIv9L3ii1KqSG3rXBf0F7rx3kLG0NMoforggNUJg4UkimfjSmcF
 eQiMbWBnaCDvezmcom6MIpGJcyEVMmUQKYcVJKtY1HkxOO2FuhuCiYF7HmjPXfiQic2i
 ErLTv1VI7t7UM3f9JTQkSv1vp5B0ixLrcNv/1Ska183h9JoCDaDm30VCcwJd9LdPUGOm
 g9x03dYakQM6uxz0INoIZfEV+O726e9Rkh5qeQS5/RXvmNsV5OPpRbUmQWMylhi6YGt4
 Pqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832881;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b78UWC9uO9LxVpWkpN/xs0h4gShaH6sg+/KTvj59t3E=;
 b=apxIG+FdSCl4nMuONeXlJ1xKDPmYcUW1aKxJGYW3QjHfusvEm1KO0T1v3zElsGYF4s
 nJZC3inkJ09JUu30Lv/7FVe+Y+qPlBsq3soS4IODL1eT14PaNhXfhtDpRzIxia3k5gh6
 aMEA+ZWECG0aeWD9ai4lyRW/WbHiv4kuZ54dr5/SoqwwURNQLoOToHUeM1iukAU6vGHX
 D/Hgrf9gXgDxYfWnViPdYiq7zXoAc2i94P5YHSttdzJzP5v1hMah7HchZDG34tnkmqM5
 +hneppQcHoC2+xZBG86lYCxIv0mKZHpLsNg4V/4BNEy6SH5Oy4ukdEJ3P88SRumWnrXA
 NrZA==
X-Gm-Message-State: AO0yUKUsLiQJV74V7hz2Kl0eBeStq/afdYR5/a36vtieaKaLAtSJe7uT
 JX/Fjda9eIjWoEhlAk7hjQnRKg==
X-Google-Smtp-Source: AK7set88rnUYDfO7QNOQbML6Hk46FIloQo6dJo2Op0D1fh1njCt80+JvG/87c3T7hXcklT/PJsliSw==
X-Received: by 2002:a05:6a20:bf25:b0:cc:8a62:d0d5 with SMTP id
 gc37-20020a056a20bf2500b000cc8a62d0d5mr1262791pzb.55.1677832881511; 
 Fri, 03 Mar 2023 00:41:21 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 bm17-20020a056a00321100b00580fb018e4bsm1003792pfb.211.2023.03.03.00.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:21 -0800 (PST)
Subject: [PULL 01/59] target/riscv: introduce riscv_cpu_cfg()
Date: Fri,  3 Mar 2023 00:36:42 -0800
Message-Id: <20230303083740.12817-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

We're going to do changes that requires accessing the RISCVCPUConfig
struct from the RISCVCPU, having access only to a CPURISCVState 'env'
pointer. Add a helper to make the code easier to read.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20230222185205.355361-2-dbarboza@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 31537fc05f..7ee22cbfa1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -654,6 +654,11 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
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
2.39.2


