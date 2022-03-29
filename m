Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE14EA3F9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 02:07:45 +0200 (CEST)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYzOh-0003Tc-L5
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 20:07:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYzLU-0002eZ-K0
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 20:04:24 -0400
Received: from [2607:f8b0:4864:20::536] (port=44558
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYzLS-0002Gc-SY
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 20:04:24 -0400
Received: by mail-pg1-x536.google.com with SMTP id c11so13375756pgu.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 17:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=etgjqyAwbvR6Km5d+2cDKN373f0iHJRr9ymO9u+KgK4=;
 b=G5YIvVl22ePZITTXQy7vowBlWgCkZizGIGOI6pI2XX9x6vtJv/N8rYqMnVC1NBJmDl
 Xi+sHsYUIN+SJvKP8OhZ+TiWYKsB4cnA6blgTh8kV07ztljdTDT58Zz7wNd5brW8jMKi
 MeGC0zhst3Ze45rOieg8y/L1qR1ehb0uYXPOVkW1do58sPgFqUFnszIPRO9ZxP9E/VDu
 Hg6Vj8ktwcYNsYL0mPC653HM7uXxVOtZT2l2L6hyenJnUzEd16GnIxOc9EHXvkyvvGnf
 OmD5GfIZ3n5oGbfX95H+OgOqSCiAjQRN+aczvRBQ7z8EFIt+C0RkUgE4xiw6oc4aMGhH
 c2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=etgjqyAwbvR6Km5d+2cDKN373f0iHJRr9ymO9u+KgK4=;
 b=2np/SUMnM8D9wKIrqaHF6HAiQkb2T26xh7p3uqc+a6nOlfANKIemlCk6XoqHnqrYxP
 WsYV0cLxNYLP6dkq2DTtYDLNiHqiQErvic8qBqVzBhVVuH+UB2STykLzayre+kQLsWXi
 Co/zpsra/X8KKXAFiI8v6o/OldcB/Tjx+4VH6/EUJeITqWqDfYLOzXJEIY9OIDOsdL8c
 mGM8vdAAQiOzoF+ScpRjJRZkTWbe5JkU2RKIzLj2fI7bWZxT8lMcXLhqDeGirLLT12V2
 HdDvL8NVEMJAGkndaIeRMfnhzgLI7E86ZL7x5VTQRyAFkvgoImyzvBM+IKNlwP4AptRp
 fxbg==
X-Gm-Message-State: AOAM531RB6sS/YPxJIyXoCU6DSMePdAwp/MC9YKzBMfLc6vxb9WDcsIq
 K+CxUuwu0PhnHmnMWI5XWhJiew==
X-Google-Smtp-Source: ABdhPJx8yKtkbTnvKDhEF6CrTpFMthUus1w5B4uh8qOQh+zUkITN5OLbQQgaCn3E+3ynmkMH71yJkQ==
X-Received: by 2002:a63:e545:0:b0:382:8dd9:a870 with SMTP id
 z5-20020a63e545000000b003828dd9a870mr11790668pgj.621.1648512260958; 
 Mon, 28 Mar 2022 17:04:20 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm14336170pgc.50.2022.03.28.17.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 17:04:20 -0700 (PDT)
Date: Tue, 29 Mar 2022 00:04:16 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: "Lutomirski, Andy" <luto@kernel.org>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 KVM list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YkJNAPPpdiL24kJF@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <CALCETrWk1Y47JQC=V028A7Tmc9776Oo4AjgwqRtd9K=XDh6=TA@mail.gmail.com>
 <7CCE5220-0ACF-48EE-9366-93CABDA91065@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7CCE5220-0ACF-48EE-9366-93CABDA91065@intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=seanjc@google.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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

On Mon, Mar 28, 2022, Nakajima, Jun wrote:
> > On Mar 28, 2022, at 1:16 PM, Andy Lutomirski <luto@kernel.org> wrote:
> > 
> > On Thu, Mar 10, 2022 at 6:09 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >> 
> >> This is the v5 of this series which tries to implement the fd-based KVM
> >> guest private memory. The patches are based on latest kvm/queue branch
> >> commit:
> >> 
> >>  d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
> > 
> > Can this series be run and a VM booted without TDX?  A feature like
> > that might help push it forward.
> > 
> > —Andy
> 
> Since the userspace VMM (e.g. QEMU) loses direct access to private memory of
> the VM, the guest needs to avoid using the private memory for (virtual) DMA
> buffers, for example. Otherwise, it would need to use bounce buffers, i.e. we
> would need changes to the VM. I think we can try that (i.e. add only bounce
> buffer changes). What do you think?

I would love to be able to test this series and run full-blown VMs without TDX or
SEV hardware.

The other option for getting test coverage is KVM selftests, which don't have an
existing guest that needs to be enlightened.  Vishal is doing work on that front,
though I think it's still in early stages.  Long term, selftests will also be great
for negative testing.

