Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B931B55BEAC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:14:06 +0200 (CEST)
Received: from localhost ([::1]:37156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64U9-0008Du-O8
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631q-0005bO-On
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:46 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631p-0006V6-8M
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:46 -0400
Received: by mail-pl1-x635.google.com with SMTP id jh14so10022955plb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=C/sziOYWFrRn9LEtgtvFV/oq0dBYOdwLcsR3lH/TzQBT0WL3VzlyHn5+naf1tb2lia
 yPH1HLfCBOb81/M3GaFThCUdbBZ9M3lPvFedvI9Q6pv1qKpSJXNtjUrSffVjtXLI5CIi
 qAIV0jjLBkY+fRW5g12PRWLnW50flIGjXQdmDGiCpz32yD4Opkvvb4JcqUK9oEBlcPA1
 KsVMPC0Bi93CAbhFiDFU1LhyM0GyURYgX89ig650R949WLdzxXbSabAtvmN3H7DdHviW
 MMXDD7dhdtYvyNeeJST0mQXkEyHy+wmnu6WQmh2p4Z+4c1t2IP4dJrAcCDBiNYRLSyh4
 SnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6J7gL6BfZeqHNBCJK+8rR2sxXz+yKeHStI/GCp5riaI=;
 b=BtkngYJxn/dliJqlLbiiszj//CxoTc0v4K6MKO0WJWSiI/AS1gi+lzDGeOkOin41ob
 Ju92WI1z3fpkq8N+bNUX8ehUwQ0uAyAhd21MiayLgHzpBtR2Qb9CmtHsh5NqhQXdIlag
 ptbvgEn1wGasq+ZigI/FmIKexW8w3F0RvTk0Wen2RYmQXAIf8nSaJ0eeLzOuiN6SIc6/
 QTELpyUAvJWcJ4cI2/RKjjBjdMKEn62+Ku3K53+nhsILa/8BtDek48pmrJMJjSjHOTdc
 0z7KrM34ag0LgQsSzCBke2X3huqm4bsxh1stDmZ04kmT7IbZ9CNrxB2zQkTZ8HtBK9c2
 so5g==
X-Gm-Message-State: AJIora8aMMpTOvZtFGgRDXVY/w4zGZ128eCy/KpavOhxa9xlYet5EvJc
 +AgevhKM5Mj66I2GZnY+1GQ5ig==
X-Google-Smtp-Source: AGRyM1v3o52IpJwXDuFbnKq+cDPH8VWVcIL2IzF6PXlYSrZ5ajGAfOlsza/L9w9jw6ZHQ3k8xbQg6Q==
X-Received: by 2002:a17:902:ef8e:b0:16a:5449:2012 with SMTP id
 iz14-20020a170902ef8e00b0016a54492012mr3097242plb.46.1656391243944; 
 Mon, 27 Jun 2022 21:40:43 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 1/4] Revert "target/riscv: Add dummy mcountinhibit CSR for
 priv spec v1.11 or higher"
Date: Tue, 28 Jun 2022 10:10:25 +0530
Message-Id: <20220628044028.659704-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628044028.659704-1-apatel@ventanamicro.com>
References: <20220628044028.659704-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x635.google.com
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

This reverts commit 33cc1c0b69e457f5c526f64297353cba6f7bfdb4 because
commit eab4776b2badd4088a4f807c9bb3dc453c53dc23 already implements
proper mcountinhibit CSR emulation.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu_bits.h | 3 ---
 target/riscv/csr.c      | 2 --
 2 files changed, 5 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8724b45c08..b3f7fa7130 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -159,9 +159,6 @@
 #define CSR_MTVEC           0x305
 #define CSR_MCOUNTEREN      0x306
 
-/* Machine Counter Setup */
-#define CSR_MCOUNTINHIBIT   0x320
-
 /* 32-bit only */
 #define CSR_MSTATUSH        0x310
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b5734957cf..d65318dcc6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3642,8 +3642,6 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
     [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
     [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
-    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
-                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
 
     [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
 
-- 
2.34.1


