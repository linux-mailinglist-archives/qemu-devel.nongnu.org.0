Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2766D47B112
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:28:46 +0100 (CET)
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLWm-0005w9-44
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:28:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mzK2v-0003ro-B4
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:53:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mzK28-0005qS-F2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 09:53:42 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BK7wVVs002977; 
 Mon, 20 Dec 2021 10:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=SCxUb+J3F8OAoweYXMcojIRm9Xmeg0cmsT0T2lIJnjw=;
 b=iFMsjDZkQK0cpYDOHKETBUzXdWdUJuzNDFtyWaCHSmYkqjI1AhZVuqnstc/gzPtfOtAY
 KfQSN46LsTObMyKErksFXAyWsWEbVtFAvmzUnNiBXFLyFSP9i6aUGT75quR2uBnHco/E
 LZws/yKMj7goY+CYCjuMCT+RuEuCk5b39vgWxEo9lOToBlrJflMvRy67fJ/dpiYSxBwO
 mNbUju++ExsDIJ6zpA/dkMp20AxOEUK3HQS7lrRmChsoB7UkCQwg17eFkRYXuZiJSyBm
 U1wW6g6Q2gGkgSvDSxWEs/wwPkMydr0/4h6szo7tPMOUoKrTMe+AuqV59iZOL/g0HSJq aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s7q163t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:42:42 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BKAggQ5013124;
 Mon, 20 Dec 2021 10:42:42 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d1s7q1638-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:42:42 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BKA5KRq023255;
 Mon, 20 Dec 2021 10:42:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3d1799j929-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 10:42:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BKAgT9I31981924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Dec 2021 10:42:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D8B2BE051;
 Mon, 20 Dec 2021 10:42:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E222ABE054;
 Mon, 20 Dec 2021 10:42:28 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Dec 2021 10:42:28 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Date: Mon, 20 Dec 2021 10:42:24 +0000
Message-Id: <20211220104224.143961-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dNa96YByUnGZxDfS_ZaZip4FlDeet92E
X-Proofpoint-ORIG-GUID: si2VcDXeOLMqXyzJB7DhdLa9QVl7NN7t
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112200059
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a section explaining how the Guest Owner should calculate the
expected guest launch measurement for SEV and SEV-ES.

Also update the name and link to the SEV API Spec document.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>

---

v2:
- Explain that firmware must be built without NVRAM store.
---
 docs/amd-memory-encryption.txt | 52 +++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
index ffca382b5f..fcb712ee90 100644
--- a/docs/amd-memory-encryption.txt
+++ b/docs/amd-memory-encryption.txt
@@ -43,7 +43,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
 but should not modify it (any modification of the policy bits will result
 in bad measurement). The guest policy is a 4-byte data structure containing
 several flags that restricts what can be done on a running SEV guest.
-See KM Spec section 3 and 6.2 for more details.
+See SEV API Spec [1] section 3 and 6.2 for more details.
 
 The guest policy can be provided via the 'policy' property (see below)
 
@@ -88,7 +88,7 @@ expects.
 LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
+See SEV API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
 complete flow chart.
 
 To launch a SEV guest
@@ -113,6 +113,47 @@ a SEV-ES guest:
  - Requires in-kernel irqchip - the burden is placed on the hypervisor to
    manage booting APs.
 
+Calculating expected guest launch measurement
+---------------------------------------------
+In order to verify the guest launch measurement, The Guest Owner must compute
+it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec [1]
+section 6.5.1 describes the AMD-SP operations:
+
+    GCTX.LD is finalized, producing the hash digest of all plaintext data
+    imported into the guest.
+
+    The launch measurement is calculated as:
+
+    HMAC(0x04 || API_MAJOR || API_MINOR || BUILD || GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
+
+    where "||" represents concatenation.
+
+The values of API_MAJOR, API_MINOR, BUILD, and GCTX.POLICY can be obtained
+from the 'query-sev' qmp command.
+
+The value of MNONCE is part of the response of 'query-sev-launch-measure': it
+is the last 16 bytes of the base64-decoded data field (see SEV API Spec [1]
+section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
+
+The value of GCTX.LD is SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob),
+where:
+
+* firmware_blob is the content of the entire firmware flash file (for example,
+  OVMF.fd).  Note that you must build a stateless firmware file which doesn't
+  use an NVRAM store, because the NVRAM area is not measured, and therefore it
+  is not secure to use a firmware which uses state from an NVRAM store.
+* if kernel is used, and kernel-hashes=on, then kernel_hashes_blob is the
+  content of PaddedSevHashTable (including the zero padding), which itself
+  includes the hashes of kernel, initrd, and cmdline that are passed to the
+  guest.  The PaddedSevHashTable struct is defined in target/i386/sev.c .
+* if SEV-ES is enabled (policy & 0x4 != 0), vmsas_blob is the concatenation of
+  all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long; its content is
+  defined inside Linux kernel code as struct vmcb_save_area, or in AMD APM
+  Volume 2 [2] Table B-2: VMCB Layout, State Save Area.
+
+If kernel hashes are not used, or SEV-ES is disabled, use empty blobs for
+kernel_hashes_blob and vmsas_blob as needed.
+
 Debugging
 -----------
 Since the memory contents of a SEV guest are encrypted, hypervisor access to
@@ -134,8 +175,11 @@ References
 AMD Memory Encryption whitepaper:
 https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
 
-Secure Encrypted Virtualization Key Management:
-[1] http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf
+Secure Encrypted Virtualization API:
+[1] https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf
+
+AMD64 Architecture Programmer's Manual Volume 2: System Programming
+[2] https://www.amd.com/system/files/TechDocs/24593.pdf
 
 KVM Forum slides:
 http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf

base-commit: 212a33d3b0c65ae2583bb1d06cb140cd0890894c
-- 
2.25.1


