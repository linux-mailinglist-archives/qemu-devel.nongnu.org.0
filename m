Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F47B6DCF4F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2pK-0005eB-Ht; Mon, 10 Apr 2023 21:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ALg0ZAsKCmsJLTNaUNhcWPPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--ackerleytng.bounces.google.com>)
 id 1pm2pI-0005bB-3Q
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:29:40 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ALg0ZAsKCmsJLTNaUNhcWPPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--ackerleytng.bounces.google.com>)
 id 1pm2pG-0006iv-Ft
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:29:39 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 t66-20020a254645000000b00b74680a7904so7298489yba.15
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1681176576;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u35FXb24rxXsoG0aCEe4m7ddoHISWHWt5V4ebjSzsz4=;
 b=o2tU5lXa5GgaaWuGTbd5bbvKtG3z3RSme5Cet24inDTS7nOrViJmL/iq51gozQkU0w
 fSc14g51lyAN7EZ2W2YdqFHXsQ6fhtJt3Ww8txhLuuaqZ7otipQp1kY2GirbtpvPd8tz
 qOFtr4vKJdNigycQsXduABdE6Mx/1K8btlYWEfUtLHRYy5H01FBzkck2ffnGkGbDsNsT
 ZbsMLLNEojFf+Yy7PynOmDitIMxxEZiFMr4qBeOETiKphih3BdTfUf4XHIT8Qtk4z1z+
 d9h/ldEYXKqGvPbthLo+j90zJo0SUaeonPgvSapyQgn4pLlBWcLiJxpQI3QivbmMF29i
 8afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176576;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u35FXb24rxXsoG0aCEe4m7ddoHISWHWt5V4ebjSzsz4=;
 b=gxNBH4hDTJIfFagKX7eOMKBk50Jd7nLLzD3KFb8mTbG/aT1oYlTnBGASmwWZ+69FpK
 qnazDXPQSFiuvPEfOx7CZAlRtNlQok1K+3lFe0gz3hgkQxRpN94BVhGliiUf+MDMIcdN
 XIkOW3uUouuBFexaE89EQJCQZVwMI2Q9CCrthTVm152B0SI6nTN6/0ceial/8OV0tpAK
 yszb1aPtkcdq7BRacRiv1+SfZbK/nPPoAGamlfLEjuYoMw1FAeOsbspxBd8kbQZQU76J
 tNCtgcDu7ndDsG3CxlGobkGMdm3haXfWRbeGXERAWi3i7KT1gvvIwk0jN/xXFy1wpeG+
 48oA==
X-Gm-Message-State: AAQBX9c4tpX38MGJg/1DQ7jbjSZ7ZOyhTjCUreV+EUtQLRdr3D6jRaPX
 xdtEc7OOy+Agw2fX4HFqAOeLjfEOQA7mrsm2/A==
X-Google-Smtp-Source: AKy350avHjLsg9mTzZAWYFqY+XYZP5h/AOkdol2OZ6k0pfwzqyIYSmwhwrM4doSRB7oAHOnKfLu7oA90tp2KCOA+fw==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:690c:1:b0:544:bbd2:74be with SMTP
 id bc1-20020a05690c000100b00544bbd274bemr8286702ywb.4.1681176576562; Mon, 10
 Apr 2023 18:29:36 -0700 (PDT)
Date: Tue, 11 Apr 2023 01:29:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <cover.1681176340.git.ackerleytng@google.com>
Subject: [RFC PATCH v4 0/2] Providing mount in memfd_restricted() syscall
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
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ALg0ZAsKCmsJLTNaUNhcWPPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--ackerleytng.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
series, at
https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.int=
el.com/T/

The tree can be found at:
https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-provide-mou=
nt-fd-rfc-v4

In this patchset, a modification to the memfd_restricted() syscall is
proposed, which allows userspace to provide a mount, on which the
restrictedmem file will be created and returned from the
memfd_restricted().

Allowing userspace to provide a mount allows userspace to control
various memory binding policies via tmpfs mount options, such as
Transparent HugePage memory allocation policy through
'huge=3Dalways/never' and NUMA memory allocation policy through
'mpol=3Dlocal/bind:*'.

Changes since RFCv3:
+ Added check to ensure that bind mounts must be bind mounts of the
  whole filesystem
+ Removed inappropriate check on fd=E2=80=99s permissions as Christian
  suggested
+ Renamed RMFD_USERMNT to MEMFD_RSTD_USERMNT as David suggested
+ Added selftest to check that bind mounts must be bind mounts of the
  whole filesystem

Changes since RFCv2:
+ Tightened semantics to accept only fds of the root of a tmpfs mount,
  as Christian suggested
+ Added permissions check on the inode represented by the fd to guard
  against creation of restrictedmem files on read-only tmpfs
  filesystems or mounts
+ Renamed RMFD_TMPFILE to RMFD_USERMNT to better represent providing a
  userspace mount to create a restrictedmem file on
+ Updated selftests for tighter semantics and added selftests to check
  for permissions

Changes since RFCv1:
+ Use fd to represent mount instead of path string, as Kirill
  suggested. I believe using fds makes this syscall interface more
  aligned with the other syscalls like fsopen(), fsconfig(), and
  fsmount() in terms of using and passing around fds
+ Remove unused variable char *orig_shmem_enabled from selftests

Dependencies:
+ Chao=E2=80=99s work on UPM, at
  https://github.com/chao-p/linux/commits/privmem-v11.5

Links to earlier patch series:
+ RFC v3: https://lore.kernel.org/lkml/cover.1680306489.git.ackerleytng@goo=
gle.com/T/
+ RFC v2: https://lore.kernel.org/lkml/cover.1679428901.git.ackerleytng@goo=
gle.com/T/
+ RFC v1: https://lore.kernel.org/lkml/cover.1676507663.git.ackerleytng@goo=
gle.com/T/

Ackerley Tng (2):
  mm: restrictedmem: Allow userspace to specify mount for
    memfd_restricted
  selftests: restrictedmem: Check memfd_restricted()'s handling of
    provided userspace mount

 include/linux/syscalls.h                      |   2 +-
 include/uapi/linux/restrictedmem.h            |   8 +
 mm/restrictedmem.c                            |  73 ++-
 tools/testing/selftests/mm/.gitignore         |   1 +
 tools/testing/selftests/mm/Makefile           |   1 +
 .../selftests/mm/memfd_restricted_usermnt.c   | 529 ++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh     |   3 +
 7 files changed, 611 insertions(+), 6 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h
 create mode 100644 tools/testing/selftests/mm/memfd_restricted_usermnt.c

--
2.40.0.577.gac1e443424-goog

