Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08C2F95B9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:02:12 +0100 (CET)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G7f-00076v-O5
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1G07-0005mO-Ie
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:23 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzz-0005Ux-NE
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920455; x=1642456455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g21G8J6SHmE1tWdkfuOP3hc6JmuzYOTrikeCCArzWM8=;
 b=JYScvUU52TsjI22ZC9AhfIOeXEutHdW+5zvLbEb02CFxSVXpHQcEg9WA
 9NGD1OI+G6Xz9irHS+PdZGP0T8FrUnetv6xow7vDMwlVZKGu1r147NFhD
 S4KZH5QQbRt5SXQNmT/tkhG4sLrSWGCXmCQE/m+JZ6xhjId1ZH/OzOjg+
 azgVWLfP48bg4g2Ipux8QPIlMpSz8T8lb/EvMbXTjRiMSPI2Szh4s5tdW
 FZ2erep3AbUfoDa2/eIYNnwWzKRi64S0Sv8WBfFWVtBzbQa0FS/mPlE+n
 40NxtdUCcia32avLeIsk57gdwmoY4Q0zDw96eV2w8dKTTc3VEW8klUR3I w==;
IronPort-SDR: YYSZUnqKl0BUKd/+pbV8ZhrDVy5pn7xxhs/9ap5x9GsyoHL61k0yty5TWkmbxg+QK21vCNVk+i
 z5Oed/RfQqsQLWG1JLHFcTYJF71NLlTNhSTZmodm52Jmc4z908s1V5Bn4S14i00adhbvoMLN80
 QhRNzPOlu1Iet9cSGqpIm8KBIbKFmCXaqrCUx0vyYBeKblg79vQctvmy2ZQ68KYvyvkTWwvppi
 fYAcrNYXZPLh6KMNTmsAGm6dD7dmAtBMW8yCsrja0laa+5BxOK6moRI3xtAnToLJ21VORAeoY/
 LvE=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645971"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:07 +0800
IronPort-SDR: kZDXnMM7g3uOsghURD7HUBukIxSno7QO6O9TjndZ6F4uCEH9LNvPlWn6ziBaoe9VdQnrAolGHG
 fuTGaMyPQJlQm5RST26YnaxAJWG7zEZBl8O6Msz/qd7IXVaL4s96TOowZjvvYKSseLqWw87Qzr
 qmwMdwwaHfw8grOmvJo4lcp6ie49/YipmSiPIoKfMzhty83OY/OGNVG4KwDLgLTajaeUTUygsR
 MrhPrZk0Qr95dKF2dUi4i/xdVsVwEru1EdVEds5XmwbndlOPcUwyLfoGQnfvvgzaXjTzZ973XQ
 W2zivWak5nyyS0g4RNPCyval
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:46 -0800
IronPort-SDR: pP5pZnCcj9sSGPgRsIM8sn1Wqw30erkfxWcH+aHoXJddIuY/MoC8pO+ON21VP52RdmgjQHtizI
 apE1/07tnQ97TX+SfbWCt3DC5OVKehYVqrWkULJW2YbBVwcibVD6oQRSOtYDdPZUo1fJC6TRpk
 AMkgFmRRR3CDQo+AGB2pedUcJRV+AWUof5EDEpNVvknKWLLUuO3N0k0kiUse3qEnSgLUJC1+Kl
 DTOlwcUcbMslM4rhDldFbiGcjrk1xdysiGu9Bg1QOXfeO7jLVAnfS+WtATXzXWtLpFxrbFZ7k8
 3NM=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 08/12] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
Date: Sun, 17 Jan 2021 13:53:59 -0800
Message-Id: <20210117215403.2277103-9-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

In preparation to generate the CSR register list for GDB stub
dynamically, change csr_ops[] to non-static so that it can be
referenced externally.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1610427124-49887-2-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  8 ++++++++
 target/riscv/csr.c | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 6339e84819..464653d70d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -478,6 +478,14 @@ typedef struct {
     riscv_csr_op_fn op;
 } riscv_csr_operations;
 
+/* CSR function table constants */
+enum {
+    CSR_TABLE_SIZE = 0x1000
+};
+
+/* CSR function table */
+extern riscv_csr_operations csr_ops[];
+
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 10ab82ed1f..507e8ee763 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,14 +23,6 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 
-/* CSR function table */
-static riscv_csr_operations csr_ops[];
-
-/* CSR function table constants */
-enum {
-    CSR_TABLE_SIZE = 0x1000
-};
-
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
 {
@@ -1378,7 +1370,7 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
 }
 
 /* Control and Status Register function table */
-static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
+riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* User Floating-Point CSRs */
     [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
     [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
-- 
2.29.2


