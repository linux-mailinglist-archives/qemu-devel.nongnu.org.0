Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761CB345535
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:02:33 +0100 (CET)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWNM-0004Au-GE
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKV-0002Dw-I2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:35 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKR-0006u2-A9
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464771; x=1648000771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5cxLdJ+6aVMG866gofXFqzW+8RWcHnphigjP9lE2nAA=;
 b=r3N7+pXKmQfoHQy2oc8yvBN8EztY2GdT3f/3NiPcWZndK6P5jCwOa3vA
 3C1246iL4FHHOvqPu5JsWaa1ysK4AYOSsbXmJITwWqdMlsqj9bhOPvhE4
 /jFSHzKWnrNDo1sI+wxFa+u9ERiiR69MNzSHEkAHNHHhU3GAA255uUVHn
 aWQiLm1TIshgvlsWtapUlroIdZHntQ33umjYy2oyRx1Q4EZQOJwSLPAQL
 CcdMm606atjBQWML6yOjxXdFfE0cA1/3Xz+9L8sJQX6byWNeI6eEA2Mv+
 a/ZTZAFdDSnp3VIVWgdfTDbeKhAV7Wmfa/DuUc0LA4Fb9YC94A/Mxphzs g==;
IronPort-SDR: DzEdH+CpCGgsr1wPpY0mNdylIspintX9Ou18uykS42cOoXj4OC41ZyRWPuoQjGdsFbtereZIFz
 lr3WTnUuVMV7Vt/rNHDf2G7eSZiP5b2o39ehlXWXVl2XIc0IvzpfvUYe4ZD6BLONssYxSiAwpy
 KMug/6A7xUi8Q7Jhb6bmdvJkKy32EDB0DpKZZITpA+PcaIt7+ctWek8846ui12wLqHvaJZBB0D
 bkV40b4BkpByG/Lng/bYgGLdJvB7V+vCS3DdI+AWzPO1QM2W+vdDT3cg1jbXS0q7uzUn5xHjnD
 XQs=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707623"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:28 +0800
IronPort-SDR: XGz16Adje9745tsGCnyGnJoJLWIJHjwbVxhbQj9HPOGXdpfJLV+5t655/290jkYpNnhW4dZDKY
 fCX72XBA0+DZmtXM85/4smv4tb8DktJm0XW7/trTrcNb2wo0MdqTGHwWznT7FXC/2jRpuKpu9n
 vl+A/45bG0QCzS5o2D2KJtGxyslEOzk5TM1B5Vd9WZgyJ752ehTvTyYE2JvVwsjQ+OfFBo2CxG
 o4+mLGkB6wWc204foLiNQladr0X+CADpirjbDNRYVrcO6iop4mmI8c8ZICLDsEH1C8hmXvw37q
 CBWhnrF0J4X2RF2woeq5oKEx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:36 -0700
IronPort-SDR: ml+0iKLwCImZq8PI+Fdqn/gc8f50K8Xmcbnv81sqhaCveMa2ypcuVWJMmD+1l5bhmre9L1nGaz
 li3R4QkXd8pDvdhFiCOuU3Q6a8PzvuCvdv1I1CndrOS+akJnhj5LNB3XPbiiQYFaAqSjtlqntq
 0GccIjq31uYZldk2PemkEF4CGR4noXqaKNa355z9V/MJUkvk1opAep3BOfUzKMyDLucful7Oy0
 K3/xgPhFVHeuMEOQ5h0+D06fthpAgEU5pxHUe82xHQ0wDQBmSvsdXNj5yMRHfMw7kIc7C+G+CM
 jxY=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 01/16] target/riscv: fix vs() to return proper error code
Date: Mon, 22 Mar 2021 21:57:41 -0400
Message-Id: <20210323015756.3168650-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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

vs() should return -RISCV_EXCP_ILLEGAL_INST instead of -1 if rvv feature
is not enabled.

If -1 is returned, exception will be raised and cs->exception_index will
be set to the negative return value. The exception will then be treated
as an instruction access fault instead of illegal instruction fault.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210223065935.20208-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index fd2e6363f3..d2ae73e4a0 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -54,7 +54,7 @@ static int vs(CPURISCVState *env, int csrno)
     if (env->misa & RVV) {
         return 0;
     }
-    return -1;
+    return -RISCV_EXCP_ILLEGAL_INST;
 }
 
 static int ctr(CPURISCVState *env, int csrno)
-- 
2.30.1


