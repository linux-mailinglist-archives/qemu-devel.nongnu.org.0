Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE544C250
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:44:13 +0100 (CET)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkntc-0004gk-5J
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlr-0005Rx-Jx
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mknlp-0002d0-Gt
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:36:11 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AADHcIC024078
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 13:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=OLt+vjjnqx5okXEefKu0ueaJtHOlgKta5HMpdqVxFHA=;
 b=mMF7duL4vNW6wCVvSSn3XdWgpvBRBanyXXXLLmAeihAyjZXUiY26PWrs/9KorYyosj8A
 FIdVWvvpSLtWWhtnBMGGN6ZbzlPTraEvNKkgjAIwS5SBD2qNnfe6ff5m6Hf5dFz1be6l
 gZhrQ1C46FgVz6d+VSRHy45XLuU2tZtvEoX5OUaIFBVEwPQQC0eD5yBJLM40mBj/+A/6
 5N6YbIagCvKs4WEu4mbS4kXsMh3Y2W16bicVXRNR4+cTjbgQun82TmL6pK8IsyvZN448
 apbHL4CMfSvhyxfyB+obCpbahyqsvbCt3qJFcOZC0cAmGRpeGgPUaAIDKc2l3V6BZNAy SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8eubrgmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 13:36:06 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AADIK2P027860
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 13:36:06 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8eubrgkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:06 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AADZ2tL020622;
 Wed, 10 Nov 2021 13:36:05 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3c5hbbupas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 13:36:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AADa39323396730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 13:36:03 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEE36112065;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A841A112064;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
Received: from sbct-2.pok.ibm.com (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Nov 2021 13:36:03 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] tpm: Add missing ACPI device identification objects
Date: Wed, 10 Nov 2021 08:35:56 -0500
Message-Id: <20211110133559.3370990-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BRkxFdST5V6x6VXRnc8KdScxzn5RvHTH
X-Proofpoint-ORIG-GUID: Q5aV77irbXTigGzMljaFQ2PEhfsKTgh_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_04,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=936
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100071
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


