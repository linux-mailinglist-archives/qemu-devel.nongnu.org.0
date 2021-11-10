Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99244C23E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:39:27 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknp0-0008Pa-I9
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlr-0005S0-Ka
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15378
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlp-0002cz-78
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:11 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAD3p4C008140; 
 Wed, 10 Nov 2021 13:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JIIMClVywkntsp66XtWBQyd9SNbnLzO5QIznhBMMIIg=;
 b=DNvZBXnjrRzTSMr7hkAz82ZJ31n3ZI02TTO0wVlbl9THalkvdfuud0JkMJFgXY8FXbIf
 rBzsBE86H92ahyy4Ak9fxg8md9YYyHVoMklcYxBLOjdtMlF/pnL6YjVUYfK9DWHPwjR7
 3LQaR33flb5KwhsL20LnPsyBzEbYbatbDnbymIgOrcz3XYBTbyRDx5Qn+2NYXErXxTAl
 vhP8VfMbJ4MKEvBRysc1BxaYm6Stx/T1O5DH7SgTIYCVFTfTiy5wBZFXxYAUp89LkBrH
 7M/mueTZbYSp5gZqMJdxl75MoUBkQYXq0DywYaMyy5nBUf6JBpmaPsnNOFS7Yxnau5xD 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c72v4bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:06 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AACTmt2021972;
 Wed, 10 Nov 2021 13:36:06 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8c72v4bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:06 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AADZ58d022306;
 Wed, 10 Nov 2021 13:36:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3c5hbc5fm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:05 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AADa4No983658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 13:36:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17458112069;
 Wed, 10 Nov 2021 13:36:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3032112064;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] tests: acpi: Add updated TPM related tables
Date: Wed, 10 Nov 2021 08:35:59 -0500
Message-Id: <20211110133559.3370990-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211110133559.3370990-1-stefanb@linux.ibm.com>
References: <20211110133559.3370990-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -fnhYDdArQqii8Aebfa1x05pxfX0VyVO
X-Proofpoint-GUID: 5P-4JJUbrtEzCv_hLfnxxSrjIxkFMRTx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_04,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100071
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The updated TPM related tables have the following additions:

   Device (TPM)
   {
       Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
+      Name (_UID, One)  // _UID: Unique ID
       Name (_STA, 0x0F)  // _STA: Status
       Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8921 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index c96b5277a14ae98174408d690d6e0246bd932623..dc1c990496a8fb0fc268081a54c5af363bcd833f 100644
GIT binary patch
delta 50
zcmdnzdc>8>CD<k8h!O(><D-pSq6(a@S~2m#PVoZ1lQk6FnOs#T7b=LdgnGI#Zf;Sq
GVgdkq_zlDW

delta 45
zcmX@&y3du%CD<iopArKDquNF;Q3Xza&6xOLr+5MP$r=joO#Uj93l&5+_b6B}0RSYU
B3@rcv

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index c92d4d29c79352a60974ea9f665d0b9a410a4bac..1314a5d3dad1b7b9aff782e649058873c492acb0 100644
GIT binary patch
delta 70
zcmdnzdefE5CD<k8rV;}KBl|`!Q3Wn9?U?vrr+5J;?a7)7ZcJWklM5BZ#e;Z50(=#W
a^b8bSQp+-vQyDnoLp@y>H@7HQF#!OXKoTqf

delta 46
zcmccVy3du%CD<iopArKD<HL<yq6%F8nlbUgPVoZnnv*pZ+?f1TCKoD*Z(gim#smOL
C#|=IJ

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 5d80e408d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-- 
2.31.1


