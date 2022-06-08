Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E67542F64
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:42:35 +0200 (CEST)
Received: from localhost ([::1]:38302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyu4y-0000KG-Cm
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nytwM-0006jG-Ev; Wed, 08 Jun 2022 07:33:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nytwI-0003Xm-EY; Wed, 08 Jun 2022 07:33:33 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258BXQ7Q007317;
 Wed, 8 Jun 2022 11:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fLivfP9V/utToS+WOT0UQo/TaP6znGXgfyMMVmyh41I=;
 b=WKILsziVG9ZwkBvfZZROMpna1qBficvyaoDqhGRrVMsD0shPrGj/A3E2pxNoDuLEifI8
 DFH7cD/F3H/vnkZ8o0vEcUMaIZBUHryyfyHjAHpMSf7d6Mb5UghMF6vl/RfL34c9NsRp
 BF4KtM7PJYtAkP8ZwJOQcTXwHaX+egVlq5KfMfMSVnzhHP4MsI/UduZU7QN+eY2YLPQC
 l4N2OYyLlsaGGC8zqu3DvLpQMhn+dlDacVWMrUKlDZHY+RgTzzThm/Ak3EovkHwxTGv9
 9qdn2KT+4T/jl5Evlg9L3CM1vCJdPtW/YSCMu9qljjrcqmXqBC9Is9Py98AXn36M4Hx+ Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjtqb8a8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 11:33:26 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 258BXPbd007196;
 Wed, 8 Jun 2022 11:33:25 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjtqb8a6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 11:33:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 258BLLRX013765;
 Wed, 8 Jun 2022 11:33:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3gfy19tvye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 11:33:14 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 258BXDsD15598008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jun 2022 11:33:13 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F48913604F;
 Wed,  8 Jun 2022 11:33:13 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA6E0136055;
 Wed,  8 Jun 2022 11:33:12 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jun 2022 11:33:12 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, gerd@kraxel.org
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] edk2: Use TPM2_ENABLE and TPM2_CONFIG_ENABLE for newer edk2
Date: Wed,  8 Jun 2022 07:33:11 -0400
Message-Id: <20220608113311.2144610-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Nk3siXOd97uE_8cf-rbih6FJvlE_4-ZC
X-Proofpoint-ORIG-GUID: 0YU5nVHOFsqpQ8zc5-MhGfZgAOCRlqxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_03,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=857 adultscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206080049
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Recent changes to edk2 switched the x86_64 build from using TPM_ENABLE
to TPM2_ENABLE and TPM1_ENABLE to be similar to the ARM build. Adapt
the QEMU edk2 Makefile to build with TPM2_ENABLE. QEMU v7.0.0 had lost
the TPM 2 support in edk2 and this restores it.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
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


