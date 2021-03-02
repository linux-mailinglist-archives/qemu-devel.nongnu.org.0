Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC9832ABD4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:51:11 +0100 (CET)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHBz4-0003Dh-6L
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwd-0001Oy-Ae
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwb-00085I-8G
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:39 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KjIOn042909; Tue, 2 Mar 2021 15:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wx/vEAbRkX9QV8xxhblVvmPL07WccAn1wPbN6fuibac=;
 b=nfK0rfyPxBZ4l0BiBJkM4XqQxmarJnF/ezuMxGzZDkwcRXIogNKdUEY1cKZIwA8ZtzQQ
 OvPjfHV+xUow98QU6J5cVnIkDvT7A7t784x8EW5MiufMKoj7/6SaQKfghVCMVc/vknlg
 YH3W6qd9rNNo7jcTBxRXDj0BoTL4zEFX/AsNTlLZiC9tzdfixjSlHMN8KDoXrJbw57cT
 yt1Y63f5f3di4l2PFv0EmOEmXRttq6zlEcd5JSYZWxo2W0zN+6e05WzdgDZ+gw5bL9Uq
 LJntwytj94lkNmhiy2R7cbhhb+qyS63igoBKidmLBkhKxkggGkZ+WbwcbpfdE+zGGVtZ CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vp083g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:32 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Kk8Ct045199;
 Tue, 2 Mar 2021 15:48:32 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vp083f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:32 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122KmRQp008407;
 Tue, 2 Mar 2021 20:48:31 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 36ydq988k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:31 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmT3O25690586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D564D28059;
 Tue,  2 Mar 2021 20:48:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A8BE28065;
 Tue,  2 Mar 2021 20:48:29 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:29 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/26] hw/acpi: Don't include auxiliary vcpus in ACPI
 tables
Date: Tue,  2 Mar 2021 15:48:02 -0500
Message-Id: <20210302204822.81901-7-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=860 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>

By excluding auxiliary vcpus from the ACPI tables, we hide them from the
guest OS.  This in turn allows OVMF to execute code on the auxiliary
vcpus in parallel to the OS.

Signed-off-by: Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 hw/acpi/cpu.c         | 10 ++++++++++
 hw/i386/acpi-build.c  |  5 +++++
 hw/i386/acpi-common.c |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index e2317be546..d3f0a48da9 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -436,6 +436,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
         method = aml_method(CPU_NOTIFY_METHOD, 2, AML_NOTSERIALIZED);
         for (i = 0; i < arch_ids->len; i++) {
+            if (arch_ids->cpus[i].aux) {
+                /* don't build objects for auxiliary CPUs */
+                continue;
+            }
+
             Aml *cpu = aml_name(CPU_NAME_FMT, i);
             Aml *uid = aml_arg(0);
             Aml *event = aml_arg(1);
@@ -651,6 +656,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
         /* build Processor object for each processor */
         for (i = 0; i < arch_ids->len; i++) {
+            if (arch_ids->cpus[i].aux) {
+                /* don't build objects for auxiliary CPUs */
+                continue;
+            }
+
             Aml *dev;
             Aml *uid = aml_int(i);
             GArray *madt_buf = g_array_new(0, 1, 1);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b9190b924a..8cc7e2af3a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1708,6 +1708,11 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     srat->reserved1 = cpu_to_le32(1);
 
     for (i = 0; i < apic_ids->len; i++) {
+        if (apic_ids->cpus[i].aux) {
+            /* don't build objects for auxiliary CPUs */
+            continue;
+        }
+
         int node_id = apic_ids->cpus[i].props.node_id;
         uint32_t apic_id = apic_ids->cpus[i].arch_id;
 
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf9..7c73f3900b 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -91,6 +91,11 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     madt->flags = cpu_to_le32(1);
 
     for (i = 0; i < apic_ids->len; i++) {
+        if (apic_ids->cpus[i].aux) {
+            /* don't build objects for auxiliary CPUs */
+            continue;
+        }
+
         adevc->madt_cpu(adev, i, apic_ids, table_data);
         if (apic_ids->cpus[i].arch_id > 254) {
             x2apic_mode = true;
-- 
2.20.1


