Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB9745734F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:44:03 +0100 (CET)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6za-0006Wa-G9
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo6Pb-0007YY-0W
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:51 -0500
Received: from [2607:f8b0:4864:20::72e] (port=39684
 helo=mail-qk1-x72e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1mo6PM-0004Zg-Id
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:06:50 -0500
Received: by mail-qk1-x72e.google.com with SMTP id bk22so10639161qkb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VtV9HHXd4X5WRhcYz4pKiiL6eAEsTLpENVV+xmm0B1E=;
 b=gsJUvh5WctLgXnshRJv4wGg2JAgnGdSqNb3S1bmxpaDvTOBEX8LcgLW/+JvwTzVB37
 v5K7AG9csFvUa4d1e8VMH07tEJ/4GXeXR0y5xTNeGGDEbPPYGPgXDzn7G4nizRSxv1eO
 ORYsNAAPbkIfEb6NsGnWQ8GCPrvVKrf/49w0ZT27g2F3XOg052ttHxyU5wmveX2QAeR0
 /CkUMXANh4cDh+HorkLPLoxEa1f7SRa67fSFzDU/E1oWa7A8N6PtOVfUv80pyqxAxqRj
 YJDGrR6Uf5+iNfe0u7fumnhfivIpDOd+RCAzSsT04BV51dAxqsTNgRzPecBJz4DuF5VH
 RdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VtV9HHXd4X5WRhcYz4pKiiL6eAEsTLpENVV+xmm0B1E=;
 b=2s50Tug7uDKqa6DXQMYAdrA8qgx9LI4G/gh1sPrCvGS0VVu/iKXaiLRlaAgSrmQMMw
 1B34yH8nut7tO2C1z/2RJyDAUIw+fpCGcBW1w82aJpL81q8adk2kUQyghNdpFDVXmQen
 l8dhpQL1L9KJaDGx+e3j+xX1wm0m/Thi6hFrG6qJ34biaPJ1kDcpWl/fCxXqv5TsCgUf
 j0rkSwMg9NoWNVaPopq1riafZmjS42kV7lg2BRMfz3nPegibjT6FRItWX28kOkCJ2la+
 xmuSwH2ONu0LmQuir9X3eDH7GO8Y+Juso1iZ0vgDtN9l1rIGxs/Eg9a1AyTqybRDfxK1
 dtbw==
X-Gm-Message-State: AOAM530eHhmf2V+/y46tOCIlsQ885hMEbLycfGSPCcPP1pG/ZTmqSwT/
 V+rltpxkgCC+Nl9MgqbtU6Ip28Lebcr08A==
X-Google-Smtp-Source: ABdhPJxKednFIP8LV5fXPBeBBtPHTY7W03I8IO74iFi+Vm9ZxLiGU52DJu0TAbPkEtajZX/lLl8ZnA==
X-Received: by 2002:a05:622a:349:: with SMTP id
 r9mr7258679qtw.213.1637337626383; 
 Fri, 19 Nov 2021 08:00:26 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id j20sm54140qko.117.2021.11.19.08.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:00:25 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mo6JL-00CHtq-W3; Fri, 19 Nov 2021 12:00:24 -0400
Date: Fri, 19 Nov 2021 12:00:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211119160023.GI876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e; envelope-from=jgg@ziepe.ca;
 helo=mail-qk1-x72e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 kvm@vger.kernel.org, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, Chao Peng <chao.p.peng@linux.intel.com>,
 ak@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 04:39:15PM +0100, David Hildenbrand wrote:

> > If qmeu can put all the guest memory in a memfd and not map it, then
> > I'd also like to see that the IOMMU can use this interface too so we
> > can have VFIO working in this configuration.
> 
> In QEMU we usually want to (and must) be able to access guest memory
> from user space, with the current design we wouldn't even be able to
> temporarily mmap it -- which makes sense for encrypted memory only. The
> corner case really is encrypted memory. So I don't think we'll see a
> broad use of this feature outside of encrypted VMs in QEMU. I might be
> wrong, most probably I am :)

Interesting..

The non-encrypted case I had in mind is the horrible flow in VFIO to
support qemu re-execing itself (VFIO_DMA_UNMAP_FLAG_VADDR).

Here VFIO is connected to a VA in a mm_struct that will become invalid
during the kexec period, but VFIO needs to continue to access it. For
IOMMU cases this is OK because the memory is already pinned, but for
the 'emulated iommu' used by mdevs pages are pinned dynamically. qemu
needs to ensure that VFIO can continue to access the pages across the
kexec, even though there is nothing to pin_user_pages() on.

This flow would work a lot better if VFIO was connected to the memfd
that is storing the guest memory. Then it naturally doesn't get
disrupted by exec() and we don't need the mess in the kernel..

I was wondering if we could get here using the direct_io APIs but this
would do the job too.

> Apart from the special "encrypted memory" semantics, I assume nothing
> speaks against allowing for mmaping these memfds, for example, for any
> other VFIO use cases.

We will eventually have VFIO with "encrypted memory". There was a talk
in LPC about the enabling work for this.

So, if the plan is to put fully encrpyted memory inside a memfd, then
we still will eventually need a way to pull the pfns it into the
IOMMU, presumably along with the access control parameters needed to
pass to the secure monitor to join a PCI device to the secure memory.

Jason

