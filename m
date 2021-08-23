Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B33F4C52
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 16:27:41 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIAvM-0004Ha-KK
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 10:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAl4-0006kc-AD
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mIAky-0000vB-7m
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 10:17:02 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17NE3Iuo063392; Mon, 23 Aug 2021 10:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=rQUffuddF5ZIvqDo3Aits4xe29D1wjhP3VeaTx9V+UA=;
 b=YdYuwV2S6EfBqvas6O4EK+phQjoi/j/Ec17K3D1F2+rH7Bigwb6GAK/hH5s5kGek9UGZ
 FpiSmtsgejWILotIaAp6KlOE6QIH7nuzn4EOCzsUNC7ytnMwu6Usmp8IUKsqwoslpIrA
 qR/xFMTTgSaR0NQd62fFAVdn+RosNMeK/H1/j/M4lrTNq/N3FrmqMwdOVnV23Ue6D5Jy
 FRaxS3wB7mU/TesnzeIAjFW7TdC6vB5AX0rftZi4CPpF+Jwp0xgFxywqr9RPTVW8OuAT
 KtwBT8AyJq1to27Aml4jGd+zLRzYthMEGszMfspqBVxTOUlFQ3kNmAdSLkXcuff0Vcdp 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akehva1vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:49 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17NE40eJ069212;
 Mon, 23 Aug 2021 10:16:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akehva1vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 10:16:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17NEDDfe021214;
 Mon, 23 Aug 2021 14:16:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3ajs4bknsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 14:16:47 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17NEGk3d36241910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 14:16:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C94C112069;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28DCE112065;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 14:16:46 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 00/12] Confidential guest-assisted live migration
Date: Mon, 23 Aug 2021 10:16:24 -0400
Message-Id: <20210823141636.65975-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lYiA_9tG2fesG8BMxV-qVcA2MyplAxss
X-Proofpoint-GUID: l-hA3mSpPPoACRoCgfZs05RFIEIlpDAl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_03:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230098
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
 Brijesh Singh <brijesh.singh@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Steve Rutherford <srutherford@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an RFC series for fast migration of confidential guests using an
in-guest migration helper that lives in OVMF.  QEMU VM live migration
needs to read source VM's RAM and write it in the target VM; this
mechanism doesn't work when the guest memory is encrypted or QEMU is
prevented from reading it in another way.  In order to support live
migration in such scenarios, we introduce an in-guest migration helper
which can securely extract RAM content from the guest in order to send
it to the target.  The migration helper is implemented as part of the
VM's firmware in OVMF.

We've implemented and tested this on AMD SEV, but expect most of the
processes can be used with other technologies that prevent direct access
of hypervisor to the guest's memory.  Specifically, we don't use SEV's
PSP migration commands (SEV_SEND_START, SEV_RECEIVE_START, etc) at all;
but note that the mirror VM relies on KVM_CAP_VM_COPY_ENC_CONTEXT_FROM
to shared the SEV ASID with the main VM.

Corresponding RFC patches for OVMF have been posted by Tobin
Feldman-Fitzthum on edk2-devel [1].  Those include the crux of the
migration helper: a mailbox protocol over a shared memory page which
allows communication between QEMU and the migration helper.  In the
source VM this is used to read a page and encrypt it for transport; in
the target it is used to decrypt the incoming page and storing the
content in the correct address in the guest memory.  All encryption and
decryption operations occur inside the trusted context in the VM, and
therefore the VM's memory plaintext content is never accessible to the
hosts participating in the migration.

In order to allow OVMF to run the migration helper in parallel to the
guest OS, we use a mirror VM [3], which shares the same memory mapping
and SEV ASID as the main VM but has its own run loop.  To start the
mirror vcpu and the migration handler, we added a temporary
start-migration-handler QMP command; this will be removed in a future
version to run as part of the migrate QMP command.

In the target VM we need the migration handler running to receive
incoming RAM pages; to achieve that, we boot the VM into OVMF with a
special fw_cfg value that causes OVMF to not boot the guest OS; we then
allow QEMU to receive an incoming migration by issuing a new
start-migrate-incoming QMP command.

The confidential RAM migration requires checking whether a given guest
RAM page is encrypted or not.  This is achieved using SEV shared regions
list tracking, which is implemented as part the SEV live migration patch
series [2].  This feature tracks hypercalls from OVMF and guest Linux to
report changes of page encryption status so that QEMU has an up-to-date
view of which memory regions are shared and which are encrypted.

We left a few unfinished edges in this RFC but decided to publish it to
start the commmunity discussion.  TODOs:

1. QMP commands start-migration-handler and start-migrate-incoming are
   developer tools and should be performed automatically.
2. The entry point address of the in-guest migration handler and its GDT
   are currently hard-coded in QEMU (patch 8); instead they should be
   discovered using pc_system_ovmf_table_find.  Same applies for the
   mailbox address (patch 1).
3. For simplicity, this patch series forces the use of the 
   guest-assisted migration instead of the SEV PSP-based migration. 
   Ideally we might want the user to choose the desired mode using
   migrate-set-parameters or a similar mechanism.
4. There is currently no discovery protocol between QEMU and OVMF to
   verify that OVMF indeed supports in-guest migration handler.


List of patches in this series:

1-3: introduce new confidtial RAM migration functions which communicate
     with the migration helper.
4-6: use the new MH communication functions when migrating encrypted RAM
     pages
7-9: allow starting migration handler on mirror vcpu with QMP command 
     start-migration-handler
10:  introduce the start-migrate-incoming QMP command to switch the
     target into accepting the incoming migration.
11:  fix devices issues when loading state into a live VM
12:  add documentation


This patch series is based on top of:

1. Add SEV guest live migration support, from Ashish Kalra [2]
2. Support for mirror VM, from Ashish Kalra [3]

[1] https://edk2.groups.io/g/devel/message/79517
[2] https://lore.kernel.org/qemu-devel/cover.1628076205.git.ashish.kalra@amd.com/
[3] https://lore.kernel.org/qemu-devel/cover.1629118207.git.ashish.kalra@amd.com/


Changes from RFC v1:
 - Use the an SEV mirror VM for the migation handler (instead of
   auxilliary vcpus)

RFC v1:
https://lore.kernel.org/qemu-devel/20210302204822.81901-1-dovmurik@linux.vnet.ibm.com/


Dov Murik (12):
  migration: Add helpers to save confidential RAM
  migration: Add helpers to load confidential RAM
  migration: Introduce gpa_inside_migration_helper_shared_area
  migration: Save confidential guest RAM using migration helper
  migration: Load confidential guest RAM using migration helper
  migration: Skip ROM, non-RAM, and vga.vram memory region during RAM
    migration
  i386/kvm: Exclude mirror vcpu in kvm_synchronize_all_tsc
  migration: Allow resetting the mirror vcpu to the MH entry point
  migration: Add QMP command start-migration-handler
  migration: Add start-migrate-incoming QMP command
  hw/isa/lpc_ich9: Allow updating an already-running VM
  docs: Add confidential guest live migration documentation

 docs/confidential-guest-live-migration.rst | 145 +++++++++
 docs/confidential-guest-support.txt        |   5 +
 docs/index.rst                             |   1 +
 qapi/migration.json                        |  38 +++
 include/sysemu/sev.h                       |   1 +
 migration/confidential-ram.h               |  23 ++
 hw/isa/lpc_ich9.c                          |   3 +-
 migration/confidential-ram.c               | 339 +++++++++++++++++++++
 migration/migration.c                      |  29 ++
 migration/ram.c                            | 133 +++++++-
 target/i386/kvm/kvm.c                      |   4 +-
 migration/meson.build                      |   2 +-
 migration/trace-events                     |   4 +
 13 files changed, 714 insertions(+), 13 deletions(-)
 create mode 100644 docs/confidential-guest-live-migration.rst
 create mode 100644 migration/confidential-ram.h
 create mode 100644 migration/confidential-ram.c

-- 
2.20.1


