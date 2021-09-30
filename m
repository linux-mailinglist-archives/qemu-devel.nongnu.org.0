Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1941D3A7
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:56:45 +0200 (CEST)
Received: from localhost ([::1]:43860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpzo-00069A-LM
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVown-0000Dl-Ew
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:49:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVowl-0007ZG-6H
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 01:49:33 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U3xcqO012458; 
 Thu, 30 Sep 2021 01:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Hrtc4fv7TeVdcQ7pR96X/wTZwWZULc8Zcdg4kJ9jT2w=;
 b=IN4h0obFIh0GvuIZV7UllQbh0Ug4AZBG2Jg0eXuNSkEn2LFp0waU53LDK+poZmeiXxIV
 8zk5/n7Ml9zPOZu6wjyhGC121WSfx8eFebERsRoEvpjH4J6Y1/1y/ZVKVijphg/nWn2S
 HVl5tWo/ytb/rnPDjrHOlxs21POORpCXUsl0ahoT2sgREUqqP1fADhH05y5iu9g388wU
 Z6Hl1HpMKb1PvybAWsjnpvllB3nxomjSXBNKXubBPuMh7+HNSbkvRFg/l3TtH0fr+0dp
 P7g9vYtDzn31Ls1TsPF3QxsSunRlecB+KgpKkxSoVfJS5gY88lPojfs2Bl1uvmY/YMKY Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd5ts9v4k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 01:49:26 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18U5cJQq023114;
 Thu, 30 Sep 2021 01:49:26 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd5ts9v46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 01:49:26 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18U5bE6b010535;
 Thu, 30 Sep 2021 05:49:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3b9udd5fe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 05:49:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18U5nMX141419080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 05:49:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99DD4AC05E;
 Thu, 30 Sep 2021 05:49:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CB1FAC060;
 Thu, 30 Sep 2021 05:49:19 +0000 (GMT)
Received: from DOVMURIK-QI20.localdomain (unknown [9.65.215.111])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 05:49:18 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
Date: Thu, 30 Sep 2021 08:49:13 +0300
Message-Id: <20210930054915.13252-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: afjtEHS80capItu6an9jbaEvG1ItoQKq
X-Proofpoint-GUID: jgZKbDhMHB06bXf14TyjR_LrXr45srqr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_01,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=820 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300035
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
the hashes part of the AMD PSP measured content, and OVMF can trust
these inputs if they match the hashes.

This series adds an SEV function to generate the table of hashes for
OVMF and encrypt it (patch 1/2), and calls this function if SEV is
enabled when the kernel/initrd/cmdline are prepared (patch 2/2).

Corresponding OVMF support [1] is already available in edk2 (patch series
"Measured SEV boot with kernel/initrd/cmdline").

[1] https://edk2.groups.io/g/devel/message/78250

---

v4 changes:
 - struct and variable renames (KernelLoaderContext -> SevKernelLoaderContext,
   kernel_loader_context -> sev_load_ctx).

v3 resend: https://lore.kernel.org/qemu-devel/20210825073538.959525-1-dovmurik@linux.ibm.com/
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

-- 
2.25.1


