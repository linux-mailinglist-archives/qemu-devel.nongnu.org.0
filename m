Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B0575B51
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 08:15:38 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCEbx-0001dU-Bp
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 02:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oCEUZ-0001Y9-Uh
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:07:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49836 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oCEUY-0000g3-0B
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 02:07:59 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9AtBNFicw8gAA--.25026S2; 
 Fri, 15 Jul 2022 14:07:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v3 0/5] Fix LoongArch coverity error and cpu name bug
Date: Fri, 15 Jul 2022 14:07:35 +0800
Message-Id: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_9AtBNFicw8gAA--.25026S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4rGF15Ww4kGFW3CFyrXrb_yoW8WryUpF
 W7urn8KF4kArZrtF1S9a45W3Z3Zr1xGr42qF1Sq3y8Zr45Xr109rykt3909FWUW34xWw12
 qF48Ary5X3ZrZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix some coverity errors and loongarch_cpu_class_by_name function
for LoongArch virt machine.

Only the loongarch_pch_pic patch(number 2/5) need to be reviewed in this v3
verison, and other patches have been reviewed.

Changes for v3:

1. In loongarch_pch_pic file, We should not use 'unsigned long'
   type as argument when we use find_first_bit(), and we use
   ctz64() to replace find_first_bit() to fix this bug.
2. It is not standard to use '1ULL << irq' to generate a irq mask.
   So, we replace it with 'MAKE_64BIT_MASK(irq, 1)'.
3. Rewrite commit comments for op_helper patch(number 5/5).

Changes for v2:

1. Use MAKE_64BIT_MASK(shift, len) to replace 'xxx << shift'.
2. Use ARRAY_SIZE(arrqy) to get the array size.
3. Add the assertion that 'cpu_model' resolve to a class of the 
   appropriate type.


Changes for v1:

1. Fix coverity errors such as out-of-bounds, integer overflow,
   cond_at_most, etc.
2. Fix loongarch_cpu_class_by_name function.


Please help review
Thanks.

Xiaojuan Yang (5):
  target/loongarch/cpu: Fix cpu_class_by_name function
  hw/intc/loongarch_pch_pic: Fix bugs for update_irq function
  target/loongarch/cpu: Fix coverity errors about excp_names
  target/loongarch/tlb_helper: Fix coverity integer overflow error
  target/loongarch/op_helper: Fix coverity cond_at_most error

 hw/intc/loongarch_pch_pic.c   | 18 +++++++++++-------
 target/loongarch/cpu.c        | 15 ++++++++-------
 target/loongarch/op_helper.c  |  2 +-
 target/loongarch/tlb_helper.c |  4 ++--
 4 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.31.1


