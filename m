Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F34A9F15
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 19:34:29 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG3Pg-0007WB-Tl
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 13:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hS-0006GK-MW
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:48:46 -0500
Received: from [2a00:1450:4864:20::332] (port=36711
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2hP-00042j-Cg
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:48:46 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso9937813wma.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWcEcKKXy+fNKuWe6BdFdObuWK96LmaHxLY4SkbstK4=;
 b=3hevw2QNesbci7wTTJIFASbONBzKqrJqWo7rvebZNHvcR8OHWN1mx+TWcI8ZUV1moT
 rLQZ/Nxekoldc2nKR2DyZkeq+DZXcqBRv21uyCXP+7AtI3k0rCqKraJq4vtle694uvTV
 m7EO3BGRUjkCnMBgivRRL3IFevOwYL9W6BL8YU1oc0A5yqt78MQFZrvbD/GOt7u7yUto
 WTrzc6P1S7EPYRpYO0SU87U1tXo+QaugrUGB6NiDHYQ0GhZC9KRIT0PqLqrzU2Zyo3pZ
 4QMwXl+ufXqvVeh3q7s4To5rm1cObB2aBrl8E0Dwhtlau07FOGImUsh8sJg03qKrbIBH
 oC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWcEcKKXy+fNKuWe6BdFdObuWK96LmaHxLY4SkbstK4=;
 b=SZvhdA2oSKtccbCFKb3sWDRQOgXBYeXUEum+/jyEZ+OV1R7OkA+QAzoFTEO/JCCygx
 +n968s9vBdgPaLIIA/U8Ux6jUmuXf03dHnb0KiuAFq0r2oeYzXdaqPXEgbr5q9FEptTV
 /ZYyGhHU550q367nqNp+4g2Bqja9ajoxIoRDdqIontzVRtaB7NnDhHrYQSIeB6T67gxI
 Ca5f+wgt6sB0jamoZoOi8/Qk6BppKnOJcQS1eoSV4pInWvxF6qKCcWErduQref2JFyDJ
 Joy8Z25vdJPELYgayoXn/Rz5WA5uzXXR3Ypilc6MIUfikba295pf0OLS7UnMHjW5mP/f
 BHLQ==
X-Gm-Message-State: AOAM532FfMOO9nFAhqzd0+N4hPuG9dNwJSkHTvJgKlfIiK1Xrrg63hK+
 tcW/6amqsK7pGV6A60gI7luRfQ==
X-Google-Smtp-Source: ABdhPJw5BEsQq68aXgZwd2Y7CeZHzNoZ5ofiPJzgomvbNcKV8Rn0xqIzKDpkj5PZJ7C9lrs0NTCsfg==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr3085728wmk.139.1643996921989; 
 Fri, 04 Feb 2022 09:48:41 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:48:41 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 17/23] target/riscv: Allow users to force enable AIA CSRs
 in HART
Date: Fri,  4 Feb 2022 23:16:53 +0530
Message-Id: <20220204174700.534953-18-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::332;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 5 +++++
 target/riscv/cpu.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index aa183d3c17..2afd02d713 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -537,6 +537,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
 
     /* Validate that MISA_MXL is set properly. */
@@ -782,6 +786,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
 
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c70de10c85..7ecb1387dd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -376,6 +376,7 @@ struct RISCVCPUConfig {
     bool mmu;
     bool pmp;
     bool epmp;
+    bool aia;
     uint64_t resetvec;
 };
 
-- 
2.25.1


