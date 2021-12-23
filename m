Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7E47DDBB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 03:27:23 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0DpC-0003ik-7j
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 21:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlK-0008Vz-8K
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49120
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n0DlI-0007q0-Ee
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 21:23:21 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BN1fjuB005990
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0b2L1nat6gG3PXmjzZpSa5TfsNVT7VauvWimKI20JLE=;
 b=hgfHdn0MjZ2ENUb3uNtjDG6cojFDChKafC7xiR/I2yX5VQ8Uw5bZCshaB8HQS3mg50Fa
 VzsuC/ItqBdntBAtG1n01KQZL3mrttzLSDGRrXej///8E9bIj3KiXApqZ8hLfbX17rfR
 KKa3+yv+rqwWloQpdO50K70cHbYm43civL9fj9JiGktsZLiy8wRrSosiDk7eX9BO2btx
 c+9u8QBlwBp8Xei046vwIoutwZBWQbaNVCFp+MSPoWUp3GoJeVYWwDMj8EDbMMo5z0lO
 Htmx2eXryFhtFsZxez1OvFjLGaAdR+154E5kMKmz3Qe3tv9+qFs5dybQm4omNy+tQmCe 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4fnwrhn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:23:17 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN2JRWs004269
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:23:17 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d4fnwrhn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:17 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN2CrAT001738;
 Thu, 23 Dec 2021 02:23:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3d179c566a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 02:23:16 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN2NEuN14484218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 02:23:14 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC6306A04D;
 Thu, 23 Dec 2021 02:23:14 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F0D16A054;
 Thu, 23 Dec 2021 02:23:14 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 02:23:14 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/3] tpm: Add missing ACPI device identification objects
Date: Wed, 22 Dec 2021 21:23:07 -0500
Message-Id: <20211223022310.575496-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0YCZk3cD0a5U2pKbm7NghVMeLKHOzfO0
X-Proofpoint-ORIG-GUID: GxHHBUsQEVBPthmzv5O62b16svCZ75uv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=769 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112230008
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds missing ACPI device identification objects _STR
and _UID to TPM 1.2 and TPM 2 ACPI tables.

   Stefan

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
 hw/i386/acpi-build.c               |   8 ++++++++
 tests/data/acpi/q35/DSDT.tis.tpm12 | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2  | Bin 8894 -> 8921 bytes
 4 files changed, 9 insertions(+)

-- 
2.31.1


