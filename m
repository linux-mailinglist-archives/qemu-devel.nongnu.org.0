Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485BC372326
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:44:47 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhJ0-0002QC-9y
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqz-0006PD-AR
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:49 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqx-0000Fd-0B
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080146; x=1651616146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfXgYxiYX5i1x54fnTk0QzFVD6VSA4CU3S+I1f1IWWg=;
 b=UzEo4rJHk20hJ50gMdD8B1q53NKIiNfeg/9dwHwsub5gMOKycBol5/vf
 NU8JIiHaWsjtn4fB0yux67WgG5sj3AdnZ07C+yH+E6svw0s5QgmwNsuNf
 BOSlNPFygfF0mBSxPR3JNX3DKTJ4tMVz+CW9UILEefNVZF8DVOzSxQZ/C
 nJU7mBN7t6uYi3apBQ+zE7JurM9YB47Qs67M2QNU0b0d6uHeMgUfhm15f
 p9zyenBuyQlXywFxhwWsk0KOnjdQAGHXO7HaakP1piltNKb5pFw+PJgWs
 sCl7qaLZ02M4lmwMGdFzQOeDRKoSnMH/MN7HKB5exhJRJ4Utvw2TTRCec g==;
IronPort-SDR: v+hZovra12CLn+TqkyH43MGpH8XXhtasFd5eDzQf13Wnl90U/9yCHj7KR+eKYYPgjIrELXJfq/
 zLImeCwpMGn5Izg3wLDk1qmE8QetR1QMB0sIc2/LtJ6O6sy3Z6pSfZBWQFP+3sYlb8FUXrdXqP
 VPIMcHFodTYgJChgNb/JuARnNHrJvo5F5JSMMsbJ00znL6kEVMBlNwNV9bPPn1dGqE6BdLrDCn
 xDfq3iqx7P83rhEuryj+8cfZYshXO+j7I5h9csLnD13OZBHJCqSknhl6fm11CHghu80Ay5yIX3
 HTA=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114690"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:16 +0800
IronPort-SDR: VZPN0Hq0nOhNhEHeERqNQn5zYhuJcyBt1u4sSQi3cgEQ+i59LD9u8uVsEH2+KyFGYJxnp0rLkW
 kFO+vKizXKV+mxTRyCTRKfiivy9O0AZXZPZZI68Vc9IxnfRv1WspvQy/p6II+NhkGpxLFFjWyX
 5sYsEwdCUNFZ8qy9L4AQ8vRBPpFnRFbP3hxAsUYabdmL+aVYiWFOk9+W/iZbAHmFP7CZoyu9P/
 u5kJWJwaT4FV7acruUT5h3DtwcPf4rFswStlY83CWb85kooQtO+FljWfg32KPtn5ZqA1j1v00Y
 tBqmy/hZjlPhYsrcPaj6T7Ji
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:27 -0700
IronPort-SDR: IQCzi7MJ3s6kq/BpPdfZEJeT6ne0gJ2NZIosFiraCRSfizHhnXNueB1D8CV+wIsR3szXrKTfvb
 1BNuSBw8FayCNyblf/cTtvMWXTyxTzCPiOWRKDaQiofVk4dHP2bs7LpuiDnue38NhlMfmqBJqu
 Gnee/ZN+RLCI3lml/KlqVz75saT4aDUNAukdGxAu6b9rNqFhHP6L5cqU3ovtiXZ634nm0uBwpp
 atGVKjd/gRUaxAsJ5BBO05d6UQHl/01qGv7i0Bro0JG+7aErVerDGvyZJ+1Qlh58J/u1z2lE8a
 Uw8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 29/42] target/riscv: fix exception index on instruction access
 fault
Date: Tue,  4 May 2021 08:13:14 +1000
Message-Id: <20210503221327.3068768-30-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Emmanuel Blot <emmanuel.blot@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emmanuel Blot <emmanuel.blot@sifive.com>

When no MMU is used and the guest code attempts to fetch an instruction
from an invalid memory location, the exception index defaults to a data
load access fault, rather an instruction access fault.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 659ca8a173..1018c0036d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -694,8 +694,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     if (access_type == MMU_DATA_STORE) {
         cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
-    } else {
+    } else if (access_type == MMU_DATA_LOAD) {
         cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
+    } else {
+        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
     }
 
     env->badaddr = addr;
-- 
2.31.1


