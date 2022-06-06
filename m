Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2853EF47
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 22:12:35 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyJ5V-0007z5-Qk
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 16:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nyJ39-0006RN-2T
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 16:10:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vannapurve@google.com>)
 id 1nyJ36-0002eT-8v
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 16:10:06 -0400
Received: by mail-pf1-x429.google.com with SMTP id g205so13556846pfb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oQFpDXi6bD7+wKzTyAPy27GXXUSscdFak0V6JCay3LM=;
 b=Lt8bn1CKv27NBAN2LZ6a3kjXi7zTNT9n5YC6qdlDRRz27wSGX169ro34tJXroQ4ylw
 9Wh5AtBkZYrRJCB6VOaJC0MlhiSdzn1C4PqwPfP5C2UQ58ClSnY1eORDsS+jz9o2IDri
 ni9cn1KDaMb5LTVmi0K48gTlOfkMsvw04FEVxngHWMm311dg/8tSsLNw8NZngXEjzLdm
 MRj2v0erbTuphncL4y5iv8ZG1Wuu7I1voO3ifQtd6JmL8xCnR4egkVJv67k8mCcsucuy
 B7Vorowmpt94+GNwzICo6EQEcNJyTDkVWQJuYGl9kQjzC8CdwmuVUJOWPEVPDexxdgNI
 LvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oQFpDXi6bD7+wKzTyAPy27GXXUSscdFak0V6JCay3LM=;
 b=ZU00Hbv8FVXipRPlTsuv771hIe3Jc7zrHgP1Ufp3ByK2bpdnuoSoL2VDnELrjWdpa7
 CKEXA0/2CWuR0v27FVg3TY3sCo6qcy6syx08oATJdcxie9FCnPviewi0mhxyWDXplpH9
 3jbv7xuUHs4NWTDV1XL7sjcpUeel8U52e/SefCiTBfvoHtIdehP45MT+UF0nq9xYp+9n
 eH8el2tl3No/PeoKlDD31jzg//EXTtq1rRPXNfnnh3zAvOmmmoGTJQNXCE3sKEhJPGjw
 6ZTPFYvmxVAtYCoXiBI3PDVceT0ztEZ0wb+Ge75oa3zQinzDqPn1QQoMhdrwkhZr+IjM
 gASg==
X-Gm-Message-State: AOAM532B5bl/IwYsAZiXXOAGgcPlmi7+ixRIuexhDcSb56LSo1dv8a5Q
 8kDRaVrPBzZGiPVTp5rs8JLhjTLFcZnWRYesDqhMXw==
X-Google-Smtp-Source: ABdhPJz71kp7wjsXPjRB2ML7eIa2fwB82eNGfeI62OXeQw8INa+MLyq06Q2ncMec3mjRtswZPQ72CnuvPkBz4ir4YOc=
X-Received: by 2002:a63:69c2:0:b0:3fa:78b5:d991 with SMTP id
 e185-20020a6369c2000000b003fa78b5d991mr23043411pgc.40.1654546201400; Mon, 06
 Jun 2022 13:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
In-Reply-To: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 6 Jun 2022 13:09:50 -0700
Message-ID: <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, 
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, 
 Jun Nakajima <jun.nakajima@intel.com>, dave.hansen@intel.com,
 ak@linux.intel.com, 
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=vannapurve@google.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
> Private memory map/unmap and conversion
> ---------------------------------------
> Userspace's map/unmap operations are done by fallocate() ioctl on the
> backing store fd.
>   - map: default fallocate() with mode=0.
>   - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
> The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
> secondary MMU page tables.
>
....
>    QEMU: https://github.com/chao-p/qemu/tree/privmem-v6
>
> An example QEMU command line for TDX test:
> -object tdx-guest,id=tdx \
> -object memory-backend-memfd-private,id=ram1,size=2G \
> -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
>

There should be more discussion around double allocation scenarios
when using the private fd approach. A malicious guest or buggy
userspace VMM can cause physical memory getting allocated for both
shared (memory accessible from host) and private fds backing the guest
memory.
Userspace VMM will need to unback the shared guest memory while
handling the conversion from shared to private in order to prevent
double allocation even with malicious guests or bugs in userspace VMM.

Options to unback shared guest memory seem to be:
1) madvise(.., MADV_DONTNEED/MADV_REMOVE) - This option won't stop
kernel from backing the shared memory on subsequent write accesses
2) fallocate(..., FALLOC_FL_PUNCH_HOLE...) - For file backed shared
guest memory, this option still is similar to madvice since this would
still allow shared memory to get backed on write accesses
3) munmap - This would give away the contiguous virtual memory region
reservation with holes in the guest backing memory, which might make
guest memory management difficult.
4) mprotect(... PROT_NONE) - This would keep the virtual memory
address range backing the guest memory preserved

ram_block_discard_range_fd from reference implementation:
https://github.com/chao-p/qemu/tree/privmem-v6 seems to be relying on
fallocate/madvise.

Any thoughts/suggestions around better ways to unback the shared
memory in order to avoid double allocation scenarios?

Regards,
Vishal

