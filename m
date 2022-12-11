Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FBA649239
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 04:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4CqK-0003oF-VX; Sat, 10 Dec 2022 22:17:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4Cph-0003fR-OQ; Sat, 10 Dec 2022 22:16:53 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p4Cpf-0000cz-RJ; Sat, 10 Dec 2022 22:16:53 -0500
X-QQ-mid: bizesmtp68t1670728151to75gqap
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 11 Dec 2022 11:09:10 +0800 (CST)
X-QQ-SSF: 01200000000000B0C000000A0000000
X-QQ-FEAT: aBOeTvM9AwmbvSh1kZZLqYFz5RZMQZRQleTTo3uNpgZOVgrLcYyqRJL5UEKSX
 RUkELjQ42M726sE14VviMYVHOiIfHa2DAh8yT8NrqoA7np4D9vtamn4ZMrMmpL92RKNzlXy
 SGd3/qvd5SEZ5iKET7qvqpayinh3pxqoPCVuWlmXekWL0edudGlNUSkNmFvSHo0pspKpY2V
 IjxfWyAis6MA6rP5Wa8stEpC6G20H46oi7fynk+BDMw61ketwmS73YDDfxaA30/xYnXQpYK
 wXvJLUH8GdHWdHhquEvqJCKloHv9zeS5drosP60KvofpKfqpf2PFmZ+TWphk2teycBqAjwg
 nSDWDc79ZZ+n9c5DlNFNpdhLxvkqJbpC2IZQB83
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 15/16] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Date: Sun, 11 Dec 2022 11:08:28 +0800
Message-Id: <20221211030829.802437-15-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211030829.802437-1-bmeng@tinylab.org>
References: <20221211030829.802437-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"hartid-base" and "priority-base" are zero by default. There is no
need to initialize them to zero again.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---

(no changes since v1)

 hw/riscv/opentitan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 78f895d773..85ffdac5be 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -173,10 +173,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
 
     /* PLIC */
     qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
-    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
-- 
2.34.1


