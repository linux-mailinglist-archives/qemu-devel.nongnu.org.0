Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6546D93A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 18:06:50 +0100 (CET)
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv0P2-0006mf-8l
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 12:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0Iy-0005vW-L9; Wed, 08 Dec 2021 12:00:33 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:10456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mv0In-0001ud-N6; Wed, 08 Dec 2021 12:00:32 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GMTpB004161; 
 Wed, 8 Dec 2021 17:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=A5JwnOGwJJACVYdKGlQumjwjEEYfPPQ2LFYUI1xMPU0=;
 b=PJFFOtUu6jHJnM+Lxo6wMPVXGzs8SDY1K6XkLfcXysGt/MktBJBrbq8DpSdm9snoay2R
 6uVAKv2yZHL4pPhPN5O47XpTcs3iDYjOjrgyIwxWyGFL/PnxMwogVb+hyKGKWdEK2Rvc
 jAJqsQgmr0FrBpTxpOmkd8DkABnl4rhGFHnvm2xS4Qn4DM9Z+7U3VCQ00PuxwRDS3fP0
 gR3dW+vQknuijL0wr1GhdvZcCcY5ZPKT8yqFfQVYei7xA0S8urIFn8WePmRKzdoiY+T2
 IB0FQ3eG9JjL/teLwqY8bDc8Sy1fFpFTUR+KFwzq8ktYcfNH2TGtqzcA17H1jhfu9byU TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu05ygt1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:07 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8GinNe014171;
 Wed, 8 Dec 2021 17:00:07 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cu05ygt19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8GTVZG006016;
 Wed, 8 Dec 2021 17:00:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3cqyycs7ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 17:00:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8H04Dv33358154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 17:00:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0F60C6073;
 Wed,  8 Dec 2021 17:00:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21EEAC605A;
 Wed,  8 Dec 2021 17:00:03 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.76.184])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 17:00:02 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/3] docs: rSTify ppc-spapr-hcalls.txt
Date: Wed,  8 Dec 2021 13:59:16 -0300
Message-Id: <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638982480.git.lagarcia@br.ibm.com>
References: <cover.1638982480.git.lagarcia@br.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xjv0YPqwnw9gGnxiSsTBYC5xcKi54hr3
X-Proofpoint-GUID: L2d8hZdWXYjCq8lvlyWv5nRgv8mCJWex
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080097
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, qemu-devel@nongnu.org, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/ppc-spapr-hcalls.txt | 92 ++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.txt
index 93fe3da91b..c69dae535b 100644
--- a/docs/specs/ppc-spapr-hcalls.txt
+++ b/docs/specs/ppc-spapr-hcalls.txt
@@ -1,9 +1,15 @@
-When used with the "pseries" machine type, QEMU-system-ppc64 implements
-a set of hypervisor calls using a subset of the server "PAPR" specification
-(IBM internal at this point), which is also what IBM's proprietary hypervisor
-adheres too.
+sPAPR hypervisor calls
+----------------------
 
-The subset is selected based on the requirements of Linux as a guest.
+When used with the ``pseries`` machine type, ``qemu-system-ppc64`` implements
+a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
+Architecture Reference document (LoPAR)
+<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
+This document is a subset of the Power Architecture Platform Reference (PAPR+)
+specification (IBM internal only), which is what PowerVM, the IBM proprietary
+hypervisor, adheres to.
+
+The subset in LoPAR is selected based on the requirements of Linux as a guest.
 
 In addition to those calls, we have added our own private hypervisor
 calls which are mostly used as a private interface between the firmware
@@ -12,13 +18,14 @@ running in the guest and QEMU.
 All those hypercalls start at hcall number 0xf000 which correspond
 to an implementation specific range in PAPR.
 
-- H_RTAS (0xf000)
+H_RTAS (0xf000)
+^^^^^^^^^^^^^^^
 
-RTAS is a set of runtime services generally provided by the firmware
-inside the guest to the operating system. It predates the existence
-of hypervisors (it was originally an extension to Open Firmware) and
-is still used by PAPR to provide various services that aren't performance
-sensitive.
+RTAS stands for Run-Time Abstraction Sercies and is a set of runtime services
+generally provided by the firmware inside the guest to the operating system. It
+predates the existence of hypervisors (it was originally an extension to Open
+Firmware) and is still used by PAPR and LoPAR to provide various services that
+are not performance sensitive.
 
 We currently implement the RTAS services in QEMU itself. The actual RTAS
 "firmware" blob in the guest is a small stub of a few instructions which
@@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to pass the RTAS calls to QEMU.
 
 Arguments:
 
-  r3 : H_RTAS (0xf000)
-  r4 : Guest physical address of RTAS parameter block
+  ``r3``: ``H_RTAS (0xf000)``
+
+  ``r4``: Guest physical address of RTAS parameter block.
 
 Returns:
 
-  H_SUCCESS   : Successfully called the RTAS function (RTAS result
-                will have been stored in the parameter block)
-  H_PARAMETER : Unknown token
+  ``H_SUCCESS``: Successfully called the RTAS function (RTAS result will have
+  been stored in the parameter block).
 
-- H_LOGICAL_MEMOP (0xf001)
+  ``H_PARAMETER``: Unknown token.
 
-When the guest runs in "real mode" (in powerpc lingua this means
-with MMU disabled, ie guest effective == guest physical), it only
-has access to a subset of memory and no IOs.
+H_LOGICAL_MEMOP (0xf001)
+^^^^^^^^^^^^^^^^^^^^^^^^
 
-PAPR provides a set of hypervisor calls to perform cacheable or
+When the guest runs in "real mode" (in powerpc lingua this means with MMU
+disabled, i.e. guest effective address equals to guest physical address), it
+only has access to a subset of memory and no I/Os.
+
+PAPR and LoPAR provides a set of hypervisor calls to perform cacheable or
 non-cacheable accesses to any guest physical addresses that the
 guest can use in order to access IO devices while in real mode.
 
@@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the screen.
 
 Arguments:
 
-  r3: H_LOGICAL_MEMOP (0xf001)
-  r4: Guest physical address of destination
-  r5: Guest physical address of source
-  r6: Individual element size
-        0 = 1 byte
-        1 = 2 bytes
-        2 = 4 bytes
-        3 = 8 bytes
-  r7: Number of elements
-  r8: Operation
-        0 = copy
-        1 = xor
+  ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``
+
+  ``r4``: Guest physical address of destination.
+
+  ``r5``: Guest physical address of source.
+
+  ``r6``: Individual element size, defined by the binary logarithm of the
+  desired size. Supported values are:
+
+    ``0`` = 1 byte
+
+    ``1`` = 2 bytes
+
+    ``2`` = 4 bytes
+
+    ``3`` = 8 bytes
+
+  ``r7``: Number of elements.
+
+  ``r8``: Operation. Supported values are:
+
+    ``0``: copy
+
+    ``1``: xor
 
 Returns:
 
-  H_SUCCESS   : Success
-  H_PARAMETER : Invalid argument
+  ``H_SUCCESS``: Success.
 
+  ``H_PARAMETER``: Invalid argument.
\ No newline at end of file
-- 
2.33.1


