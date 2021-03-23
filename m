Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A552534554E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:07:41 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWSK-0001co-Mf
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKb-0002Nx-J8
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:41 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKZ-0006tH-CM
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464779; x=1648000779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LPH3HiBhVT6SsrGndGfQmvetGHNAi3MZ7yoAIT6scTY=;
 b=Gb4aN7sfmjtFsJ0S/LtnhmRGmoggFzZa2QCSTrewo3pyVuQuLdou+TGY
 uerVvonpv8PPHScFPymseErFSHTtfSnY99Cyg/pm7o5wSZ7rozsApvtuz
 c6DHHabJGG9bVQ/CCi+wZ4wWOJL6q3GQY/IxxBBi8IEAWKUgRBb69sUtO
 UX58zmqckS43/FWnd1LWFdGc3nROUOgTThi8TcE1cEs6TAqUpCtBYre0S
 tok17kbDMF3Wq337HsHzwXhu7vqGVwfqh1S6KiOvCXAne0DaSsKmCUnN8
 rZosBfQXR8R3RhIH+ngTeGYDmQ01C6iyy+MSviWohuFZ5WejGNa8kIfCm A==;
IronPort-SDR: Uh2bjpZtfzjnF16itc1jmxJ/yR/AKLR1+2gb2hRyM8GCghGSz/URIm9IyUAoImyi61kcYpttOQ
 q2F2BOWgh3DdpB+Tc1lNqE+bJe2rMv2ZxMkX+74Th51uMyOsD7luAEcvjP7Jw6C0pNTQLZkbID
 Qfz6VuHRKy7so37eweS/trkrQ3ANtUnl5rjZEoLfOs21kflnLfQhz+rAAYV2cP8djGwiJSRtYM
 TF/f7/Dc3YQayWInxnmS+BrjkIy/oEXBwH74ocIW/q22+ZX35Hs+orX+0XOGo7dTwaqisy+ZkE
 j+c=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707637"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:35 +0800
IronPort-SDR: UboKDZuCGEgBB8xevumpR/dWFT0tRhZbdIShS2NPfYFCF493G0VBvi7NGnH+iNk5oq4j6ZfbIs
 kYSzOw9isuUvupBvDCFZZL5dKU+2NgqcoTmnMPoCI0WTOnUNar2fOjJxauS4i4J2EEbC1KbtXZ
 YHa5Tgzmd48n5mOdCn+JIKkAxuu7WwuDiSS82EI8rYGIzFibYCH62fQkAoq9+1YGROLNOLCkjG
 sWOiWm/+l8Kd1CVX/YzjoxT5UG9AbulN2Wfl3eP6Oj7ti5xCEGgYuoXfGxaXklRyWzuWdYRttA
 5OmEEBHQT5j9tifgC3RW9Xhx
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:43 -0700
IronPort-SDR: 5zlX5DwsYvuTp9EOhSLpcZqgEGfNByLy6HnAtA15rw8Kd/A+iY2qkISfnfd5Ok5+IkIHNTohEL
 WfzFXfs3IkecxW3Sgf9RfUTGfAsgo17LPe24QbDocN86hsplJQURv/SChZ6hq/ZhaK78dWlXpc
 IzcSIoTHHGqrM/+5zddzQ9ESW1M+eVxH0RQ8PVfkp8QWVJPG9FHei+zeE25NLCp4RLwBvrj/OM
 1Tj/TLuQ+DmDyxpxRr9UFFIatc19T6U2cCbn7dFO4rGtxnIAqRutiDdtuUNt9BDZ/Brg+4ii8R
 E1U=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 08/16] target/riscv: Use background registers also for
 MSTATUS_MPV
Date: Mon, 22 Mar 2021 21:57:48 -0400
Message-Id: <20210323015756.3168650-9-alistair.francis@wdc.com>
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

The current condition for the use of background registers only
considers the hypervisor load and store instructions,
but not accesses from M mode via MSTATUS_MPRV+MPV.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210311103036.1401073-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index b15a60d8a2..8d4a62988d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -364,7 +364,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * was called. Background registers will be used if the guest has
      * forced a two stage translation to be on (in HS or M mode).
      */
-    if (!riscv_cpu_virt_enabled(env) && riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (!riscv_cpu_virt_enabled(env) && two_stage) {
         use_background = true;
     }
 
-- 
2.30.1


