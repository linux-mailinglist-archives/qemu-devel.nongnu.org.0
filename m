Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056226536FD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 20:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p84i1-0004ud-OM; Wed, 21 Dec 2022 14:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p84hz-0004uG-D9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:24:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p84hx-0001XU-8s
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:24:55 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLJD4Qf028696; Wed, 21 Dec 2022 19:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=w5Ar8Iqp3EZHP2b25W9pZQFxl1VTaDvuFHbL2L1SWfY=;
 b=Gu7caPMCBcyv+leqrugPFAPvJud2yQfH0a1Pomq4IcB7eSNrl9Gk+pqXZu0fK2sgLH4n
 qW73iwEY91dt/4xmB+NgP0lNi1kVLy72oB5BuWmGaV6EHqz2XUpeO+ordB9IbzElNhC6
 3VmutVePQlZlqaFBUDRRr5QB5bHwSW8Cpa+wgJJ1hX89tNalEwEgzHi75mYukFI30Ckr
 0ksWlEygL3SiMAg3Bz4Cq7ubQ1zK6t9EAtrFetj8qzngXJmodpmqWZ5fhpl8uTGkbwWp
 kqwZoIXP/vqRU+VGcJ6Uhni67xxQceXbg1g1IfIfeXQ5W3HQV+WRSHOYVAeYTvYXdtDy Hg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm83ur8fv-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 19:24:50 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL5BeME012611;
 Wed, 21 Dec 2022 19:05:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3mh6yy4ade-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 19:05:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BLJ5jHY50332004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 19:05:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86D4820049;
 Wed, 21 Dec 2022 19:05:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E94B20040;
 Wed, 21 Dec 2022 19:05:45 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.46.51])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 21 Dec 2022 19:05:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RFC v2 0/1] tests: add wasmtime testsuite
Date: Wed, 21 Dec 2022 20:05:43 +0100
Message-Id: <20221221190544.311471-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yG41p6cgjcoCxz9Ft9NPWNolWfewUEDB
X-Proofpoint-GUID: yG41p6cgjcoCxz9Ft9NPWNolWfewUEDB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=753 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210162
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

I made some updates based on the feedback from Alex.

At the moment it mostly works for me on top of 6394578984da: aarch64,
riscv64 and s390x are clean, but there are some failures on x86_64.
With qemu-user vma rework it unfortunately fails in more places;
I haven't analyzed these failures yet.

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg00657.html
    https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02612.html

v1 -> v2:
* Drop gitlab jobs.
* Move to tests/third-party/.
* Use avocado. To be honest, I'm not sure how much value it brings
  here; I hoped that TAPRunner would at least print the number of
  passed tests, but it only checks whether at least one test failed).
* Add various check-* Makefile targets.
* Add json -> TAP 14 conversion.
* Add documentation.
* Move test binaries to the host system.
  This prevents unnecessary full rebuilds of the Docker image.
* Add riscv64; bump Rust and Wasmtime versions.
* Do not use docker.py; unfortunately this leads to reimplementing some
  of its features: docker command detection based on $(ENGINE) and
  injecting the current user into the image.
* Disable core dumps.

Best regards,
Ilya

Ilya Leoshkevich (1):
  tests: add wasmtime testsuite

 Makefile                                     |  1 +
 docs/devel/testing.rst                       |  9 +++
 tests/Makefile.include                       |  6 ++
 tests/third-party/Makefile.include           | 50 ++++++++++++
 tests/third-party/wasmtime/Dockerfile        | 32 ++++++++
 tests/third-party/wasmtime/Makefile.include  | 49 ++++++++++++
 tests/third-party/wasmtime/avocado-wrapper   | 38 +++++++++
 tests/third-party/wasmtime/avocado.cfg       |  3 +
 tests/third-party/wasmtime/json2tap          | 77 ++++++++++++++++++
 tests/third-party/wasmtime/run-tests-wrapper | 82 ++++++++++++++++++++
 tests/third-party/wasmtime/test              | 48 ++++++++++++
 11 files changed, 395 insertions(+)
 create mode 100644 tests/third-party/Makefile.include
 create mode 100644 tests/third-party/wasmtime/Dockerfile
 create mode 100644 tests/third-party/wasmtime/Makefile.include
 create mode 100755 tests/third-party/wasmtime/avocado-wrapper
 create mode 100644 tests/third-party/wasmtime/avocado.cfg
 create mode 100755 tests/third-party/wasmtime/json2tap
 create mode 100755 tests/third-party/wasmtime/run-tests-wrapper
 create mode 100755 tests/third-party/wasmtime/test

-- 
2.38.1


