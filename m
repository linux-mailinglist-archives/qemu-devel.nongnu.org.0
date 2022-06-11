Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9915472CD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 10:14:10 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzwG0-00031Z-Ox
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 04:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4b-0003K2-Ck
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 04:02:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4Y-00021E-Li
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 04:02:21 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u18so1080687plb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=K2vK2Ekqs2VRw14pfK+188Xunjtf4RMgkIrwvcwCkbQsHeP+UnU+8VqbghVX1GJ31t
 P/b5bIZyaW9Os5CUr0FI32LIe6GBX4HRnj8TyfChut1dAem1IYpdyMta68Li9UEngHvi
 ugtbMUS6PdTOTUV0w5FytlKIIL16bIHS9KWFt2q/gkeob33ibfIrWT2RwGkvjEHHBU4d
 tpBfLg74CQ8qLNlmrstRz4Rrni/jmBgj7IXu2gsYxzYdzju7sijvmAXz3hmYlARMCOeV
 rjBvBjbZM6KRpdTN9zgO13rY7xWNZu8fDLcp740cA/aJI7tmrHInZOHKJ0nT2MLBbOE5
 7CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVHViNMuB7xKyupW6LMRK2DTrEYBRxgZhhJyysMzOXI=;
 b=gClOOM8lpU52K3DRBYQ7yDMUJmWbt+0UVKlbVpYT3wiJpkFUp7L6BHhGaXrgdlLoFS
 3Ljp7YrgU86QBAqhxiQuzSzW5yNaqsZe3M+Hx1YAWPTGKe03c7vgM1lYnXNWoRk5C+rO
 1eCdeHMnStQu3lgrtonNwGkX5VzJIgHKEmm/J2ApWH7PpqN/XcTEZnNYstLb6E5qp230
 28uVTFSSqqnahzaywVwAJe7LKh2yQNmaxfXASa5cYB1Qpu4H15lKB0EiXu4/fNmgCv0d
 3P2Wh2U5T6rMPst2mtU00d8Rwxqv3Bd5zWGSi2K1lKEYWySE2CKaXT2eCyMLP4YqmlQD
 YaFg==
X-Gm-Message-State: AOAM531mJcviuZk1rI79+wcUIhb0ZmQ1t3xnYpmS1YHdwKGOdntdr+9Y
 pCL1BotERZXSwkmEQBKrBaLgng==
X-Google-Smtp-Source: ABdhPJzNldIB4DrETIJ2gKBeV35RRXKWNU/cm299ziOfhSws6SwQGrvJG1C37mxT3MqfsG9sz1JxdA==
X-Received: by 2002:a17:90b:247:b0:1e6:7f44:e385 with SMTP id
 fz7-20020a17090b024700b001e67f44e385mr3951162pjb.195.1654934534157; 
 Sat, 11 Jun 2022 01:02:14 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.61.69.124])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a62c701000000b0050dc762814asm889025pfg.36.2022.06.11.01.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 01:02:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v6 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
Date: Sat, 11 Jun 2022 13:31:05 +0530
Message-Id: <20220611080107.391981-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220611080107.391981-1-apatel@ventanamicro.com>
References: <20220611080107.391981-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x62a.google.com
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


