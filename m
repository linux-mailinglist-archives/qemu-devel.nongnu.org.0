Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1A3DF60A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:55:22 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0VV-0002Z2-2m
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mB0Ua-0001s4-AU
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:54:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50098
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mB0UY-00085z-IX
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:54:24 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173JYJCh064706; Tue, 3 Aug 2021 15:54:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yvRUiohWJIuhhVr9Fp4zUp/YWTrS+tXBjCnR2pLaXF8=;
 b=Aks/1H1dSSRj4obln6D4NUWUNUZiChpGeyYiiIxzTWQExXIG8WB3G7M332ms/GHYWyfz
 vYOzI4ldl2bEOnw0hepNGSslSyGt2Kj27hUSC1tY44TzOa6Set0VCfKXUaXB0I2p4U73
 hxUxKQCMVQ3zLktrQCDONKanxlcfbFuHRGTu1SvgLHTKNXPQqtN7ocHnHo4jc9tVD5w1
 ZFw0VrLOlimyoLu4H8mfo1mD174cHfYNdSajDGKe71KoWvGl7KS3jj03WJ9CTZZFhxkB
 2cC7I6ASLA/yJ7peSOro5c41jOots8d82OE1feStmUdOycxXRPjG3kxh42nYIbbX/CJx iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a76d7ayq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 15:54:14 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 173JYLRI064938;
 Tue, 3 Aug 2021 15:54:14 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a76d7aypm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 15:54:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173JqFhX009383;
 Tue, 3 Aug 2021 19:54:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3a4x58yv41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 19:54:12 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 173JpFDO16253306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 19:51:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B2CAA4082;
 Tue,  3 Aug 2021 19:54:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33B8BA4053;
 Tue,  3 Aug 2021 19:54:07 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 19:54:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg/user-exec: Fix read-modify-write of code on s390
 hosts
Date: Tue,  3 Aug 2021 21:54:06 +0200
Message-Id: <20210803195406.149446-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yOj-M-feXQyPEk2vdBMftZ8vWrYEINRk
X-Proofpoint-GUID: 1CEKD8pKxepKtJrfilhA7PneipQIGWgZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

x86_64 dotnet/runtime uses cmpxchg for code patching. When running it
under s390x qemu-linux user, cpu_signal_handler() does not recognize
this as a write and does not restore PAGE_WRITE cleared by
tb_page_add(), incorrectly forwarding the signal to the guest code.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/user-exec.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 90d1a2d327..587a0f1ef9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -681,17 +681,24 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     pc = uc->uc_mcontext.psw.addr;
 
     /* ??? On linux, the non-rt signal handler has 4 (!) arguments instead
-       of the normal 2 arguments.  The 3rd argument contains the "int_code"
-       from the hardware which does in fact contain the is_write value.
+       of the normal 2 arguments.  The 4th argument contains the "Translation-
+       Exception Identification for DAT Exceptions" from the hardware (aka
+       "int_parm_long"), which does in fact contain the is_write value.
        The rt signal handler, as far as I can tell, does not give this value
-       at all.  Not that we could get to it from here even if it were.  */
-    /* ??? This is not even close to complete, since it ignores all
-       of the read-modify-write instructions.  */
+       at all.  Not that we could get to it from here even if it were.
+       So fall back to parsing instructions.  Treat read-modify-write ones as
+       writes, which is not fully correct, but for tracking self-modifying code
+       this is better than treating them as reads.  Checking si_addr page flags
+       might be a viable improvement, albeit a racy one.  */
+    /* ??? This is not even close to complete.  */
     pinsn = (uint16_t *)pc;
     switch (pinsn[0] >> 8) {
     case 0x50: /* ST */
     case 0x42: /* STC */
     case 0x40: /* STH */
+    case 0xba: /* CS */
+    case 0xbb: /* CDS */
+    case 0xc8: /* CSST */
         is_write = 1;
         break;
     case 0xc4: /* RIL format insns */
@@ -715,7 +722,27 @@ int cpu_signal_handler(int host_signum, void *pinfo,
             is_write = 1;
         }
         break;
+    case 0xeb: /* RSY format insns */
+        switch (pinsn[2] & 0xff) {
+        case 0x14: /* CSY */
+        case 0x30: /* CSG */
+        case 0x31: /* CDSY */
+        case 0x3e: /* CDSG */
+        case 0xe4: /* LANG */
+        case 0xe6: /* LAOG */
+        case 0xe7: /* LAXG */
+        case 0xe8: /* LAAG */
+        case 0xea: /* LAALG */
+        case 0xf4: /* LAN */
+        case 0xf6: /* LAO */
+        case 0xf7: /* LAX */
+        case 0xfa: /* LAAL */
+        case 0xf8: /* LAA */
+            is_write = 1;
+        }
+        break;
     }
+
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
-- 
2.31.1


