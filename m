Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76513725EA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:43:24 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldomB-0006HK-N4
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0Z-0006F8-2L; Tue, 04 May 2021 01:54:11 -0400
Received: from ozlabs.org ([203.11.71.1]:60255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0X-00056r-3o; Tue, 04 May 2021 01:54:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CN2hX2z9sxS; Tue,  4 May 2021 15:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107600;
 bh=wGnIirSsUVp7mZHT1NOlF7GNp+krjgYkY2MXH1rKUJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iJ9aQdMAFzVUd7M+mAl40Vmy8DdqO/Fenos8dEAggx8RjjgHvZXEJRn+Wn1InhE9z
 rFo21CussToJTrQvBSZcVYv88F3umvg4zNFCXstlMvjWDwnLmXuwBeCeQAgC8LXyZc
 VUllYm2a/5AfsUmpPvO8tvcb2RqV9UMP2ecOJoJg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 34/46] spapr.c: do not use MachineClass::max_cpus to limit CPUs
Date: Tue,  4 May 2021 15:53:00 +1000
Message-Id: <20210504055312.306823-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Up to this patch, 'max_cpus' value is hardcoded to 1024 (commit
6244bb7e5811). In theory this patch would simply bump it to 2048, since
it's the default NR_CPUS kernel setting for ppc64 servers nowadays, but
the whole mechanic of MachineClass:max_cpus is flawed for the pSeries
machine. The two supported accelerators, KVM and TCG, can live without
it.

TCG guests don't have a theoretical limit. The user must be free to
emulate as many CPUs as the hardware is capable of. And even if there
were a limit, max_cpus is not the proper way to report it since it's a
common value checked by SMP code in machine_smp_parse() for KVM as well.

For KVM guests, the proper way to limit KVM CPUs is by host
configuration via NR_CPUS, not a QEMU hardcoded value. There is no
technical reason for a pSeries QEMU guest to forcefully stay below
NR_CPUS.

This hardcoded value also disregard hosts that might have a lower
NR_CPUS limit, say 512. In this case, machine.c:machine_smp_parse() will
allow a 1024 value to pass, but then kvm_init() will complain about it
because it will exceed NR_CPUS:

Number of SMP cpus requested (1024) exceeds the maximum cpus supported
by KVM (512)

A better 'max_cpus' value would consider host settings, but
MachineClass::max_cpus is defined well before machine_init() and
kvm_init(). We can't check for KVM limits because it's too soon, so we
end up making a guess.

This patch makes MachineClass:max_cpus settings innocuous by setting it
to INT32_MAX. machine.c:machine_smp_parse() will not fail the
verification based on max_cpus, letting kvm_init() do the checking with
actual host settings. And TCG guests get to do whatever the hardware is
capable of emulating.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210408204049.221802-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fd53615df0..b37ceb8ee8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4487,7 +4487,16 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spapr_machine_init;
     mc->reset = spapr_machine_reset;
     mc->block_default_type = IF_SCSI;
-    mc->max_cpus = 1024;
+
+    /*
+     * Setting max_cpus to INT32_MAX. Both KVM and TCG max_cpus values
+     * should be limited by the host capability instead of hardcoded.
+     * max_cpus for KVM guests will be checked in kvm_init(), and TCG
+     * guests are welcome to have as many CPUs as the host are capable
+     * of emulate.
+     */
+    mc->max_cpus = INT32_MAX;
+
     mc->no_parallel = 1;
     mc->default_boot_order = "";
     mc->default_ram_size = 512 * MiB;
-- 
2.31.1


