Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED84372313
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:40:58 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhFJ-00069R-4d
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqx-0006Ly-Vq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:48 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqv-0000Lb-W8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080145; x=1651616145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F35Wlg7ThlZkm1vRHn1Yuy4izpGJ5nEtQpXZGyOoRmY=;
 b=funyECAU6SjbitKP9B3jCP6yNjNYnw5OIbXSo/+A1d7pg+tRJUkagGby
 UI0VHWpl3Cjezd7VyEzB6QwbsbCGLz//RAlDALJ3tAP1SH7s8aNFAA7pT
 ZcCNn6o5Vdxcr8dnzcKePo14t54jSPNmOrbcHEvc2r3Di0JUwLbYsF78b
 cnT8f53bzimS+CWrl+/VLXsATA33Owr1uShQkFJTWK0C9CbO79dBQ3vDb
 tqQLvx9rAGyFUMJJK/WXUYz6M8tMXLq/5ENUPr+Cm4PhaZrXTXFnroOPo
 w/KtYTAJ+wOJitIGcAGQlRUK0Vwb/MKfqoWpt+IhIg7AEEtyJuieNw9kr w==;
IronPort-SDR: F1wg6BBtJP/A8mL/JCleoMC4mbt/mDDR42S007g7ICzaSgihJgrQfBxK0Vrokdk0kVdQspwxJc
 IOLG6n5zFkD0QSTp9QxQLrExdeuSCQhq8DTozfZC7fBCoRQEn0cGJBke30MIIH5A0etcizFRzt
 CN4NQas2Rkm+qdbZXjV9mMUM/1tGlMX1igGXgUElYOD3F0XcWWJUvI6hT/8Y1vBYQKJNxw5bvs
 BrgwUQuMYZbZLATWwtOUw/Q+jZK21Ahn0mP61hNFly1tTldjcibh5/dXvEAcHr/P10AWCUxJq/
 2Tc=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114688"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:10 +0800
IronPort-SDR: 0DOg9z5W4Ub9Q/+i/Od3bTeUubJ7yWT89vE3F8201KRK1Icj5D2Xn4kqK4Et961250SxtOxwBq
 4ar8H/eXxGaTPb0rNrPdxh877gBGjGO7fvisKNKrQ+SCLXprehgErkUbgU2d+lsDPW3Uk/n9y/
 M772SDWbxoxUaD3ok9+tt+kJNHTlT/eKpCvhEn2ZsTcSQt8JC50wOkEvm9z1HLF8V72CVH6jHq
 LWWf/8WU/WdLFkZpNCf3/FyOcyfgxNJdDFdr2MoZSdGopJ75YlVklyVuJHP7VS6ulSDVttNkWs
 XxRxYmqWONxXyQi9hexhA/K3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:21 -0700
IronPort-SDR: qEJWfysx1qzEOcJsjEzdv4f3GJzOTISNoiLfElJ+WdyjHvgg/XEyqfLZ1eQTLBVzNdAmoxK59H
 SQahVSR4VuMow0m7uDFtLneZcBahll4+PSWkHcb3OzyR7Ja9Adl8H0aG+1+0hKeDO6VqC3YcIM
 6jdxWy1i34rfvVszgnpMhKhMF67uuiWrSxfQ40FKRNn6ggmB+pQtKHIVzvjERTGgI2PwabUS/M
 Kca2g+xNpbhhHiVgQUZVAbodQlKVFHY0ihQBcDGZwB9QJCNgLoFRPjH406lak1Yrf7cLeCuVhU
 VQg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:08 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 27/42] target/riscv: Add ePMP support for the Ibex CPU
Date: Tue,  4 May 2021 08:13:12 +1000
Message-Id: <20210503221327.3068768-28-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: d426baabab0c9361ed2e989dbe416e417a551fd1.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66787d019c..4bf6a00636 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -202,6 +202,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
-- 
2.31.1


