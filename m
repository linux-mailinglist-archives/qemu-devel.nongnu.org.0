Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4B18B5E5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 14:22:57 +0100 (CET)
Received: from localhost ([::1]:37888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEv8S-0007CA-L5
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 09:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jEv5N-0001xc-Kl
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jEv5M-0001TZ-Dk
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jEv5M-0001Sp-96
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 09:19:44 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JD7E98051696
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:19:43 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu98uff5x-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 Mar 2020 09:19:43 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 19 Mar 2020 13:19:41 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Mar 2020 13:19:39 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02JDJcXc46071816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 13:19:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 334AAA405B;
 Thu, 19 Mar 2020 13:19:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EAA7A405F;
 Thu, 19 Mar 2020 13:19:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.146.136])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 13:19:36 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 06/16] s390x: protvirt: KVM intercept changes
Date: Thu, 19 Mar 2020 09:19:11 -0400
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319131921.2367-1-frankja@linux.ibm.com>
References: <20200319131921.2367-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031913-0012-0000-0000-00000393DAC7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031913-0013-0000-0000-000021D0C086
Message-Id: <20200319131921.2367-7-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_04:2020-03-19,
 2020-03-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 suspectscore=1 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190058
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protected VMs no longer intercept with code 4 for an instruction
interception. Instead they have codes 104 and 108 for protected
instruction interception and protected instruction notification
respectively.

The 104 mirrors the 4 interception.

The 108 is a notification interception to let KVM and QEMU know that
something changed and we need to update tracking information or
perform specific tasks. It's currently taken for the following
instructions:

* spx (To inform about the changed prefix location)
* sclp (On incorrect SCCB values, so we can inject a IRQ)
* sigp (All but "stop and store status")
* diag308 (Subcodes 0/1)

Of these exits only sclp errors, state changing sigps and diag308 will
reach QEMU. QEMU will do its parts of the job, while the ultravisor
has done the instruction part of the job.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index c695941076b7aead..cbb71aa11b9a626a 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -115,6 +115,8 @@
 #define ICPT_CPU_STOP                   0x28
 #define ICPT_OPEREXC                    0x2c
 #define ICPT_IO                         0x40
+#define ICPT_PV_INSTR                   0x68
+#define ICPT_PV_INSTR_NOTIFICATION      0x6c
 
 #define NR_LOCAL_IRQS 32
 /*
@@ -1698,6 +1700,8 @@ static int handle_intercept(S390CPU *cpu)
             (long)cs->kvm_run->psw_addr);
     switch (icpt_code) {
         case ICPT_INSTRUCTION:
+        case ICPT_PV_INSTR:
+        case ICPT_PV_INSTR_NOTIFICATION:
             r = handle_instruction(cpu, run);
             break;
         case ICPT_PROGRAM:
-- 
2.25.1


