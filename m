Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7FF44AF2C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:08:16 +0100 (CET)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkRnL-0002G7-Po
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:08:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRia-0004p5-0J
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:03:20 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkRiU-0005Yg-2s
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:03:19 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DpVXA028579
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 14:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=638Q9xVL9fiWlKNJ6IZNgdYE3+BNLCWWUGKoxlq2/so=;
 b=IRwj/faV0VNwVvbcXX7OsBFrxUYLpttveI9l3ryem6nDtuPppVKokweBBC1h+V6VwAKc
 M4I2KXkClgPiEcxkP4whoctYnp2hIyUPO/bT53s4mzLw454Bxfeg8RyakcoZo4MmNjNu
 dOtpFMwFJuVLgHtuR+ZBs04V5DPOc4me/ehDJ/OhTy/F/5EjocCbfUEbNfWCP8SB1Qyw
 Ftyjys7KEwneVxMwiDnenSh0Kvp7uzHrwmTHrdh0LPbXwMH5SARrpNOBmfJQRoFPJRvX
 8GUfzhlGDwc8207ivRZJsbKim+yIGr1RgJ0mg9huhEjDlQBfxAcG6z0Yv/p87ExCk8WU PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7n9cqfpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 14:03:12 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9DbI1c023883
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 14:03:12 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7n9cqfnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:03:11 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9DrO5P001233;
 Tue, 9 Nov 2021 14:03:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3c5hbb9yvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:03:10 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9E1rvD46793204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 14:01:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8438D2805A;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7711E28073;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 14:01:53 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] tpm: Add missing ACPI device identification objects
Date: Tue,  9 Nov 2021 09:01:49 -0500
Message-Id: <20211109140152.3310657-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CnEjo_PiP4GWMGuS-fcTknucESkEE9zK
X-Proofpoint-ORIG-GUID: LmB3wLHNhBv6C7VmxLvnq9U01b1eUHVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=852 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090085
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
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


