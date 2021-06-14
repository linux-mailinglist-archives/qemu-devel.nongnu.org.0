Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D0D3A6EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:15:11 +0200 (CEST)
Received: from localhost ([::1]:36780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lss3C-0005as-Ht
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1o-0003dJ-KZ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lss1m-0001Jb-Gz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:13:44 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EJ3dTo112934
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=JEgjFVnQLJ6GiOQSiDv94S0NFUIezf0VCwL1aDBFRkQ=;
 b=GJKlZPeqsxcJGiRC5EGJHaaWyljEFBKOxb6AIvGoXn6jtL8ilEWJIn5hNy5s0dgtRJ/z
 yQnjJZmioGheHJDFPYzCKx0G/S4z1z/GbGJLBoi0b3X0DS6KMIes4RCjDrEv/pwkU/Li
 JeE9hadqR1xr0zQyvb4oWqTnmJboOlhdPRF6OHjJK0yVPZgsWkgmTbgLuTSQeZqrO81x
 HL07FB4+2MZP0UJgtR/SYEohgG5HgqV77o/EyL3vVATZGw06NDCtrT1oHink5Tr+0fJu
 /I4jEafXwYQeJGQD2NvBR/3Y5O7+Q/LqRaBzVqadrfv10tt8GI7bjyRSmpJLPETSd3zJ 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396cnbrrft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:40 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EJ4ShD118322
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 15:13:40 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396cnbrrfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 15:13:40 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EJ9B3b024254;
 Mon, 14 Jun 2021 19:13:39 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3954gjwd38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 19:13:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EJDcZB32178670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 19:13:38 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34DE0136063;
 Mon, 14 Jun 2021 19:13:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D37F3136055;
 Mon, 14 Jun 2021 19:13:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 19:13:37 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] tpm: Eliminate TPM related code if CONFIG_TPM is not
 set
Date: Mon, 14 Jun 2021 15:13:31 -0400
Message-Id: <20210614191335.1968807-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4HJOPuHPc-ivPP-jcV7ZCNjj8F0lAX4C
X-Proofpoint-ORIG-GUID: cCGhVUD2B7S0ZI_vc7vCJ8FvHFtp7-ga
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_12:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=853 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140121
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
Cc: philmd@redhat.com, armbru@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches entirely eliminate TPM related code if CONFIG_TPM
is not set.

  Stefan

v2:
  - top-down approach for code elimination from arch down to acpi

Stefan Berger (4):
  i386: Eliminate all TPM related code if CONFIG_TPM is not set
  arm: Eliminate all TPM related code if CONFIG_TPM is not set
  acpi: Eliminate all TPM related code if CONFIG_TPM is not set
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


