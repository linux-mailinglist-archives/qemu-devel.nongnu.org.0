Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B3D3B86A2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:57:58 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycb7-0005HF-C3
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHU-0005Rx-AK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:40 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62838
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHL-0008CM-CA
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:40 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UFX4Wi131224
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0fXgncAbR1vdCC6BsuqhbJ89iytgfr9NpJRhojh/9Yo=;
 b=N++waMWYfN5npXZU4NFk3AHxexCRk9ZKXUI7oyela0F6us6cL/rW0CRytRUXwY4m1de4
 LPeVOUNmhRZFWYEnlwWgZrKhWdrUWqk5UGdZETwbDDeAp+CaDgNKCCCWk4Llc2Y1Wtsg
 5MyE80PurLyFuJo+vyiBs1YOkcQ7lxhmlj20Pmp1cZvtj/oGbnvZGFmNlAPv9tFet5sX
 Ufe+r43ibOO0WIcDAE0eOokq0auMS+4IJkdoFhMoM7o/CEOwSHR6FEiRgVZbxZ2ULkOO
 4mZvWS9nR/UamX6Z7lHwblriaav2insXbdCXTWUJanXBreSXo1jJPhYpdVaea7ACVGdY cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gubsr4m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UFYGov135814
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:28 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39gubsr4k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:37:28 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UFX0qh030001;
 Wed, 30 Jun 2021 15:37:26 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 39duvdrkk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:37:26 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UFbPDi30671288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 15:37:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7061AAE097;
 Wed, 30 Jun 2021 15:37:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FB30AE099;
 Wed, 30 Jun 2021 15:37:25 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 15:37:25 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH 7/7] tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs
Date: Wed, 30 Jun 2021 11:37:23 -0400
Message-Id: <20210630153723.672473-8-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 753263-abIFRCXAlDOenInrgoFQYbix9
X-Proofpoint-GUID: 1yAQbE71r2aFjxD2hLT8pp8olGHa4NwN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300092
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TCPA.tis.tpm12 file contains the following:

[000h 0000   4]                    Signature : "TCPA"    [Trusted Computing Platform Alliance table]
[004h 0004   4]                 Table Length : 00000032
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : 32
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]               Platform Class : 0000
[026h 0038   4]         Min Event Log Length : 00010000
[02Ah 0042   8]            Event Log Address : 0000000007FF0000

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8465 bytes
 tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4178162b0b20b2a4a391daa73264963c28a99a3a 100644
GIT binary patch
literal 8465
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
HnFIEJ<TmVT

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/TCPA.tis.tpm12 b/tests/data/acpi/q35/TCPA.tis.tpm12
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a56961b413e7715b3d60f9836d1c8f2f4c7347cb 100644
GIT binary patch
literal 50
qcmWG>4sbMLU|?V}a`Jcf2v%^42yj*a0!E-1hz+7a07U<12eAOxRtEt9

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index fb093b32b9..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/TCPA.tis.tpm12",
-- 
2.31.1


