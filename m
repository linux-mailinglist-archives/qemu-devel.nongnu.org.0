Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641124396D9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezWm-0005s7-G3
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKZ-0001lN-Ak
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rpathak@ventanamicro.com>)
 id 1mezKW-0005WF-MU
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:43:59 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e65so10806994pgc.5
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7yXLiuOcBTxYABPq5lAJTZLVXh8n3YYUevwT4wKlq2k=;
 b=cWwQ7CHifJjfDW0kqDPJUc+U64yPNYUIjKyhHQtpbef8MqdwEZci1jmIJFwzaSXJkX
 u7UzRqfvnUzPPtKmqYDJu6kee2U53xrLi/kzNuRQJBmAtZE8DrGR/M+hJ8/4cpO45Rxi
 ITw9wce31v2LP+22G848rVKL4U52VNB76vU2iG0PAAse9T0w0N2+tRdZvFGyV4MszGuY
 rmLK5DlUIuLjtxAV0LrF+nCzMABHHTwKTcGcHkILtgXXp+8DGKXOpGC7meRe/FysjIfB
 LadR96lyCxVrP6h8/UYGWIBi1Iu6DH2MpDAoSRxdKudCZ8v+oigmaTmcvbCCtH+Z3ONB
 YVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7yXLiuOcBTxYABPq5lAJTZLVXh8n3YYUevwT4wKlq2k=;
 b=wA2IpQYdJlnc8F+i5vieEI5cXQMaEgljx+ZnRNnXBbvhefg2zfG1vpQgz3L9Gj8pJZ
 8/PzyLvEF/UyN0LX8aNmNsB0lU2qxnxocE2gl8ZhCf+OojOpiZy6YvMcogIe2ClOdfIa
 L3gY1/d853NxKxFByCblY7YNFzhz1f7Ih6m2V/dAy9p9sAingkIKb1z/k0WAxFm4I3U3
 9Gscj3K0DfuXi3NWnzkt1bnxvAx2FA8ckHgfjOMHeejvm0XGRG5/uNDRhd7kzDhOdGNe
 qqyB2vNQjkvPD8OyPVP0O8xBdrqAM6UcJaQUsAj0Z20fVRp1rb33LLbR4dszv1moofZW
 NC6w==
X-Gm-Message-State: AOAM532rl/vIyijQmiAj+YHqTvwNGH1/g3VUb1EJCxrbLfKYhnwtRItT
 QXAv1RQLEMzw2oaSBNDVW8n0Eg==
X-Google-Smtp-Source: ABdhPJwJKdJiw6HtmGMWTiKqP+HGnZMdeypFeeHMl/MK1G5a/oQ2+u9PMsTxVkDSpMG2i8N1ZbEd7g==
X-Received: by 2002:a63:b145:: with SMTP id g5mr10095805pgp.355.1635165834850; 
 Mon, 25 Oct 2021 05:43:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:6817:c049:7263:28b8:7cdf:c7e4])
 by smtp.googlemail.com with ESMTPSA id nn2sm3293461pjb.34.2021.10.25.05.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:43:54 -0700 (PDT)
From: Rahul Pathak <rpathak@ventanamicro.com>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, bmeng.cn@gmail.com,
 Alistair.Francis@wdc.com
Subject: [PATCH v2 2/2] target/riscv: csr: Implement mconfigptr CSR
Date: Mon, 25 Oct 2021 18:13:19 +0530
Message-Id: <20211025124319.195290-3-rpathak@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025124319.195290-1-rpathak@ventanamicro.com>
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=rpathak@ventanamicro.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rpathak@ventanamicro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
---
 target/riscv/cpu_bits.h |  1 +
 target/riscv/csr.c      | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index cffcd3a5df..e2f154b7c5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -140,6 +140,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15 
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 69e4d65fcd..2d7f608d49 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -209,6 +209,16 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
 
     return RISCV_EXCP_ILLEGAL_INST;
 }
+
+static RISCVException priv1p12(CPURISCVState *env, int csrno)
+{
+	if (env->priv_ver >= PRIV_VERSION_1_12_0) {
+		return RISCV_EXCP_NONE;
+	}
+
+	return RISCV_EXCP_ILLEGAL_INST;
+}
+
 #endif
 
 /* User Floating-Point CSRs */
@@ -1569,10 +1579,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
 
     /* Machine Information Registers */
-    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
-    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
-    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
-    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MVENDORID] = { "mvendorid", 	any,   		read_zero    },
+    [CSR_MARCHID]   = { "marchid",   	any,   		read_zero    },
+    [CSR_MIMPID]    = { "mimpid",    	any,   		read_zero    },
+    [CSR_MHARTID]   = { "mhartid",   	any,   		read_mhartid },
+    [CSR_MCONFIGPTR] = {"mconfigptr", 	priv1p12,  	read_zero    },
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
-- 
2.25.1


