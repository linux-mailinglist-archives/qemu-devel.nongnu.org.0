Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A0E6DCF6E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:35:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2uu-0002HE-53; Mon, 10 Apr 2023 21:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Wbk0ZAsKCsYmowq3xqA5zss00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--ackerleytng.bounces.google.com>)
 id 1pm2us-0002H0-MZ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:35:26 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Wbk0ZAsKCsYmowq3xqA5zss00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--ackerleytng.bounces.google.com>)
 id 1pm2uq-0000Cn-V0
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:35:26 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 w184-20020a6382c1000000b0050bed8b0b61so2764743pgd.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1681176921;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P3v7tjSHGZNeYf6fkHAGvkufX/1T+vrTWm+HxnUGut4=;
 b=ckDnI+qYpROoTcufCDcwOgr9iK1RPksPsWmIOeBsLNA/uyUeqNZdzhUf9sXthlctPf
 F+wMi3ClOnexsABXRbEypc3cqMNPH6Z0tNPVuwd8fhbDH8ln+SkWrpjNxEGwPxC/2glt
 FMI52wFhtuuDKkOMoaifJqIS9sTG7C5BknJRLtVbUZ9NqSkywnTZ/Opexpr9pbApTgcj
 GvPQtEzR7qQ4/fxydRQd5pWtJ5dgkv7JwSBfm07pT8ToRPItu6TrUnHKJfJ+avfBnkLl
 UgRpWyM2oduh/jLdoDELNXyYnRgcaaN+uD3VPgKEYl1EqI5ru4nTcuI8zBQ1sZRVNTWk
 QFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176921;
 h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P3v7tjSHGZNeYf6fkHAGvkufX/1T+vrTWm+HxnUGut4=;
 b=LdBeuOpns5iLedECcRVFOy/SJD2jHpcs0sDqnPSUbL0E8zcxrV9jVU+Bm04h39AH+3
 bWNv630VplKagd6wzganx4gub78bX2TonuCfmchv3sfWjyOqJ3JLnUbVLyK/gNqcJRVV
 vvqLh+DWshy+fH6pXvawSwfYAb7u8/E/aq5zd/0qiSWluZwRWLsiL0DFyJrRje83tgOJ
 NffgbUMmv0bTWjupXhk04h7VlWKOnozLz7hhE7viDVRxMYiRDYVDSA/RmTfkqwVysaoK
 MlwnvlNfXdC3c64xlUQoecczgKXOaHVdOD7wi5VG2v5zhQxg1Nsyhf6dtv2iPSJg5Vkh
 nqyw==
X-Gm-Message-State: AAQBX9egNFq26YgotOlZYNcWM4tE9h6QUL2z2Cv5PyBml+newkOPlkxN
 ajJ04WN6hYcFqNOOzBtZzXlhxGtBLdl7CrPQaw==
X-Google-Smtp-Source: AKy350ZpEpeQ13YWXEI6KoaJD09D+A99JikQlgyPpvIj63sO7he4qmnLCAo5joZFqabrZuaV6dwRVFPxHRliUjWyCg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a63:4c1c:0:b0:518:1f4d:3dbc with SMTP
 id z28-20020a634c1c000000b005181f4d3dbcmr213711pga.10.1681176921489; Mon, 10
 Apr 2023 18:35:21 -0700 (PDT)
Date: Tue, 11 Apr 2023 01:35:20 +0000
In-Reply-To: <9bbdc378-e66e-0a44-244b-33dffe888a2b@redhat.com> (message from
 David Hildenbrand on Mon, 3 Apr 2023 10:24:37 +0200)
Mime-Version: 1.0
Message-ID: <diqz5ya319rb.fsf@ackerleytng-cloudtop.c.googlers.com>
Subject: Re: [RFC PATCH v3 2/2] selftests: restrictedmem: Check hugepage-ness
 of shmem file backing restrictedmem fd
From: Ackerley Tng <ackerleytng@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org, 
 aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, 
 jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3Wbk0ZAsKCsYmowq3xqA5zss00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--ackerleytng.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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

David Hildenbrand <david@redhat.com> writes:

> On 01.04.23 01:50, Ackerley Tng wrote:
>> For memfd_restricted() calls without a userspace mount, the backing
>> file should be the shmem mount in the kernel, and the size of backing
>> pages should be as defined by system-wide shmem configuration.

>> If a userspace mount is provided, the size of backing pages should be
>> as defined in the mount.

>> Also includes negative tests for invalid inputs, including fds
>> representing read-only superblocks/mounts.


> When you talk about "hugepage" in this patch, do you mean THP or
> hugetlb? I suspect thp, so it might be better to spell that out. IIRC,
> there are plans to support actual huge pages in the future, at which
> point "hugepage" terminology could be misleading.


Thanks for pointing this out! I've replaced references to hugepage with
thp, please see RFC v4 at
https://lore.kernel.org/lkml/cover.1681176340.git.ackerleytng@google.com/T/

>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>    tools/testing/selftests/Makefile              |   1 +
>>    .../selftests/restrictedmem/.gitignore        |   3 +
>>    .../testing/selftests/restrictedmem/Makefile  |  15 +
>>    .../testing/selftests/restrictedmem/common.c  |   9 +
>>    .../testing/selftests/restrictedmem/common.h  |   8 +
>>    .../restrictedmem_hugepage_test.c             | 486 ++++++++++++++++++
>>    6 files changed, 522 insertions(+)
>>    create mode 100644 tools/testing/selftests/restrictedmem/.gitignore
>>    create mode 100644 tools/testing/selftests/restrictedmem/Makefile
>>    create mode 100644 tools/testing/selftests/restrictedmem/common.c
>>    create mode 100644 tools/testing/selftests/restrictedmem/common.h
>>    create mode 100644  
>> tools/testing/selftests/restrictedmem/restrictedmem_hugepage_test.c

>> ...


