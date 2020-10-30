Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB12A0967
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 16:17:46 +0100 (CET)
Received: from localhost ([::1]:38032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYW9x-0004Ss-33
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 11:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kYW83-0003Fd-VR; Fri, 30 Oct 2020 11:15:47 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54018
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kYW81-00079D-0y; Fri, 30 Oct 2020 11:15:47 -0400
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id CD3295FC12;
 Fri, 30 Oct 2020 16:15:41 +0100 (CET)
From: remi@remlab.net
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/boot: fix SVE for EL3 direct kernel boot
Date: Fri, 30 Oct 2020 17:15:41 +0200
Message-Id: <20201030151541.11976-1-remi@remlab.net>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 11:15:42
X-ACL-Warn: Detected OS   = ???
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

When booting a CPU with EL3 using the -kernel flag, set up CPTR_EL3 so
that SVE will not trap to EL3.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3e9816af80..cf97600a91 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -742,6 +742,9 @@ static void do_cpu_reset(void *opaque)
                     if (cpu_isar_feature(aa64_mte, cpu)) {
                         env->cp15.scr_el3 |= SCR_ATA;
                     }
+                    if (cpu_isar_feature(aa64_sve, cpu)) {
+                        env->cp15.cptr_el[3] |= CPTR_EZ;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.29.1


