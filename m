Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3432D5A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:50:39 +0100 (CET)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpJE-0002vf-9b
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGb-0001H8-BM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:53 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:20078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGZ-0007k4-Cx
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614870432; x=1646406432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZDTRaHSlH9oUWKzFGvyYantQbVP3e5DHaFFuxiCV2ig=;
 b=B75MV53Ryr7OchNJXsabha9LJeH3i2456av/qZhvISmaPih82Poc5s4Y
 PnW2gTUC9BrSMFk028Ny5Sq9otkwZPZwNFR/T5TyoaVn6mz42y1xsBiUG
 99wjMxQjK0IGRiadRrf+j27hD9OGnjRqehZyxBV002HoKMXp7s8TD7A0r
 lf87KcgTvIt6P7qqlHTkG2SZK+rilx1GIAVvpIy9qR1dTwPtTfSlnFFD+
 rFDvg+RZ5hnWJ67e8+oQWcBFAXLSxU9DBNWABoSdnCQRpna+DkXF/MDfV
 riK5EjA+Tpjf0/RbN+Wf2FOfw8Y0wpf8IwOiSStgj5dmeL2ZNKY9In9cu g==;
IronPort-SDR: sbCsxsH3V5eHDBMEimszhlYP1u69QnJPFVAbCLji0VNWNzzPCJJJ8crhKVVIC46uMhulZ4Qfhr
 OTAjIjOqiO45cyMstDkfS4OqVeUBSnnyk43sZj19DMXwBVoXRugW88OCj+EwyB5Ql0exhc7GoX
 NdmHLmGOVOHJ1inevjOmVVnVxhUT/+PRT5bQ89v4oCHDa4Qh6ECp3GNsjOyPrwCro7ydMeFYR4
 jgmchh9DJT5eax4WRBgRJAZiewkew7dEPQP2qSwU5Pshxgfb7Gk7qvn/Q6060NOX7cH4dTBDZr
 qa8=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="265660838"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 23:07:10 +0800
IronPort-SDR: raFEygcAXEcvMPw8PNRkYemvO5kt2B7o6+YVORjq9mC3j2mLi+bIX5q/HI7zLTr76GnIolNc8A
 vYw1s597yaUUvO98pD/tbhNP6n5LLl4RwYIUaFIqRaAu8Yt6zJNX9HSJSPYmZgw2uO6krE4vd2
 1jDcr0F6vMYkUCM+Lu1U4YyOnm0kL0CbQk6kkjSY2hedK0DcD9LUhPpaAxhrvDTYMiFoDYvpRU
 /+0zZmheVQE77mpkf8WEFLex0cDZoPmoRPYxbiY90fj85dS5068LO8qz14d4cdCsy9AuO/n6AS
 s2+rtABa2v5/jyT4ylilR8OC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:30:49 -0800
IronPort-SDR: 8LZ095pFAOlndJvP65t27S2J0KdS0wru4RFFdNcARiQ20BsKSu7y8Hr9gYO1Bn+a3ZLNFpYG2T
 taQWWPsLd/Ni3/mPo5FNOaoBiTiJBQ/XV4w7PDUy4osVYJuQZ8pQq0dxVNq+ycKnYDbGQDvVN/
 fJKmCNoQu0iDtLzyMUpz72IZvC1VSHI4ftYbRQjV4yO9VkAq/dd0Qt/PaFJkmtESjjSVBxvHj7
 8Sd678iMMmaPV3tgTYooB3eGcjC2zTMJmg1bLK70/ju2LDY/i2ay4EbSelQo/XDymee03Jk5PM
 U7I=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:47:48 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 01/19] target/riscv: Declare csr_ops[] with a known size
Date: Thu,  4 Mar 2021 09:46:33 -0500
Message-Id: <20210304144651.310037-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

csr_ops[] is currently declared with an unknown size in cpu.h.
Since the array size is known, let's do a complete declaration.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1611024723-14293-1-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 02758ae0eb..419a21478c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -487,7 +487,7 @@ enum {
 };
 
 /* CSR function table */
-extern riscv_csr_operations csr_ops[];
+extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
 void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
-- 
2.30.1


