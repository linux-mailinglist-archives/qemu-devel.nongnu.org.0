Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED6544200
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:15 +0200 (CEST)
Received: from localhost ([::1]:46908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8w2-0005Ti-FN
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 23:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8tG-0002jc-J5
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:22 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8tF-0006i8-28
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id h1so19233111plf.11
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 20:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=gdG4poOqnLowhBfaGguMxRCsHnkii2JLiGLrQUIDAVcPvFAi0zFJkJoLDRm7DLgp66
 1OjGXb2uVE3lMHB3k6yTOwzGjP0ootaqNB9Cv+5LchjkSeoj0TBItqlhS+/VuOxp9wvN
 gI0awhztZattXWi8JayUUpjmE0biT682WA5//Prb/yrRJ5r9W2EDlA9J/TbL2neM4c9U
 YsqAQoCIw4bov8zcx4hjfJwRp1BGGaeMt1xb4h3z2VEpK8piQOeJt2+M+vbZJyE/allX
 OZNJ2LaWoAfRUUE/zSRo2uXfJdGuwSLCHSZfJTIMmH99OJMV2b6IPCUb+qPjxN1mbCME
 DR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=kd28cChwwXz+ly4iko3/nCpbPgQ1u0+eJTFC0QYGNkC/RMveDi2jIj4WYAe868e8D1
 wN5QY4yyzF/vzvk2nHLygJT+bMyVIgystJo3TvzhxM93gI8A2HirauKK+vOiDeilH2tN
 IxQbDyxWvRno1DCU0NDcuH7uSmv9SwIYOqGIOTS6K2vkFgD4RkHDck+rzJ4u/2oPKdnc
 dZvdqb5qyVyZ/K5tAdQ34XxhXkE213Zqk32t1BYes/lfAkRxP1YNQHEa0smoUj3cEte5
 44bpIM38EkpM4fg9JWvxNl60MMEUI4W4i7VZhbdTEazr4GriMvH5l9m0pvQTJlBBuVaX
 60jg==
X-Gm-Message-State: AOAM533i8jFZxJm0uuS9JsHWUfngEqQ2QNRqcUC5gS9UVFc+K+4Xo4kU
 dCn4FZArF/79Y/gUou1OXznyJQ==
X-Google-Smtp-Source: ABdhPJzkFkiD9fqOnQaRoflCGGZjqa5XzxB0U8kur4dVJCK81zXwlDAUMTWBc7SnrKw0TbWfgGXCHA==
X-Received: by 2002:a17:902:db06:b0:163:e89d:622c with SMTP id
 m6-20020a170902db0600b00163e89d622cmr37359410plx.143.1654745478529; 
 Wed, 08 Jun 2022 20:31:18 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.182.198.228])
 by smtp.gmail.com with ESMTPSA id
 ei13-20020a17090ae54d00b001e31c7aad6fsm15053964pjb.20.2022.06.08.20.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:31:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Thu,  9 Jun 2022 09:00:09 +0530
Message-Id: <20220609033011.752714-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609033011.752714-1-apatel@ventanamicro.com>
References: <20220609033011.752714-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
implementation that don't want to implement can simply have a dummy
mcountinhibit which is always zero.

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in the CSR ops.")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 target/riscv/csr.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4d04b20d06..4a55c6a709 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,6 +159,9 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
+/* Machine Counter Setup */
+#define CSR_MCOUNTINHIBIT   0x320
+
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6dbe9b541f..409a209f14 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
+    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
+                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


