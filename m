Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F47231E427
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:02:28 +0100 (CET)
Received: from localhost ([::1]:35864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYeB-0007tj-1f
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbp-0006Hq-F4
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:01 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbn-0008KW-1p
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613599; x=1645149599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ucyFmcAoZY4qSh6YXvyciZzfAblmO8rXrb8Y5SqFG7s=;
 b=OYk45VSAnfaWQhpxh/mPEQEeCNwxsZEjG3vAdyoHqcKUq36VRQ2cBVR9
 3czPOHv8xS2eOZooXxvM/0zBWL83EIwFFA7Lz1Y/TzIigD/219br+B2OF
 LQupfleZtG/RP6TbUNsoJl84w9paCXWi9TNn4+P6eXl/wH6RaMd4s4RVw
 J3xiARcDcxR9o2kc2FqnvGboudl0tF0Vs++JoRgUxXcupE1i5nq5mTWBz
 cs3sO5sFVJnPwVgGIilRFTLSG7UQC4l86CuHFD5mVfySCiPtWl1nRLsmk
 BzMjdjkZrCZXof0XjjJIcUzxN0jl7PCbcuz6MyCTcFBgrGzwLYo81eBz3 g==;
IronPort-SDR: DC9HnQ9gYdzAWhcYcEvJszGTKRvIVWp4u/wYHOEHjMQaSbEnkBbIzoGLpZOe7LhedS7CSM/SRl
 fzrv4U8pl4UFdn64cTSpjqY+hOTf3DShScG7rDnIwsVXmN4Rf+ZneizHJ9JdnJy4ja7SubOb9a
 if2vqGB6rXBjyOP3LCCGkcGdaD6YnZaml4OCgCxWfZ6xYJIoPTn2UBzlTW3Avs7E/BAGx6kLx9
 6sQ5/yBAex313nfMcGrq9SO9iFCoaZ9RZYM27T0tR0mtb3FD59HJ2LepodN5fjhVbQoKSMMTkD
 CRc=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392110"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:55 +0800
IronPort-SDR: cNKqwwlhbxV+X6Vx/fZ5KXqe88puaJXm5VMTAhhRxZdC+F3fiKQIV+x7FUZZ8NUx/SlFjn3JnJ
 oSX9MpCRowRbVqLE0k3TBhflTdMCqgozlllWfDGkvf2fGCXL5CJ5gJUxA6f2rmuO5b1p5It86m
 cdmXi6RG/l0ChEY8mWLTWb2fNhqdk0bL2GZ25NoF5TuRvH2fUzFjXL4vIF1oI9p3DOjBlVvWjN
 RAPn/DGcg/TTAqb0GrappoPUSU/DRJirE3flkkY8k1Py1HnSOrrD8jG4aIFveGOlBz/96VgcBj
 DIZFwXu4mIkujwju4WRDPCNQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:24 -0800
IronPort-SDR: V4eri6z4RKNkq511zm4Sch8QRyQCo+ATaeLZuLHMN/ISpUnHrirbv1nduOYk0mj+dQM8LTBn6m
 sqYtyx/EthqVNln0HVxzKql39dHQ/PCZRYGUM76DI3GahJ8BLVKIomyCGyxA1TdWWXRD5FyGsV
 2iBp6pM2te6RKM2yHnui6Jrx0IadoQO4QE6EXVRHn22R/PLpmgpu9fSvkOgJxlyjAYd5aBUJog
 BFi6iaqRuyacax7DnTCq2RyVgaMHO4QWMtu/atCcVqVG3bZ636wpNJ0YTRA3YhRJQtpavoPjI1
 Dm4=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:54 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 01/19] target/riscv: Declare csr_ops[] with a known size
Date: Wed, 17 Feb 2021 17:59:16 -0800
Message-Id: <20210218015934.1623959-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
2.30.0


