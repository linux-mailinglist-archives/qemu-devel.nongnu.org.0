Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6676B23EF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:18:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFBV-0004DT-FM; Thu, 09 Mar 2023 07:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1paFBQ-0004AJ-24; Thu, 09 Mar 2023 07:15:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1paFBN-0003yU-NV; Thu, 09 Mar 2023 07:15:43 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329BHIUw027527; Thu, 9 Mar 2023 12:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/rWr5PFl5sVls4Pw8OS8QIifY72lWtmSiP7xB3f7odo=;
 b=V3vXR2HrgjyPpjNdLJxi0JwA075FNr3tDDUqK6LqEsuP1H5CbMyHAJzhuTJ11GFCJGsG
 AQwujPEvx50+VcKDfL9PxxQWu+FARaQZiQu212p+HnVHNvAlYPyb8PVjq8hti642YVMc
 s+PpldWxbrDk1D0bhzgO1CBUAyV62JmWsiDXAqFdSuoX7/rQNWUBF6GBE0H0ZUHLSuXx
 zRuemNGAXbXLy5FBig/EufekzA2xbKg3NMrwghGavmlSGiKRGSj0o+lg1VkbAJgnY+Tt
 WIwclrtayDlPs+KN5h2SjOkL6klYUawaRMDEmXrYhrlyX7HSdZ3orJTAj1+L/24/aabE AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6pa7wpcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:32 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329B10Bk013584;
 Thu, 9 Mar 2023 12:15:31 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6pa7wpbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32940KXC023552;
 Thu, 9 Mar 2023 12:15:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p6fystaef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 329CFQxs27132212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Mar 2023 12:15:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14C5020067;
 Thu,  9 Mar 2023 12:15:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDD1A2004B;
 Thu,  9 Mar 2023 12:15:24 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.28.223]) by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  9 Mar 2023 12:15:24 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v17 09/12] machine: adding s390 topology to query-cpu-fast
Date: Thu,  9 Mar 2023 13:15:08 +0100
Message-Id: <20230309121511.139152-10-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230309121511.139152-1-pmorel@linux.ibm.com>
References: <20230309121511.139152-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GPPqRd_kBvSBJoUf3mGQHosOayMVAWp6
X-Proofpoint-ORIG-GUID: 2mxllI2KZodz0SaEUQUwfQpvemEpbbbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

S390x provides two more topology attributes, entitlement and dedication.

Let's add these CPU attributes to the QAPI command query-cpu-fast.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 qapi/machine.json          | 9 ++++++++-
 hw/core/machine-qmp-cmds.c | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5e5d7ed20b..ac6bb9e0c8 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -55,10 +55,17 @@
 # Additional information about a virtual S390 CPU
 #
 # @cpu-state: the virtual CPU's state
+# @dedicated: the virtual CPU's dedication (since 8.0)
+# @entitlement: the virtual CPU's entitlement (since 8.0)
 #
 # Since: 2.12
 ##
-{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
+{ 'struct': 'CpuInfoS390',
+  'data': { 'cpu-state': 'CpuS390State',
+            'dedicated': 'bool',
+            'entitlement': 'CpuS390Entitlement'
+  }
+}
 
 ##
 # @CpuInfoFast:
diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index b98ff15089..3f35ed83a6 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -35,6 +35,8 @@ static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
     CPUS390XState *env = &s390_cpu->env;
 
     info->cpu_state = env->cpu_state;
+    info->dedicated = env->dedicated;
+    info->entitlement = env->entitlement;
 #else
     abort();
 #endif
-- 
2.31.1


