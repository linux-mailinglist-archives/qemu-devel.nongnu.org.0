Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF8437A4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:44:48 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPsd-0000pb-Tk
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXR-00031z-J3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:55 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXN-0006TG-Q5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728569; x=1652264569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kX2Xv9V0jg3JpeHNNRl1F4kvINea/oqMxr6h/7opXw8=;
 b=OQU3vT9D4YQ2A3OrEpjGSwOBIncsB10PiudLZ6HOnJw4gKQdDadRn1+e
 iAejfood//9mLiTaBk2z3Iz7KlfcIZ1OQ2UlrTG+atsmHVPcIPEey+E25
 oZG5wHRoQpmiEHZVbY2SCMW53YB4PmHth5fiVvGse4OiIOXtfeP0YvhIc
 MO5P7exXfdhH7q8WweR0Slt/QvDbJ+BNWpRAhVOkhw3hzhh5fvaMMPTmR
 XCPsDYE6bTfmG6ib6759MyG6X/UVojJVwcYUlnu/Um+yLldnbH9ztIa3U
 bJL/ANUbHIgNL3J7QWDrig4zcVCrbTBm6MzS4iShtUfBdjffapXLEF/RT g==;
IronPort-SDR: Cop+ns6xH8gpF4rfLhExvBCjQcIOP+L1PanbZBfCi00fKB+DdTX2ulw5sbz8nhZzDixLZUzH8j
 v+qrR/uSgAuME3P+rvFlXiTEPlt1P/Bb4fmY1OGW4qkeVhlrBqlF5ETAuAjP/n9X3TjA6hrPek
 ZiEfqwk4AG8d6ftwcHCz+uc+EuI3+xT2gsyZsSPYiQpK8TnCmAleF2ckZX1UkrRwHRoH+gqlsM
 dmnWNRneaRng7WgtcMvaaeLv+X6RtW92jV1DUaCmnsJt0c4F/E9vVZgRtu8nZv47RSOC2GvDu7
 pRc=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735495"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:53 +0800
IronPort-SDR: PZ840mW7fUrg+t0Iu0MlbI0I80+iFnn8ZOlCZNdfsJh1OsJtdZKc3u+AMgM5oCd+munGOz4U+C
 SnyqebfD1ou686PaQJeagz7H/RhSZJtYi/qu75XhsM3pXOuPJmiApaJiBmhrlv+cTj6iC1N+hE
 hUBbjopGkG0UTiQ8vfvkwfa1jxh5wVHETiGVwmyt1SIcBOto95IP3lxMu9+eJdtLzLmluc3HNO
 4zfo7io8ALfxuRgHyDzeLQcxgW6pC37qv2mmsqxgw0DXs8uED/ac7lRWKpI1DuxSAoiWy52+fz
 /6p/RnD+6XKW954yTwQebTZe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:52 -0700
IronPort-SDR: ICLNxL9tr9M0RlkL958AJiTS2agnMnwWwD+7SEWLPE+IqEw93WpuIsaaLzzeZlEReA8A5DrrOf
 SDGewpg33d4gVTvk9QemcO1M3Ov09eIBiFUHSydSgtzUsIv7/8bxX1Aphr0OdYnJqDymaOxMPP
 RLFhVGNoNbY0YlJDhCIPk3ru8a4LLKwMK/bB6f+1rxdMOkbTYOSK8dAkRzlVOhwUY0uyf+7CDo
 5rtNtk6QU1wTvFs/X/KdLz2ijb+ES+NuIMSHQtnggJtMYNzBQSvfaWP0uAj6Lk1ZwKCLm7XBHo
 pnU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:51 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 34/42] target/riscv: Remove the hardcoded SSTATUS_SD macro
Date: Tue, 11 May 2021 20:19:43 +1000
Message-Id: <20210511101951.165287-35-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This also ensures that the SD bit is not writable.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 9ea842309f0fd7adff172790f5b5fc058b40f2f1.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu_bits.h | 6 ------
 target/riscv/csr.c      | 9 ++++++++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 24d89939a0..3a0e79e545 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -403,12 +403,6 @@
 #define SSTATUS32_SD        0x80000000
 #define SSTATUS64_SD        0x8000000000000000ULL
 
-#if defined(TARGET_RISCV32)
-#define SSTATUS_SD SSTATUS32_SD
-#elif defined(TARGET_RISCV64)
-#define SSTATUS_SD SSTATUS64_SD
-#endif
-
 /* hstatus CSR bits */
 #define HSTATUS_VSBE         0x00000020
 #define HSTATUS_GVA          0x00000040
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 97ceff718f..41951a0a84 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -459,7 +459,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
@@ -788,6 +788,13 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
     target_ulong mask = (sstatus_v1_10_mask);
+
+    if (riscv_cpu_is_32bit(env)) {
+        mask |= SSTATUS32_SD;
+    } else {
+        mask |= SSTATUS64_SD;
+    }
+
     *val = env->mstatus & mask;
     return RISCV_EXCP_NONE;
 }
-- 
2.31.1


