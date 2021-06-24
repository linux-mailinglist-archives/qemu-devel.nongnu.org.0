Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660D3B2C5D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:22:50 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMVV-0004yE-Dq
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwMTg-00031o-LT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:20:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lwMTe-0007ol-Jq
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:20:56 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OA2x9J002247; Thu, 24 Jun 2021 06:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=l1jf5wrImVM0jiCZApHgXi8k4lSo3Rl2G0/KS7gj2sE=;
 b=cEIe5lgCp9emuS/3xP6cuMK7r7rp2yu+dTVgWr2BElqL2IdtzzSqNrFMm6KFASKRXrRs
 rmeoyVWgJ95s1FmBuBUcan3hrf/jofKa02aEHaEeudiv0U4Kl74+u+T850QTe/lhFaSr
 GD6sxvAm3PWkdj95z1IOe8fjy5CrQZZ+d8+r6R4fo10Ayytq4Vr/TIhCVFhD+k/tOJOV
 6r81cIeIl7Gd2hRVzCxTrUfs9Pj8rIw6UzfmUxWe0B8P3/tW59frIpcyxnqzZuEYmi2t
 Dir1ORgYjy/KJWPsNeDVT9+gosrBuNhI+6LnWbXqeJ3hI9Ohk2d7+CatsEA+UQaDL0LY JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cp57mf10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:20:51 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15OA3kqo005039;
 Thu, 24 Jun 2021 06:20:51 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cp57mf0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 06:20:51 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15OACI8s010065;
 Thu, 24 Jun 2021 10:20:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 399wjgt3bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 10:20:50 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15OAKmED24379872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 10:20:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EFA77805C;
 Thu, 24 Jun 2021 10:20:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E19E7805F;
 Thu, 24 Jun 2021 10:20:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Jun 2021 10:20:47 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
Date: Thu, 24 Jun 2021 10:20:38 +0000
Message-Id: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cILxi5Pam7fFG4MEsxU9pots2p9_Rboy
X-Proofpoint-GUID: 7NvpOjlyYK78f12w7R8EyOfN6LI2muQA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=946
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240054
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v3 changes:
 - initrd hash is now mandatory; if no -initrd is passed, calculate the
   hash of the empty buffer.  This is now aligned with the OVMF
   behaviour which verifies the empty initrd (correctly).
 - make SevHashTable entries fixed: 3 entries for cmdline, initrd, and kernel.
 - in sev_add_kernel_loader_hashes: first calculate all the hashes, only then
   fill-in the hashes table in the guest's memory.
 - Use g_assert_not_reached in sev-stub.c.
 - Use QEMU_PACKED attribute for structs.
 - Use QemuUUID type for guids.
 - in sev_add_kernel_loader_hashes: use ARRAY_SIZE(iov) instead of literal 2.

v2: https://lore.kernel.org/qemu-devel/20210621190553.1763020-1-dovmurik@linux.ibm.com/
v2 changes:
 - Extract main functionality to sev.c (with empty stub in sev-stub.c)
 - Use sev_enabled() instead of machine->cgs->ready to detect SEV guest
 - Coding style changes

v1: https://lore.kernel.org/qemu-devel/20210525065931.1628554-1-dovmurik@linux.ibm.com/

Dov Murik (2):
  sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
    boot
  x86/sev: generate SEV kernel loader hashes in x86_load_linux

 target/i386/sev_i386.h |  12 ++++
 hw/i386/x86.c          |  25 +++++++-
 target/i386/sev-stub.c |   5 ++
 target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+), 1 deletion(-)


base-commit: b22726abdfa54592d6ad88f65b0297c0e8b363e2
-- 
2.25.1


