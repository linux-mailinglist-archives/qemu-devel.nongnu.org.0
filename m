Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669F83AF5D1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:07:06 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPGD-0001Y8-GU
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvPFM-0000ma-Qc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:06:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvPFK-0004k1-Jg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:06:12 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LJ3ZLK059087; Mon, 21 Jun 2021 15:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=1mTybbyXM/E3sv1J1Dgb9Gj+dRh5NhMUSqocsAMTwJc=;
 b=sxdalGilyBgtbFXB7AooGkULp31jMuiRUCuGbdRiKCgHA/Fmuc40osEKmrFEMEAykjN5
 diYPXaJ+u0CeKtiYMeqiI1mFgZSYxHPPmGrWowVZ8A8hA9eqdFJWwjGG5cBVhC+51zMy
 U4jbGb9mvWQQFp6lQybMNpuu0prLiESaKjVSFb5nxS1SOPqLmfPvT3o6Mbn90Uqnoq3G
 nL+HfLPb+3Yqk6QrsIXbp1AyXu5xxDJbflSdhS4I+Y1s3tTdXa5+ugqTxiOXXb9RrkJo
 r2srkUdPv6AMFTKmrMj4C7kdtRoIOGfG7sHUptEDX3PSpuxFkrG29Sklq1lZJJVroR/q JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b0a78jvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:06:04 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LJ629T067298;
 Mon, 21 Jun 2021 15:06:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39b0a78jus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 15:06:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LJ3gha007934;
 Mon, 21 Jun 2021 19:06:03 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3998791m6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 19:06:03 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LJ61p926214818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 19:06:01 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDF666A04F;
 Mon, 21 Jun 2021 19:06:01 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 636AA6A051;
 Mon, 21 Jun 2021 19:06:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 19:06:00 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
Date: Mon, 21 Jun 2021 19:05:51 +0000
Message-Id: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sWDGEUG3SVPuhZBXKZ5S1DoSg-qxIQ1x
X-Proofpoint-ORIG-GUID: 19bbY7Puz_q18KuSdUB0GooPAG9x3vgS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_11:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=726
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210112
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently booting with -kernel/-initrd/-append is not supported in SEV
confidential guests, because the content of these blobs is not measured
and therefore not trusted by the SEV guest.

However, in some cases the kernel, initrd, and cmdline are not secret
but should not be modified by the host.  In such a case, we want to
verify inside the trusted VM that the kernel, initrd, and cmdline are
indeed the ones expected by the Guest Owner, and only if that is the
case go on and boot them up (removing the need for grub inside OVMF in
that mode).

To support that, OVMF adds a special area for hashes of
kernel/initrd/cmdline; that area is expected to be filled by QEMU and
encrypted as part of the initial SEV guest launch.  This in turn makes
the hashes part of the PSP measured content, and OVMF can trust these
inputs if they match the hashes.

This series adds an SEV function to generate the table of hashes for
OVMF and encrypt it (patch 1/2), and calls this function if SEV is
enabled when the kernel/initrd/cmdline are prepared (patch 2/2).

Corresponding OVMF support was submitted to edk2-devel [1] (patch series
"Measured SEV boot with kernel/initrd/cmdline"); it's still under
review.

[1] https://edk2.groups.io/g/devel/topic/patch_v1_0_8_measured_sev/83074450

---

v1: https://lore.kernel.org/qemu-devel/20210525065931.1628554-1-dovmurik@linux.ibm.com/

v2:
 - Extract main functionality to sev.c (with empty stub in sev-stub.c)
 - Use sev_enabled() instead of machine->cgs->ready to detect SEV guest
 - Coding style changes


Dov Murik (2):
  sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
    boot
  x86/sev: generate SEV kernel loader hashes in x86_load_linux

 hw/i386/x86.c          |  25 ++++++++-
 target/i386/sev-stub.c |   5 ++
 target/i386/sev.c      | 121 +++++++++++++++++++++++++++++++++++++++++
 target/i386/sev_i386.h |  12 ++++
 4 files changed, 162 insertions(+), 1 deletion(-)


base-commit: e4bfa6cd68e0b19f42c0c4ef26c024d39ebab044
-- 
2.25.1


