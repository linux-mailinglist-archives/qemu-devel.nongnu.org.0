Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB832AC0F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:08:11 +0100 (CET)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCFV-0006LM-Bt
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwg-0001WV-Bq
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwe-00086k-8L
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122KhgMk168465; Tue, 2 Mar 2021 15:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8hyH56LRkpvTv0mf4DTpS+OO6A4Mif12MqDVQqWX1jA=;
 b=BTQbiMYVbYG2ccAG1kS3FDFrbC44AusTVTtg21H0ibbNzSLg6qvLPioXcCTJtfEW+kSv
 keAqWtBHw907aHfZ+ncG/wVEis2WvyoXT7fypQ94Ajmmv2WWCjASS/H7umL302i2O1YB
 6P+ZDQPrReEBAffxZTlH9hhAwNBFwNlBRtciIq0jZzJfCbZBdmac/TkmJVZK8acQ41MT
 j7ZV37set/qIF2Hl16VVv3SdBy65iQuTd3vb3bWmBx4UACB/RG3VtpT8BRlAX2rveGaD
 PIsCsdGzVd4JlBg0Hpg5tkTJzD3oKfgyD5gZr7BZo9BKGRMCm0P0VkXSWx1WqMSZbRz/ Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnd05j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:35 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122Khis3168579;
 Tue, 2 Mar 2021 15:48:33 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnd05h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:33 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Kgw7l019511;
 Tue, 2 Mar 2021 20:48:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3710sqncda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:31 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmUX440042850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 728292805C;
 Tue,  2 Mar 2021 20:48:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C50728065;
 Tue,  2 Mar 2021 20:48:30 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:30 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/26] hw/i386: Set CPUState.aux=true for auxiliary vcpus
Date: Tue,  2 Mar 2021 15:48:04 -0500
Message-Id: <20210302204822.81901-9-dovmurik@linux.vnet.ibm.com>
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
 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On x86 machines, when initializing the CPUState structs, set the aux
flag to true for auxiliary vcpus.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 include/hw/i386/x86.h | 2 +-
 hw/i386/x86.c         | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 56080bd1fb..f9ec6af9b7 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -85,7 +85,7 @@ void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
 
-void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, Error **errp);
+void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, bool aux, Error **errp);
 void x86_cpus_init(X86MachineState *pcms, int default_cpu_version);
 CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
                                              unsigned cpu_index);
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index be23fad650..bc17b53180 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -101,13 +101,16 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 }
 
 
-void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
+void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, bool aux, Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
+    if (!object_property_set_bool(cpu, "aux", aux, errp)) {
+        goto out;
+    }
     qdev_realize(DEVICE(cpu), NULL, errp);
 
 out:
@@ -135,7 +138,8 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
                                                       ms->smp.max_cpus - 1) + 1;
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
+        x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id,
+                    possible_cpus->cpus[i].aux, &error_fatal);
     }
 }
 
-- 
2.20.1


