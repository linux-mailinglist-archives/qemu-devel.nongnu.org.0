Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3B435A16
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:47:24 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPz9-00040R-My
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZW-0005YS-ML; Thu, 21 Oct 2021 00:20:54 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:34041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZU-00008X-VG; Thu, 21 Oct 2021 00:20:54 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p4yhZz4xdN; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=27NYbh/bACla06XyBbqxcDEkvrriotzWjRoaQN4Lmv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VQE5Jyb4jotr5dbDdRzyumFLrgJtpkJ+g3XvHfv4kAj3vJWPCybNXxrM5pEVfvGCf
 Rgja1mCZttb8QM79t/tKXf+hpMW17soThIGCMxlV6jkAFdN8KayMNyULB599BEQmoj
 Hsoyqpn0TRdBKteFzmOvUtxB2IM3+Pdm/ycLMUyM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/25] ppc/pegasos2: Warn when using VOF but no kernel is
 specified
Date: Thu, 21 Oct 2021 15:20:16 +1100
Message-Id: <20211021042027.345405-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Issue a warning when using VOF (which is the default) but no -kernel
option given to let users know that it will likely fail as the guest
has nothing to run. It is not a hard error because it may still be
useful to start the machine without further options for testing or
inspecting it from monitor without actually booting it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <a4ec9a900df772b91e9f69ca7a0799d8ae293e5a.1634241019.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


