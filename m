Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FE3603BF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 09:55:46 +0200 (CEST)
Received: from localhost ([::1]:38364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWwqn-0006pX-Ha
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 03:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1lWwpI-0006Hn-JK; Thu, 15 Apr 2021 03:54:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1lWwpF-0002eF-R2; Thu, 15 Apr 2021 03:54:12 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13F7XmEg044510; Thu, 15 Apr 2021 03:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=ccdw1h1FpLZVMFSio+Ui/fn2FVzrIb5nkTDJJUnpbDw=;
 b=PKJVPXF5BTFazcjQQ+SbybtTReGYlAEW60yxVINg172zHukSFqjHh+0pdBhK0+8PlR/T
 683OQ0V8NbzdbyFNH8se/SH+DZSnK/bqrXRhmdD39QRTPiNhS4v3mlrR8khBCAmm+fRn
 LR/R/jSK7av2n5IxMCu50RETYhkfNgGaRC9OENuO+xQ+RVtPGxpgbvka5/JklmtVkV6Z
 B3KX59G0OHQhCFH0WTgU6xPSCS+Wifs5R4tnr5Puu83qlHd5KkJynGGz3Sq1QDFDQETG
 IoA/8PxW8GR3CwcuO1hEJaRrXeNUPrUBF5FErjEujNMeBs1Y74hHyee1IVtA25IE5K3V UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xfrnjv2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 03:54:00 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13F7XtF0045291;
 Thu, 15 Apr 2021 03:53:59 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xfrnjv1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 03:53:59 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13F7qiXF017276;
 Thu, 15 Apr 2021 07:53:57 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 37u3n8a0sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 07:53:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13F7rsMM20316614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 07:53:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2705A42042;
 Thu, 15 Apr 2021 07:53:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F46A4203F;
 Thu, 15 Apr 2021 07:53:50 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.199.63.240])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 15 Apr 2021 07:53:49 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Thu, 15 Apr 2021 13:23:48 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, mst@redhat.com, imammedo@redhat.com,
 xiaoguangrong.eric@gmail.com
Subject: [RFC-PATCH] ppc/spapr: Add support for H_SCM_PERFORMANCE_STATS hcall
Date: Thu, 15 Apr 2021 13:23:43 +0530
Message-Id: <20210415075343.482855-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JiAqiOFOTibJjGnf2nwCEgwDK-8VsHeT
X-Proofpoint-GUID: F5baFwlQ72nO65R6BlU0zIErdJsS2Yjt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_03:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, groug@kaod.org,
 shivaprasadbhat@gmail.com, aneesh.kumar@linux.ibm.com,
 bharata@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for H_SCM_PERFORMANCE_STATS described at [1] for
spapr nvdimms. This enables guest to fetch performance stats[2] like
expected life of an nvdimm ('MemLife ') etc and display them to the
user. Linux kernel support for fetching these performance stats and
exposing them to the user-space was done via [3].

The hcall semantics mandate that each nvdimm performance stats is
uniquely identied by a 8-byte ascii string (e.g 'MemLife ') and its
value be a 8-byte integer. These performance-stats are exchanged with
the guest in via a guest allocated buffer called
'requestAndResultBuffer' or rr-buffer for short. This buffer contains
a header descibed by 'struct papr_scm_perf_stats' followed by an array
of performance-stats described by 'struct papr_scm_perf_stat'. The
hypervisor is expected to validate the rr-buffer header and then based
on the request copy the needed performance-stats to the array of
'struct papr_scm_perf_stat' following the header.

The patch proposes a new function h_scm_performance_stats() that
services the H_SCM_PERFORMANCE_STATS hcall. After verifying the
validity of the rr-buffer header via scm_perf_check_rr_buffer() it
proceeds to fill the rr-buffer with requested performance-stats. The
value of individual stats is retrived from individual accessor
function for the stat which are indexed in the array
'nvdimm_perf_stats'.

References:
[1] "Hypercall Op-codes (hcalls)"
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/powerpc/papr_hcalls.rst#n269
[2] Sysfs attribute documentation for papr_scm
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-bus-papr-pmem#n36
[3] "powerpc/papr_scm: Fetch nvdimm performance stats from PHYP"
https://lore.kernel.org/r/20200731064153.182203-2-vaibhav@linux.ibm.com

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 hw/ppc/spapr_nvdimm.c  | 243 +++++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h |  19 +++-
 2 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index 252204e25f..4830eae4a4 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -35,6 +35,11 @@
 /* SCM device is unable to persist memory contents */
 #define PAPR_PMEM_UNARMED PPC_BIT(0)
 
+/* Maximum output buffer size needed to return all nvdimm_perf_stats */
+#define SCM_STATS_MAX_OUTPUT_BUFFER  (sizeof(struct papr_scm_perf_stats) + \
+                                      sizeof(struct papr_scm_perf_stat) * \
+                                      ARRAY_SIZE(nvdimm_perf_stats))
+
 bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
                            uint64_t size, Error **errp)
 {
@@ -502,6 +507,243 @@ static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+static int perf_stat_noop(SpaprDrc *drc, uint8_t unused[8], uint64_t *val)
+{
+    *val = 0;
+    return H_SUCCESS;
+}
+
+static int perf_stat_memlife(SpaprDrc *drc, uint8_t unused[8], uint64_t *val)
+{
+    /* Assume full life available of an NVDIMM right now */
+    *val = 100;
+    return H_SUCCESS;
+}
+
+/*
+ * Holds all supported performance stats accessors. Each performance-statistic
+ * is uniquely identified by a 8-byte ascii string for example: 'MemLife '
+ * which indicate in percentage how much usage life of an nvdimm is remaining.
+ * 'NoopStat' which is primarily used to test support for retriving performance
+ * stats and also to replace unknown stats present in the rr-buffer.
+ *
+ */
+static const struct {
+    char stat_id[8];
+    int  (*stat_getval)(SpaprDrc *drc, uint8_t id[8],  uint64_t *val);
+} nvdimm_perf_stats[] = {
+    { "NoopStat", perf_stat_noop},
+    { "MemLife ", perf_stat_memlife},
+};
+
+/*
+ * Given a nvdimm drc and stat-name return its value. In case given stat-name
+ * isnt supported then return H_PARTIAL.
+ */
+static int nvdimm_stat_getval(SpaprDrc *drc, uint8_t id[8], uint64_t *val)
+{
+    int index;
+
+    /* Lookup the stats-id in the nvdimm_perf_stats table */
+    for (index = 0; index < ARRAY_SIZE(nvdimm_perf_stats); ++index) {
+
+        if (memcmp(nvdimm_perf_stats[index].stat_id, &id[0], 8) == 0 &&
+            nvdimm_perf_stats[index].stat_getval) {
+
+            return nvdimm_perf_stats[index].stat_getval(drc, id, val);
+        }
+    }
+
+    return H_PARTIAL;
+}
+
+/*
+ * Given a request & result buffer header verify its contents. Also
+ * verify that buffer & buffer-size provided by the guest is accessible and
+ * large enough to hold the requested stats. The size of buffer needed to
+ * hold the requested 'num_stat' number of stats is returned in 'size'.
+ */
+static int scm_perf_check_rr_buffer(struct papr_scm_perf_stats *header,
+                                    hwaddr addr, size_t *size,
+                                    uint32_t *num_stats)
+{
+    size_t expected_buffsize;
+
+    /* Verify the header eyecather and version */
+    if (memcmp(&header->eye_catcher, SCM_STATS_EYECATCHER,
+               sizeof(header->eye_catcher))) {
+        return H_BAD_DATA;
+    }
+    if (be32_to_cpu(header->stats_version) != 0x1) {
+        return H_NOT_AVAILABLE;
+    }
+
+    /* verify that rr buffer has enough space */
+    *num_stats = be32_to_cpu(header->num_statistics);
+    if (*num_stats == 0) { /* Return all stats */
+        expected_buffsize = SCM_STATS_MAX_OUTPUT_BUFFER;
+    } else { /* Return a subset of stats */
+        expected_buffsize = sizeof(struct papr_scm_perf_stats) +
+            (*num_stats) * sizeof(struct papr_scm_perf_stat);
+
+    }
+
+    if (*size < expected_buffsize) {
+        return H_P3;
+    }
+    *size = expected_buffsize;
+
+    /* verify that rr buffer is writable */
+    if (!address_space_access_valid(&address_space_memory, addr, *size,
+                                    true, MEMTXATTRS_UNSPECIFIED)) {
+        return H_PRIVILEGE;
+    }
+
+    return H_SUCCESS;
+}
+
+/*
+ * For a given DRC index (R3) return one ore more performance stats of an nvdimm
+ * device in guest allocated Request-and-result buffer (rr-buffer) (R4) of
+ * given 'size' (R5). The rr-buffer consists of a header described by
+ * 'struct papr_scm_perf_stats' that embeds the 'stats_version' and
+ * 'num_statistics' fields. This is followed by an array of
+ * 'struct papr_scm_perf_stat'. Based on the request type the writes the
+ * performance into the array of 'struct papr_scm_perf_stat' embedded inside
+ * the rr-buffer provided by the guest.
+ * Special cases handled are:
+ * 'size' == 0  : Return the maximum possible size of rr-buffer
+ * 'size' != 0 && 'num_statistics == 0' : Return all possible performance stats
+ *
+ * In case there was an error fetching a specific stats (e.g stat-id unknown or
+ * any other error) then return the stat-id in R4 and also replace its stat
+ * entry in rr-buffer with 'NoopStat'
+ */
+static target_ulong h_scm_performance_stats(PowerPCCPU *cpu,
+                                            SpaprMachineState *spapr,
+                                            target_ulong opcode,
+                                            target_ulong *args)
+{
+    const uint32_t drc_index = args[0];
+    const hwaddr addr = args[1];
+    size_t size = args[2];
+    int index;
+    MemTxResult result;
+    uint32_t num_stats;
+    uint8_t stat_id[8];
+    unsigned long rc;
+    uint64_t stat_val, invalid_stat = 0;
+    struct papr_scm_perf_stats perfstats;
+    struct papr_scm_perf_stat *stats, *stat;
+    SpaprDrc *drc = spapr_drc_by_index(drc_index);
+
+    /* Ensure that the drc is valid & is valid PMEM dimm and is plugged in */
+    if (!drc || !drc->dev ||
+        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
+        return H_PARAMETER;
+    }
+
+    /* Guest requested max buffer size for output buffer */
+    if (size == 0) {
+        args[0] = SCM_STATS_MAX_OUTPUT_BUFFER;
+        return H_SUCCESS;
+    }
+
+    /* Read and verify rr-buffer header */
+    result = address_space_read(&address_space_memory, addr,
+                                MEMTXATTRS_UNSPECIFIED, &perfstats,
+                                sizeof(perfstats));
+    if (result != MEMTX_OK) {
+        return H_PRIVILEGE;
+    }
+
+    /* Verify that the rr-buffer is valid */
+    rc = scm_perf_check_rr_buffer(&perfstats, addr, &size, &num_stats);
+    if (rc != H_SUCCESS) {
+        return rc;
+    }
+
+    /* allocate enough buffer space locally for holding all stats */
+    stats = g_malloc0(size  - sizeof(struct papr_scm_perf_stats));
+
+    if (num_stats == 0) { /* Return all supported stats */
+
+        for (index = 1; index < ARRAY_SIZE(nvdimm_perf_stats); ++index) {
+            stat = &stats[index - 1];
+            memcpy(stat_id, &nvdimm_perf_stats[index].stat_id, 8);
+            rc = nvdimm_stat_getval(drc, stat_id, &stat_val);
+
+            /* On error add noop stat to rr buffer & save last inval stat-id */
+            if (rc != H_SUCCESS) {
+                if (!invalid_stat) {
+                    memcpy(&invalid_stat, &stat_id[0], 8);
+                }
+                memcpy(&stat_id, nvdimm_perf_stats[0].stat_id, 8);
+                stat_val = 0;
+            }
+
+            memcpy(&stat->statistic_id, stat_id, 8);
+            stat->statistic_value = cpu_to_be64(stat_val);
+        }
+        /* Number of stats returned == perf_stats array size - noop-stat */
+        num_stats = ARRAY_SIZE(nvdimm_perf_stats) - 1;
+
+    } else { /* Return a subset of requested stats */
+
+        /* copy the rr-buffer from the guest memory */
+        result = address_space_read(&address_space_memory,
+                                    addr + sizeof(struct papr_scm_perf_stats),
+                                    MEMTXATTRS_UNSPECIFIED, stats,
+                                    size - sizeof(struct papr_scm_perf_stats));
+
+        if (result != MEMTX_OK) {
+            g_free(stats);
+            return H_PRIVILEGE;
+        }
+
+        for (index = 0; index < num_stats; ++index) {
+            stat = &stats[index];
+            memcpy(&stat_id, &stats->statistic_id, 8);
+            rc = nvdimm_stat_getval(drc, stat_id, &stat_val);
+
+            /* On error add noop stat to rr buffer & save last inval stat-id */
+            if (rc != H_SUCCESS) {
+                if (!invalid_stat) {
+                    memcpy(&invalid_stat, &stat_id[0], 8);
+                }
+                memcpy(&stat_id, nvdimm_perf_stats[0].stat_id, 8);
+                stat_val = 0;
+            }
+
+            memcpy(&stat->statistic_id, stat_id, 8);
+            stat->statistic_value = cpu_to_be64(stat_val);
+        }
+    }
+
+    /* Update and copy the local rr-buffer header and stats back to guest */
+    perfstats.num_statistics = cpu_to_be32(num_stats);
+    result = address_space_write(&address_space_memory, addr,
+                                 MEMTXATTRS_UNSPECIFIED, &perfstats,
+                                 sizeof(struct papr_scm_perf_stats));
+    if (result == MEMTX_OK) {
+        result = address_space_write(&address_space_memory,
+                                     addr + sizeof(struct papr_scm_perf_stats),
+                                     MEMTXATTRS_UNSPECIFIED, stats,
+                                     size - sizeof(struct papr_scm_perf_stats));
+    }
+
+    /* Cleanup the stats buffer */
+    g_free(stats);
+
+    if (result) {
+        return H_PRIVILEGE;
+    }
+
+    /* Check if there was a failure in fetching any stat */
+    args[0] = invalid_stat;
+    return invalid_stat ? H_PARTIAL : H_SUCCESS;
+}
+
 static void spapr_scm_register_types(void)
 {
     /* qemu/scm specific hcalls */
@@ -511,6 +753,7 @@ static void spapr_scm_register_types(void)
     spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
     spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
     spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
+    spapr_register_hypercall(H_SCM_PERFORMANCE_STATS, h_scm_performance_stats);
 }
 
 type_init(spapr_scm_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index d2b5a9bdf9..4b71b58e00 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -326,6 +326,7 @@ struct SpaprMachineState {
 #define H_P8              -61
 #define H_P9              -62
 #define H_OVERLAP         -68
+#define H_BAD_DATA        -70
 #define H_UNSUPPORTED_FLAG -256
 #define H_MULTI_THREADS_ACTIVE -9005
 
@@ -539,8 +540,9 @@ struct SpaprMachineState {
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_HEALTH            0x400
+#define H_SCM_PERFORMANCE_STATS 0x418
 
-#define MAX_HCALL_OPCODE        H_SCM_HEALTH
+#define MAX_HCALL_OPCODE        H_SCM_PERFORMANCE_STATS
 
 /* The hcalls above are standardized in PAPR and implemented by pHyp
  * as well.
@@ -787,6 +789,21 @@ OBJECT_DECLARE_SIMPLE_TYPE(SpaprTceTable, SPAPR_TCE_TABLE)
 DECLARE_INSTANCE_CHECKER(IOMMUMemoryRegion, SPAPR_IOMMU_MEMORY_REGION,
                          TYPE_SPAPR_IOMMU_MEMORY_REGION)
 
+/* Defs and structs exchanged with guest when reporting drc perf stats */
+#define SCM_STATS_EYECATCHER "SCMSTATS"
+
+struct QEMU_PACKED papr_scm_perf_stat {
+    uint8_t statistic_id[8];
+    uint64_t statistic_value;
+};
+
+struct QEMU_PACKED papr_scm_perf_stats {
+    uint8_t eye_catcher[8];    /* Should be “SCMSTATS” */
+    uint32_t stats_version;  /* Should be 0x01 */
+    uint32_t num_statistics; /* Number of stats following */
+    struct papr_scm_perf_stat scm_statistics[]; /* Performance matrics */
+};
+
 struct SpaprTceTable {
     DeviceState parent;
     uint32_t liobn;
-- 
2.30.2


