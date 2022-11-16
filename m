Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C935A62C82D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:50:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNT5-0000Mw-VD; Wed, 16 Nov 2022 13:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovNT1-0000LM-AF
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:49:01 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ovNSs-00005J-FE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:48:52 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so3206244pji.1
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A0w6P3/5rWNmrPimfeWShNgQxfD7eWOB8psbtgB4eNM=;
 b=iuHU2XySbRBXDBvmb7KGdjsTrJ11MtKm8XUWbJgiH+mJZH0mrNKnmVkYWIqEN8KH+D
 TMTSgskSxS+dz6pqJQ/6lU5YOrdG2ZlIZWDOaRJRiQwsbQA3PrerGAmObwm4ynhLdSAK
 ipQyS23YgpxwcwZ6vh4k2Bq/MDUW0MakaENRTi4n4z7trqezhQAU1VBvvRliz6hMutEA
 9nByJ3f7EiBHZeDsD30/pNhrYplPoCDi15C49ph/4Z5Ug6emFwiauN/3keUjTSc8xjjS
 9rhI8o2gCdwKZQMaSLBrQFcQ5PC0p5wqf3PICwkpXgJE4dUBiCSgdG/Zg1bcsS/uJXqa
 0yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0w6P3/5rWNmrPimfeWShNgQxfD7eWOB8psbtgB4eNM=;
 b=ZLtWEs9VOZ+w+cHt4INT0QjaQpssx2ngVd8yBCyaGQRBsj4g/D6smnT0/XtkK9ku6r
 P2bZWdWL1VMrHG+mm93aFVYtQbHNa+IKMUZ0GOlYgg+SF1UFfNgUc5/n3FkXmxJuRCRL
 EIUclf9frVELa7phsAzftX0WtpQ3Hj9TIneXjy0vC9uGXkQIwSFKsst3dc1tA7nGq8Di
 bHbdovDEB9EzbztKtkw+//OSlPr0zna1CmVAjKYv4vgkFLAfoBzSDqrCZLtmAgl+8zPD
 IzYQRxCjF/ZFihanwhhkKk3tEw5wkHWGsNgCNREqlVd0FslZxlm4vbcsMiFLOuIOI8KR
 ODsw==
X-Gm-Message-State: ANoB5pnNbapkajBghcxTSBH1qhGSFif3bQKaxgUSmT/ozP1FTz2UuAMJ
 1Bwtw3YkVYno9lCHKP8dM7wx3g==
X-Google-Smtp-Source: AA0mqf7gsXMWPLCwPxYnb+HvqYNLX3WPvDWV8mKDKQpAZsMJhL2t5iqRN/vftj6zV72w0hUj24psag==
X-Received: by 2002:a17:90b:3c0d:b0:20d:478a:9d75 with SMTP id
 pb13-20020a17090b3c0d00b0020d478a9d75mr5030085pjb.149.1668624527166; 
 Wed, 16 Nov 2022 10:48:47 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 7-20020a621507000000b0056c0b98617esm11265827pfv.0.2022.11.16.10.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:48:46 -0800 (PST)
Date: Wed, 16 Nov 2022 18:48:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, Linux API <linux-api@vger.kernel.org>,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
 Michael Roth <michael.roth@amd.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <songmuchun@bytedance.com>, Wei W Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <Y3Uwi2lc4NDrdzML@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <2e252f4f-7d45-42ac-a88f-fa8045fe3748@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e252f4f-7d45-42ac-a88f-fa8045fe3748@app.fastmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102d.google.com
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

On Wed, Nov 16, 2022, Andy Lutomirski wrote:
> 
> 
> On Tue, Oct 25, 2022, at 8:13 AM, Chao Peng wrote:
> > diff --git a/Documentation/virt/kvm/api.rst 
> > b/Documentation/virt/kvm/api.rst
> > index f3fa75649a78..975688912b8c 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6537,6 +6537,29 @@ array field represents return values. The 
> > userspace should update the return
> >  values of SBI call before resuming the VCPU. For more details on 
> > RISC-V SBI
> >  spec refer, https://github.com/riscv/riscv-sbi-doc.
> > 
> > +::
> > +
> > +		/* KVM_EXIT_MEMORY_FAULT */
> > +		struct {
> > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
> > +			__u32 flags;
> > +			__u32 padding;
> > +			__u64 gpa;
> > +			__u64 size;
> > +		} memory;
> > +
> 
> Would it make sense to also have a field for the access type (read, write,
> execute, etc)?  I realize that shared <-> private conversion doesn't strictly
> need this, but it seems like it could be useful for logging failures and also
> for avoiding a second immediate fault if the type gets converted but doesn't
> have the right protection yet.

I don't think a separate field is necessary, that info can be conveyed via flags.
Though maybe we should go straight to a u64 for flags.  Hmm, and maybe avoid bits
0-3 so that if/when RWX info is conveyed the flags can align with
PROT_{READ,WRITE,EXEC} and the EPT flags, e.g.

	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)

> (Obviously, if this were changed, KVM would need the ability to report that
> it doesn't actually know the mode.)
> 
> --Andy

