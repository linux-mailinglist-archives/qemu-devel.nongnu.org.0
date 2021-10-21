Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA86435A11
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:40:18 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPsH-00076t-Ju
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZW-0005XE-6C; Thu, 21 Oct 2021 00:20:54 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:56143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZU-00007c-7I; Thu, 21 Oct 2021 00:20:53 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p4qDxz4xcb; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=3/jBE86qRC5DpBHtwaqXWiA6Qj1qGEgC1h3r7zLUf04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ETN68hW060Haq0sIlB+3Cyt5h4foE9H2rdklHpEuRaPwqpSDA7T569BLBKIK0jRUK
 RgwOl8cDXygFf5h/XKlE48bQLvoaq+vNYdytVg/6dvudNOOStt/tkLkSdrV0oeWT1b
 LjKBor4s+NA/sgM6m/orv0CCod1GJtJ+X8tR9VBc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 13/25] ppc/pegasos2: Restrict memory to 2 gigabytes
Date: Thu, 21 Oct 2021 15:20:15 +1100
Message-Id: <20211021042027.345405-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
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

The CHRP spec this board confirms to only allows 2 GiB of system
memory below 4 GiB as the high 2 GiB is allocated to IO and system
resources. To avoid problems with memory overlapping these areas
restrict RAM to 2 GiB similar to mac_newworld.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <54f58229a69c9c1cca21bcecad700b3d7052edd5.1634241019.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pegasos2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index b8ce859f1a..474cfdeabf 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -117,6 +117,10 @@ static void pegasos2_init(MachineState *machine)
     qemu_register_reset(pegasos2_cpu_reset, pm->cpu);
 
     /* RAM */
+    if (machine->ram_size > 2 * GiB) {
+        error_report("RAM size more than 2 GiB is not supported");
+        exit(1);
+    }
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     /* allocate and load firmware */
-- 
2.31.1


