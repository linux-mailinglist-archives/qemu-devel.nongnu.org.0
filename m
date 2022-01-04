Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD897484765
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:04:16 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4oAS-0005vi-07
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:04:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o4l-0005WZ-5N
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:58:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o4h-0002ZG-QM
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:58:21 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204GDIM5010651
 for <qemu-devel@nongnu.org>; Tue, 4 Jan 2022 17:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VmT9n5tHGTECH6siA04ksuIvQ68FxVde1oUD9Axbayo=;
 b=bcMnHF2gHnEoXtUGhzBva7j5uPQniWXkDRNJUeJWZims/aFzU3msXPm2gj0yTGbyNBmL
 9Xk15OOENdGOWnW9TDUDkRm/mOm81VCZkn8QBFvRkh7oqTU5jg2rciGekwubo3RNk5OV
 n3PvTIbQmGZawugO/LHm1nok9DNEnwYIAuHIbFcdK/++DR0azky4vIgo5p69HxDom3kC
 AKt5tudFCdLhyEtg53PXzkf6z6xajCN49kNFkq1bwrDUVFqxIyxggRGVHwsNyIwM/19s
 76OXh/Q8sNV7jxHgyVDsI5osFdHENeahsNhAQ2ozr2zo2KLO/ayl4dBBbHMvsu9+2E2L zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rde6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 17:58:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204HjTl0009408
 for <qemu-devel@nongnu.org>; Tue, 4 Jan 2022 17:58:17 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rde6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:58:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204HwCQ4023155;
 Tue, 4 Jan 2022 17:58:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 3daekakfvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:58:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204HwFVI9503518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 17:58:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5CF112405C;
 Tue,  4 Jan 2022 17:58:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF526124054;
 Tue,  4 Jan 2022 17:58:14 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 17:58:14 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/3]  tpm: Add missing ACPI device identification objects
Date: Tue,  4 Jan 2022 12:58:03 -0500
Message-Id: <20220104175806.872996-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Cxe--caKWXqbnXcmQLKJQgq1bf6iuic
X-Proofpoint-ORIG-GUID: _UME63Zbr-dbpZvJ2Z_6oApkEaKE2JvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=879
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040117
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds missing ACPI device identification objects _STR
and _UID to TPM 1.2 and TPM 2 ACPI tables.

   Stefan

v5:
 - Changed Fixes: tag to Resolves:
 - Mentioned in 2/3 that choice of uid '1' is based on inspection of hardware
   TPMs' sysfs entries

v4:
 - Rebased on current master: regenerated binaries in patch 3

v3:
 - Dropped replacement of ACPI tables with empty files in 1/3.
 - Reduced ignored files

Stefan Berger (3):
  tests: acpi: prepare for updated TPM related tables
  acpi: tpm: Add missing device identification objects
  tests: acpi: Add updated TPM related tables

 hw/arm/virt-acpi-build.c           |   1 +
 hw/i386/acpi-build.c               |   7 +++++++
 tests/data/acpi/q35/DSDT.tis.tpm12 | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2  | Bin 8894 -> 8921 bytes
 4 files changed, 8 insertions(+)

-- 
2.31.1


