Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2342E299
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:17:50 +0200 (CEST)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb7Aj-0006Dd-V8
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75V-0006Vf-HJ; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75S-0002Qh-0A; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B53CD756192;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4216B748F58; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <a4ec9a900df772b91e9f69ca7a0799d8ae293e5a.1634241019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/6] ppc/pegasos2: Warn when using VOF but no kernel is
 specified
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Issue a warning when using VOF (which is the default) but no -kernel
option given to let users know that it will likely fail as the guest
has nothing to run. It is not a hard error because it may still be
useful to start the machine without further options for testing or
inspecting it from monitor without actually booting it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 474cfdeabf..a1dd1f6752 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -194,7 +194,10 @@ static void pegasos2_init(MachineState *machine)
         if (!pm->vof) {
             warn_report("Option -kernel may be ineffective with -bios.");
         }
+    } else if (pm->vof) {
+        warn_report("Using Virtual OpenFirmware but no -kernel option.");
     }
+
     if (!pm->vof && machine->kernel_cmdline && machine->kernel_cmdline[0]) {
         warn_report("Option -append may be ineffective with -bios.");
     }
-- 
2.21.4


