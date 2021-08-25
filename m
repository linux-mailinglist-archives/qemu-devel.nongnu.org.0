Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297B3F724F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:52:38 +0200 (CEST)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpaG-00023c-MB
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIpYw-0001HP-Az
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:51:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46376
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIpYu-0008Ew-KR
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:51:14 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mIpYV-0008Jj-KL; Wed, 25 Aug 2021 10:50:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: atar4qemu@gmail.com,
	qemu-devel@nongnu.org
Date: Wed, 25 Aug 2021 10:51:00 +0100
Message-Id: <20210825095100.20180-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH] sun4m: fix setting CPU id when more than one CPU is present
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState property") changed
the sun4m CPU reset code to use the start-powered-off property and so split the
creation of the CPU into separate instantiation and realization phases to enable
the new start-powered-off property to be set.

This accidentally broke sun4m machines with more than one CPU present since
sparc_cpu_realizefn() sets a default CPU id, and now that realization occurs after
calling cpu_sparc_set_id() in cpu_devinit() the CPU id gets reset back to the
default instead of being uniquely encoded based upon the CPU number. As soon as
another CPU is brought online, the OS gets confused between them and promptly
panics.

Resolve the issue by moving the cpu_sparc_set_id() call in cpu_devinit() to after
the point where the CPU device has been realized as before.

Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState property")
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 42e139849e..7f3a7c0027 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -803,11 +803,11 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     cpu = SPARC_CPU(object_new(cpu_type));
     env = &cpu->env;
 
-    cpu_sparc_set_id(env, id);
     qemu_register_reset(sun4m_cpu_reset, cpu);
     object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
                              &error_fatal);
     qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
+    cpu_sparc_set_id(env, id);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
     env->prom_addr = prom_addr;
 }
-- 
2.20.1


