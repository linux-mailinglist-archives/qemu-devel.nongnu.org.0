Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774146E18DE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:13:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn72s-0007gh-Kt; Thu, 13 Apr 2023 20:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3T5o4ZAsKCo4su2w93wGB5yy66y3w.u648w4C-vwDw3565y5C.69y@flex--ackerleytng.bounces.google.com>)
 id 1pn72q-0007gQ-48
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:04 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3T5o4ZAsKCo4su2w93wGB5yy66y3w.u648w4C-vwDw3565y5C.69y@flex--ackerleytng.bounces.google.com>)
 id 1pn72o-00037s-3S
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:12:03 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 y10-20020a25320a000000b00b8f6ab06288so1317736yby.22
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681431119; x=1684023119;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i+pweVgTeWv08z0ELDTsB0Ltp1Ye2bcZK0KHo4GqVbw=;
 b=SxumLiXBZqVvPSsO4nE95gXtUUxXVcRm2giZRY9/5ORZ+OjADqAAbFJkobyKcqmfCt
 ePUsZvwKG04KkaahIzuPRZeniJUEzn01e6frQqq0jAgCaSwlASsR29xtCtNlSjb+T5pj
 VEWY0EVxAPptAmO48HG5tvNAJPPxntiFot3tECFeEreHjLrDdGnAKPlTKHy30+MbbqI8
 64DeVDk4CEwT4IFGcaTIdQJJ7t2C3BZm2t+9Gp59h71CPchlPnK0jhl4w3WF/G3NQ2HG
 SBMasteYkoK5+FJ8YkRnsN77u+ShB1rljGgMoVKQvjdG4NVzxFbFqiD01CFCoQkbIqFa
 aeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681431119; x=1684023119;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+pweVgTeWv08z0ELDTsB0Ltp1Ye2bcZK0KHo4GqVbw=;
 b=INMFiu1GwwDTKCdG8R+uMYqHtqDS3pbcuoIE9J1DP/MJFF/49jz7AJAwB5JHQOPOI6
 sHclVCOh+Pnz0RjVCwAe5vVbtRsuylHvhMrCOR/j9JJtAiT2KEjUFbDwaESEvmNkMMik
 6uyIa4aZsmzixQ5TnL2WN4i11kOhdhSM+yQQyhz56sPcml3vRHDRS0CmR5arjHGoW61n
 mHeJcdOMLe4VI+3aX0321fnpETcaWoCt+sU809SJHSp81TUQeX1G7IkGCkaOMin4yOWL
 gNX4F4vT6dszAcr7/8G8o7Paftrzlr4w/oKnpaF82i1Fhk4+H5pbWiBqw14uVw9E7N5W
 dZIA==
X-Gm-Message-State: AAQBX9cYgFU/hqpP4ObFHgNZVR4IsJa/49XUJ0XCUTqNz4UxGu9mKNC7
 +f0fArfUg9uRgi0f/FAMGnN+vibStCzUBBIQew==
X-Google-Smtp-Source: AKy350aFyMPBdyqRFopcQD1OOk7RIztiWHN973sMgROTFTwCsBiX6bTJGMx6PuL8Cu3fjd47w7zygKuC4QNdUU7X4w==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a25:72d6:0:b0:b8f:55f6:e50f with SMTP
 id n205-20020a2572d6000000b00b8f55f6e50fmr2609596ybc.1.1681431119162; Thu, 13
 Apr 2023 17:11:59 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:11:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <cover.1681430907.git.ackerleytng@google.com>
Subject: [RFC PATCH 0/6] Setting memory policy for restrictedmem file
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, muchun.song@linux.dev, feng.tang@intel.com, 
 brgerst@gmail.com, rdunlap@infradead.org, masahiroy@kernel.org, 
 mailhol.vincent@wanadoo.fr, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3T5o4ZAsKCo4su2w93wGB5yy66y3w.u648w4C-vwDw3565y5C.69y@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Hello,

This patchset builds upon the memfd_restricted() system call that was
discussed in the 'KVM: mm: fd-based approach for supporting KVM' patch
series [1].

The tree can be found at:
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-set-memory-=
policy

In this patchset, a new syscall is introduced, which allows userspace
to set the memory policy (e.g. NUMA bindings) for a restrictedmem
file, to the granularity of offsets within the file.

The offset/length tuple is termed a file_range which is passed to the
kernel via a pointer to get around the limit of 6 arguments for a
syscall.

The following other approaches were also considered:

1. Pre-configuring a mount with a memory policy and providing that
   mount to memfd_restricted() as proposed at [2].
    + Pro: It allows choice of a specific backing mount with custom
      memory policy configurations
    + Con: Will need to create an entire new mount just to set memory
      policy for a restrictedmem file; files on the same mount cannot
      have different memory policies.

2. Passing memory policy to the memfd_restricted() syscall at creation time=
.
    + Pro: Only need to make a single syscall to create a file with a
      given memory policy
    + Con: At creation time, the kernel doesn=E2=80=99t know the size of th=
e
      restrictedmem file. Given that memory policy is stored in the
      inode based on ranges (start, end), it is awkward for the kernel
      to store the memory policy and then add hooks to set the memory
      policy when allocation is done.

3. A more generic fbind(): it seems like this new functionality is
   really only needed for restrictedmem files, hence a separate,
   specific syscall was proposed to avoid complexities with handling
   conflicting policies that may be specified via other syscalls like
   mbind()

TODOs

+ Return -EINVAL if file_range is not within the size of the file and
  tests for this

Dependencies:

+ Chao=E2=80=99s work on UPM [3]

[1] https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux=
.intel.com/T/
[2] https://lore.kernel.org/lkml/cover.1681176340.git.ackerleytng@google.co=
m/T/
[3] https://github.com/chao-p/linux/commits/privmem-v11.5

---

Ackerley Tng (6):
  mm: shmem: Refactor out shmem_shared_policy() function
  mm: mempolicy: Refactor out mpol_init_from_nodemask
  mm: mempolicy: Refactor out __mpol_set_shared_policy()
  mm: mempolicy: Add and expose mpol_create
  mm: restrictedmem: Add memfd_restricted_bind() syscall
  selftests: mm: Add selftest for memfd_restricted_bind()

 arch/x86/entry/syscalls/syscall_32.tbl        |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl        |   1 +
 include/linux/mempolicy.h                     |   4 +
 include/linux/shmem_fs.h                      |   7 +
 include/linux/syscalls.h                      |   5 +
 include/uapi/asm-generic/unistd.h             |   5 +-
 include/uapi/linux/mempolicy.h                |   7 +-
 kernel/sys_ni.c                               |   1 +
 mm/mempolicy.c                                | 100 ++++++++++---
 mm/restrictedmem.c                            |  75 ++++++++++
 mm/shmem.c                                    |  10 +-
 scripts/checksyscalls.sh                      |   1 +
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   8 +
 .../selftests/mm/memfd_restricted_bind.c      | 139 ++++++++++++++++++
 .../mm/restrictedmem_testmod/Makefile         |  21 +++
 .../restrictedmem_testmod.c                   |  89 +++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   6 +
 18 files changed, 454 insertions(+), 27 deletions(-)
 create mode 100644 tools/testing/selftests/mm/memfd_restricted_bind.c
 create mode 100644 tools/testing/selftests/mm/restrictedmem_testmod/Makefi=
le
 create mode 100644 tools/testing/selftests/mm/restrictedmem_testmod/restri=
ctedmem_testmod.c

--
2.40.0.634.g4ca3ef3211-goog

