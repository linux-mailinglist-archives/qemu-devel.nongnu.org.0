Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFD2EB887
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:43:43 +0100 (CET)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzja-0002zL-LY
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:43:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0005kA-36; Tue, 05 Jan 2021 22:38:48 -0500
Received: from ozlabs.org ([203.11.71.1]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzei-0006IJ-SI; Tue, 05 Jan 2021 22:38:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG6jfwz9sWL; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=NgwqRujmNWjrdDwsW4Sd+FYXffq1TrNhq5+fdfUvyNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fB4+XgwB48n9LmaPX7QDQ/ifGeDcpRgPBF5yaSvdlCIJGwryvM2PokbeAv+jX+Cdw
 Gt9xMLJCkaPjUZ1O1/3UK5GkUR5sdwUFTN3M3jOdSMiqrc/GqG5HGMmkIudvExLzen
 ma2lW+ebOb9NpLpJsUt3EciCVtH70YAdfkeEaNXE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 09/22] spapr: Fix buffer overflow in
 spapr_numa_associativity_init()
Date: Wed,  6 Jan 2021 14:38:03 +1100
Message-Id: <20210106033816.232598-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, Min Deng <mdeng@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Running a guest with 128 NUMA nodes crashes QEMU:

../../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

The crash happens when setting the FWNMI migration blocker:

2861	    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) == SPAPR_CAP_ON) {
2862	        /* Create the error string for live migration blocker */
2863	        error_setg(&spapr->fwnmi_migration_blocker,
2864	            "A machine check is being handled during migration. The handler"
2865	            "may run and log hardware error on the destination");
2866	    }

Inspection reveals that papr->fwnmi_migration_blocker isn't NULL:

(gdb) p spapr->fwnmi_migration_blocker
$1 = (Error *) 0x8000000004000000

Since this is the only place where papr->fwnmi_migration_blocker is
set, this means someone wrote there in our back. Further analysis
points to spapr_numa_associativity_init(), especially the part
that initializes the associative arrays for NVLink GPUs:

    max_nodes_with_gpus = nb_numa_nodes + NVGPU_MAX_NUM;

ie. max_nodes_with_gpus = 128 + 6, but the array isn't sized to
accommodate the 6 extra nodes:

struct SpaprMachineState {
    .
    .
    .
    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];

    Error *fwnmi_migration_blocker;
};

and the following loops happily overwrite spapr->fwnmi_migration_blocker,
and probably more:

    for (i = nb_numa_nodes; i < max_nodes_with_gpus; i++) {
        spapr->numa_assoc_array[i][0] = cpu_to_be32(MAX_DISTANCE_REF_POINTS);

        for (j = 1; j < MAX_DISTANCE_REF_POINTS; j++) {
            uint32_t gpu_assoc = smc->pre_5_1_assoc_refpoints ?
                                 SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
            spapr->numa_assoc_array[i][j] = gpu_assoc;
        }

        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] = cpu_to_be32(i);
    }

Fix the size of the array. This requires "hw/ppc/spapr.h" to see
NVGPU_MAX_NUM. Including "hw/pci-host/spapr.h" introduces a
circular dependency that breaks the build, so this moves the
definition of NVGPU_MAX_NUM to "hw/ppc/spapr.h" instead.

Reported-by: Min Deng <mdeng@redhat.com>
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1908693
Fixes: dd7e1d7ae431 ("spapr_numa: move NVLink2 associativity handling to spapr_numa.c")
Cc: danielhb413@gmail.com
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/pci-host/spapr.h | 2 --
 include/hw/ppc/spapr.h      | 5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 4f58f0223b..bd014823a9 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -115,8 +115,6 @@ struct SpaprPhbState {
 #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
 #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256GB each */
 
-/* Max number of these GPUsper a physical box */
-#define NVGPU_MAX_NUM                6
 /* Max number of NVLinks per GPU in any physical box */
 #define NVGPU_MAX_LINKS              3
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 06a5b4259f..1cc19575f5 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -112,6 +112,9 @@ typedef enum {
 #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
 #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
 
+/* Max number of these GPUsper a physical box */
+#define NVGPU_MAX_NUM                6
+
 typedef struct SpaprCapabilities SpaprCapabilities;
 struct SpaprCapabilities {
     uint8_t caps[SPAPR_CAP_NUM];
@@ -240,7 +243,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
 
-    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
+    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
 
     Error *fwnmi_migration_blocker;
 };
-- 
2.29.2


