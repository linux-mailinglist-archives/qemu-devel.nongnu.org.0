Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B7C519F26
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:22:46 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmE1j-00021y-4J
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmDUe-0006E6-8y; Wed, 04 May 2022 07:48:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmDUc-0006g7-Fe; Wed, 04 May 2022 07:48:31 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244Bc7ei011970;
 Wed, 4 May 2022 11:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=RUeSHhbUgUfo46KCEyXZizyqFvSdKTR6hRvbE0qkfO8=;
 b=M3xHl82GD9KrnoQ81QTj1jl8I1a/psFQYwJ33O0l1gb773eo/TrVlkDkVmdpTSu57wGR
 sPKZE7Sh03VZzwmPvvnpiFp39hglc7tlFHSsB56gPS4rpFmRd8VD6puUVvlBZG53LU1k
 Rgh8dgb6ktlzamAUmtJ/CbX0HAPZom8olAisCPEEG7AQFBZKruF2rN7L/x0mMePnfeiX
 m8dvquG3hgn/P+Tiu3lMEjsXR5eU0aQF1zcZxx5dSuLgipwS+u7ZmtLO0D/Hu6OGcgSh
 s2RWlDmnvdm0QlW1Letw6LWzQOJYkrd3fuiyhtCWtr3X+YhG3qm4eaZFURXo+r2LKQOE pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3furmc08c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:48:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 244BeRJ3017227;
 Wed, 4 May 2022 11:48:27 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3furmc08bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:48:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244BgX9j005725;
 Wed, 4 May 2022 11:48:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3fttcj1qrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:48:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 244BmLi841288060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 11:48:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4045C4C044;
 Wed,  4 May 2022 11:48:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C63D24C046;
 Wed,  4 May 2022 11:48:20 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.50.79])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 May 2022 11:48:20 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user/host/s390: Treat EX and EXRL as writes
Date: Wed,  4 May 2022 13:48:19 +0200
Message-Id: <20220504114819.1729737-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 93BDZSW-rGO7QIsjNGMW5paUix6HgKiJ
X-Proofpoint-ORIG-GUID: 5nFCX-oXsjDWqKZF4Zx11igj53DGopvC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_03,2022-05-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040076
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clang-built s390x branch-relative-long test fails on clang-built s390x
QEMU due to the following sequence of events:

- The test zeroes out a code page, clang generates exrl+xc for this.

- do_helper_xc() is called. Clang generates exrl+xc there as well.

- Since there already exists a TB for the code in question, its page is
  read-only and SIGSEGV is raised.

- host_signal_handler() calls host_signal_write() and the latter does
  not recognize exrl as a write. Therefore page_unprotect() is not
  called and the signal is forwarded to the test.

Fix by treating EXRL (and EX, just in case) as writes. There may be
false positives, but they will lead only to an extra page_unprotect()
call.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/include/host/s390/host-signal.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index 6f191e64d7..25fefa00bd 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -50,6 +50,7 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
     case 0x50: /* ST */
     case 0x42: /* STC */
     case 0x40: /* STH */
+    case 0x44: /* EX */
     case 0xba: /* CS */
     case 0xbb: /* CDS */
         return true;
@@ -61,6 +62,12 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
             return true;
         }
         break;
+    case 0xc6: /* RIL-b format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x0: /* EXRL */
+            return true;
+        }
+        break;
     case 0xc8: /* SSF format insns */
         switch (pinsn[0] & 0xf) {
         case 0x2: /* CSST */
-- 
2.35.1


