Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD269C45B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:05:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwTh-0006Xz-GW; Sun, 19 Feb 2023 22:04:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pTwTe-0006Xe-MH
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:04:30 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@linux.intel.com>)
 id 1pTwTb-0001R6-Nf
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676862267; x=1708398267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E8xZ7auVU/piWMLG1AXlZIsK3dlj5WYN4ckwufDorRE=;
 b=YRSBm2Z2SSjT8HA9+MLBitGwpls9YpjMcIpz7LxZjsgi7SIJkhuzIOmK
 puV47Bro6ukUKeNWvEXSt1NYqiAbqDX2tJc7UHcegpLGrZWNewGgh37dR
 O9y3ykrJlRR+8+E+DWcfCtRYyM63XYhZCMIhxzPvE0/bhzfTarM7KhXwy
 I8wflCYD4eCSmyQbnfM6MTrmsU+jk1fMd7VfN7syfggmSqGhfi0sFk60q
 0PFh5HpxJr7HdsEFPsZluRUJwPFbQBJf5cjB8bexsznlrh6ZzzrFqYHea
 4mBjPX85w74ym4MWW2jE+ris/WxvLlRqNFTvQYvWPx5/SGV2VlNIZihoq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="332319340"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="332319340"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2023 19:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="1000125665"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; d="scan'208";a="1000125665"
Received: from yy-desk-7060.sh.intel.com (HELO localhost) ([10.239.159.76])
 by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2023 19:04:13 -0800
Date: Mon, 20 Feb 2023 11:04:12 +0800
From: Yuan Yao <yuan.yao@linux.intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, qemu-devel@nongnu.org, aarcange@redhat.com,
 ak@linux.intel.com, akpm@linux-foundation.org, arnd@arndb.de,
 bfields@fieldses.org, bp@alien8.de, chao.p.peng@linux.intel.com,
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com,
 hughd@google.com, jlayton@kernel.org, jmattson@google.com,
 joro@8bytes.org, jun.nakajima@intel.com,
 kirill.shutemov@linux.intel.com, linmiaohe@huawei.com,
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com,
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com,
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org,
 seanjc@google.com, shuah@kernel.org, steven.price@arm.com,
 tabba@google.com, tglx@linutronix.de, vannapurve@google.com,
 vbabka@suse.cz, vkuznets@redhat.com, wanpengli@tencent.com,
 wei.w.wang@intel.com, x86@kernel.org, yu.c.zhang@linux.intel.com
Subject: Re: [RFC PATCH 0/2] Add flag as THP allocation hint for
 memfd_restricted() syscall
Message-ID: <20230220030412.fgh3f5qzgihz4f4x@yy-desk-7060>
References: <cover.1676680548.git.ackerleytng@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1676680548.git.ackerleytng@google.com>
User-Agent: NeoMutt/20171215
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=yuan.yao@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Sat, Feb 18, 2023 at 12:43:00AM +0000, Ackerley Tng wrote:
> Hello,
>
> This patchset builds upon the memfd_restricted() system call that has
> been discussed in the ‘KVM: mm: fd-based approach for supporting KVM’
> patch series, at
> https://lore.kernel.org/lkml/20221202061347.1070246-1-chao.p.peng@linux.intel.com/T/#m7e944d7892afdd1d62a03a287bd488c56e377b0c
>
> The tree can be found at:
> https://github.com/googleprodkernel/linux-cc/tree/restrictedmem-rmfd-hugepage
>
> Following the RFC to provide mount for memfd_restricted() syscall at
> https://lore.kernel.org/lkml/cover.1676507663.git.ackerleytng@google.com/T/#u,
> this patchset adds the RMFD_HUGEPAGE flag to the memfd_restricted()
> syscall, which will hint the kernel to use Transparent HugePages to
> back restrictedmem pages.
>
> This supplements the interface proposed earlier, which requires the
> creation of a tmpfs mount to be passed to memfd_restricted(), with a
> more direct per-file hint.
>
> Dependencies:
>
> + Sean’s iteration of the ‘KVM: mm: fd-based approach for supporting
>   KVM’ patch series at
>   https://github.com/sean-jc/linux/tree/x86/upm_base_support
> + Proposed fix for restrictedmem_getattr() as mentioned on the mailing
>   list at
>   https://lore.kernel.org/lkml/diqzzga0fv96.fsf@ackerleytng-cloudtop-sg.c.googlers.com/
> + Hugh’s patch:
>   https://lore.kernel.org/lkml/c140f56a-1aa3-f7ae-b7d1-93da7d5a3572@google.com/,
>   which provides functionality in shmem that reads the VM_HUGEPAGE
>   flag in key functions shmem_is_huge() and shmem_get_inode()

Will Hugh's patch be merged into 6.3 ? I didn't find it in 6.2-rc8.
IMHO this patch won't work without Hugh's patch, or at least need
another way, e.g. HMEM_SB(inode->i_sb)->huge.

>
> Future work/TODOs:
> + man page for the memfd_restricted() syscall
> + Support for per file NUMA binding hints
>
> Ackerley Tng (2):
>   mm: restrictedmem: Add flag as THP allocation hint for
>     memfd_restricted() syscall
>   selftests: restrictedmem: Add selftest for RMFD_HUGEPAGE
>
>  include/uapi/linux/restrictedmem.h            |  1 +
>  mm/restrictedmem.c                            | 27 ++++++++++++-------
>  .../restrictedmem_hugepage_test.c             | 25 +++++++++++++++++
>  3 files changed, 43 insertions(+), 10 deletions(-)
>
> --
> 2.39.2.637.g21b0678d19-goog
>

