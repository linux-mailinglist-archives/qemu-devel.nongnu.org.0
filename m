Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C673B8684
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycUp-0002YA-JV
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHW-0005ZF-W6
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1lycHM-0008C9-5W
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:37:42 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UFYN4t062929
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=R/rFNV2AYL6hirRgXPKJyuOYU2jc6nlCdUOkq3b5bQE=;
 b=W/QCqaTsoocIgwaz28O6I7YdlC9cD2l461pfpzYCzLJRAfj2l1b5q3s/NiaZ+tO5cz0s
 ZngmXjHjqBZLNIwP8P9Sjkgr/LE2gFeFcDJ8Rgeyy6t7UgjKJXB5jmClziYAKkXVX0hc
 +tXDaXUJG0XqvKt5trgO5nzcMUwHtQ5eXBM6hU/OwGydBecn08HJF5WpcKUQgBi9BI9i
 wHKzPFVa5vlXj/q9yZ8c+mC2M2NVgZQZi5R1FQgXhba1aKpPBB8qNIlf7nIv3KV9Yf78
 FmwIS8Pyc501SqtSOOhAQltFdI5Sz7gelC2N6DlkOJ1RUH7Eu7IaAT9HXvyiCL9EJv9h Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr1syhsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:26 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UFYlJe064636
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:37:26 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gr1syhsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:37:26 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UFWx0g029919;
 Wed, 30 Jun 2021 15:37:25 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 39duvdrkjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:37:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UFbOew27853206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 15:37:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF1BEAE02D;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2031AE09E;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
Received: from sbct-3.pok.ibm.com?044watson.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 15:37:24 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Subject: [PATCH 0/7] tests: Add test cases for TPM 1.2 ACPI tables
Date: Wed, 30 Jun 2021 11:37:16 -0400
Message-Id: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3RWr4pGuGH54myvuzcxmiGnMqGxeSS2W
X-Proofpoint-ORIG-GUID: vEsvR4EAW0-vM1kgmLaIHC7T1rbFLQH8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-30,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300092
Received-SPF: none client-ip=148.163.156.1;
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
Cc: philmd@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches adds test case for TPM 1.2 ACPI tables.

  Stefan

Stefan Berger (7):
  tests: Rename TestState to TPMTestState
  tests: Add tpm_version field to TPMTestState and fill it
  tests: Add suffix tpm2 or tpm12 to ACPI table files
  test: tpm: Create TPM 1.2 response in TPM emulator
  tests: acpi: prepare for new TPM 1.2 related tables
  tests: acpi: Add test cases for TPM 1.2 with TCPA table
  tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs

 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 0 -> 8465 bytes
 .../data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
 tests/data/acpi/q35/TCPA.tis.tpm12            | Bin 0 -> 50 bytes
 .../data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
 tests/qtest/bios-tables-test.c                |  20 ++++++++++-----
 tests/qtest/tpm-crb-test.c                    |   5 ++--
 tests/qtest/tpm-emu.c                         |  24 +++++++++++++-----
 tests/qtest/tpm-emu.h                         |  11 +++++---
 tests/qtest/tpm-tis-device-test.c             |   3 ++-
 tests/qtest/tpm-tis-test.c                    |   3 ++-
 tests/qtest/tpm-tis-util.c                    |   2 +-
 11 files changed, 48 insertions(+), 20 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.tis.tpm12
 rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
 create mode 100644 tests/data/acpi/q35/TCPA.tis.tpm12
 rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)

-- 
2.31.1


