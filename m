Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ABC534D15
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:13:47 +0200 (CEST)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAV0-0007Mi-Qd
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANS-0007Uq-Dx
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:06:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANQ-0000sF-OK
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:05:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1314436pjt.4
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6MrD6bzN19Je1Xt3JmYim4uIDMcK9Yyrc6qTYo17mM=;
 b=NvNlvCI6HhMSLd19YYvZUNNq9a4yomNfspgfywybPYrVo+JXqa9zoWpZ3mZpJmQd2y
 yh9DrXL7YdthjrAwKzz2Nznjj/FgC8klHoLhGs5OeJur5crw2Sh43/kNXKH7ZbF5q5nV
 tvElxTFjKHPCoYfVdqDVbbI/j/ZIoIMg6CAiEzXU17pUKotifxTOBr8TqHyb2FAIG2NU
 5nHVojnryvbBPKWEQ425OHRjkxO9rk50YIW1IJoo2KWG/LFbsSLQeEVnZeQiyiLpS6Xp
 KOAegreZ+0Rqc/mhQhj501T5sbuPzEgDLOnglnTbnGtBhdx61KmvGmDqe7zn0fd6Jl05
 gEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6MrD6bzN19Je1Xt3JmYim4uIDMcK9Yyrc6qTYo17mM=;
 b=r+Uajq1xOW21rEDYZera11l5u4lQnEGAwJ6XW/NZDvTvzCG24XoV3n1vtFze6//xlH
 whxZCpEBxH3s2zAsoA+h/dHBsozCtrMZY81hDKuwdZGT5oF2HW4C1Dfer5ftksxwE6dT
 +l2isEal45+byRFJ6PPgG7NMMZTFggitsAwaRa2PGcywGk9WoGWtRLUew+bcVG7NuSy0
 0pz48q9cAV9TFn2aX9NNcbWi1hBlMyhVwMp5YbaG5d57rkIOXoZlT1XulEjWUhmPBmCT
 /Vd/a1ZAjQu1fjF9ockBl1XLOMdSJ6oCFN+UMGE3Ns/pxGoSyxDl72XWUV4I6bCqHTa0
 gzMg==
X-Gm-Message-State: AOAM530PVv+UeoljBvh36JEXzvm1MqrcQiekaxMUxbNcpei2VV6IW321
 Cb15K5rq0p8lHc4PMfMdhKtnmw==
X-Google-Smtp-Source: ABdhPJwOb1/CNA4rVlWexFr84+a/gp9IWX5EjX6DR9l6j3fLLU4YGdzf78BeuDayscnSFUzLxpdB4g==
X-Received: by 2002:a17:902:ef45:b0:156:1858:71fc with SMTP id
 e5-20020a170902ef4500b00156185871fcmr36439276plx.23.1653559555520; 
 Thu, 26 May 2022 03:05:55 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.94.60])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa793ba000000b0050dc76281e5sm1020126pff.191.2022.05.26.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 03:05:54 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Thu, 26 May 2022 15:35:34 +0530
Message-Id: <20220526100536.49672-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526100536.49672-1-apatel@ventanamicro.com>
References: <20220526100536.49672-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102d.google.com
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
mcountinhibit which always zero.

Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
the CSR ops.")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


