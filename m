Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41C58806C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 18:40:58 +0200 (CEST)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIuwy-0004BN-VL
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 12:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oIuv9-00025v-DH
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:39:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oIuv7-0000F4-Rg
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 12:39:03 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso16159763pjq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YLolmPC/4W6Ekt5KXSGhTlaQ+SvTrN9uL1784FHTktA=;
 b=DEczoNtVTMwIsaw8yg11wYkQuI9LeTuQwFeOQ0oJ03m1tMW/YgHdOnTv17v8+A6WTV
 U7hpMystc0MLLmDXYDMaROWkoGrECN3+IY7Ia+Z09cQyp/+2thONhPGLIYnqECJRrXhr
 dDHRlXhlBA0o0w24sHNoK99DkncCME85F/XcNTjXnZbY1/vtUg34rxTUMG/OWYQ4HMcI
 iIFe/Qw/lNcBgMnxPgPuAhy90CFyCy84wOdE8NkRPB91ulC5zTuJcdVgjk8H0EgOjoUm
 FnlRd5MiMQxVvv/M1kuZRL91q7QvdBIT05QOREIPMw2HWyehKvsTbH9WC464J4D8ov37
 YsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YLolmPC/4W6Ekt5KXSGhTlaQ+SvTrN9uL1784FHTktA=;
 b=yrCz9oddFcrPZijHXGDVKho2CK1HU1iNi0sp8Waw4x9rcRixfJUyGOC3Fks1DEXzHI
 rN28KgQ2O6+O4l8sKOoIVdH8j3aoRzfuIvzXN3p4zIpJnFTHDLnz4DguZLRZLhTbgA6S
 Ynfjm/PFeFYv34GAMdVLmdMf60dgaT4qH0ES70qMg7c4jVrIyzyS6G8y+iUajxUgVZL+
 a+d3nYApF44EOugV7pewlfOCpq7uZ3slNUAc0UQBBL0Zwka9y+roJ3FdlemHqPLhOITG
 BRGepyjB2WTQ/0sLRQBxpwauNzZj/daRPCs87Bq0Dm87tbFT698oDM2EgSEarVSbhTsX
 Gd8g==
X-Gm-Message-State: ACgBeo2Cgfx6aaDK2mYjKXcwVfWOCB0YAH4+MvOMsEIOuahdTdTIcuEP
 ohZ3AVUchWD2GimHW0tHs79+bA==
X-Google-Smtp-Source: AA6agR5iAjFP2q7X1PbZvwrW6P6B4ILkh92ieVBGwE4LPz6Qma2k0ZREMBEhxOJKazpAhnjrSGkWTg==
X-Received: by 2002:a17:902:dac6:b0:16d:bdf5:7084 with SMTP id
 q6-20020a170902dac600b0016dbdf57084mr22165713plx.55.1659458340177; 
 Tue, 02 Aug 2022 09:39:00 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 l15-20020a17090aec0f00b001f216407204sm11136513pjy.36.2022.08.02.09.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 09:38:59 -0700 (PDT)
Date: Tue, 2 Aug 2022 16:38:55 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wei Wang <wei.w.wang@linux.intel.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <YulTH7bL4MwT5v5K@google.com>
References: <36e671d2-6b95-8e4f-c2ac-fee4b2670c6e@amd.com>
 <20220720150706.GB124133@chaop.bj.intel.com>
 <d0fd229d-afa6-c66d-3e55-09ac5877453e@amd.com>
 <YtgrkXqP/GIi9ujZ@google.com>
 <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
 <20220721092906.GA153288@chaop.bj.intel.com>
 <YtmT2irvgInX1kPp@google.com>
 <20220725130417.GA304216@chaop.bj.intel.com>
 <YuQ64RgWqdoAAGdY@google.com> <Yuh0ikhoh+tCK6VW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yuh0ikhoh+tCK6VW@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102d.google.com
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

On Tue, Aug 02, 2022, Sean Christopherson wrote:
> I think we should avoid UNMAPPABLE even on the KVM side of things for the core
> memslots functionality and instead be very literal, e.g.
> 
> 	KVM_HAS_FD_BASED_MEMSLOTS
> 	KVM_MEM_FD_VALID
> 
> We'll still need KVM_HAS_USER_UNMAPPABLE_MEMORY, but it won't be tied directly to
> the memslot.  Decoupling the two thingis will require a bit of extra work, but the
> code impact should be quite small, e.g. explicitly query and propagate
> MEMFILE_F_USER_INACCESSIBLE to kvm_memory_slot to track if a memslot can be private.
> And unless I'm missing something, it won't require an additional memslot flag.
> The biggest oddity (if we don't also add KVM_MEM_PRIVATE) is that KVM would
> effectively ignore the hva for fd-based memslots for VM types that don't support
> private memory, i.e. userspace can't opt out of using the fd-based backing, but that
> doesn't seem like a deal breaker.

Hrm, but basing private memory on top of a generic FD_VALID would effectively require
shared memory to use hva-based memslots for confidential VMs.  That'd yield a very
weird API, e.g. non-confidential VMs could be backed entirely by fd-based memslots,
but confidential VMs would be forced to use hva-based memslots.

Ignore this idea for now.  If there's an actual use case for generic fd-based memory
then we'll want a separate flag, fd, and offset, i.e. that support could be added
independent of KVM_MEM_PRIVATE.

