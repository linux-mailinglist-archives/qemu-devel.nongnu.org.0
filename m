Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A33F7092
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:41:34 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInXR-00057C-Nj
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mInWA-0002pW-T0
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:40:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mInW5-000081-DN
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:40:14 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17P7dwtt004260; Wed, 25 Aug 2021 03:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=9pVhwn2f3yUB2pp7FDrPjUpCWTPsolC837j5AQD89fY=;
 b=aJ8j8tD4Nnkc2PgiyM+1JO1P9ZVg01c3dTpqiYsfhLypR708wS2C8XD8EmZ5a9lwO6CW
 v7Xv2u5PaME/t9iANq5rpxO2+AXfp4wd0Mg9Y+DQyBpEufxl9sLD3GgcdO/OpYgyVI/O
 4Q1VIOg8tzDeWFdSb6+FSSG1JeE+ZuQ5IKqoie2xPqlzpenwgsIM+zavsJ9YW6e/QfdG
 J1glx57a43iQtdJ7J4mkZfm3xZDsp4OGKzV4hQ3JOYfJgHMS6s+dwnE/MzTEvPqtkm3k
 V92RL7EwO/rFyj4/I2NNElsoM9qP9LqGuZK9f/5s6k82UrRWjrNiDgi8gw4V/s3BmFt0 mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3anh3krtqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 03:40:07 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17P7e6K0005414;
 Wed, 25 Aug 2021 03:40:06 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3anh3krtjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 03:40:05 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17P7Wmel025359;
 Wed, 25 Aug 2021 07:35:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3an9f7f1aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Aug 2021 07:35:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17P7ZjWQ54460802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Aug 2021 07:35:45 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08B3FC6062;
 Wed, 25 Aug 2021 07:35:45 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA977C605B;
 Wed, 25 Aug 2021 07:35:43 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Aug 2021 07:35:43 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] [RESEND] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
Date: Wed, 25 Aug 2021 07:35:36 +0000
Message-Id: <20210825073538.959525-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7v_e_OupyCX0W_3NfU2RQQo1_dK2bDE4
X-Proofpoint-GUID: brQQRXzQQDdy8RnN-oUAVW11EIBGpZpC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_02:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=908 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108250044
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Resending for QEMU 6.2; no code changes since the last round.)

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

Corresponding OVMF support [1] is already available in edk2 (patch series
"Measured SEV boot with kernel/initrd/cmdline").

[1] https://edk2.groups.io/g/devel/message/78250

---

v3: https://lore.kernel.org/qemu-devel/20210624102040.2015280-1-dovmurik@linux.ibm.com/
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


base-commit: f9baca549e44791be0dd98de15add3d8452a8af0
-- 
2.25.1


