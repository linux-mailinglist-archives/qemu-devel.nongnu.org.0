Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD866E4DC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHpiA-0000wZ-OI; Tue, 17 Jan 2023 12:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pHpi8-0000w2-Il
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:25:24 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1pHpi6-00071v-Pe
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:25:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso34760586pjf.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oPCKpcym2RW5d35rmFIPP7PcNPID9DHF3zaB9zUqfc0=;
 b=fcIljTThBG4xJap5TcGlXLzzw36TVvznNFdH4K5cV1wgP0TBEN+a0DD1GCYhRROsCO
 QvjnEf/w+v2arlNJbI9HWsv3aQkGE66ZYpTq2jVV7H8jTKB+jcivNkBG1DLGh2COfKTX
 pweZYAuWKUG+YbRSPiUyMiUsIhMoDelNa4TCm0Xonr0YcRslVr+wkYXPREIFWc5njYN5
 hleDjpP/fD2PR+Pk217/hDlyN417xQoAuBfDpMCd7cMkK5+rXFZvrG6QdKzfXmWAaGuZ
 MtZaFsL+TjIMHfkIcKjhxx6/QR2rCC95vb8NVwOqOTD6jTRuiCKfm4a07+k8PrsQ0gnu
 +dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oPCKpcym2RW5d35rmFIPP7PcNPID9DHF3zaB9zUqfc0=;
 b=ttYEQJUG5E4OxoNe5I0xKKPasHC76Ri/R8XE8mcaKeLCoPTrZ/YE1vRYKmxWjshR35
 R0j9ujUQGFukGs/lIlrcmXGvKdXSWqbg0d4AGDXAHZAMax0x9pX1HGznHl6Q0VhNmwIy
 Ao1XKqVxvFY+5beffHwH4TSu1HKgksVhxOvKi8YbJC15GOIuqmDI8xqytQL+RJnJWMBG
 aD8Is93iWqQI4lexanX3PWfevRxDvSYc8ngWdemZwfut60zQ03gQRuEB6eBmT11tQUqW
 4KgTov9m++CadNVA+pyquZyWSER6sSftASPNKscFb5WpBD+6eeOX9nR2J1IvMgg3n1ra
 lXXg==
X-Gm-Message-State: AFqh2krUT7hzrhmQOm1Q9ue9X3R6ch7EmxIO+EVTlvRNi9Z0EnXVATRH
 rvRCcqBU5LBkTRYPEvglGW6ghg==
X-Google-Smtp-Source: AMrXdXvUnfK+nwEzio3X173A3OOI+axnR8EWU2P/trlYbT/Eyg2+Qv0Pg0jRmQ5K8mkAb8pmdGJXpw==
X-Received: by 2002:a05:6a20:8f02:b0:b8:c646:b0e2 with SMTP id
 b2-20020a056a208f0200b000b8c646b0e2mr385151pzk.3.1673976320986; 
 Tue, 17 Jan 2023 09:25:20 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b0022960d00017sm4505994pjb.22.2023.01.17.09.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:25:20 -0800 (PST)
Date: Tue, 17 Jan 2023 17:25:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <Y8bZ/J98V5i3wG/v@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <c25f1f8c-f7c0-6a96-cd67-260df47f79a9@linux.intel.com>
 <20230117133015.GE273037@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117133015.GE273037@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 17, 2023, Chao Peng wrote:
> On Tue, Jan 17, 2023 at 11:21:10AM +0800, Binbin Wu wrote:
> > 
> > On 12/2/2022 2:13 PM, Chao Peng wrote:
> > > In confidential computing usages, whether a page is private or shared is
> > > necessary information for KVM to perform operations like page fault
> > > handling, page zapping etc. There are other potential use cases for
> > > per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > > or exec-only, etc.) without having to modify memslots.
> > > 
> > > Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> > > userspace to operate on the per-page memory attributes.
> > >    - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> > >      a guest memory range.
> > >    - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> > >      memory attributes.
> > > 
> > > KVM internally uses xarray to store the per-page memory attributes.
> > > 
> > > Suggested-by: Sean Christopherson <seanjc@google.com>
> > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com/
> > > ---
> > >   Documentation/virt/kvm/api.rst | 63 ++++++++++++++++++++++++++++
> > >   arch/x86/kvm/Kconfig           |  1 +
> > >   include/linux/kvm_host.h       |  3 ++
> > >   include/uapi/linux/kvm.h       | 17 ++++++++
> > 
> > Should the changes introduced in this file also need to be added in
> > tools/include/uapi/linux/kvm.h ?
> 
> Yes I think.

I'm not sure how Paolo or others feel, but my preference is to never update KVM's
uapi headers in tools/ in KVM's tree.  Nothing KVM-related in tools/ actually
relies on the headers being copied into tools/, e.g. KVM selftests pulls KVM's
headers from the .../usr/include/ directory that's populated by `make headers_install`.

Perf's tooling is what actually "needs" the headers to be copied into tools/, so
my preference is to let the tools/perf maintainers deal with the headache of keeping
everything up-to-date.

> But I'm hesitate to include in this patch or not. I see many commits sync
> kernel kvm.h to tools's copy. Looks that is done periodically and with a
> 'pull' model.

