Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251EA165E04
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 14:01:09 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4lS0-0002pn-56
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 08:01:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lOj-00060H-4X
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lOi-0006VS-67
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62876
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4lOi-0006V6-0k
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:44 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KCsxrF034743
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:43 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubpr987-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:43 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 12:57:41 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 12:57:38 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KCvbg621430468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 12:57:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A782AAE055;
 Thu, 20 Feb 2020 12:57:37 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83D9EAE04D;
 Thu, 20 Feb 2020 12:57:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 12:57:36 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/16] s390x: protvirt: KVM intercept changes
Date: Thu, 20 Feb 2020 07:56:28 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220125638.7241-1-frankja@linux.ibm.com>
References: <20200220125638.7241-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022012-0012-0000-0000-000003889ACD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022012-0013-0000-0000-000021C5318B
Message-Id: <20200220125638.7241-7-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=1 spamscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=939 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002200097
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Secure guests no longer intercept with code 4 for an instruction
interception. Instead they have codes 104 and 108 for secure
instruction interception and secure instruction notification
respectively.

The 104 mirrors the 4 interception.

The 108 is a notification interception to let KVM and QEMU know that
something changed and we need to update tracking information or
perform specific tasks. It's currently taken for the following
instructions:

* stpx (To inform about the changed prefix location)
* sclp (On incorrect SCCB values, so we can inject a IRQ)
* sigp (All but "stop and store status")
* diag308 (Subcodes 0/1)

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 1d6fd6a27b..eec0b92479 100644
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
@@ -1693,6 +1695,8 @@ static int handle_intercept(S390CPU *cpu)
             (long)cs->kvm_run->psw_addr);
     switch (icpt_code) {
         case ICPT_INSTRUCTION:
+        case ICPT_PV_INSTR:
+        case ICPT_PV_INSTR_NOTIFICATION:
             r = handle_instruction(cpu, run);
             break;
         case ICPT_PROGRAM:
-- 
2.20.1


