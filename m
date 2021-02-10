Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43516315F4F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:19:57 +0100 (CET)
Received: from localhost ([::1]:42464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iqy-0003hF-8M
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:19:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip0-0001T5-21; Wed, 10 Feb 2021 01:17:54 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36451 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioq-0000E5-QD; Wed, 10 Feb 2021 01:17:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gk0qcsz9sTD; Wed, 10 Feb 2021 17:17:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937858;
 bh=p6kTMtJgkU426/UWAnyk0LS8IbGVn9NADPzPs99ZNXo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KcZlbSRQNijixp0hoNnqaZdIAXMeNI/iaZHkfv5hrXjf7miPdXMy9PHxmEO1Fhgey
 gDvSZeT6Gs9Pxube7PSgycpZoR2+Zb4flYddqwcbq42wNkyFJJJggn2QubNUKMYkAu
 EGGVeoJwNcRxeK1p/z/43plD7rWw/CnopHw7UJIs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/19] spapr.c: add 'name' property for hotplugged CPUs nodes
Date: Wed, 10 Feb 2021 17:17:18 +1100
Message-Id: <20210210061735.304384-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

In the CPU hotunplug bug [1] the guest kernel throws a scary
message in dmesg:

pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16

The reason isn't related to the bug though. This happens because the
kernel file arch/powerpc/platform/pseries/hotplug-cpu.c, function
dlpar_cpu_remove(), is not finding the device_node.name of the offending
CPU.

We're not populating the 'name' property for hotplugged CPUs. Since the
kernel relies on device_node.name for identifying CPU nodes, and the
CPUs that are coldplugged has the 'name' property filled by SLOF, this
is creating an unneeded inconsistency between hotplug and coldplug CPUs
in the kernel.

Let's fill the 'name' property for hotplugged CPUs as well. This will
make the guest dmesg throws a less intimidating message when we try to
unplug the last online CPU:

pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9@1, rc: -16

[1] https://bugzilla.redhat.com/1911414

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210120232305.241521-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e7992c0422..0ecc193468 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3756,6 +3756,19 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
 
     spapr_dt_cpu(cs, fdt, offset, spapr);
 
+    /*
+     * spapr_dt_cpu() does not fill the 'name' property in the
+     * CPU node. The function is called during boot process, before
+     * and after CAS, and overwriting the 'name' property written
+     * by SLOF is not allowed.
+     *
+     * Write it manually after spapr_dt_cpu(). This makes the hotplug
+     * CPUs more compatible with the coldplugged ones, which have
+     * the 'name' property. Linux Kernel also relies on this
+     * property to identify CPU nodes.
+     */
+    _FDT((fdt_setprop_string(fdt, offset, "name", nodename)));
+
     *fdt_start_offset = offset;
     return 0;
 }
-- 
2.29.2


