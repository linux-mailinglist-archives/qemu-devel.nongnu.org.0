Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D805BE944
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 16:46:23 +0200 (CEST)
Received: from localhost ([::1]:35642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaeVy-0008AD-3I
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 10:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oabb5-0000XA-Lk
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:39:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oabb3-0001s4-9r
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:39:27 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28KBNxUN023812;
 Tue, 20 Sep 2022 11:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=V32dD7Rr+IdtugZCl3iQ+KTNtXDAuqaRngYtPpzeyEs=;
 b=tr9L/BaS/W8ChEKXVrAO6WTdVi8/Roaz9pBd7U+r4ZyHkKxMWN8LFowIomvsuy7qHYTL
 4T2C8/3kL9DDd3FcWdt5k+CjRhnAh2HNRj5tV9uLAXjtX+lZWmotRL3fgHaGyHe6F2d/
 FDlXdgPr2bZLgy3rpG7zmeVtov18N480JvZSw1QqtAutosEM8L6dIRxaMYOwdguI8HLB
 wOwujVbfE27q77IYW2qwrQ6dfPLYCJbmdXFLIyY+sDh/RQmi0Y8/wCKhvZqCKqqdSATU
 fgc7f8SLFkB66vY0bCsrbEL90CZaIvmO+Rugg5lbL25v2rNGDZz/fchlp0EfazAL2Waw Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqckt8sfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:39:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28KBNwFD023772;
 Tue, 20 Sep 2022 11:39:21 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqckt8ryf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:39:21 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28KBaILL007674;
 Tue, 20 Sep 2022 11:39:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3jn5v8tsvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 11:39:12 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28KBd9Yp37290428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Sep 2022 11:39:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13AF8A4060;
 Tue, 20 Sep 2022 11:39:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85A1FA4054;
 Tue, 20 Sep 2022 11:39:08 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.67.151])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Sep 2022 11:39:08 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user/host/s390: Add vector instructions to
 host_signal_write()
Date: Tue, 20 Sep 2022 13:39:07 +0200
Message-Id: <20220920113907.334144-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: I2LJVlF7tkGVH8_iT5lBECwBekcisa5d
X-Proofpoint-GUID: ap7d1tNQdR0EptkcfgVajt0QMTyId9TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_04,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200064
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new noexec test fails on s390x with "unexpected SEGV". This test
overwrites code using libc's memcpy(), which uses VSTL instruction.
host_signal_write() does not recognize it, which causes SEGV to be
incorrectly forwarded to the test.

Add all vector instructions that write to memory to
host_signal_write().

Reported-by: Thomas Huth <thuth@redhat.com>
Fixes: ab12c95d3f19 ("target/s390x: Make translator stop before the end of a page")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/include/host/s390/host-signal.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index 25fefa00bd..e6d3ec26dc 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -87,6 +87,31 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
             return true;
         }
         break;
+    case 0xe6:
+        switch (pinsn[2] & 0xff) {
+        case 0x09: /* VSTEBRH */
+        case 0x0a: /* VSTEBRG */
+        case 0x0b: /* VSTEBRF */
+        case 0x0e: /* VSTBR */
+        case 0x0f: /* VSTER */
+        case 0x3f: /* VSTRLR */
+            return true;
+        }
+        break;
+    case 0xe7:
+        switch (pinsn[2] & 0xff) {
+        case 0x08: /* VSTEB */
+        case 0x09: /* VSTEH */
+        case 0x0a: /* VSTEG */
+        case 0x0b: /* VSTEF */
+        case 0x0e: /* VST */
+        case 0x1a: /* VSCEG */
+        case 0x1b: /* VSCEF */
+        case 0x3e: /* VSTM */
+        case 0x3f: /* VSTL */
+            return true;
+        }
+        break;
     case 0xeb: /* RSY format insns */
         switch (pinsn[2] & 0xff) {
         case 0x14: /* CSY */
-- 
2.37.2


