Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54719519698
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 06:33:42 +0200 (CEST)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm6ho-0004kc-TD
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 00:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shuizhuyuanluo@126.com>)
 id 1nm6fd-0003x1-Sc
 for qemu-devel@nongnu.org; Wed, 04 May 2022 00:31:27 -0400
Received: from m15111.mail.126.com ([220.181.15.111]:22234)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shuizhuyuanluo@126.com>) id 1nm6fY-0004at-Ut
 for qemu-devel@nongnu.org; Wed, 04 May 2022 00:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oQztY
 bugxmMIVSGCd2fdDupJQ6Qz34rCRuQsaJDxo80=; b=i7gWWosYydDIlHTiibdFZ
 me45F9wLDkmwnS4yolKGsxKVyzR260C6bGljKOesTPhmcm0rEkyax0IHFURcUD1P
 dsFhVzfYq8nYXNnuWjxTcPNJ0Ru8yH4ZJe4keG4YDxuBUQC4dLmmyRAH8bEwNF5x
 5d1vZIS7hStv6JyxK3svvI=
Received: from localhost.localdomain (unknown [101.228.28.144])
 by smtp1 (Coremail) with SMTP id C8mowABndSWLAXJiclQ4Bg--.37367S2;
 Wed, 04 May 2022 12:31:09 +0800 (CST)
From: nihui <shuizhuyuanluo@126.com>
To: qemu-devel@nongnu.org
Cc: nihui <shuizhuyuanluo@126.com>
Subject: [PATCH] linux-user: Expose risc-v V and H isa bit in get_elf_hwcap()
Date: Wed,  4 May 2022 12:31:05 +0800
Message-Id: <20220504043105.2574-1-shuizhuyuanluo@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowABndSWLAXJiclQ4Bg--.37367S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UCw1UCryUtF1rXF4Dtwb_yoWfArg_A3
 yrZFs0qFW8AFW0v34Dtr1ft3WSvryDCr1kXFn8KF43Kwn7AF45tw1xXFs5ta1fJ393u34r
 Zr10yry0yr1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRHOJwtUUUUU==
X-Originating-IP: [101.228.28.144]
X-CM-SenderInfo: pvkxx65kx13tpqox0qqrswhudrp/1tbi7g32eltC+GwLzgAAsn
Received-SPF: pass client-ip=220.181.15.111;
 envelope-from=shuizhuyuanluo@126.com; helo=m15111.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This patch brings the optional risc-v vector and hypervisor bits
in hwcap so that application could detect these isa support from
/proc/self/auxv correctly in qemu userspace mode.

Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 61063fd974..3f0ef2b8f6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1484,7 +1484,8 @@ static uint32_t get_elf_hwcap(void)
 #define MISA_BIT(EXT) (1 << (EXT - 'A'))
     RISCVCPU *cpu = RISCV_CPU(thread_cpu);
     uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
-                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
+                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
+                    | MISA_BIT('V') | MISA_BIT('H');
 
     return cpu->env.misa_ext & mask;
 #undef MISA_BIT
-- 
2.25.1


