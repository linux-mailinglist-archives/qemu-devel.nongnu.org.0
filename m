Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6C24BA29F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:10:58 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhUn-0006Lx-8f
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nKh0F-0006aq-EI; Thu, 17 Feb 2022 08:39:24 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62606
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1nKh0D-0001is-BQ; Thu, 17 Feb 2022 08:39:23 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HClbja004661; 
 Thu, 17 Feb 2022 13:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wwM3+qVzoo7ehBhe9NaM4GO+bNveqcq7gHq8K4iK0uU=;
 b=en+NlssAEno0U00xhoKk+eUBa2H5wlDXXoUmGotbHqcg/cDf1jmTbrQ0xSReyB/N7x/h
 iA/QZHQjRqzJe3/hoTledoLihh71ywiGpKkpGwYKB76FiX6rzsXNYLREqioqonDa0X+w
 LCG9DUuIw3QR9TKvnMfmRSY4CSv15WJ2mYcD3kJ1fTVzJMzVcGH8kgmn5WGFRCcNwqTV
 bqBAJHC3uEe5srjVotn63z6bfbSB0eoTIwp2+1M8XBW/lVm/X945nJFImJ+JXAlS5H0C
 cVTT+S4eyiTyT2j7aT43d9JvFhBoD29pQRSoEn+7pxliad4TO4zjnGfIAdTVCNW6ZxfE iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9pp9h6p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 13:39:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HCprho017155;
 Thu, 17 Feb 2022 13:39:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9pp9h6mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 13:39:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HDbb1Z005926;
 Thu, 17 Feb 2022 13:39:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64hajpmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 13:39:16 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HDdDMh45220152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 13:39:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFE394C046;
 Thu, 17 Feb 2022 13:39:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 066934C040;
 Thu, 17 Feb 2022 13:39:12 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.42.121])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 13:39:11 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v6 01/11] s390x: SCLP: reporting the maximum nested topology
 entries
Date: Thu, 17 Feb 2022 14:41:15 +0100
Message-Id: <20220217134125.132150-2-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220217134125.132150-1-pmorel@linux.ibm.com>
References: <20220217134125.132150-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HHYaMOjGm0cIEOMi1w3xFzKDuh-pIq7q
X-Proofpoint-ORIG-GUID: WYEvJTHeUdhRzQATSYq8WWyD43d9hFMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_05,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 mlxlogscore=988 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170061
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: thuth@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 ehabkost@redhat.com, kvm@vger.kernel.org, david@redhat.com, eblake@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The maximum nested topology entries is used by the guest to know
how many nested topology are available on the machine.

Currently, reporting SCLP reports 0, which is the equivalent of
reporting the default value of 2.
Let's use the default SCLP value of 2 and increase this value in the
future patches implementing higher levels.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/sclp.c         | 1 +
 include/hw/s390x/sclp.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 89c30a8a91..7797a45cef 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -125,6 +125,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
 
     /* CPU information */
     prepare_cpu_entries(machine, entries_start, &cpu_count);
+    read_info->stsi_parm = SCLP_READ_SCP_INFO_MNEST;
     read_info->entries_cpu = cpu_to_be16(cpu_count);
     read_info->offset_cpu = cpu_to_be16(offset_cpu);
     read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index d3ade40a5a..20dd4bd818 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -111,12 +111,14 @@ typedef struct CPUEntry {
     uint8_t reserved1;
 } QEMU_PACKED CPUEntry;
 
+#define SCLP_READ_SCP_INFO_MNEST                  2
 #define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET     128
 typedef struct ReadInfo {
     SCCBHeader h;
     uint16_t rnmax;
     uint8_t rnsize;
-    uint8_t  _reserved1[16 - 11];       /* 11-15 */
+    uint8_t  _reserved1[15 - 11];       /* 11-14 */
+    uint8_t  stsi_parm;                 /* 15-16 */
     uint16_t entries_cpu;               /* 16-17 */
     uint16_t offset_cpu;                /* 18-19 */
     uint8_t  _reserved2[24 - 20];       /* 20-23 */
-- 
2.27.0


