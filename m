Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C834020020E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 08:42:55 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmAjm-0000EB-Nu
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 02:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAbv-0005co-9Y
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:34:48 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:61615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4324eb4de=alistair.francis@wdc.com>)
 id 1jmAbl-00028E-Ad
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 02:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1592548478; x=1624084478;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxVyDAhQ8bumskxZPWWUD2L/widqjE3TyqKlh9liO+U=;
 b=gulqEDyHxBbvKtS5hiHoQ/eDkkSGnEDbfVnwLCA++sPlq4hW8apwrTzp
 u91jxkEPtmsuLXXpvJg57WVpOq9mWekZsbU5baVuyHodlmFFvfeZHjZQu
 L0ZtHQZBENi15xSoubraVJDX5VfnXzjsqJm/THMnCCANtOXm/zWyB4KmG
 bU5zaMQhhVgbY3sJYq43wWhHTTQ/9zCMKrmmxCgRP3225h38gbKae2fTI
 TiaS0C8qnwXxhoYBESpnpTUw5kt7pCGyjPLYwVjC0KOeIQ+QcsA2dxMF7
 IJXZZ12ep2GYXab7ecgo5jT7NBR0DwmjLv2OxKID5j5odUOo8gfCSDp4Q g==;
IronPort-SDR: ayS6wDcGOmCkeIBD0gk1LIdzwmIjjzSGTy7W9HK/WH/4E71r90IfGVwHr8MsnsGdi076UTepiv
 e/rGYhpCnN8yCgCJRULoowW+RiAN6Vf4Rbxe3Laf0gB5FxKits0BGPgJ87OPrk49Xmze5xkaE/
 uYP/EOFweZxoW8zRAsQnkoDep6TqPw28zvKdg5LETpF0pb6TdysDVk//wdghJ9H0EchIFQo3BD
 hTY3SjcjhlPWYCMC+jC7DnP1nN47JXvo8PilU7GvTqb/XwPGC6+OqkPyW6PNiFqyYWu8y6QWcu
 EqA=
X-IronPort-AV: E=Sophos;i="5.75,253,1589212800"; d="scan'208";a="144724286"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:34:28 +0800
IronPort-SDR: oXMIwGLBPz/pBNyRA/DIiJIXjymz1QwFF1efpKIP6KQjo+KZry3cLw1EC8TLgydjOgpJrxnUrE
 YTJ12AMyWheMuFKUQqhQQbQ7RtE/IEDV0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 23:23:38 -0700
IronPort-SDR: jMGvd7K/RfvAYaXQJwUhKHyrcAurd6wx1E/iNnb9aDnDg3XNy5EjTT6sy2k46qcIoGGoF/y5gZ
 6TKZ5GOq1GQQ==
WDCIronportException: Internal
Received: from unknown (HELO risc6-mainframe.hgst.com) ([10.86.58.142])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Jun 2020 23:34:27 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/32] target/riscv: Set access as data_load when validating
 stage-2 PTEs
Date: Thu, 18 Jun 2020 23:24:53 -0700
Message-Id: <20200619062518.1718523-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619062518.1718523-1-alistair.francis@wdc.com>
References: <20200619062518.1718523-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4324eb4de=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:34:26
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 62fe1ecc8f..eda7057663 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -435,7 +435,7 @@ restart:
             hwaddr vbase;
 
             /* Do the second stage translation on the base PTE address. */
-            get_physical_address(env, &vbase, &vbase_prot, base, access_type,
+            get_physical_address(env, &vbase, &vbase_prot, base, MMU_DATA_LOAD,
                                  mmu_idx, false, true);
 
             pte_addr = vbase + idx * ptesize;
-- 
2.27.0


