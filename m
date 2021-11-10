Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A844C183
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:46:56 +0100 (CET)
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn0B-0000cF-BZ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmtE-0005WH-Lz; Wed, 10 Nov 2021 07:39:45 -0500
Received: from [2607:f8b0:4864:20::434] (port=39903
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmt8-0001Tf-KQ; Wed, 10 Nov 2021 07:39:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id x64so2551861pfd.6;
 Wed, 10 Nov 2021 04:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MS/pPq2gbTzGriNVm1Kz4si1ol7Zxmr958sWxbX7sU=;
 b=SwyPirIAVRCs6lp+OWaY1Wq/JENztu4eH9iWm3cB+DjGCrHR7B1ZPqjcaLFu+n1MYC
 M10SdlkrgZhj6XdLdX84g2hvt3rcQyiLd4Zizm9JUTM/8e6IaGH/bhPdHZFIPNoDL7aW
 oFJ82zgKkMlkCBH1biCrTXLFeE5XrVraMCn+N7cl6szGrwPoB75P+Kftuw41Qk+F8jmD
 lwfQuimnc2R3QqxHF6bxO7rHaS6cDcJQcOmcJM4Mq6gvT9EZqxT13iM6qeazH0nQ4+d/
 N4peu1uJobY7baFQJCysJQ9APpRx6eCdCxMG6EZUJXhyxcLrB+UUQetghudcNN9FvpEu
 MERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9MS/pPq2gbTzGriNVm1Kz4si1ol7Zxmr958sWxbX7sU=;
 b=vIyo2IcRa57KSVg+Ps5ZkxsFuplsDhPpyip+fb5+B+MUnAy5IFlXQyI3nMJj9Ol498
 1YHVsv1pTMuDWTYAoee9gKcPA9RHjevxzDNT2vawaSDAhBebRLOZDqHK2f6hfNKsibMq
 rtZeF4gERLQ6jOuY8TzxKh6IbSahKITOLYNn/bwNB8PvVNJfqLPhwWjresij01mNaZ9i
 MYa7jWwrwUkWFyxvspOKM1lXnVN+A8nHi1zj8VQ+MF22HXhLq/jceDaEaz+qi6Q3RHLp
 XsypdEN9SW81uY4Neo6x3p6UQaiZIbyaKOQ20pFSjZLhVaPV7OtaZk/IYl4aSf0tFIxP
 2RYg==
X-Gm-Message-State: AOAM532i560LW0sPHlIs1X9q/6QmA/J+KmZ8cLVsQ3NstXbBlCzGD759
 stGrvO/xKxH/vjZd/QqQSXbxhky1ZD0=
X-Google-Smtp-Source: ABdhPJz3piIL3Y2RAJr0XprRLya9pTfNotCbigiurBP0qcQBS7S7fXXKjiuoeG4elfbczdMkk+pS9w==
X-Received: by 2002:a63:6ec8:: with SMTP id j191mr120985pgc.148.1636547975621; 
 Wed, 10 Nov 2021 04:39:35 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id e14sm14101456pfv.18.2021.11.10.04.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:39:35 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] spapr_numa.c: fix FORM1 distance-less nodes
Date: Wed, 10 Nov 2021 09:39:21 -0300
Message-Id: <20211110123921.1927528-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110123921.1927528-1-danielhb413@gmail.com>
References: <20211110123921.1927528-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 71e6fae3a99 fixed an issue with FORM2 affinity guests with NUMA
nodes in which the distance info is absent in
machine_state->numa_state->nodes. This happens when QEMU adds a default
NUMA node and when the user adds NUMA nodes without specifying the
distances.

During the discussions of the forementioned patch [1] it was found that
FORM1 guests were behaving in a strange way in the same scenario, with
the kernel seeing the distances between the nodes as '160', as we can
see in this example with 4 NUMA nodes without distance information:

$ numactl -H
available: 4 nodes (0-3)
(...)
node distances:
node   0   1   2   3
  0:  10  160  160  160
  1:  160  10  160  160
  2:  160  160  10  160
  3:  160  160  160  10

Turns out that we have the same problem with FORM1 guests - we are
calculating associativity domain using zeroed values. And as it also
turns out, the solution from 71e6fae3a99 applies to FORM1 as well.

This patch creates a wrapper called 'get_numa_distance' that contains
the logic used in FORM2 to define node distances when this information
is absent. This helper is then used in all places where we need to read
distance information from machine_state->numa_state->nodes. That way
we'll guarantee that the NUMA node distance is always being curated
before being used.

After this patch, the FORM1 guest mentioned above will have the
following topology:

$ numactl -H
available: 4 nodes (0-3)
(...)
node distances:
node   0   1   2   3
  0:  10  20  20  20
  1:  20  10  20  20
  2:  20  20  10  20
  3:  20  20  20  10

This is compatible with what FORM2 guests and other archs do in this
case.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01960.html

Fixes: 690fbe4295d5 ("spapr_numa: consider user input when defining associativity")
CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
CC: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_numa.c | 62 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index 56ab2a5fb6..e9ef7e7646 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -66,16 +66,41 @@ static const uint32_t *get_associativity(SpaprMachineState *spapr, int node_id)
     return spapr->FORM1_assoc_array[node_id];
 }
 
+/*
+ * Wrapper that returns node distance from ms->numa_state->nodes
+ * after handling edge cases where the distance might be absent.
+ */
+static int get_numa_distance(MachineState *ms, int src, int dst)
+{
+    NodeInfo *numa_info = ms->numa_state->nodes;
+    int ret = numa_info[src].distance[dst];
+
+    if (ret != 0) {
+        return ret;
+    }
+
+    /*
+     * In case QEMU adds a default NUMA single node when the user
+     * did not add any, or where the user did not supply distances,
+     * the distance will be absent (zero). Return local/remote
+     * distance in this case.
+     */
+    if (src == dst) {
+        return NUMA_DISTANCE_MIN;
+    }
+
+    return NUMA_DISTANCE_DEFAULT;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
-    int src, dst;
     int nb_numa_nodes = ms->numa_state->num_nodes;
-    NodeInfo *numa_info = ms->numa_state->nodes;
+    int src, dst;
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = src; dst < nb_numa_nodes; dst++) {
-            if (numa_info[src].distance[dst] !=
-                numa_info[dst].distance[src]) {
+            if (get_numa_distance(ms, src, dst) !=
+                get_numa_distance(ms, dst, src)) {
                 return false;
             }
         }
@@ -133,7 +158,6 @@ static uint8_t spapr_numa_get_numa_level(uint8_t distance)
 static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
 {
     MachineState *ms = MACHINE(spapr);
-    NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int src, dst, i, j;
 
@@ -170,7 +194,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachineState *spapr)
              * The PPC kernel expects the associativity domains of node 0 to
              * be always 0, and this algorithm will grant that by default.
              */
-            uint8_t distance = numa_info[src].distance[dst];
+            uint8_t distance = get_numa_distance(ms, src, dst);
             uint8_t n_level = spapr_numa_get_numa_level(distance);
             uint32_t assoc_src;
 
@@ -498,7 +522,6 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
                                                void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
-    NodeInfo *numa_info = ms->numa_state->nodes;
     int nb_numa_nodes = ms->numa_state->num_nodes;
     int distance_table_entries = nb_numa_nodes * nb_numa_nodes;
     g_autofree uint32_t *lookup_index_table = NULL;
@@ -540,30 +563,7 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
 
     for (src = 0; src < nb_numa_nodes; src++) {
         for (dst = 0; dst < nb_numa_nodes; dst++) {
-            /*
-             * We need to be explicit with the local distance
-             * value to cover the case where the user didn't added any
-             * NUMA nodes, but QEMU adds the default NUMA node without
-             * adding the numa_info to retrieve distance info from.
-             */
-            distance_table[i] = numa_info[src].distance[dst];
-            if (distance_table[i] == 0) {
-                /*
-                 * In case QEMU adds a default NUMA single node when the user
-                 * did not add any, or where the user did not supply distances,
-                 * the value will be 0 here. Populate the table with a fallback
-                 * simple local / remote distance.
-                 */
-                if (src == dst) {
-                    distance_table[i] = NUMA_DISTANCE_MIN;
-                } else {
-                    distance_table[i] = numa_info[src].distance[dst];
-                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
-                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
-                    }
-                }
-            }
-            i++;
+            distance_table[i++] = get_numa_distance(ms, src, dst);
         }
     }
 
-- 
2.31.1


