Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC63A4C1E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 03:27:17 +0200 (CEST)
Received: from localhost ([::1]:49018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrsQe-0000GA-Jc
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 21:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsLB-0003Mm-19
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lrsL6-0004mJ-GX
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 21:21:36 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15C12hTM063433
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=C7eJmrg7kCra7xJJzPgvQODsKeZDQkYne05TnjXsqao=;
 b=kcxn94MCQpbjcCqkzs3AC+O2D651J6D6G4TMSgam2Hkany1n/KYUhPnbgfdGfCuLI8L0
 kULxv22z6j1PJWlcY8aKLMuzR7a0lBdmoAMqt0zDKcPU9qOBbcgDdSdH9QIhVlrlNLFW
 EmKKcbuA+NHYN+KAsvhviOpQB6BdD3fQa0v+kCTwMExQFADLpkwXSe8ZAxtuQonzmIYz
 tjhuZjpplZwwV2pXvl8ErHb0nG6dOuvLohjP9n5sHPShLLTCJzTwViOwEZvIXlHdnbbt
 0NIkzsXTWVftfqv8j7EEnFSMPirzJCopUS9uMsocsP700CvLZEIpFY+1x+ei4y/A9lIG jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394jc8gu04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15C1GqGv106710
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 21:21:30 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394jc8gtyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 21:21:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15C1Bnvs005052;
 Sat, 12 Jun 2021 01:21:29 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 393ccmarfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Jun 2021 01:21:29 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15C1LScS29884890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Jun 2021 01:21:28 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0E9F112067;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAAD1112064;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 12 Jun 2021 01:21:28 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: armbru@redhat.com, qemu-devel@nongnu.org
Subject: [RFC PATCH V1 0/3] tpm: Eliminate TPM related code if CONFIG_TPM is
 not set
Date: Fri, 11 Jun 2021 21:20:59 -0400
Message-Id: <20210612012102.1820063-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R3NADBPwmegmK5mvSrUfdxc0e0f1DsPI
X-Proofpoint-GUID: FeuHroSvJBZrd60PE9vaD2xXzkhIFYui
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=911 adultscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106120006
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches entirely elimiante TPM related code if CONFIG_TPM
is not set.

  Stefan

Stefan Berger (3):
  acpi: Eliminate all TPM related code if CONFIG_TPM is not set
  arm: Eliminate all TPM related code if CONFIG_TPM is not set
  sysemu: Make TPM structures inaccessible if CONFIG_TPM is not defined

 hw/acpi/aml-build.c          |  2 ++
 hw/arm/sysbus-fdt.c          |  4 ++++
 hw/arm/virt-acpi-build.c     |  6 ++++++
 hw/arm/virt.c                |  2 ++
 hw/i386/acpi-build.c         | 20 ++++++++++++++++++++
 include/hw/acpi/tpm.h        |  4 ++++
 include/sysemu/tpm.h         |  6 +++++-
 include/sysemu/tpm_backend.h |  6 +++++-
 stubs/tpm.c                  |  4 ----
 9 files changed, 48 insertions(+), 6 deletions(-)

-- 
2.31.1


