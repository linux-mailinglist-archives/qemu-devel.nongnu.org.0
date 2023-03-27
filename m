Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97546CA3FD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:25:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgltA-00082d-Tq; Mon, 27 Mar 2023 08:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pglN8-0006E2-KM
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:50:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kconsul@linux.vnet.ibm.com>)
 id 1pglN5-00006k-PY
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:50:46 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RBCEOU009712; Mon, 27 Mar 2023 11:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=RpRMiM75Zg4zkflT3d+YVq/M7weSGu7MVQNw2eJEq+M=;
 b=HoyiplyQqYVnHBWSNSkMVo4bajMgJNgjY2EnH/Dyp104bEz8cqLy73MqHAyQUX7SPSIg
 rBjVE5ixLgKz9d5t0EAkUWAkiVbpFIXzxI8T6FHdfG3R4UacaPJsqgt1tkJdZ9eDS24N
 QW8rUsjpbYCeAlsqeQKDjbJaaGDktFwxYZO1UlkWAxTXpvUWIYsoXoWhSr3EuOCgwzzr
 cfHaH8AMAyBg03cvwIRQcM8mYjSoKHENpcnNHMI0Shu6Qpv6cnw99PXo/vgBzwCJ2FB2
 GEc0x6e1hqkM3EllBoa8EjfAG+6K2f0F1Au2vWxubWe7nzFFhU3we5GYhNnbywn6CcuX xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pka2agtfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RBeO46010537;
 Mon, 27 Mar 2023 11:50:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pka2agtf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32R9lmif019495;
 Mon, 27 Mar 2023 11:50:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6jqqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 11:50:36 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RBoXtd35651840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 11:50:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D789B20040;
 Mon, 27 Mar 2023 11:50:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 766652004B;
 Mon, 27 Mar 2023 11:50:32 +0000 (GMT)
Received: from r223l.aus.stglabs.ibm.com (unknown [9.3.109.14])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 11:50:32 +0000 (GMT)
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org, Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: [PATCH 0/2] Re-enabling tests/avocado/boot_linux.py for PPC64
Date: Mon, 27 Mar 2023 07:50:28 -0400
Message-Id: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JQwRSU-HltUdptMRTrmKMpq2Jhxx2AQk
X-Proofpoint-GUID: QvxoqH7f4T_QcQiX3Vz2MZrpgVVjQ9GI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303270090
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=kconsul@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 27 Mar 2023 08:23:48 -0400
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

The tests/avocado/boot_linux.py was disabled because it would take
too long to execute due to which it would timeout. On investigation
of this it was found that:
1)	The avocado module was downloading the Fedora 31 qcow2 image 2
	times due to checksum algorithm mismatch. The first download
	was computing the checksum with the sha1 algorithm whereas the
	second time the sha256 algorithm checksum was being passed by the
	avocado_qemu module due to which the 2nd download was being
	triggered.
2)	The boot_linux.py test-case was including the image download time
	for the 2nd download (as mentioned in point 1) in the test-case
	timeout time.

This patchset aims to solve the above problems by:
1)	Bumping up the avocado-framework version used by qemu to 101.0.
	This version of avocado includes a fix that re-computes the
	checksum of the already downloaded file using sha256 and then checks
	the checksum string being passed by avocado_qemu. This fix will
	also update the *-CHECKSUM file with a new line for the sha256
	checksum.
2)	Separating the download timeout from the actual test-case
	execution timeout in boot_linux.py.

Kautuk Consul (2):
  tests/requirements.txt: bump up avocado-framework version to 101.0
  tests/avocado/boot_linux.py: re-enable test-case for ppc64

 tests/avocado/boot_linux.py | 6 +++++-
 tests/requirements.txt      | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.2


