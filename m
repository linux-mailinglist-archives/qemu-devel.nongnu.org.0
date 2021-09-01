Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC493FD9CB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:36:46 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPTx-0007B9-32
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPG2-0003ye-FN
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mLPG0-00033G-EU
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:22:22 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181C2mtJ176864; Wed, 1 Sep 2021 08:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4YoURgPgK9fBFxEhpXxWMr1YNWz0wf1Vx/8K4Y4N2MM=;
 b=aRXEE0fIqwT7rfG3ilIQmkkqrIQOQwY7rjb9aAoNv9NG0ujG/vxu4m1y+n9RyXYAZVen
 lkvIFw4qdBLJvYTujVZJIysEmZMnPfo67i8NbdFst2Xi3yYi8UiCj47yQ+UJtWqtmcpq
 DLe9t6tJhaiItGR7HblUaSV1Jn4zOX3Lp/aWMB9gLErxStFNAA++SaDyuR9JwU2y6a8k
 if+bU/v9xRy0JEtYn8e1AvMFOvKeukbO09GsfO5Q/ubTYVhFF7/p5Gt3OwSFHS6YEoHU
 yOUSjxuKJYBmiaPz4hU/1rn3UBP1AOcaXqUAxrTKoG7UTZJBd/kdPn8j8CGFgO6AFESs Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3at56b7hxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 08:22:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 181C3trv181838;
 Wed, 1 Sep 2021 08:22:18 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3at56b7hx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 08:22:18 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181CChxP002099;
 Wed, 1 Sep 2021 12:22:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3aqcsd6kss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 12:22:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181CMGpp34275676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 12:22:16 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9944DBE053;
 Wed,  1 Sep 2021 12:22:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF26EBE04F;
 Wed,  1 Sep 2021 12:22:15 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Sep 2021 12:22:15 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 10/10] tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs
Date: Wed,  1 Sep 2021 08:21:43 -0400
Message-Id: <20210901122143.1867023-11-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901122143.1867023-1-stefanb@linux.ibm.com>
References: <20210901122143.1867023-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cUgVkmBikiN7Ykv94_jNSjMnfjS6y5f7
X-Proofpoint-ORIG-GUID: vG-BzrBQmlHm595yM8MBqipoPi-eECo7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_03:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
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
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210802215246.1433175-11-stefanb@linux.ibm.com
---
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8894 bytes
 tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..6735e73971c6be95deceb23051a78af6a4573bd8 100644
GIT binary patch
literal 8894
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
E0|senc>n+a

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


