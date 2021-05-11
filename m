Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6437A57C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:11:11 +0200 (CEST)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQIA-0008Ov-6H
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXZ-00033H-2v
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:03 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPXM-0006X1-P3
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728568; x=1652264568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JgM/gLIjni+dyO7wx31lSD4YXhtJoi1y1oqkheC/Erk=;
 b=m2eVkVnpIHhAczxT26Pxs6t7OUhtP9QkovAFSv25bPOxZk6iUplRBKmI
 L7Yut2Ea4bCtkMZBMdgR0Q0j+V9ngeWdAWcKqdKvKKeJ0nBqs01XJbjh+
 RNIAmsoF68BciB++S3AKGAlWDF9sHisy1sFhKBF6GuqSnGQdOzhRzd+PH
 U5IAEQUdtj/25fJ1ZLf+MRjveL67mVdge4uboDQqmimj+NjNBSv0Voy/H
 5zyt81rm336pBs/rGRB34j6qDS6dwxUuTx8RP7FJFFycJqys+PAPlryNK
 XAXW3G+xPfcC+DU4XD50CqbX9XmDIY6kyPUB78F4PuM9fXU65gntrmP4L A==;
IronPort-SDR: UhaeL/ZnndQv8qErUJaU/ULt1QuEioCXT0LSrQio1Fx7HrPt3Rpmsuy57reDr6GEDhvGh9aBIN
 E0MVnlkAXApHNEAWZOXMlPiJCWgWmD+NljghSFMEbhmOSiJkikbUNcAa/cWrtiC/+oAxaIj8kM
 qMiyaeuqKN70aybyddpQnvU2KDfSlkFMOokbADReF8jAGJC7BFEHgp8HpXJmAUwXt7IXlwOWQ3
 wC8h3iydBa3RSwKDzPG4vqTY/jtOHs0zQDmobkJwfiPpYWLOMVti6pf4vXJAcSqd7k95Jnl/gn
 L1o=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735492"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:50 +0800
IronPort-SDR: 6nWf2jd4T7sKb6tpviMMf9uxujdE+v3322OoABuzzoj/TuP559wgNWHasHnDKSNWNMGcrtaAR3
 MhUH5Utpfhin6P996Vx5c9vh2mjtekVFk8/+EQchkgEme9zEZhep3LOkRSJeOxJ1ZKEqfaU0Rb
 cUrJWYSyvzz6i7Rnz4ZUVuRQxBS//m+EPZKkLP7V0OwloaXDHsKdS6TiImfjN+OUit+uSyUdiP
 fyrxu1HPBHW8O0AqSxbdSdAh3ZBMozgVc8XyT5Ud9ix5ynxvGTEy+yL3vDZlnIemjqtUah1rtG
 YDVvjG/gn+1wL1Yx6cBmRFBa
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:49 -0700
IronPort-SDR: Z9KgeFdRYIColcrMZjxWZh+fdwvT5jtFAkxyZwI/2GxU4QURm3MrC/0EfT7wrLuPHILip5QiZS
 /LHTYq0U3ghAx7dY30OkN7BrwbSSyymp/EP20FBZcCU2Vfn4NArZLi+fdNx50YwbMObYJT/Q1k
 NddW6Yr9tJwtMJ9Hu6WDWOj6X1ELcDuN/bxHG3yC1Az4rLSDnpqUdVp3CLgVZKyKqE7py1n5qE
 xZHHXejWJGtkHLy4lIERAqQZeMCkMvmCxeNCrm4zrPByWcqQu4kxoA96PsskSd92nzXX+/B8YA
 sh0=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:48 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 33/42] target/riscv: Remove the hardcoded RVXLEN macro
Date: Tue, 11 May 2021 20:19:42 +1000
Message-Id: <20210511101951.165287-34-alistair.francis@wdc.com>
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: a07bc0c6dc4958681b4f93cbc5d0acc31ed3344a.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/cpu.h | 6 ------
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index add734bbbd..7e879fb9ca 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -54,12 +54,6 @@
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
 
-#if defined(TARGET_RISCV32)
-#define RVXLEN RV32
-#elif defined(TARGET_RISCV64)
-#define RVXLEN RV64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 #define RVI RV('I')
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 04ac03f8c9..3191fd0082 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -147,7 +147,11 @@ static void set_resetvec(CPURISCVState *env, target_ulong resetvec)
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
-    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#if defined(TARGET_RISCV32)
+    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
+#endif
     set_priv_version(env, PRIV_VERSION_1_11_0);
 }
 
-- 
2.31.1


