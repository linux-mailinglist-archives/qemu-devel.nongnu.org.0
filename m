Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE960D17B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:19:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMcr-0004LY-8M; Tue, 25 Oct 2022 12:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1onMcU-0003ju-Du
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:17:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1onMcS-0005pN-NT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:17:38 -0400
Received: by mail-pj1-x102d.google.com with SMTP id l6so7735516pjj.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0XpehjN5/x0DVN6iNfQRcpwLRiHoknqSMi2DnBppXC4=;
 b=VTegWoMotPt2w65LyX5l1RfBFsrVct34KfNYTQclV1Ej8EpD0Aka6DhRqFqKKPkKYF
 dx/pMAu3a28hbLyvQafo+3Wa+3mCeMIJhF5AVwXriBoAuAKBIFTkfyEZGt3R9F9Nhi41
 fj+nZajeXUNM6G2OtS9Tq69y8zmBsHay0qJIu6C8XDsQnxvChs2zKzG+iHzQM3CemyK7
 rQ1rbv2xpfwgbK/hJO81F9yW0YMzSmbw6UXv81EZOUicFWm2Vd2NYV/mOhEHD+opJjML
 IMkSJQctzTXXbBbp4cSFHMIFqYkomesQTa0hCcAW0LxBYbC7hn0bynG64p0PfcuPbXmb
 uofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XpehjN5/x0DVN6iNfQRcpwLRiHoknqSMi2DnBppXC4=;
 b=t6yew2mgOcqoVBpQdbMuRDT566NLNqyczbb3TF7yijV1735sQBLQ4WFAIE7pxaKO1k
 AA1DkIS6x1zov5xP8GVjetvMc0VjYHSyFp/adfi5bcwV9dsuPf5XfEYttpb0F7HW1mux
 1gOaUN45uP//bfw2qfzMUAFRT0dZhWkpki8kxYV0shFnB5ybuF12/yqfOZQGdGXMHXwO
 2Wfj4EsSapchiom4KVo8M+9dya/RbPI55IgjvaPNU6yZxPYhUOpd61D2xAhSjv6E6M6S
 FOXvno8LxheXzVVxhB82LSHO+v58/pR2UBqxsVqSmFD09ueqJt2u3hTkOsIbswhcy+8/
 rGKg==
X-Gm-Message-State: ACrzQf3ETqvycB54U/U1HgcUon7EaeB8HG9ifC0T+pr0DzFUGcfOqazf
 /17yMTdBSIfGjaEdMsbSAMV62Q==
X-Google-Smtp-Source: AMsMyM738RdpBPHm9pvc30fi3c2/lYdgFkQc2nwAzBbq52uGbxkdpRe8GUTzQNa3Uoldv8m3HWsH3Q==
X-Received: by 2002:a17:903:41c7:b0:182:a32f:4db5 with SMTP id
 u7-20020a17090341c700b00182a32f4db5mr39384792ple.22.1666714654279; 
 Tue, 25 Oct 2022 09:17:34 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 b3-20020a1709027e0300b00186881e1feasm1399643plm.112.2022.10.25.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:17:33 -0700 (PDT)
Date: Tue, 25 Oct 2022 16:17:30 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <Y1gMGpWpzzA/AC//@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <CAFEAcA-=Sc9Sc4oLq13HAFW49ZBw8u6DtN7bf_vjVYX_AAaKSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=Sc9Sc4oLq13HAFW49ZBw8u6DtN7bf_vjVYX_AAaKSg@mail.gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022, Peter Maydell wrote:
> On Tue, 25 Oct 2022 at 16:21, Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index f3fa75649a78..975688912b8c 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6537,6 +6537,29 @@ array field represents return values. The userspace should update the return
> >  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
> >  spec refer, https://github.com/riscv/riscv-sbi-doc.
> >
> > +::
> > +
> > +               /* KVM_EXIT_MEMORY_FAULT */
> > +               struct {
> > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE (1 << 0)
> > +                       __u32 flags;
> > +                       __u32 padding;
> > +                       __u64 gpa;
> > +                       __u64 size;
> > +               } memory;
> > +
> > +If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the VCPU has
> > +encountered a memory error which is not handled by KVM kernel module and
> > +userspace may choose to handle it. The 'flags' field indicates the memory
> > +properties of the exit.
> > +
> > + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
> > +   private memory access when the bit is set. Otherwise the memory error is
> > +   caused by shared memory access when the bit is clear.
> > +
> > +'gpa' and 'size' indicate the memory range the error occurs at. The userspace
> > +may handle the error and return to KVM to retry the previous memory access.
> > +
> 
> What's the difference between this and a plain old MMIO exit ?
> Just that we can specify a wider size and some flags ?

KVM_EXIT_MMIO is purely for cases where there is no memslot.  KVM_EXIT_MEMORY_FAULT
will be used for scenarios where there is a valid memslot for a GPA, but for
whatever reason KVM cannot map the memslot into the guest.

In this series, the new exit type is use to handle guest-initiated conversions
between shared and private memory.  By design, conversion requires explicit action
from userspace, and so even though KVM has a valid memslot, KVM needs to exit to
userspace to effectively forward the conversion request to userspace.

Long term, I also hope to convert all guest-triggered -EFAULT paths to instead
return KVM_EXIT_MEMORY_FAULT.  At minimum, returning KVM_EXIT_MEMORY_FAULT instead
of -EFAULT will allow KVM to provide userspace with the "bad" GPA when something
goes sideways, e.g. if faulting in the page failed because there's no valid
userspace mapping.

There have also been two potential use cases[1][2], though they both appear to have
been abandoned, where userspace would do something more than just kill the guest
in response to KVM_EXIT_MEMORY_FAULT.

[1] https://lkml.kernel.org/r/20200617230052.GB27751@linux.intel.com
[2] https://lore.kernel.org/all/YKxJLcg%2FWomPE422@google.com

