Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEB9B67C0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 18:09:24 +0200 (CEST)
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAcWB-0004On-Hl
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 12:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsa-0007LZ-Nv
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsZ-0006wE-HW
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:28 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:44795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsZ-0006vw-B1
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:27 -0400
Received: by mail-pl1-f180.google.com with SMTP id q15so99463pll.11
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 08:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=jdvh8xkCNZRDIokZ6zUfPGYGT6cGVGf9KSyR16yXLxg=;
 b=IRVFQyqhseswwHics8/H92k2UJlIgnPcYlan4ynpep2zcA3I5X1DP/eBx5zwTrZ0iQ
 5vLhgK1vgOXZQbUC6ZmnVs+/mV6VIaUspUxQaOA7/VN1sN9OILP89YbIWYWFskht8+dL
 ZHCEwnm5ntgOXOk3apf18EM3mtnBF7jp5YcNky/jnrz1SBdh93NXtw6HF+SB2HqSZt0p
 wVeIq9hDPt5gkpnkYSF7UmDMBzmR3w04YO2Aw9PqRbf2koxCLBjJXXeaOh2cJ9EMnBmV
 IPnAgOvtpcH6HBlRPDswgbuaBfZod+lnTnnoHJalICpspsM/daW5AiqBp531u+4VmBVW
 NsyA==
X-Gm-Message-State: APjAAAWmzNRSXEOQPyroRZx4TCFqoHp711r38ofJFul19F915NYd6s9c
 32KEXz41kT10NUW16QsKpLTrBw==
X-Google-Smtp-Source: APXvYqxXC8bI1g/v42IdXX6p+ngA8TciElitk1LvxDBeQK9DTpZMLhUBEuypbtQjMKHYdrxG9tyVCQ==
X-Received: by 2002:a17:902:ba82:: with SMTP id
 k2mr4619587pls.293.1568820506154; 
 Wed, 18 Sep 2019 08:28:26 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t9sm5261215pgj.89.2019.09.18.08.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:25 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:21 -0700
Message-Id: <20190918145640.17349-30-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.180
Subject: [Qemu-devel] [PULL 29/48] riscv: hart: Add a "hartid-base" property
 to RISC-V hart array
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

At present each hart's hartid in a RISC-V hart array is assigned
the same value of its index in the hart array. But for a system
that has multiple hart arrays, this is not the case any more.

Add a new "hartid-base" property so that hartid number can be
assigned based on the property value.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/riscv_hart.c         | 3 ++-
 include/hw/riscv/riscv_hart.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 6620e41cb7..5b98227db6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -29,6 +29,7 @@
 
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
+    DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -47,7 +48,7 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int idx,
     object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx],
                             sizeof(RISCVCPU), cpu_type,
                             &error_abort, NULL);
-    s->harts[idx].env.mhartid = idx;
+    s->harts[idx].env.mhartid = s->hartid_base + idx;
     qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
     object_property_set_bool(OBJECT(&s->harts[idx]), true,
                              "realized", &err);
diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 3b52b50571..c75856fa73 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -35,6 +35,7 @@ typedef struct RISCVHartArrayState {
 
     /*< public >*/
     uint32_t num_harts;
+    uint32_t hartid_base;
     char *cpu_type;
     RISCVCPU *harts;
 } RISCVHartArrayState;
-- 
2.21.0


