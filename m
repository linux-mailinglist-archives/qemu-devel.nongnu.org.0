Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57E56A18E8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUV4-0005zO-IE; Fri, 24 Feb 2023 04:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1pVUV1-0005yL-0m
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:36:19 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1pVUUz-00015m-Bi
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677231377; x=1708767377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qh5dHIF3Zy/2vFiSSHWmzyQvmvJlUbTRwfF+WltTESk=;
 b=AcbMbH0zeUWxBNT8zkSOca9GGrveL5kdd6pBJOabsTKzk/yEZ3nazJrF
 Q193omJKdNFQqDAXDFThowdnPBj/yeoxXc7XL4P3T9D7KDnyIBUsmqwFI
 +zwK9Npk5gYIb4LJDS3FGsDWMhjwWQk6DPbnlLndCxbagOKCFrmtO07CM
 0kIlzEOLSQNDHtiWSSUgr6zfcVDNrvFBZVnSjY0vLNxScT65UXkq7/bB2
 M0lVky2WR+ZRmmvj6MWf0A2+hFZBYHe2ZXKqQ0dLSA2lfmkBHNpnrYkJT
 UVWJA9e3egW3vka4v6td7R1ZJn9wGvx6s5NqEpStETIrKwkKoog0ALrf5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331171619"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="331171619"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:36:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741608912"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="741608912"
Received: from rkris18-mobl.amr.corp.intel.com (HELO box.shutemov.name)
 ([10.252.56.190])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:36:03 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id C84DF10A581; Fri, 24 Feb 2023 12:36:00 +0300 (+03)
Date: Fri, 24 Feb 2023 12:36:00 +0300
From: kirill.shutemov@linux.intel.com
To: Ackerley Tng <ackerleytng@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, kvm@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 qemu-devel@nongnu.org, chao.p.peng@linux.intel.com,
 aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org,
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, corbet@lwn.net,
 dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com,
 jlayton@kernel.org, jmattson@google.com, joro@8bytes.org,
 jun.nakajima@intel.com, linmiaohe@huawei.com, luto@kernel.org,
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com,
 mingo@redhat.com, naoya.horiguchi@nec.com, pbonzini@redhat.com,
 qperret@google.com, rppt@kernel.org, seanjc@google.com,
 shuah@kernel.org, steven.price@arm.com, tabba@google.com,
 tglx@linutronix.de, vannapurve@google.com, vbabka@suse.cz,
 vkuznets@redhat.com, wanpengli@tencent.com, wei.w.wang@intel.com,
 x86@kernel.org, yu.c.zhang@linux.intel.com
Subject: Re: [RFC PATCH 1/2] mm: restrictedmem: Allow userspace to specify
 mount_path for memfd_restricted
Message-ID: <20230224093600.osmbpilmsi64wlwb@box.shutemov.name>
References: <20230216100150.yv2ehwrdcfzbdhcq@box.shutemov.name>
 <diqzsfex5hfv.fsf@ackerleytng-cloudtop.c.googlers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <diqzsfex5hfv.fsf@ackerleytng-cloudtop.c.googlers.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga11.intel.com
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

On Thu, Feb 23, 2023 at 12:55:16AM +0000, Ackerley Tng wrote:
> 
> "Kirill A. Shutemov" <kirill@shutemov.name> writes:
> 
> > On Thu, Feb 16, 2023 at 12:41:16AM +0000, Ackerley Tng wrote:
> > > By default, the backing shmem file for a restrictedmem fd is created
> > > on shmem's kernel space mount.
> 
> > > With this patch, an optional tmpfs mount can be specified, which will
> > > be used as the mountpoint for backing the shmem file associated with a
> > > restrictedmem fd.
> 
> > > This change is modeled after how sys_open() can create an unnamed
> > > temporary file in a given directory with O_TMPFILE.
> 
> > > This will help restrictedmem fds inherit the properties of the
> > > provided tmpfs mounts, for example, hugepage allocation hints, NUMA
> > > binding hints, etc.
> 
> > > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > > ---
> > >   include/linux/syscalls.h           |  2 +-
> > >   include/uapi/linux/restrictedmem.h |  8 ++++
> > >   mm/restrictedmem.c                 | 63 +++++++++++++++++++++++++++---
> > >   3 files changed, 66 insertions(+), 7 deletions(-)
> > >   create mode 100644 include/uapi/linux/restrictedmem.h
> 
> > > diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
> > > index f9e9e0c820c5..4b8efe9a8680 100644
> > > --- a/include/linux/syscalls.h
> > > +++ b/include/linux/syscalls.h
> > > @@ -1056,7 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int
> > > flags);
> > >   asmlinkage long sys_set_mempolicy_home_node(unsigned long start,
> > > unsigned long len,
> > >   					    unsigned long home_node,
> > >   					    unsigned long flags);
> > > -asmlinkage long sys_memfd_restricted(unsigned int flags);
> > > +asmlinkage long sys_memfd_restricted(unsigned int flags, const char
> > > __user *mount_path);
> 
> > >   /*
> > >    * Architecture-specific system calls
> 
> > I'm not sure what the right practice now: do we provide string that
> > contains mount path or fd that represents the filesystem (returned from
> > fsmount(2) or open_tree(2)).
> 
> > fd seems more flexible: it allows to specify unbind mounts.
> 
> I tried out the suggestion of passing fds to memfd_restricted() instead
> of strings.
> 
> One benefit I see of using fds is interface uniformity: it feels more
> aligned with other syscalls like fsopen(), fsconfig(), and fsmount() in
> terms of using and passing around fds.
> 
> Other than being able to use a mount without a path attached to the
> mount, are there any other benefits of using fds over using the path string?

It would be nice if anyone from fs folks comment on this.

> Should I post the patches that allows specifying a mount using fds?
> Should I post them as a separate RFC, or as a new revision to this RFC?

Let's first decide what the right direction is.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

