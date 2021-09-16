Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712E40D149
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 03:37:03 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQgKk-00081d-At
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 21:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgEV-0006tj-7x; Wed, 15 Sep 2021 21:30:36 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mQgES-0004KX-9t; Wed, 15 Sep 2021 21:30:35 -0400
Received: by mail-qk1-x733.google.com with SMTP id t4so5728909qkb.9;
 Wed, 15 Sep 2021 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/FfgWFSiS86WF5yRhDm3S5AMj1DHorE3wbzzE0S9U0=;
 b=iXtMIzFHctCQTUzGoYsNESyB9GEB2A9AEagf14BhF+hc1D2aktySD/guL7C6gJqbUC
 9xoZPX/Nxxfgpd4BC1UlS3OvrceDreNb1GMsWlO+PmEzaU+hO2zk5pFYFX5CeGYwcsJa
 9qPccnMZdDbIQ0pn1q5bxe7mmQd6f+aesZlEaD0tZnGjWepOttZn5C/Qsyb/+r/QCgAx
 vhVqznAaKZxI0pQcvYjj19DkVqaXKDxsxZBlwByKMcII1Nhm9ckDe272iuuashoaAEZv
 5pz7AgcZsO0dWuZ3ckdlOE18qGDooN48pQ9aa64j2s5E/CHpR4jI4ygOqxZTyqXwv+VR
 a7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D/FfgWFSiS86WF5yRhDm3S5AMj1DHorE3wbzzE0S9U0=;
 b=dSbIPIrMkHGLpCefyPBb3lV4C6UlPica4bqjZx2z/nfiKJZEj79tinhP49EFqcQIZb
 1ErrxV12+ciKchhvqL4FbT2dYR8jTez4ZDuJPPVDRhfHeqBmYjoT+wZU9JCrDov0dkgA
 fMcW8oZZHQ4sFT94ifnLG7Sp0XYl/G1MiLe0TC2QwwqxmUSzhGb3rCPssDIw3vecGpZa
 IA5Km9Xf8haaw6DAW7vUmOqff6uCDQLRinyZwYQkHhEh3ukMc/ztKsK/XDS9Ail2eLcX
 V4gjnSUypGCbcSgfSUuYtKFImAKzVcyn4QKq29FuhSUwDTd9WzVtDBAHVB1hgxPDhh5k
 3J+A==
X-Gm-Message-State: AOAM532KNE4KVlCyRPCAyOV9JiWjDllVV6MPUkyk5Gtmyd5rklXQA4DN
 h70CQkDYUc51bS5VKGTEdqkaW827EwM=
X-Google-Smtp-Source: ABdhPJyMWTJ4IpgTO8bHowDf1dhHFBpT5FZ3aky+z81cyQUGkPA0FcQICEsvgIi+uUTWjU/twqyqaQ==
X-Received: by 2002:a05:620a:c53:: with SMTP id
 u19mr2900189qki.144.1631755830996; 
 Wed, 15 Sep 2021 18:30:30 -0700 (PDT)
Received: from rekt.COMFAST ([177.189.43.50])
 by smtp.gmail.com with ESMTPSA id 67sm1369417qkl.1.2021.09.15.18.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 18:30:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 7/7] spapr_numa.c: handle auto NUMA node with no distance
 info
Date: Wed, 15 Sep 2021 22:30:04 -0300
Message-Id: <20210916013004.272059-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916013004.272059-1-danielhb413@gmail.com>
References: <20210916013004.272059-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

numa_complete_configuration() in hw/core/numa.c always adds a NUMA node
for the pSeries machine if none was specified, but without node distance
information for the single node created. This added node is also not
accounted for in numa_state->num_nodes, which returns zero.

NUMA FORM1 affinity code didn't rely on numa_state information to do its
job, but FORM2 does. As is now, this is the result of a pSeries guest
with NUMA FORM2 affinity when no NUMA nodes is specified:

$ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
node 0 free: 15681 MB No distance information available.

This can be amended in spapr_numa_FORM2_write_rtas_tables(). We're
always expecting at least one NUMA node, and we're going to enforce that
the local distance (the distance to the node to itself) is always 10.
This allows for the proper creation of the NUMA distance tables, fixing
the output of 'numactl -H' in the guest:

$ numactl -H available: 1 nodes (0) node 0 cpus: 0 node 0 size: 16222 MB
node 0 free: 15685 MB node distances: node   0
  0:  10

CC: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

Igor,

CCing you as a FYI. I wasn't sure whether there is a reason for
numa_complete_configuration() not adding distance info an update 'num_nodes'
for the auto-generated NUMA node, I decided to handle this case in
pseries side instead.



 hw/ppc/spapr_numa.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 659513b405..d8caf5f6bd 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -499,7 +499,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 {
     MachineState *ms = MACHINE(spapr);
     NodeInfo *numa_info = ms->numa_state->nodes;
-    int nb_numa_nodes = ms->numa_state->num_nodes;
+    int nb_numa_nodes = ms->numa_state->num_nodes ?: 1;
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
     g_autofree uint32_t *lookup_index_table = NULL;
     g_autofree uint32_t *distance_table = NULL;
@@ -539,6 +539,17 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
+            /*
+             * We need to be explicit with the local distance
+             * value to cover the case where the user didn't added any
+             * NUMA nodes, but QEMU adds the default NUMA node without
+             * adding the numa_info to retrieve the info from.
+             */
+            if (src == dst) {
+                node_distances[i++] = 10;
+                continue;
+            }
+
             node_distances[i++] = numa_info[src].distance[dst];
         }
     }
-- 
2.31.1


