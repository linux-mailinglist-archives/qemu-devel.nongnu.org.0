Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F42D9276
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:11:25 +0100 (CET)
Received: from localhost ([::1]:50372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog8q-0005Xj-Qk
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofww-0005uz-6r; Sun, 13 Dec 2020 23:59:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:35793 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofws-0004tY-M3; Sun, 13 Dec 2020 23:59:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTft3LzFz9sWn; Mon, 14 Dec 2020 15:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921894;
 bh=0L+U7Z6HClD4XMOBOZAZ1ZGfCt5+Vu/ERqYHn+wwDlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TAgpjIkjJAaQPF/Gpm63abD7OgyQYfO0gCOfbkwTGarpSWUFBtu8nMAIMBKnLIydk
 hShkYOegycA0Hs2Z7kHuoWWVirDZQ5cHkoWMAdmLmDnQG5Sp7Rs6zsRTXiUNIB11wf
 XXcTLM1EpfZyf4jnv1rTP0esGKxfjlkRQOH06kH0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 24/30] ppc/e500: Free irqs array to avoid memleak
Date: Mon, 14 Dec 2020 15:58:01 +1100
Message-Id: <20201214045807.41003-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 Gan Qixin <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gan Qixin <ganqixin@huawei.com>

When running qom-test, a memory leak occurred in the ppce500_init function,
this patch free irqs array to fix it.

ASAN shows memory leak stack:

Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0xfffc5ceee1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffc5c806800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaacf9999244 in ppce500_init qemu/hw/ppc/e500.c:859
    #3 0xaaacf97434e8 in machine_run_board_init qemu/hw/core/machine.c:1134
    #4 0xaaacf9c9475c in qemu_init qemu/softmmu/vl.c:4369
    #5 0xaaacf94785a0 in main qemu/softmmu/main.c:49

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Message-Id: <20201204075822.359832-1-ganqixin@huawei.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 6a64eb31ab..072e558c2d 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -926,6 +926,7 @@ void ppce500_init(MachineState *machine)
                                 ccsr_addr_space);
 
     mpicdev = ppce500_init_mpic(pms, ccsr_addr_space, irqs);
+    g_free(irqs);
 
     /* Serial */
     if (serial_hd(0)) {
-- 
2.29.2


