Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0423C77BB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:17:59 +0200 (CEST)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Oqs-0004Pw-2I
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oou-0001Y7-9B
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:15:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1342
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1m3Oor-0004x7-IX
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:15:55 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DK3mJa140832
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HoEDlvu6512z1b5RLkb4CCBDZszek8MVwxCtktdFtNM=;
 b=P5tMu/FzmU7hXXhO+3JZiL0JLEfN0uawj8ZOSfkSKxfH8nXkOfE4BviTeJ0rtc2Hkw7T
 l8RzALtXrVylTboiLgM95BMHOaDhQiHKswsK+4Zishg7JvVX7nNtkawyr76XVrynQwno
 UDxWG+pT9nD3vuH9LBC9Of426QyAOPB5mpdZsfpJ4l/KozokRA3qHBPqwsiJnp1mX7fM
 xFayqS/PYVjptv/DvJU0I0XH5hy9jwRaTp4KwRSrnIxUuWQUMhM6DC8xF54/7a1lrNy4
 ITe15VKSzbjj83SzmYVWqLd/qTfmK5enw4CMxAU+366uwvJ3cYHhL5MXwvCXCXnTBStQ iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sde10j1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16DKASAP171358
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 16:15:52 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sde10j14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 16:15:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DKDCAY032459;
 Tue, 13 Jul 2021 20:15:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 39q36cbhsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 20:15:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DKFnks49152434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 20:15:49 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA0A978066;
 Tue, 13 Jul 2021 20:15:49 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FA3C7805C;
 Tue, 13 Jul 2021 20:15:49 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 20:15:49 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH v5 03/10] tests: acpi: Prepare for renaming of TPM2 related
 ACPI files
Date: Tue, 13 Jul 2021 16:15:38 -0400
Message-Id: <20210713201545.903754-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wfR9z70L_I6M6Nv7sZ_NTuv4xx_MIEC8
X-Proofpoint-ORIG-GUID: rSdEjTJwENKK3n5jHNBHjarKFeoGiNHc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_12:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130124
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

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/q35/DSDT.tis.tpm2           | 0
 tests/data/acpi/q35/TPM2.tis.tpm2           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm2
 create mode 100644 tests/data/acpi/q35/TPM2.tis.tpm2

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/TPM2.tis.tpm2 b/tests/data/acpi/q35/TPM2.tis.tpm2
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..b301b8fa06 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.tis.tpm2",
+"tests/data/acpi/q35/TPM2.tis.tpm2",
-- 
2.31.1


