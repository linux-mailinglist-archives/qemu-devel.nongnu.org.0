Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3643722ED
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:21:26 +0200 (CEST)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgwP-0001cZ-9n
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpQ-0004kv-Sm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:13 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpO-00008S-6Y
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080050; x=1651616050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cQ+E7bgIWZyDSwMRwwYYu9Yg/pKRgf4qLqVbRNdF+II=;
 b=l/9QQlP2NO+g3Bx7uRKF7O1wwB13JQI0LUUkgEuElSs1KawcPQGLDKOU
 egKKEhKNUUn4M/4aqZ5lbpwMbTnipFY/t3suzQgWuzpg6zARo9BNSNL6D
 U/17jP65fvvbtM9Nb4fl+VU8i5+uY1WdPAQDpjW7vK/qftnOrjCDMpcFz
 aXZEVnp8uCuORQHL73HcPNNTUeFKbHQW2HAewhEFTX5apafLvSA3MLqaZ
 85EMRZYPNDp3rCE4OooLQOTBJzmm6acPJ9NbVLnVYwIVSDladcSUHdUZe
 33u6EoQCoLGy8QktVx1YBwcdjY+N5hy7iRrUuLUOG8oUFNBAtwfwypKCb w==;
IronPort-SDR: w4CeeGs4HnM1usGvtG5p7VgayTuq8VUtW8Gw9IRYJ8vDIvfjCQopA0OC+QXaD+Xh4iK+9v3aQ2
 d+8/agNcyFemLhWas1wurZFtscwqZnLu+JwfQTMzjNqaWckEVkr3kU9mlHuUWIIvAfATzkdSNl
 65ONMbLGerNngda3akYCInUyTnGag+YAWz5bMuyAFvS9q5YO8P9Aqv2CZphGRewxAadj54x5OS
 ykciKLAlAzFe7oZ5uAiiyQ/1kY/10HqTPpUAYBDdjZ62rOdMwu2T10QLkU3xe8LebSLeZuaVeL
 hEA=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114619"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:09 +0800
IronPort-SDR: ChO1GjR8zSiHXzrbGwqU/FLa8+jq/cno+unn3yXQAvN0HhpcxO1++rd+8HUFxlJz2B3CoanEYp
 /Jqia8Jda3HWNcNhbglPzFqT/Ery3cOiclR5RMv5HED0YbfVW2exTy+QvCACH6piYZ9jN7o5YE
 FgevvDJaoscEPQ+31ZOCaAi3tKiL8qV06wkcAtpFRoU4X5EuoIdt1kuTr2VGdx4RDPU4zFjaJL
 BjBNwufZpBmMsylpgEKSRYC1K2AT++QqyXzpISBc3ym13VY4tKgmdqQltDif9j1kKRMig5hU+2
 9bs6KI1+0MrNI1t/vt9miDZo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:20 -0700
IronPort-SDR: zLe3MsDDRsv6ZYWTVdxc3iECNQ/AupWhtGb1l3bSlhxrGCtnZ2p7HLdT3C1uZVAXQIq9Qmq22T
 h8pzCR0w2nOo+3YqMyLZAcUKEZx89M/jQOo1b+LirfnziVvYJNXSZ8s1+SmFBai7AUrkyNBbZo
 PwpamLvyHyVt8WruNiWb85yV0YB78guX/NJZk1RdmHQd+6NinMeWgibH+EByTN5J2rrIo3sMC1
 DK2F5Fsi5QtvmdsuWKn9r/vL2tbHDWQp6RMFTsWzj51mXtqBeDxlz4nCcg3mUE3u0bh3vvMG1l
 knQ=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 09/42] target/riscv: Convert the RISC-V exceptions to an enum
Date: Tue,  4 May 2021 08:12:54 +1000
Message-Id: <20210503221327.3068768-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: f191dcf08bf413a822e743a7c7f824d68879a527.1617290165.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h   | 44 ++++++++++++++++++++-------------------
 target/riscv/cpu.c        |  2 +-
 target/riscv/cpu_helper.c |  4 ++--
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index b42dd4f8d8..8549d77b4f 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -504,27 +504,29 @@
 #define DEFAULT_RSTVEC      0x1000
 
 /* Exception causes */
-#define EXCP_NONE                                -1 /* sentinel value */
-#define RISCV_EXCP_INST_ADDR_MIS                 0x0
-#define RISCV_EXCP_INST_ACCESS_FAULT             0x1
-#define RISCV_EXCP_ILLEGAL_INST                  0x2
-#define RISCV_EXCP_BREAKPOINT                    0x3
-#define RISCV_EXCP_LOAD_ADDR_MIS                 0x4
-#define RISCV_EXCP_LOAD_ACCESS_FAULT             0x5
-#define RISCV_EXCP_STORE_AMO_ADDR_MIS            0x6
-#define RISCV_EXCP_STORE_AMO_ACCESS_FAULT        0x7
-#define RISCV_EXCP_U_ECALL                       0x8
-#define RISCV_EXCP_S_ECALL                      0x9
-#define RISCV_EXCP_VS_ECALL                      0xa
-#define RISCV_EXCP_M_ECALL                       0xb
-#define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
-#define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
-#define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
-#define RISCV_EXCP_SEMIHOST                      0x10
-#define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
-#define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
-#define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
-#define RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT  0x17
+typedef enum RISCVException {
+    RISCV_EXCP_NONE = -1, /* sentinel value */
+    RISCV_EXCP_INST_ADDR_MIS = 0x0,
+    RISCV_EXCP_INST_ACCESS_FAULT = 0x1,
+    RISCV_EXCP_ILLEGAL_INST = 0x2,
+    RISCV_EXCP_BREAKPOINT = 0x3,
+    RISCV_EXCP_LOAD_ADDR_MIS = 0x4,
+    RISCV_EXCP_LOAD_ACCESS_FAULT = 0x5,
+    RISCV_EXCP_STORE_AMO_ADDR_MIS = 0x6,
+    RISCV_EXCP_STORE_AMO_ACCESS_FAULT = 0x7,
+    RISCV_EXCP_U_ECALL = 0x8,
+    RISCV_EXCP_S_ECALL = 0x9,
+    RISCV_EXCP_VS_ECALL = 0xa,
+    RISCV_EXCP_M_ECALL = 0xb,
+    RISCV_EXCP_INST_PAGE_FAULT = 0xc, /* since: priv-1.10.0 */
+    RISCV_EXCP_LOAD_PAGE_FAULT = 0xd, /* since: priv-1.10.0 */
+    RISCV_EXCP_STORE_PAGE_FAULT = 0xf, /* since: priv-1.10.0 */
+    RISCV_EXCP_SEMIHOST = 0x10,
+    RISCV_EXCP_INST_GUEST_PAGE_FAULT = 0x14,
+    RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT = 0x15,
+    RISCV_EXCP_VIRT_INSTRUCTION_FAULT = 0x16,
+    RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT = 0x17,
+} RISCVException;
 
 #define RISCV_EXCP_INT_FLAG                0x80000000
 #define RISCV_EXCP_INT_MASK                0x7fffffff
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6842626c69..e530df9385 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -358,7 +358,7 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
 }
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 503c2559f8..99cc388db9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -72,7 +72,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
     } else {
-        return EXCP_NONE; /* indicates no pending interrupt */
+        return RISCV_EXCP_NONE; /* indicates no pending interrupt */
     }
 }
 #endif
@@ -1069,5 +1069,5 @@ void riscv_cpu_do_interrupt(CPUState *cs)
 
     env->two_stage_lookup = false;
 #endif
-    cs->exception_index = EXCP_NONE; /* mark handled to qemu */
+    cs->exception_index = RISCV_EXCP_NONE; /* mark handled to qemu */
 }
-- 
2.31.1


