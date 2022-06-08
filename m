Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7175438AF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyyNZ-0001xa-Sb
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyL5-00073q-JG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:15:23 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nyyL3-0002cD-Qv
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 12:15:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so21080989pjm.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6MrD6bzN19Je1Xt3JmYim4uIDMcK9Yyrc6qTYo17mM=;
 b=chhzcMCF/4yPlQGichb2GHoVHQsKJh57/D9/2a1yNnJnuMDuQTRXDGyNtcss+9oemx
 TL+2SQUwPGiOshVrz5T4vu/H7v/RDduiFJmyl+W9cMT28IDg3ZgN+zCiLHDn+g7zuUHi
 l+V4cyNZH7/LyRroznvvvlMhhYk/18K7U1pwOLocy8QBjk1lcWWvItm48WKJAiEe7dTx
 cDX+sxpQl9+jbzG0uqjXfrQd1LlMAYm6+Fiv9MrI3HxuvGg0YB+r+gjYJUVM/uspAUKn
 M6srOURqvsZR3csHFS/pv5GmnFlR/6J6mDFmv/myoQ2/LvLCPYYbrFGirbKw81znCTby
 fIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6MrD6bzN19Je1Xt3JmYim4uIDMcK9Yyrc6qTYo17mM=;
 b=1QO82ZSLWzE/r9dD1UOWA47zh3olCe9XHxlrQJfbAucc44C/LfXRZn3lGR8OXN4GX/
 hb4Spl8F129VcKaT7X3gp9fwYaqBQTrCokH43NkwakhfGJauy2O1dCiJ7TQIYyPgjQRV
 UMuA2U00L4nhQcWgBdZ3dY/wrvFvXjmIKQEq4XzNk2i4shz09LJx4MUQVKnvPWFqdjb7
 Ej7EXS3KBc5bCojCGEnl3JIrJh8WmpZHu8vR2qQlIOpSpco/wfugIwABK1Y2VVIKef5Q
 9FMaznLahF7HCGP3wkC4ipYXVPMv8AMzpkFWjzaWbt7cnE/0iTjbSiQoM6PPZYJqVBVy
 7eQg==
X-Gm-Message-State: AOAM532JlIVyMgKN5FKBLzm+5vp8sSr6+/hKxPk6v+rQZfBPQUF5/4VW
 eopnfrYsoDwENLIEIHwudDuERg==
X-Google-Smtp-Source: ABdhPJxqwQCxf3fI8IygActJWkkR0dX1eYfxLcAZ8yR0Oba+S+7XXvejuzL8uzTWtcppL36dYGJfcg==
X-Received: by 2002:a17:90b:1101:b0:1e8:5df5:b2ac with SMTP id
 gi1-20020a17090b110100b001e85df5b2acmr24183728pjb.239.1654704920478; 
 Wed, 08 Jun 2022 09:15:20 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.162.103.97])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003fcde69fea5sm13374843pgd.81.2022.06.08.09.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:15:19 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Wed,  8 Jun 2022 21:44:03 +0530
Message-Id: <20220608161405.729964-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608161405.729964-1-apatel@ventanamicro.com>
References: <20220608161405.729964-1-apatel@ventanamicro.com>
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


