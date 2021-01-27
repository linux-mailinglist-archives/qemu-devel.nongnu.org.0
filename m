Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4C304E59
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 02:13:30 +0100 (CET)
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ZOi-0004ZQ-SU
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 20:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l4ZLM-0003gq-LC
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:10:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1l4ZLJ-0000zC-S4
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 20:10:00 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R11wJ2019963
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+wxOZxIqeU24yyLRBIHHEcmhrcinhVKPLfNa9Gp9Ah0=;
 b=cFqOmUXNTRNGceeIToTXFKcWa3sidCYl0CGe3zL3F6PwAKiK2RswhM5VBq6wOBj8olpx
 jrwX94PJuajSxgosa+i4PLmUhbLg13/iGBXX1QB/usmLiCqCdVaByzUkWykHUmSciwoS
 k/jKYc7VuRSCXZXvjwM22k/kUujfFmCtH4k902uBfxplPQkXdcsCpS9Xcc5sMltnPwbc
 2bevaaPkjrT9X8Od/1dkVeWJSHq3s2M+IeFgAWvWreJ+rvfpsxrbqjpz72wYZEfC6TjD
 L9ellzzC1tVA4e0MEoeVwOJPy2Lia17N1X43PpmjYEcBbk4xuiaW3qI2QEF3bfa254rX kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36au9cbrtp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:54 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10R121jj020210
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 20:09:54 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36au9cbrt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 20:09:54 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R12l4v011913;
 Wed, 27 Jan 2021 01:09:53 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 36a3qbs0s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 01:09:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10R19qn230540148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 01:09:52 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D2316A051;
 Wed, 27 Jan 2021 01:09:52 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50C7E6A04D;
 Wed, 27 Jan 2021 01:09:51 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.13.166])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 01:09:51 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] tests/acceptance/boot_linux: Switch to Fedora 32
Date: Tue, 26 Jan 2021 20:09:45 -0500
Message-Id: <20210127010946.17370-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_11:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270000
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, dbuono@linux.vnet.ibm.com,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Local acceptance tests run with "make check-acceptance" are now
showing some cases canceled like the following:

(01/39) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: CANCEL: Failed to download/prepare boot image (0.25 s)

Turns out, every full-vm test in boot_linux.py is trying to use a
Fedora 31 cloud image and is failing, with Avocado refusing to download
it, presumably because Fedora 31 is EOL.

This patch moves to Fedora 32, which is still supported. And seem to
work fine

The script has the image checksums hardcoded. I downloaded and verified
the checksums with the Fedora 32 GPG key, but I would feel more
confident if someone else wants to verify it too.

The checksum files are here:
https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/ppc64le/images/Fedora-Cloud-32-1.6-ppc64le-CHECKSUM
https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/32/Cloud/s390x/images/Fedora-Cloud-32-1.6-s390x-CHECKSUM
https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/aarch64/images/Fedora-Cloud-32-1.6-aarch64-CHECKSUM
https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/32/Cloud/x86_64/images/Fedora-Cloud-32-1.6-x86_64-CHECKSUM
and the GPG keys are available here:
https://getfedora.org/en/security/

NOTE: I tried moving to Fedora 33, but the aarch64 VM cannot boot
properly. May be worth investigating but I have no experience with ARM
so I'll leave that to someone else, if interested.

Daniele Buono (1):
  tests/acceptance/boot_linux: Switch to Fedora 32

 tests/acceptance/boot_linux.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.30.0


