Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518A137A493
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:27:21 +0200 (CEST)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPbj-0003Vt-VV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVF-0008Oi-OO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPV0-0006X1-BX
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728421; x=1652264421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPCk4g3W8fX2UrYqx8Ha0jhj3mJEcwbKzn0C8s8q6fI=;
 b=oucN2XWPcy2mxLi1q3oBgP07ckU/klG2fa0+UQNDGFPL2Ak1vJkJ6dy9
 NbrLZl7hYO7MKMKAz9O/YV/iYRCkRobg+dnrnmn7B4lOB/3aGBiEhBjqS
 4ihDBZUgag81N1V2DMjBMkPOHXW9UrWM5d6CFaZAD4DsPEh68idUb0XxZ
 4BkwFUcFt5IfxXM0aIbe4A6z8FNhZszH/2BE+nKKDi8hmXnAqFcUlnr0x
 K1mtzj5mz38d/dOLWuBGypzMnub4Fw++vlgdfF43Cpv7lhKbTxfmm5q+U
 dPlfkjdk0NwKgnOLlVPAfwe5EzjJul+VlahZgztUfJDo07dqubEOM5eMb Q==;
IronPort-SDR: WN7CcicTR0CLIbcPUFEsE3MyEgSq45zJ3FtwYb3UrZzHmj/Xfqjfw6q5VqtbJjclnUBABzNsO5
 SzqiSmpC2EDdowO4AGpJV1cWoXoeeNewGnuc96CYvvm05/bWe1xN8P35PdV+QVWrEmLIxypGfj
 Lf/5NvvGFnIRuVWLnwcmWhveKrB22jcTbshSlokM+UOQTIRN+T33s0j8Jjhnc0FYlYQMT4TZ7Z
 035pe4J818TxJxsZPeH0l8feZvkQ1WWLNZJx6phAQYyLTKzzMsg9XQyqL0uUI8UwTaum/XHQrF
 uGc=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735356"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:18 +0800
IronPort-SDR: LLCOLY+5mvGnK4hcPqrLolHfLpDOtJ3/PFgQIMhv7uTLkNEOTXe8u8sLs88hIrX/tE6SsWzuYA
 ENSnZEuUkMYh9+/ENo46cmh5lhzUS8R4hwwfYHnwyRTjFKVlgjuHr5guxmoFkfedj3zWDWTQDN
 WrslTPHp0SFXGoRmej7S/+c3g2MjpAUSC96XKv4PbnSDiT6psw2KfZ3wdIGPwrgM8525q5cpIY
 sUyy0tYqgqAjrRytGIu8X1bY1Sp071vjiPxRPu5HlwspThTWgiwQ9FNc5eG7y1BfdRhWNKXOxt
 4Pev1Zq/WHmEFrKF3nhofbmt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:17 -0700
IronPort-SDR: HNgN7+MuSBShX5Oo/q/Qf09Hg4k2pAuSMHug0m1rkByavrbmHIZMA/CeLq2I4Kgfs1l72XypY2
 VVXI91e9QcxyE/ESEPMnt4lUxH/Q+wJyySrkIa6c5vLFQ/gBzKsqpZEE9ZzOlNjAnoVmW3tkM3
 PmGCaZ33C7uZyh9wV7MmQE8jlvOtDif+GO0KGIleETVWM4defo5z2DwR6dG8PcUfVikDKGleCt
 7xsdt+gE3PjIrjWKugrgf/jf7IaagDMjk3ZfGCOdrOnHSUnhOj0ZB1Brr25fHSS1ksTtpJdgoj
 NYA=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 05/42] target/riscv: Add Shakti C class CPU
Date: Tue, 11 May 2021 20:19:14 +1000
Message-Id: <20210511101951.165287-6-alistair.francis@wdc.com>
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

C-Class is a member of the SHAKTI family of processors from IIT-M.

It is an extremely configurable and commercial-grade 5-stage in-order
core supporting the standard RV64GCSUN ISA extensions.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-2-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 311b1db875..8079da8fa8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 047d6344fe..6842626c69 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -708,6 +708,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.31.1


