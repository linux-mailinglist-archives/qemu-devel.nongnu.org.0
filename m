Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EB457191
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 16:22:50 +0100 (CET)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5iz-0001cv-41
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 10:22:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo5g3-0000ai-TX
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:19:48 -0500
Received: from [2607:f8b0:4864:20::829] (port=44858
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo5g1-0002hn-Si
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 10:19:47 -0500
Received: by mail-qt1-x829.google.com with SMTP id a2so9734070qtx.11
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0+oKCHlqOeL41R0XCrWbPi4i3qyXHn6RmL7MeAl4NL8=;
 b=lPGpGcid8QXwelr7zzSt5VTkDWstEKhmIVZjDI/gptTZ1XB8fRlCJsY82dS22YEbbI
 GADEuew95VumLWojAcQF6/3Rj7N9VtmARWHCGzMlbaVOuA5B2Iy8CEcEelQIeeRTPjCb
 /UriGVwYo5CnjPZCDlOVP8JIARNcJaTQUz01jDwgOeu3eE5FmpCC10B9LQ/D1G1T0tx4
 iQg2Eg0YoxH/lMrAwoMlca7V5PAbid3j8gMabaFjohga4jUqveMxv4mUiSKJmYsSXZJ9
 w9340v2YmW88xNRP0Sl+7ZXF9oISeC5mr2uPkE4vqO+Lek1l1/D1zTf+VnU59MujzXzD
 zgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0+oKCHlqOeL41R0XCrWbPi4i3qyXHn6RmL7MeAl4NL8=;
 b=jxoE3JpPehSnzV6pvoQwhcHbuLx2yyZZxqOwt4PyzaDMx/eFT90aMm+D9eoDn+k2OV
 vKmARqY1c0SQLmUmoxO9awD4Hwhm6BlpOcFtKASxFs/hK/FtEfWQSWJoR6ndBYM/6Q9o
 TtKG2IhAEJcLia7KMXUwMwLpy1vxtULewxo8UUFLP1sPV+SsooOIe7wzBuDG6nHtGJPs
 dDSihywENSMYQs4u2B3MTH+uoR4vM7XI65qo9dqP5zjI3b84ulOaA5BiN43ZDEuA3lsJ
 FOMkejmhkliClOztjxw8pqL4ZvNTE/TnwLKHGBxgj4yNsWZj+qGn6CSM3UUIFGG4A3s1
 mRAw==
X-Gm-Message-State: AOAM533RrPXi1us7fZl/2CU/FGH/4/3+MiB2Fl3VF1EgPFN1Pcoi4SDC
 LmjCKj0LgkMjchSClCbRM4yJcw==
X-Google-Smtp-Source: ABdhPJzBFCjiPUEhMyOCMWRnIUW5f5YGg2HohyzeoXo1q5KwzNya5wlMfrrS3JbWjHX+xZcOYu6I9Q==
X-Received: by 2002:a05:622a:1a93:: with SMTP id
 s19mr7169174qtc.291.1637335184307; 
 Fri, 19 Nov 2021 07:19:44 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id o126sm11039qke.11.2021.11.19.07.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 07:19:43 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mo5fz-00CHGM-Aq; Fri, 19 Nov 2021 11:19:43 -0400
Date: Fri, 19 Nov 2021 11:19:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211119151943.GH876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119134739.20218-2-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-x829.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 09:47:27PM +0800, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The new seal type provides semantics required for KVM guest private
> memory support. A file descriptor with the seal set is going to be used
> as source of guest memory in confidential computing environments such as
> Intel TDX and AMD SEV.
> 
> F_SEAL_GUEST can only be set on empty memfd. After the seal is set
> userspace cannot read, write or mmap the memfd.
> 
> Userspace is in charge of guest memory lifecycle: it can allocate the
> memory with falloc or punch hole to free memory from the guest.
> 
> The file descriptor passed down to KVM as guest memory backend. KVM
> register itself as the owner of the memfd via memfd_register_guest().
> 
> KVM provides callback that needed to be called on fallocate and punch
> hole.
> 
> memfd_register_guest() returns callbacks that need be used for
> requesting a new page from memfd.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>  include/linux/memfd.h      |  24 ++++++++
>  include/linux/shmem_fs.h   |   9 +++
>  include/uapi/linux/fcntl.h |   1 +
>  mm/memfd.c                 |  33 +++++++++-
>  mm/shmem.c                 | 123 ++++++++++++++++++++++++++++++++++++-
>  5 files changed, 186 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/memfd.h b/include/linux/memfd.h
> index 4f1600413f91..ff920ef28688 100644
> +++ b/include/linux/memfd.h
> @@ -4,13 +4,37 @@
>  
>  #include <linux/file.h>
>  
> +struct guest_ops {
> +	void (*invalidate_page_range)(struct inode *inode, void *owner,
> +				      pgoff_t start, pgoff_t end);
> +	void (*fallocate)(struct inode *inode, void *owner,
> +			  pgoff_t start, pgoff_t end);
> +};
> +
> +struct guest_mem_ops {
> +	unsigned long (*get_lock_pfn)(struct inode *inode, pgoff_t offset,
> +				      bool alloc, int *order);
> +	void (*put_unlock_pfn)(unsigned long pfn);
> +
> +};

Ignoring confidential compute for a moment

If qmeu can put all the guest memory in a memfd and not map it, then
I'd also like to see that the IOMMU can use this interface too so we
can have VFIO working in this configuration.

As designed the above looks useful to import a memfd to a VFIO
container but could you consider some more generic naming than calling
this 'guest' ?

Along the same lines, to support fast migration, we'd want to be able
to send these things to the RDMA subsytem as well so we can do data
xfer. Very similar to VFIO.

Also, shouldn't this be two patches? F_SEAL is not really related to
these acessors, is it?

> +extern inline int memfd_register_guest(struct inode *inode, void *owner,
> +				       const struct guest_ops *guest_ops,
> +				       const struct guest_mem_ops **guest_mem_ops);

Why does this take an inode and not a file *?

> +int shmem_register_guest(struct inode *inode, void *owner,
> +			 const struct guest_ops *guest_ops,
> +			 const struct guest_mem_ops **guest_mem_ops)
> +{
> +	struct shmem_inode_info *info = SHMEM_I(inode);
> +
> +	if (!owner)
> +		return -EINVAL;
> +
> +	if (info->guest_owner && info->guest_owner != owner)
> +		return -EPERM;

And this looks like it means only a single subsytem can use this API
at once, not so nice..

Jason

