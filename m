Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D1F32AC02
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:03:55 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCBO-0000yc-Hk
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwg-0001YD-Rd
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwd-00086K-BA
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Khgh8168494; Tue, 2 Mar 2021 15:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=l9ZxYGcwT23r+dBbAQSUTDw1K9vlv0YrlqgNWmlaRGA=;
 b=IIlBbwpzuhFRBkNhY1szx5XHksbXosUFKIeyqdx6hf+JiNA8PqobDsgcRZobHDoTJTX6
 8+Ob5YYIWK61HjE3cTpxRE/+VhJQ6rb7cf46dTqgQGUHmridR9un2QyLauT5ZYPdtc1y
 zx0VHDbO6AtJ0oufFwTgqFNhJWYIpwB/sWq2oSOjMOhLkpKbfwGyN4hDnut+sgr9qYQA
 rZ2zU7nGXMAsgeH0LTqzB6KBdE0DXwCKpgzWdVGrbHglBCNPHUCA4r0UiJSR6Koqw77h
 JY1GoK0qJUL7eI2QVJinKZZI9/YLU7BswumSh4qPzjJfAnmcGxuYQjh2xcuUqkusfOVj sA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371vnd05fr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:34 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Kgu54015441;
 Tue, 2 Mar 2021 20:48:28 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 37128ga1v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:28 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmSnj25755968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFBFE2805A;
 Tue,  2 Mar 2021 20:48:27 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C77D328058;
 Tue,  2 Mar 2021 20:48:27 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:27 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/26] Confidential guest live migration
Date: Tue,  2 Mar 2021 15:47:56 -0500
Message-Id: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Jon Grimm <jon.grimm@amd.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
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
PSP migration commands (SEV_SEND_START, SEV_RECEIVE_START, etc) at all.

Corresponding RFC patches for OVMF have been posted by my colleague
Tobin Feldman-Fitzthum on edk2-devel.  Those include the crux of the
migration helper: a mailbox protocol over a shared memory page which
allows communication between QEMU and the migration helper.  In the
source VM this is used to read a page and encrypt it for transport; in
the target it is used to decrypt the incoming page and storing the
content in the correct address in the guest memory.  All encryption and
decryption operations occur inside the trusted context in the VM, and
therefore the VM's memory plaintext content is never accessible to the
hosts participating in the migration.

In order to allow OVMF to run the migration helper in parallel to the
guest OS, we introduce the notion of auxiliary vcpus, which are usable
for OVMF but are hidden from the guest OS.  These might have other
future uses for in-guest operations/agents.

In the target VM we need the migration handler running to receive
incoming RAM pages; to achieve that, we boot the VM into OVMF with a
special fw_cfg value that causes OVMF to not boot the guest OS; we then
allow QEMU to receive an incoming migration by issuing a new
start-migrate-incoming QMP command.

The confidential RAM migration requires checking whether a given guest
RAM page is encrypted or not.  This is currently achieved using AMD's
patches which track the encryption status of guest pages in KVM, using
hypercalls from OVMF and guest Linux to report changes of such status.
The QEMU side of these patches is included as the first two patches in
this series.  The concrete implementation of this page encryption tracking
is currently in flux in the KVM mailing list, but the underlying
implementation doesn't affect our confidential RAM migration as long as
it can check whether a given guest address is encrypted.

List of patches in this series:

1-2: reposting AMD encrypted page bitmap support.
3-11: introduce the notion of auxiliary vcpus.
12-21: introduce the migration specifics.
22-23: fix devices issues when loading state into a live VM
24: introduce the start-migrate-incoming QMP command to switch the
target into accepting the incoming migration.
25: remove SEV migration blocker
26: add documentation


Brijesh Singh (1):
  kvm: add support to sync the page encryption state bitmap

Dov Murik (21):
  linux-headers: Add definitions of KVM page encryption bitmap ioctls
  machine: Add auxcpus=N suboption to -smp
  hw/boards: Add aux flag to CPUArchId
  hw/i386: Mark auxiliary vcpus in possible_cpus
  cpu: Add boolean aux field to CPUState
  hw/i386: Set CPUState.aux=true for auxiliary vcpus
  softmmu: Don't sync aux vcpus in pre_loadvm
  softmmu: Add cpu_synchronize_without_aux_post_init
  migration: Add helpers to save confidential RAM
  migration: Add helpers to load confidential RAM
  migration: Introduce gpa_inside_migration_helper_shared_area
  migration: Save confidential guest RAM using migration helper
  migration: Load confidential guest RAM using migration helper
  migration: Stop VM after loading confidential RAM
  migration: Don't sync vcpus when migrating confidential guests
  migration: When starting target, don't sync auxiliary vcpus
  hw/isa/lpc_ich9: Allow updating an already-running VM
  target/i386: Re-sync kvm-clock after confidential guest migration
  migration: Add start-migrate-incoming QMP command
  target/i386: SEV: Allow migration unless there are no aux vcpus
  docs: Add confidential guest live migration documentation

Tobin Feldman-Fitzthum (4):
  hw/acpi: Don't include auxiliary vcpus in ACPI tables
  softmmu: Add pause_all_vcpus_except_aux
  migration: Stop non-aux vcpus before copying the last pages
  migration: Call migration handler cleanup routines

 docs/confidential-guest-live-migration.rst | 142 ++++++++++++
 docs/confidential-guest-support.txt        |   5 +
 docs/index.rst                             |   1 +
 qapi/migration.json                        |  26 +++
 include/exec/ram_addr.h                    | 197 ++++++++++++++++
 include/exec/ramblock.h                    |   3 +
 include/exec/ramlist.h                     |   3 +-
 include/hw/boards.h                        |   3 +
 include/hw/core/cpu.h                      |   2 +
 include/hw/i386/x86.h                      |   2 +-
 include/sysemu/cpus.h                      |   2 +
 linux-headers/linux/kvm.h                  |  13 ++
 migration/confidential-ram.h               |  23 ++
 accel/kvm/kvm-all.c                        |  43 ++++
 hw/acpi/cpu.c                              |  10 +
 hw/core/cpu.c                              |   1 +
 hw/core/machine.c                          |   7 +
 hw/i386/acpi-build.c                       |   5 +
 hw/i386/acpi-common.c                      |   5 +
 hw/i386/pc.c                               |   7 +
 hw/i386/x86.c                              |  10 +-
 hw/isa/lpc_ich9.c                          |   3 +-
 migration/confidential-ram.c               | 258 +++++++++++++++++++++
 migration/migration.c                      |  18 +-
 migration/ram.c                            | 135 ++++++++++-
 migration/savevm.c                         |  13 +-
 softmmu/cpus.c                             |  68 +++++-
 softmmu/runstate.c                         |   1 +
 softmmu/vl.c                               |   3 +
 target/i386/machine.c                      |   9 +
 target/i386/sev.c                          |  25 +-
 migration/meson.build                      |   6 +-
 migration/trace-events                     |   4 +
 33 files changed, 1027 insertions(+), 26 deletions(-)
 create mode 100644 docs/confidential-guest-live-migration.rst
 create mode 100644 migration/confidential-ram.h
 create mode 100644 migration/confidential-ram.c


base-commit: 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462
-- 
2.20.1


