Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468421D5C5B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 00:25:52 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZim7-0007tr-Ar
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 18:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jZihW-000103-Hh; Fri, 15 May 2020 18:21:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jZihV-0006gy-3c; Fri, 15 May 2020 18:21:06 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FM34AV090433; Fri, 15 May 2020 18:21:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 311rdmwjat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 18:21:01 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04FMFkNU124666;
 Fri, 15 May 2020 18:21:01 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 311rdmwjaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 18:21:01 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04FMKG2h031772;
 Fri, 15 May 2020 22:21:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3100uc2e4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 22:21:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04FMKxeA47972834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 22:20:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA4AE112061;
 Fri, 15 May 2020 22:20:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E67E112067;
 Fri, 15 May 2020 22:20:59 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.146.125])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 May 2020 22:20:59 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2 1/8] s390/sclp: get machine once during read scp/cpu info
Date: Fri, 15 May 2020 18:20:25 -0400
Message-Id: <20200515222032.18838-2-walling@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515222032.18838-1-walling@linux.ibm.com>
References: <20200515222032.18838-1-walling@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_07:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005150185
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 18:21:02
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 svens@linux.ibm.com, pbonzini@redhat.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Functions within read scp/cpu info will need access to the machine
state. Let's make a call to retrieve the machine state once and
pass the appropriate data to the respective functions.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
---
 hw/s390x/sclp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index ede056b3ef..61e2e2839c 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -49,9 +49,8 @@ static inline bool sclp_command_code_valid(uint32_t code)
     return false;
 }
 
-static void prepare_cpu_entries(SCLPDevice *sclp, CPUEntry *entry, int *count)
+static void prepare_cpu_entries(MachineState *ms, CPUEntry *entry, int *count)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     uint8_t features[SCCB_CPU_FEATURE_LEN] = { 0 };
     int i;
 
@@ -77,7 +76,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
     IplParameterBlock *ipib = s390_ipl_get_iplb();
 
     /* CPU information */
-    prepare_cpu_entries(sclp, read_info->entries, &cpu_count);
+    prepare_cpu_entries(machine, read_info->entries, &cpu_count);
     read_info->entries_cpu = cpu_to_be16(cpu_count);
     read_info->offset_cpu = cpu_to_be16(offsetof(ReadInfo, entries));
     read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);
@@ -132,10 +131,11 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
 /* Provide information about the CPU */
 static void sclp_read_cpu_info(SCLPDevice *sclp, SCCB *sccb)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     ReadCpuInfo *cpu_info = (ReadCpuInfo *) sccb;
     int cpu_count;
 
-    prepare_cpu_entries(sclp, cpu_info->entries, &cpu_count);
+    prepare_cpu_entries(machine, cpu_info->entries, &cpu_count);
     cpu_info->nr_configured = cpu_to_be16(cpu_count);
     cpu_info->offset_configured = cpu_to_be16(offsetof(ReadCpuInfo, entries));
     cpu_info->nr_standby = cpu_to_be16(0);
-- 
2.21.3


