Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502374910A0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:23:11 +0100 (CET)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Xaw-0005cp-Eh
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:23:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXW-0003Ga-1m; Mon, 17 Jan 2022 14:19:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37910
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXU-00028Y-6v; Mon, 17 Jan 2022 14:19:37 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HGRW6X017139; 
 Mon, 17 Jan 2022 19:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=W2yXhSaly25xuC9i/dl+THdDSdXMPSvwxetWntpy1LM=;
 b=nCc7QP0dazpJ81lk26AFLR3Jljdk8bE3d9jvslI9MRSKxolgx46rKF/ce2CbcO0cutan
 tvqtA7wyfWnlCj97Q9TcsiOf06ur0DXLAubj1igNaycpBzacvd4zPCoNKOrb3jiF3FoM
 IYEX4SglXBKMbR7aSXeE2Ln8OeBTDEB3qVuQRTXOXP7kDGZyBaVGCatMQmF7/QxZFZ/V
 pgX9gX5E5w28qOdAQPVBP4yYdaVJYTXNVJbH+pNUgAvHYLh0nUH7MU6pwvGyNKX5mz3w
 6Qz15HnCGUJHxvzHTHNISeoeGusYY3pwG3Z+tqhZ/0G3CP1TQJI/lAv43168HQwPI1QX FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnc0ck12c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:33 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HIabMD023346;
 Mon, 17 Jan 2022 19:19:32 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnc0ck128-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:32 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HJDpuD029983;
 Mon, 17 Jan 2022 19:19:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3dknwa3asy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HJJVWB18546964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 19:19:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1293178060;
 Mon, 17 Jan 2022 19:19:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B26947805C;
 Mon, 17 Jan 2022 19:19:29 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.75.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 19:19:29 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/3] rSTify ppc-spapr-uv-hcalls.txt.
Date: Mon, 17 Jan 2022 16:19:17 -0300
Message-Id: <243a714d3861f7539d29b02a899ffc376757d668.1642446876.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642446868.git.lagarcia@br.ibm.com>
References: <cover.1642446868.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6XnaKonFNgcZVqsKmeoUg1SFSx6z9cqD
X-Proofpoint-ORIG-GUID: bqsXKsrlN8XCbWKcRRXHU7ANPnwEllX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201170119
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/ppc-spapr-uv-hcalls.txt | 165 ++++++++++++++++-------------
 1 file changed, 89 insertions(+), 76 deletions(-)

diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv-hcalls.txt
index 389c2740d7..a00288deb3 100644
--- a/docs/specs/ppc-spapr-uv-hcalls.txt
+++ b/docs/specs/ppc-spapr-uv-hcalls.txt
@@ -1,76 +1,89 @@
-On PPC64 systems supporting Protected Execution Facility (PEF), system
-memory can be placed in a secured region where only an "ultravisor"
-running in firmware can provide to access it. pseries guests on such
-systems can communicate with the ultravisor (via ultracalls) to switch to a
-secure VM mode (SVM) where the guest's memory is relocated to this secured
-region, making its memory inaccessible to normal processes/guests running on
-the host.
-
-The various ultracalls/hypercalls relating to SVM mode are currently
-only documented internally, but are planned for direct inclusion into the
-public OpenPOWER version of the PAPR specification (LoPAPR/LoPAR). An internal
-ACR has been filed to reserve a hypercall number range specific to this
-use-case to avoid any future conflicts with the internally-maintained PAPR
-specification. This document summarizes some of these details as they relate
-to QEMU.
-
-== hypercalls needed by the ultravisor ==
-
-Switching to SVM mode involves a number of hcalls issued by the ultravisor
-to the hypervisor to orchestrate the movement of guest memory to secure
-memory and various other aspects SVM mode. Numbers are assigned for these
-hcalls within the reserved range 0xEF00-0xEF80. The below documents the
-hcalls relevant to QEMU.
-
-- H_TPM_COMM (0xef10)
-
-  For TPM_COMM_OP_EXECUTE operation:
-    Send a request to a TPM and receive a response, opening a new TPM session
-    if one has not already been opened.
-
-  For TPM_COMM_OP_CLOSE_SESSION operation:
-    Close the existing TPM session, if any.
-
-  Arguments:
-
-    r3 : H_TPM_COMM (0xef10)
-    r4 : TPM operation, one of:
-         TPM_COMM_OP_EXECUTE (0x1)
-         TPM_COMM_OP_CLOSE_SESSION (0x2)
-    r5 : in_buffer, guest physical address of buffer containing the request
-         - Caller may use the same address for both request and response
-    r6 : in_size, size of the in buffer
-         - Must be less than or equal to 4KB
-    r7 : out_buffer, guest physical address of buffer to store the response
-         - Caller may use the same address for both request and response
-    r8 : out_size, size of the out buffer
-         - Must be at least 4KB, as this is the maximum request/response size
-           supported by most TPM implementations, including the TPM Resource
-           Manager in the linux kernel.
-
-  Return values:
-
-    r3 : H_Success    request processed successfully
-         H_PARAMETER  invalid TPM operation
-         H_P2         in_buffer is invalid
-         H_P3         in_size is invalid
-         H_P4         out_buffer is invalid
-         H_P5         out_size is invalid
-         H_RESOURCE   problem communicating with TPM
-         H_FUNCTION   TPM access is not currently allowed/configured
-    r4 : For TPM_COMM_OP_EXECUTE, the size of the response will be stored here
-         upon success.
-
-  Use-case/notes:
-
-    SVM filesystems are encrypted using a symmetric key. This key is then
-    wrapped/encrypted using the public key of a trusted system which has the
-    private key stored in the system's TPM. An Ultravisor will use this
-    hcall to unwrap/unseal the symmetric key using the system's TPM device
-    or a TPM Resource Manager associated with the device.
-
-    The Ultravisor sets up a separate session key with the TPM in advance
-    during host system boot. All sensitive in and out values will be
-    encrypted using the session key. Though the hypervisor will see the 'in'
-    and 'out' buffers in raw form, any sensitive contents will generally be
-    encrypted using this session key.
+===================================
+Hypervisor calls and the Ultravisor
+===================================
+
+On PPC64 systems supporting Protected Execution Facility (PEF), system memory
+can be placed in a secured region where only an ultravisor running in firmware
+can provide access to. pSeries guests on such systems can communicate with
+the ultravisor (via ultracalls) to switch to a secure virtual machine (SVM) mode
+where the guest's memory is relocated to this secured region, making its memory
+inaccessible to normal processes/guests running on the host.
+
+The various ultracalls/hypercalls relating to SVM mode are currently only
+documented internally, but are planned for direct inclusion into the Linux on
+Power Architecture Reference document ([LoPAR]_). An internal ACR has been filed
+to reserve a hypercall number range specific to this use case to avoid any
+future conflicts with the IBM internally maintained Power Architecture Platform
+Reference (PAPR+) documentation specification. This document summarizes some of
+these details as they relate to QEMU.
+
+Hypercalls needed by the ultravisor
+===================================
+
+Switching to SVM mode involves a number of hcalls issued by the ultravisor to
+the hypervisor to orchestrate the movement of guest memory to secure memory and
+various other aspects of the SVM mode. Numbers are assigned for these hcalls
+within the reserved range ``0xEF00-0xEF80``. The below documents the hcalls
+relevant to QEMU.
+
+``H_TPM_COMM`` (``0xef10``)
+---------------------------
+
+SVM file systems are encrypted using a symmetric key. This key is then
+wrapped/encrypted using the public key of a trusted system which has the private
+key stored in the system's TPM. An Ultravisor will use this hcall to
+unwrap/unseal the symmetric key using the system's TPM device or a TPM Resource
+Manager associated with the device.
+
+The Ultravisor sets up a separate session key with the TPM in advance during
+host system boot. All sensitive in and out values will be encrypted using the
+session key. Though the hypervisor will see the in and out buffers in raw form,
+any sensitive contents will generally be encrypted using this session key.
+
+Arguments:
+
+  ``r3``: ``H_TPM_COMM`` (``0xef10``)
+
+  ``r4``: ``TPM`` operation, one of:
+
+    ``TPM_COMM_OP_EXECUTE`` (``0x1``): send a request to a TPM and receive a
+    response, opening a new TPM session if one has not already been opened.
+
+    ``TPM_COMM_OP_CLOSE_SESSION`` (``0x2``): close the existing TPM session, if
+    any.
+
+  ``r5``: ``in_buffer``, guest physical address of buffer containing the
+  request. Caller may use the same address for both request and response.
+
+  ``r6``: ``in_size``, size of the in buffer. Must be less than or equal to
+  4 KB.
+
+  ``r7``: ``out_buffer``, guest physical address of buffer to store the
+  response. Caller may use the same address for both request and response.
+
+  ``r8``: ``out_size``, size of the out buffer. Must be at least 4 KB, as this
+  is the maximum request/response size supported by most TPM implementations,
+  including the TPM Resource Manager in the linux kernel.
+
+Return values:
+
+  ``r3``: one of the following values:
+
+    ``H_Success``: request processed successfully.
+
+    ``H_PARAMETER``: invalid TPM operation.
+
+    ``H_P2``: ``in_buffer`` is invalid.
+
+    ``H_P3``: ``in_size`` is invalid.
+
+    ``H_P4``: ``out_buffer`` is invalid.
+
+    ``H_P5``: ``out_size`` is invalid.
+
+    ``H_RESOURCE``: problem communicating with TPM.
+
+    ``H_FUNCTION``: TPM access is not currently allowed/configured.
+
+    ``r4``: For ``TPM_COMM_OP_EXECUTE``, the size of the response will be stored
+    here upon success.
-- 
2.34.1


