Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B28457999
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 00:35:56 +0100 (CET)
Received: from localhost ([::1]:38644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moDQA-000871-Qx
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 18:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1moDNd-0007Ok-3c
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 18:33:17 -0500
Received: from [2607:f8b0:4864:20::831] (port=37447
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jgg@ziepe.ca>) id 1moDNa-0007x6-Td
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 18:33:16 -0500
Received: by mail-qt1-x831.google.com with SMTP id f20so11002806qtb.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 15:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YIQtmzLjEsgeZMQMOnkMzRwMWgRyVXZoeNdlFrk18qs=;
 b=NLLz2U5cbYEoorMYBXQrK8g/0dsQGOOIzTFzpIoM82ai9sEhm8aVRw+/BSYzFL+689
 BulZ2pbNGnI/4bphyGwK+LCcpSosFvZ+rw35XZRx6YXpkIQx8YxHYTN+q0oXMOqAVENc
 XB4JnHls4dkr5k7ZheHEl44EItXxSWqm6lSNgR62w1dbRoTG5C7zEC2oAW/D2bw78pDc
 zD/7I+T9RhLwq2MRwjtPcowgD2liuh3dxi/fvdWK1tLAharf0byCKhzAKJvZVM/E9sdk
 fVUUoRlZxW54VP8R/sKiLNvFzSEHme73UtzJ9W/Y3cYmh49+bmuoMo8qaW396gxyiZ79
 6rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YIQtmzLjEsgeZMQMOnkMzRwMWgRyVXZoeNdlFrk18qs=;
 b=DKif+retf40zMNkIdXjJCL0i+d2W8wZt2J1J3mB25sw+dUMhW/7wx5QTSqpVDvSSEw
 6vsT95k0bGzG0VdDhY+nsNy+3D080AepsFziuhjVBcHDjKKPRSotXVpsJZakGSqDk+CD
 2ohyE88D9GNC248NXQRJWxoYatTNvDu3QnoCGGtDZLGDEvJcX8cEU54hy9X6LUy8kd9r
 Wrz9ppZI26LW4zujKxCXufzf9+hnstLjLi9z03/8bm4kt1ccd1u54ucL1iiEms+brL7m
 SsVE9ltFefv8qYybSrTABDPQgcRLtuAhzxIjWw/ilsqDqVDGR9p7TMSE4DfypOpGA2lY
 wPLQ==
X-Gm-Message-State: AOAM531/NPouMfySxRr7mzMOYe2ED8b00DTNcLusrSNHdumnWzcX/XPR
 LALh/8Ec5DWmHpjltBHkpI5zvA==
X-Google-Smtp-Source: ABdhPJyxRDjxrzpShk1yUcPpFaeAg/9+/FV8kt7sx9ISnNgpRPG9gnZ2XXj45zOthyEGjNn5VI7NlA==
X-Received: by 2002:a05:622a:449:: with SMTP id
 o9mr10355315qtx.158.1637364793514; 
 Fri, 19 Nov 2021 15:33:13 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id s20sm626369qtc.75.2021.11.19.15.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 15:33:12 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1moDNY-00CyxZ-6v; Fri, 19 Nov 2021 19:33:12 -0400
Date: Fri, 19 Nov 2021 19:33:12 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211119233312.GO876299@ziepe.ca>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <YZf4aAlbyeWw8wUk@google.com> <20211119194746.GM876299@ziepe.ca>
 <YZgjc5x6FeBxOqbD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZgjc5x6FeBxOqbD@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::831; envelope-from=jgg@ziepe.ca;
 helo=mail-qt1-x831.google.com
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
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 10:21:39PM +0000, Sean Christopherson wrote:
> On Fri, Nov 19, 2021, Jason Gunthorpe wrote:
> > On Fri, Nov 19, 2021 at 07:18:00PM +0000, Sean Christopherson wrote:
> > > No ideas for the kernel API, but that's also less concerning since
> > > it's not set in stone.  I'm also not sure that dedicated APIs for
> > > each high-ish level use case would be a bad thing, as the semantics
> > > are unlikely to be different to some extent.  E.g. for the KVM use
> > > case, there can be at most one guest associated with the fd, but
> > > there can be any number of VFIO devices attached to the fd.
> > 
> > Even the kvm thing is not a hard restriction when you take away
> > confidential compute.
> > 
> > Why can't we have multiple KVMs linked to the same FD if the memory
> > isn't encrypted? Sure it isn't actually useful but it should work
> > fine.
> 
> Hmm, true, but I want the KVM semantics to be 1:1 even if memory
> isn't encrypted.

That is policy and it doesn't belong hardwired into the kernel.

Your explanation makes me think that the F_SEAL_XX isn't defined
properly. It should be a userspace trap door to prevent any new
external accesses, including establishing new kvms, iommu's, rdmas,
mmaps, read/write, etc.

> It's not just avoiding the linked list, there's a trust element as
> well.  E.g. in the scenario where a device can access a confidential
> VM's encrypted private memory, the guest is still the "owner" of the
> memory and needs to explicitly grant access to a third party,
> e.g. the device or perhaps another VM.

Authorization is some other issue - the internal kAPI should be able
to indicate it is secured memory and the API user should do whatever
dance to gain access to it. Eg for VFIO ask the realm manager to
associate the pci_device with the owner realm.

Jason

