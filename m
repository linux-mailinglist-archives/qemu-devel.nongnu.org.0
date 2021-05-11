Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DAC37A566
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:03:16 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQAV-0007Da-Qe
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXC-0002cY-BG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPX2-0006X1-Pc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728546; x=1652264546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqdonLUuZyYbToc+r7mOqmQfOKiL5G8dfgQnAVG1UWQ=;
 b=LZxMRbb09tROEzyUijtNZLYuu1IZGljPr0gTcPyPgbVkUhJ+rRia5fSH
 A/bFUguTAk4Eatq72i3bKgbYIQXu37GyAuHNwqaKpKxcG8cCruhqehG3A
 fYJ+yLETxFNeu0QtI6B56BXC272GUwcki9KXfijdaWA16vGZgH++qlHNb
 IGwpN2PlBCThth0gQ8zLH+CzArpqa9ksjjhNqktYNE4+on2KuQERA5eZB
 VLbGhIws0/GRwq1nAAcAhiFfqMfWPObAEWffFJDXkDArIldrUyuHIK7ws
 3MQyc1jro2PlldIS/CuWrnWK+SmtUlevf/ollrZjVxAcXqqG4k2UA4Ybp Q==;
IronPort-SDR: 5T198sX1/wjDlWZO5AF29uA31sxUincAdmqTulDaWRjfkNVYNdw3x5G8LFf1wsvQND2DeKIF9w
 1SlDTjLd9e5YD9jvzKZQqwlIG9a6yoeHaM7WDz6lC6dopXfUXVkWVcPd87B5FMbQfmJqYP4Lvk
 GR5FH3YS+8EnekG4iGtfopoMgWQkf1p1ZVYQvXT+QeWh8nFhAE6i/LK1vPSw1XRKXFV633/N1h
 JhPdP+h2So1a0ke7XQcCNfSOTJbPUFYqhrJVhXiZnI+vo2EsvICQIUhe05aLW3Bl6DyLeowGiy
 1no=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735482"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:42 +0800
IronPort-SDR: zSHzThHs/0WWY+TJ4S6NBPWjputc37JI6CD9E9uQxD0JmEXUY2JW865OUhQDZj3nsMV3YdbnWF
 zjmN9IbkS4KJybqZ07Dr7AIBPn2bWFwBIoE9es1YKg+w7Z+NCTDF3QBvn3aAV81AtyvSDliWTw
 dN9gTj8N2nsPdKXGrVaHRqhgeFR+2pz7DZBkciodLPnrngdM0MtS2cT3TyaRK7CbbcvyQMZgmR
 Dv2/oTMDVeFMhJzzZ0Cv/BDXcyK0sfX3+qa3pDmODsw6fyeDA/EYi0QirZLtAaOpPIVxEmwyei
 4pwH/3AX3km+UUQgHdv7xY75
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:43 -0700
IronPort-SDR: gfoA+7xRFjMs41qasJfwx5sdXdy2t7alYJHX2uZN+vUB9BuDoPl/cNRRxXovs94Pqp/zAnKTpE
 mbcRk2VCkYYiZZvvJFDVzyt0s8OnB35FSlEJpWryno8nX72nhAXfk/TqC6j//jPPT7/ywWRKnj
 twAj7ESLc/nXgM2DLExtiW8pFqn52SDmMPahpQ7ZVQOJvHiL+OniQ2FM/NqLFdXGhD/NXnYqAH
 w624GjuD7E7JwS1K7I/+1v7Dvac3NUhGlcpYQ6fwiXa6JtCAUaqCKqE24WvuIFJ0Br/49xNsgq
 Uq8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 31/42] fpu/softfloat: set invalid excp flag for RISC-V
 muladd instructions
Date: Tue, 11 May 2021 20:19:40 +1000
Message-Id: <20210511101951.165287-32-alistair.francis@wdc.com>
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2008 spec:
  Invalid operation exception is signaled when doing:
  fusedMultiplyAdd(0, Inf, c) or fusedMultiplyAdd(Inf, 0, c)
  unless c is a quiet NaN; if c is a quiet NaN then it is
  implementation defined whether the invalid operation exception
  is signaled.

In RISC-V Unprivileged ISA spec:
  The fused multiply-add instructions must set the invalid
  operation exception flag when the multiplicands are Inf and
  zero, even when the addend is a quiet NaN.

This commit set invalid operation execption flag for RISC-V when
multiplicands of muladd instructions are Inf and zero.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210420013150.21992-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 fpu/softfloat-specialize.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9ea318f3e2..78f699d6f8 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -627,6 +627,12 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_RISCV)
+    /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero */
+    if (infzero) {
+        float_raise(float_flag_invalid, status);
+    }
+    return 3; /* default NaN */
 #elif defined(TARGET_XTENSA)
     /*
      * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-- 
2.31.1


