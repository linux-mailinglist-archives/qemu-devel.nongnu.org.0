Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA63DF7B4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 00:18:19 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB2jp-0004AL-Jt
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 18:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mB2i1-0003Ju-HK
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:16:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mB2hx-0007eG-Uq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:16:25 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173M3eGl098239; Tue, 3 Aug 2021 18:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=DeKEumd4u0rAOcS9tPdr2QSf68+OqRG6uG4d9UJEEws=;
 b=pXjzi1kSg34Ybyco0mQgsQN/P0aPvhWZfWun75+CQN1ka5cBseQcXLyuMmbb4N/EUNhP
 lBMCpkvcei+Favrhh7WGsj/7gNt1oBeNNLsb3OehHpOWWA8XnE/z9CP7L8us30o+L8aS
 EySUZmOO/Xa/NCudSkbUA1C0anIERMWNLHh70GkHIWPo/x+DJRIRJldsdd1OR6Bzu7rI
 42JMENBHvoKwreufF1MFCouSiqi3jo2j61uJfeJrROipv3b0mfYWFKe/zQIRDTMzeo1I
 jFkfKTnE5jlOEvyh2n+4YofUZXoMIHrjroLzd5oIOHdALfp/aKHnugcS71+C6JU44EgS 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733jdf0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 18:16:14 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 173M4J99103300;
 Tue, 3 Aug 2021 18:16:14 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733jdf00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 18:16:13 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173LvefR014139;
 Tue, 3 Aug 2021 22:16:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3a4wshr5a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 22:16:11 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173MG8ER27918736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 22:16:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2680AAE04D;
 Tue,  3 Aug 2021 22:16:08 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0D88AE056;
 Tue,  3 Aug 2021 22:16:07 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 22:16:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] accel/tcg/user-exec: Fix read-modify-write of code on s390
 hosts
Date: Wed,  4 Aug 2021 00:16:06 +0200
Message-Id: <20210803221606.150103-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2GAZM399oFSxWv_ERcabRNw5wWNJUsNi
X-Proofpoint-GUID: haEJUWrM8uNkwAyHscWnHuer2guEw6zB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108030136
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00464.html
v1 -> v2: Fix comment style, fix CSST detection (Richard).

 accel/tcg/user-exec.c | 48 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 90d1a2d327..8fed542622 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -680,18 +680,26 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = uc->uc_mcontext.psw.addr;
 
-    /* ??? On linux, the non-rt signal handler has 4 (!) arguments instead
-       of the normal 2 arguments.  The 3rd argument contains the "int_code"
-       from the hardware which does in fact contain the is_write value.
-       The rt signal handler, as far as I can tell, does not give this value
-       at all.  Not that we could get to it from here even if it were.  */
-    /* ??? This is not even close to complete, since it ignores all
-       of the read-modify-write instructions.  */
+    /*
+     * ??? On linux, the non-rt signal handler has 4 (!) arguments instead
+     * of the normal 2 arguments.  The 4th argument contains the "Translation-
+     * Exception Identification for DAT Exceptions" from the hardware (aka
+     * "int_parm_long"), which does in fact contain the is_write value.
+     * The rt signal handler, as far as I can tell, does not give this value
+     * at all.  Not that we could get to it from here even if it were.
+     * So fall back to parsing instructions.  Treat read-modify-write ones as
+     * writes, which is not fully correct, but for tracking self-modifying code
+     * this is better than treating them as reads.  Checking si_addr page flags
+     * might be a viable improvement, albeit a racy one.
+     */
+    /* ??? This is not even close to complete.  */
     pinsn = (uint16_t *)pc;
     switch (pinsn[0] >> 8) {
     case 0x50: /* ST */
     case 0x42: /* STC */
     case 0x40: /* STH */
+    case 0xba: /* CS */
+    case 0xbb: /* CDS */
         is_write = 1;
         break;
     case 0xc4: /* RIL format insns */
@@ -702,6 +710,12 @@ int cpu_signal_handler(int host_signum, void *pinfo,
             is_write = 1;
         }
         break;
+    case 0xc8: /* SSF format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x2: /* CSST */
+            is_write = 1;
+        }
+        break;
     case 0xe3: /* RXY format insns */
         switch (pinsn[2] & 0xff) {
         case 0x50: /* STY */
@@ -715,7 +729,27 @@ int cpu_signal_handler(int host_signum, void *pinfo,
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


