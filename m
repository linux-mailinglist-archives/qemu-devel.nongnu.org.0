Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A984576F7
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:20:37 +0100 (CET)
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9R5-00066Y-OZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mo9Ok-0005Ob-St
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:18:10 -0500
Received: from [2607:f8b0:4864:20::62b] (port=34548
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mo9Oh-0001jD-NH
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:18:09 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y8so8870463plg.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 11:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g/YNskCC8H0pIrRty3bOxTWWIwZezM/dF8uipgTGVfY=;
 b=CNOzkM2IBiGjqfRhSRYpA8+aOR9+w9kYa1mO17Fub/lEhXiodlJQQbYvAU23XPSB80
 zEPvGqgAhRJ6Ac9fwqtRfF+TRjsCcSQq5iPvk/1Ntl7JnciUfiF+ZDILvu0CHa2qGnpl
 ujk4JKugJX/qAenq8IEMYsdgtnjBtqpUR91i9SBdt8L7pGQrEmbiL4/gffr02rrMSJmz
 6yzyBXWa8jt0zBA9CA494YG0zM4LbpueA4wdoIYm5oesyznYRillp/PJwv9KFNX7usVm
 7PTxEHROAZHj6Qj+AaUATSaSV1EpFTybV/lhNnk/ZpIoUTNLB6A6TpiLrhOQ7Y6XFsOL
 ut9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/YNskCC8H0pIrRty3bOxTWWIwZezM/dF8uipgTGVfY=;
 b=IyKO95NQbS8hHxIJifLH1XcTZ0F+UYhZCR94FK8jKQnhIlOUF3M+MLibejseozPj5I
 SfI4AFJSc+8vGXBTfYeaLBC29uVDb05W7Eu1NkC5byKrF4TkW58kp22IlhiSGK59k8D6
 cJ6JvT0rfCsmKKXe9Pg3jEMPIhoR88H7j12nuUm6x4eO/yoz8OJSpjPs9TT6Vj8SLU2m
 n9bpE9Gmb4Ljjg9ChD1/zbXPamH8CJe5eb0ZqRY9G8z1keOD+yYGAkaRHSLPu5iwQ9al
 d72HUni2zCfLsKPljS7pkn5URvpmPMm+AQgVlRmg6YFCbm3Im4YWgDjnFjfbhkxCzqmJ
 mX6Q==
X-Gm-Message-State: AOAM531urvKcTUS47xc4hB7c7hSBPz11VnEzvg8rXaUhh2turYOnj0rH
 omMS2s0bdnhCDF8vn1/yUBLIWA==
X-Google-Smtp-Source: ABdhPJxLPt6CntmozfnHLwXqny0KwCU2vgLZSjJXfMA4iRfgP9luxNnbV0AtIM87S/ieQOg/r1KAAQ==
X-Received: by 2002:a17:902:b28a:b0:142:3e17:38d8 with SMTP id
 u10-20020a170902b28a00b001423e1738d8mr80638372plr.56.1637349484440; 
 Fri, 19 Nov 2021 11:18:04 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id f15sm426180pfe.171.2021.11.19.11.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 11:18:03 -0800 (PST)
Date: Fri, 19 Nov 2021 19:18:00 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Chao Peng <chao.p.peng@linux.intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <YZf4aAlbyeWw8wUk@google.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Fri, Nov 19, 2021, David Hildenbrand wrote:
> On 19.11.21 16:19, Jason Gunthorpe wrote:
> > As designed the above looks useful to import a memfd to a VFIO
> > container but could you consider some more generic naming than calling
> > this 'guest' ?
> 
> +1 the guest terminology is somewhat sob-optimal.

For the F_SEAL part, maybe F_SEAL_UNMAPPABLE?

No ideas for the kernel API, but that's also less concerning since it's not set
in stone.  I'm also not sure that dedicated APIs for each high-ish level use case
would be a bad thing, as the semantics are unlikely to be different to some extent.
E.g. for the KVM use case, there can be at most one guest associated with the fd,
but there can be any number of VFIO devices attached to the fd.

