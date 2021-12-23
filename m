Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5EA47DDBD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:28:44 +0100 (CET)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0DqV-0005Fy-Sa
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlL-000051-CE
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50612
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlI-0007qQ-L0
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:23 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN1CJv1032254; 
 Thu, 23 Dec 2021 02:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=47kAfJwvelEDd7f89iJjcGSGIPb8jn+fvrhRMi5OFEE=;
 b=eypsL+3rlDDWdMA5OT0dBJV+HiO2oAU1rUhTXfiEtkWtj4qZAnVSZazqJncympZEfvYE
 mYkiQRtixBAYiylGugGK/fJfH3uEcEe3ei0W8+U27rwggBE/SDZ8oe7ToQtYVuhl3LY9
 xP1/oylQpti5sb98UeA+ztIQB5SVGCujAeewIvrrNmNZjrG7rJAy/rZbgn8UdVEWtrBV
 BPhwJMiBqjtGzifKlRe4u7h3AFR9b/MUoaMDAQj+d1VeOCtctBs/lB922hN6vR6xNA0+
 bVFXykY+5a5FvYKQFMV/CPmWjKZCD90xXhpoyz2++d0L29cAEJ09IxboDZciXaDrZWhF kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4f7yh036-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:18 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN1vT9a020827;
 Thu, 23 Dec 2021 02:23:18 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4f7yh02w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:18 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN2C8Ua013135;
 Thu, 23 Dec 2021 02:23:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 3d179c58d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:17 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN2NGtI30736740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 02:23:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 787316A054;
 Thu, 23 Dec 2021 02:23:16 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10F056A05F;
 Thu, 23 Dec 2021 02:23:16 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 02:23:15 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] tests: acpi: Add updated TPM related tables
Date: Wed, 22 Dec 2021 21:23:10 -0500
Message-Id: <20211223022310.575496-4-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223022310.575496-1-stefanb@linux.ibm.com>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qO6G3Oehxb1bJxGnute9YeOOVRZLvOq8
X-Proofpoint-GUID: OvSZPgnnrXeawcUPtJVLLZ6u54unB8JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112230008
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Message-id: 20211110133559.3370990-4-stefanb@linux.ibm.com
---
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8921 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8..fb9dd1f0599afd6b555ea570ecd00a3bb227aa84 100644
GIT binary patch
delta 50
zcmdnzdc>8>CD<k8h!O(><KvB7q6(a@S~2m#PVoZ1lQk6FnOs#T7b=LdgnGI#Zf;Sq
GVgdkr91X<)

delta 45
zcmX@&y3du%CD<iopArKDqxwcJQ3Xza&6xOLr+5MP$r=joO#Uj93l&5+_b6B}0RSYz
B3@!iw

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index dcbb7f0af377425db53130e8ba1c62c09c22e006..00d732e46f5d9d056e557bd026fa30f9db3b8c30 100644
GIT binary patch
delta 70
zcmdnzdefE5CD<k8rV;}KBgaNAQ3Wn9?U?vrr+5J;?a7)7ZcJWklM5BZ#e;Z50(=#W
a^b8bSQp+-vQyDnoLp@y>H@7HQF#!OXcoHoD

delta 46
zcmccVy3du%CD<iopArKD<D-pSq6%F8nlbUgPVoZnnv*pZ+?f1TCKoD*Z(gim#smOL
C=M6sq

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


