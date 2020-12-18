Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5DF2DE3BF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:13:04 +0100 (CET)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGVD-0001jE-15
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqGCO-0003rs-DS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:53:36 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:24644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kqGCM-0002m9-N0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 08:53:36 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-DjXegSJ1MNeNB6a7gXHIuw-1; Fri, 18 Dec 2020 08:53:28 -0500
X-MC-Unique: DjXegSJ1MNeNB6a7gXHIuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEDB310054FF;
 Fri, 18 Dec 2020 13:53:26 +0000 (UTC)
Received: from bahia.lan (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 330842C01B;
 Fri, 18 Dec 2020 13:53:25 +0000 (UTC)
Subject: [PATCH] spapr: Fix buffer overflow in spapr_numa_associativity_init()
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 18 Dec 2020 14:53:24 +0100
Message-ID: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-stable@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Running a guest with 128 NUMA nodes crashes QEMU:

../../util/error.c:59: error_setv: Assertion `*errp =3D=3D NULL' failed.

The crash happens when setting the FWNMI migration blocker:

2861=09    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) =3D=3D SPAPR_CAP_ON) {
2862=09        /* Create the error string for live migration blocker */
2863=09        error_setg(&spapr->fwnmi_migration_blocker,
2864=09            "A machine check is being handled during migration. The =
handler"
2865=09            "may run and log hardware error on the destination");
2866=09    }

Inspection reveals that papr->fwnmi_migration_blocker isn't NULL:

(gdb) p spapr->fwnmi_migration_blocker
$1 =3D (Error *) 0x8000000004000000

Since this is the only place where papr->fwnmi_migration_blocker is
set, this means someone wrote there in our back. Further analysis
points to spapr_numa_associativity_init(), especially the part
that initializes the associative arrays for NVLink GPUs:

    max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;

ie. max_nodes_with_gpus =3D 128 + 6, but the array isn't sized to
accommodate the 6 extra nodes:

#define MAX_NODES 128

struct SpaprMachineState {
    .
    .
    .
    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];

    Error *fwnmi_migration_blocker;
};

and the following loops happily overwrite spapr->fwnmi_migration_blocker,
and probably more:

    for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
        spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_POIN=
TS);

        for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
            uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
                                 SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
            spapr->numa_assoc_array[i][j] =3D gpu_assoc;
        }

        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be32=
(i);
    }

Fix the size of the array. This requires "hw/ppc/spapr.h" to see
NVGPU_MAX_NUM. Including "hw/pci-host/spapr.h" introduces a
circular dependency that breaks the build, so this moves the
definition of NVGPU_MAX_NUM to "hw/ppc/spapr.h" instead.

Reported-by: Min Deng <mdeng@redhat.com>
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1908693
Fixes: dd7e1d7ae431 ("spapr_numa: move NVLink2 associativity handling to sp=
apr_numa.c")
Cc: danielhb413@gmail.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/pci-host/spapr.h |    2 --
 include/hw/ppc/spapr.h      |    5 ++++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 4f58f0223b56..bd014823a933 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -115,8 +115,6 @@ struct SpaprPhbState {
 #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
 #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256GB e=
ach */
=20
-/* Max number of these GPUsper a physical box */
-#define NVGPU_MAX_NUM                6
 /* Max number of NVLinks per GPU in any physical box */
 #define NVGPU_MAX_LINKS              3
=20
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 06a5b4259f20..1cc19575f548 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -112,6 +112,9 @@ typedef enum {
 #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
 #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
=20
+/* Max number of these GPUsper a physical box */
+#define NVGPU_MAX_NUM                6
+
 typedef struct SpaprCapabilities SpaprCapabilities;
 struct SpaprCapabilities {
     uint8_t caps[SPAPR_CAP_NUM];
@@ -240,7 +243,7 @@ struct SpaprMachineState {
     unsigned gpu_numa_id;
     SpaprTpmProxy *tpm_proxy;
=20
-    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
+    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE];
=20
     Error *fwnmi_migration_blocker;
 };



