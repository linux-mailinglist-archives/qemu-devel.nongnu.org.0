Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27581374C16
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:48:09 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRFQ-0006Pp-7L
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtV-0001MZ-50
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:29 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtT-0000wu-6n
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257127; x=1651793127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JgM/gLIjni+dyO7wx31lSD4YXhtJoi1y1oqkheC/Erk=;
 b=kXciBxXr37nMAxKBxJqWhxldPimtHW1uj5QOnVmMKpUORZW0bkA97Ole
 svKh+N59XUrZrrcyIgZjrTLDV/OAaWSYXxj6LwcHBWzuyZy71l63ZKKgU
 10749zvblUYqV6/kGf7ocIzK0YjGjx5uRK2NFOnmmiSjea1nyKk+F4CNC
 5e2hFGcLG4jWTMuBby+9C4gC7YsrJWesOOlog5x8aaP6GpolNALIbNTgO
 DZur4xuyb8fu9nvSM4E8dVggWRIvcOV2EPo0bPT2tZSpV+H92S6okQrGa
 6smIxizGInHmiCn6RhxAiBBm3blE2oH4804yQ0IpWSfecnBPFRCceNp+7 w==;
IronPort-SDR: kNuagp9UuG2Z+4E0El4kDgk5dLLYEH/5BRKj//b2FRFkpGP3ZKr4WFM2BlIzMRIf5/mZZP01CK
 mpjrvN0hxufg7tZIxEAe/gM3MQqOU6d0Aq0eNHeiTYGFXOLqTOcrvE0pcwbYOk93qmllkSwb2Z
 77P3fD1i4mNd5Gz/wK/o4Fyg7gK11weqJ3Bu131oMxF2oUeOKFXsT138+77mXsI1/maR25KcEM
 12updEnChgtAPMtHuEi99/MEcGbeL35ysdIEkqQLeRjLiJVeuRUC8mS+QXzJ9WxXXWt/AvVYtW
 L18=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166586003"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:08 +0800
IronPort-SDR: E+S+9shrwTxROOUYhD6CVPayLzddXJpodLYrjE2zkNPEhaCstyhSFLG7P8iz8PywbMrnqL2Yf5
 5EKVhlww9a629ylV3VbyJlYcP3mLTcRTPfzA6rDS50PJObAkIYMHi9nDZch3TQgrLurTR7scBv
 ITnwQLldYbeXHUMbP6jPngxBqQbULw6edGRc/H1ndYBTcO0yHSjFL7PcfVqZGkE5r1JOw3v0gf
 t4Z3ZOHUGjvjNLliwsmt7pGMHrEURp1InSps2C3navcgKin/PLmJTu6rP/j1j234W10zKYLdvA
 vmc5RBTyLYzjE5wBzqTW8TC6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:49 -0700
IronPort-SDR: bJ2uFQdTLf6TEk5lNM9Wn+vJQYuedt0zJhm28lvCjGz0+JUozJ87tyVdOxVUTBXCUm2qiOSErh
 PRR9m34NymwP1FxwtZKVMfIpn7Dy6KlPAAJAtMV7rAjP5d9vA98vOMyw1LD91g55EShgFGc5Xt
 UEgOcfpNaEr+gA/vVf+4I3RjF6ebEGnEYbvWRiOkNQMIlbhnicGrWTdt8xUKE2iKJcu0rrqSs3
 eR0q46aHOo/6N33gqTqaQeJxE8jsgtuYmA5Xbo6thxu/KJqxb7X115zATRnflqlEsEeTZ5xfnr
 mxU=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:25:06 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 33/42] target/riscv: Remove the hardcoded RVXLEN macro
Date: Thu,  6 May 2021 09:23:03 +1000
Message-Id: <20210505232312.4175486-34-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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


