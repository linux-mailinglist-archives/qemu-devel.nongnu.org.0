Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED305440A9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 02:49:58 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz6N3-0000aa-RM
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 20:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nz6Kt-0007y5-ER; Wed, 08 Jun 2022 20:47:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50530
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nz6Kr-000155-5V; Wed, 08 Jun 2022 20:47:42 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258MxKs3017605;
 Thu, 9 Jun 2022 00:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=HTaULoLnKtg931ae3/auEYCkw/5K7jkdH5ihikneTrI=;
 b=VPw2+G5nPW6RSmucCqoXxVapnkgctv3WKRpDFTU7cctRjlOOULknHWFK9utN/zkABwii
 ienzlwf3nA64uSvxD1RK93TAj1ROGSyLDiCKNhV06U0LgOnhpNySAa7OJUi/Pn1bIXNJ
 jrTH+0lKUxILLbbYvFMdRtG114jBHA4QkIwjPHBSZ9rbu1+JybQQPLdFZL7ZNeV8Rv9o
 uVliyeQ1Dl4QCviJ49XOdFloBQBPLBNzgiqR3PoapjdK0DNA0O0oNd9PIp4UQ1Ez81NS
 X+cdiK69Q9iYQgflnm8KACDn1cf+RoYHvc1nP1CEkud/Vqv+hQF4JbMtgSxnDQ7sk+5W eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gk5211dm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:47:37 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2590aueQ029989;
 Thu, 9 Jun 2022 00:47:36 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gk5211dkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:47:36 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2590YhZ7018651;
 Thu, 9 Jun 2022 00:47:36 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3gfy19xt75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:47:36 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2590lZUc32899400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jun 2022 00:47:35 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B60BE051;
 Thu,  9 Jun 2022 00:47:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE1A3BE04F;
 Thu,  9 Jun 2022 00:47:34 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jun 2022 00:47:34 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, gerd@kraxel.org
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2] edk2: Use TPM2_ENABLE and TPM2_CONFIG_ENABLE for newer edk2
Date: Wed,  8 Jun 2022 20:47:27 -0400
Message-Id: <20220609004727.6542-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IbpDzRTdk-8u_rpFKzTmK3fNfn86oQMC
X-Proofpoint-ORIG-GUID: YbTEOz9Y4S3-Ej19k6oPVOtxOxFYtVKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090000
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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

The edk2 commit 4de8d61bcec ("OvmfPkg: rework TPM configuration") switched
the x86_64 build from using TPM_ENABLE to TPM2_ENABLE and TPM1_ENABLE to
be similar to the ARM build. Adapt the QEMU edk2 Makefile to build with
TPM2_ENABLE. QEMU v7.0.0 had lost the TPM 2 support in edk2 and this
restores it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 roms/Makefile.edk2 | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index 485f2244b1..a6eb14f215 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -101,8 +101,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE
+		-D TPM2_ENABLE
 	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-i386-secure-code.fd: submodules
@@ -113,8 +112,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE \
+		-D TPM2_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
 	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
@@ -127,8 +125,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE
+		-D TPM2_ENABLE
 	cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-x86_64-secure-code.fd: submodules
@@ -140,8 +137,7 @@ submodules:
 		-D NETWORK_IP6_ENABLE \
 		-D NETWORK_HTTP_BOOT_ENABLE \
 		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE \
+		-D TPM2_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
 	cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
-- 
2.35.3


