Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518033CA387
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 19:04:30 +0200 (CEST)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44mi-0004XY-W7
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 13:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m44kI-00028k-LU; Thu, 15 Jul 2021 13:01:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m44kF-0008Vn-By; Thu, 15 Jul 2021 13:01:58 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 370DA74632F;
 Thu, 15 Jul 2021 19:01:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BDB607457E6; Thu, 15 Jul 2021 19:01:51 +0200 (CEST)
Message-Id: <483ac599a1407b766179aaea2794aed60cc09f53.1626367844.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1626367844.git.balaton@eik.bme.hu>
References: <cover.1626367844.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 1/2] ppc/pegasos2: Fix spurious warning with -bios
Date: Thu, 15 Jul 2021 18:50:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -append option is currently not compatible with -bios (as we don't
yet emulate nvram so we can only put it in the environment with VOF).
Therefore a warning is printed if -append is used with -bios but
because the default value of kernel_cmdline seems to be an empty
string instead of NULL this warning was printed even without -append
when -bios is used. Only print warning if -append is given.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/pegasos2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 9fad1854b1..b8ce859f1a 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -191,7 +191,7 @@ static void pegasos2_init(MachineState *machine)
             warn_report("Option -kernel may be ineffective with -bios.");
         }
     }
-    if (machine->kernel_cmdline && !pm->vof) {
+    if (!pm->vof && machine->kernel_cmdline && machine->kernel_cmdline[0]) {
         warn_report("Option -append may be ineffective with -bios.");
     }
 }
-- 
2.21.4


