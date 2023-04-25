Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519496EE57F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:17:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLKV-0001wG-3C; Tue, 25 Apr 2023 12:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prLKI-0001eL-UD; Tue, 25 Apr 2023 12:15:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prLK7-0004FP-KR; Tue, 25 Apr 2023 12:15:30 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PG4D6p008606; Tue, 25 Apr 2023 16:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=l3RVD15EqoSBupoSQjJcxlIGPf6G34/auclhs9bUJ5w=;
 b=LG64oTl20DczqtQ9n9SmU5dxoC5QcHP5WEos0TpKK/7ToREwizgEN7bPafQf5uFwwK1u
 /W19KPX8kduOdlUe7nWlqwioeI/veA9Tyyh6pEq5YCiMlnDPhFMSN6RkNyCh3rCnJLzr
 GfBs0Xb6yb2mORVuAtfpBXk7KleoXZiBQ/2vU4SSzsLtA7WxLJzMmIIafp98oqPrcGSU
 +xxGMVV9cIGU3T1ztPxpHkuIm0uBaQLFw2YkN1/HtNRFQP/eo4O0YgHOTjX2xGRVoMuS
 3/3Oswbgo6rfOcKdDKb0+TDn8Rao6BX2iH6byGKOWicXcUITfZj0CxE6U69JaxFUY5Hj ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6hxgrxhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:13 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33PG4Jfv010025;
 Tue, 25 Apr 2023 16:15:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6hxgrxfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P9WcbK024739;
 Tue, 25 Apr 2023 16:15:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47771v70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 16:15:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33PGF4UO2622174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Apr 2023 16:15:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1212D2007C;
 Tue, 25 Apr 2023 16:15:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C17A2007A;
 Tue, 25 Apr 2023 16:15:03 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com (unknown
 [9.152.222.242])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 25 Apr 2023 16:15:03 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v20 09/21] machine: adding s390 topology to query-cpu-fast
Date: Tue, 25 Apr 2023 18:14:44 +0200
Message-Id: <20230425161456.21031-10-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230425161456.21031-1-pmorel@linux.ibm.com>
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HX0S-XcwtkiArx8WXNiKHRGI1Nyo1Jzz
X-Proofpoint-ORIG-GUID: 55dmJNS8-Hpl_3IDptydAtuN4-Zo0MFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_07,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250144
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
index 1cdd83f3fd..c6a12044e0 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -55,10 +55,17 @@
 # Additional information about a virtual S390 CPU
 #
 # @cpu-state: the virtual CPU's state
+# @dedicated: the virtual CPU's dedication (since 8.1)
+# @entitlement: the virtual CPU's entitlement (since 8.1)
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


