Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBAD4B9E40
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 12:03:16 +0100 (CET)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKeZ8-0005ZE-Kx
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 06:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nKeXP-0004po-DT
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:01:27 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nKeXL-0000T0-Gd
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:01:26 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H9dC2g010989; 
 Thu, 17 Feb 2022 11:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=46huDZNpXJKUHAAHmEepITUEc990bHxfVVmB91WcBlM=;
 b=SV2+8GAfu4pfuQ6/izjLzi7MnFZyNdojoi1zNedBAQeZSA1FnQPzkUUmmhL5cQ9rb7k8
 S3n89DrHwwqb+qepVD0Y1rz0XrA6Ln/93eilNXT10rWZm/Z05/J3rhfHU0uVXE6GdsUA
 NdS/8APa6M9ALBYwhAMZhVwjJ2d9EPrpmO3jv2WLEM86piCnSQOykN6AFNquSuDJgLvI
 jpH3+p3YDM183HLL20Zx5fAcIZ4C7v1JTswYXkspFJeyRS4ih1jDRDxUtkxcDnDV8ahj
 i8bUl5Xag5OoIl4WnkAwLUhq3HbF/ln1F+W6sQj8HUMiJyBE6rI5+5hPW+76bqTpbKVN 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9k5sabxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:01:12 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HAqHdd024814;
 Thu, 17 Feb 2022 11:01:12 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e9k5sabwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:01:12 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HB0FpN025989;
 Thu, 17 Feb 2022 11:01:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3e64hd46fs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:01:11 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HB19f214942692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 11:01:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F6A378082;
 Thu, 17 Feb 2022 11:01:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99BF3780AC;
 Thu, 17 Feb 2022 11:01:07 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Feb 2022 11:01:07 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] docs/system/i386: Add measurement calculation details to
 amd-memory-encryption
Date: Thu, 17 Feb 2022 11:00:59 +0000
Message-Id: <20220217110059.2320497-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X9wnSzZDG9Qc4EeV29hK5iL1vqTRdg4I
X-Proofpoint-GUID: ljyzD4Gl7RbAkcbpPJetQ5zc6atopfk5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170049
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a section explaining how the Guest Owner should calculate the
expected guest launch measurement for SEV and SEV-ES.

Also update the name and links to the SEV API Spec document.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>

---

v2:
- Explain that firmware must be built without NVRAM store.

v3:
- rstify
---
 docs/system/i386/amd-memory-encryption.rst | 54 ++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/docs/system/i386/amd-memory-encryption.rst b/docs/system/i386/amd-memory-encryption.rst
index 215946f813..dcf4add0e7 100644
--- a/docs/system/i386/amd-memory-encryption.rst
+++ b/docs/system/i386/amd-memory-encryption.rst
@@ -47,7 +47,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
 but should not modify it (any modification of the policy bits will result
 in bad measurement). The guest policy is a 4-byte data structure containing
 several flags that restricts what can be done on a running SEV guest.
-See KM Spec section 3 and 6.2 for more details.
+See SEV API Spec ([SEVAPI]_) section 3 and 6.2 for more details.
 
 The guest policy can be provided via the ``policy`` property::
 
@@ -92,7 +92,7 @@ expects.
 ``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
 context.
 
-See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A) for the
+See SEV API Spec ([SEVAPI]_) 'Launching a guest' usage flow (Appendix A) for the
 complete flow chart.
 
 To launch a SEV guest::
@@ -118,6 +118,49 @@ a SEV-ES guest:
  - Requires in-kernel irqchip - the burden is placed on the hypervisor to
    manage booting APs.
 
+Calculating expected guest launch measurement
+---------------------------------------------
+
+In order to verify the guest launch measurement, The Guest Owner must compute
+it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec
+([SEVAPI]_) section 6.5.1 describes the AMD-SP operations:
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
+from the ``query-sev`` qmp command.
+
+The value of MNONCE is part of the response of ``query-sev-launch-measure``: it
+is the last 16 bytes of the base64-decoded data field (see SEV API Spec
+([SEVAPI]_) section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
+
+The value of GCTX.LD is
+``SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob)``, where:
+
+* ``firmware_blob`` is the content of the entire firmware flash file (for
+  example, ``OVMF.fd``).  Note that you must build a stateless firmware file
+  which doesn't use an NVRAM store, because the NVRAM area is not measured, and
+  therefore it is not secure to use a firmware which uses state from an NVRAM
+  store.
+* if kernel is used, and ``kernel-hashes=on``, then ``kernel_hashes_blob`` is
+  the content of PaddedSevHashTable (including the zero padding), which itself
+  includes the hashes of kernel, initrd, and cmdline that are passed to the
+  guest.  The PaddedSevHashTable struct is defined in ``target/i386/sev.c``.
+* if SEV-ES is enabled (``policy & 0x4 != 0``), ``vmsas_blob`` is the
+  concatenation of all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long;
+  its content is defined inside Linux kernel code as ``struct vmcb_save_area``,
+  or in AMD APM Volume 2 ([APMVOL2]_) Table B-2: VMCB Layout, State Save Area.
+
+If kernel hashes are not used, or SEV-ES is disabled, use empty blobs for
+``kernel_hashes_blob`` and ``vmsas_blob`` as needed.
+
 Debugging
 ---------
 
@@ -142,8 +185,11 @@ References
 `AMD Memory Encryption whitepaper
 <https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf>`_
 
-.. [SEVKM] `Secure Encrypted Virtualization Key Management
-   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf>`_
+.. [SEVAPI] `Secure Encrypted Virtualization API
+   <https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf>`_
+
+.. [APMVOL2] `AMD64 Architecture Programmer's Manual Volume 2: System Programming
+   <https://www.amd.com/system/files/TechDocs/24593.pdf>`_
 
 KVM Forum slides:
 

base-commit: c13b8e9973635f34f3ce4356af27a311c993729c
-- 
2.25.1


