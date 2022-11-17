Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D662DF43
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 16:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovgWE-0005Ay-RP; Thu, 17 Nov 2022 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovgW8-0005Ag-AE
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:09:28 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovgW5-0002wg-K9
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 10:09:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id i12so472754wrb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBusLlaaNz/2IZSIaqYfgs6/xdT0ROMSHKfiBIhkdsE=;
 b=NfpbBsBQgrbY75WiJ016e0JTmdGmoYyca7I/NCnJZhfmCCTZjayS9RdRKm4JfS2fcJ
 fVeXHWNZWpWqOxuAKjFqL87nRYvfdIeS/OGZksL27R8rb8hVNRwXGKXYPRUYovuyOhTQ
 2KdieC+Lyx97mRgkXg4lB53Eby8Njkv0vJYLjpXxSam8mrjRDYlb2SWZOAdruhuNiKch
 oimt+1rPmL9CFVQctuwqINnIzoMMDOOHZx1qNiF5cxB4yWYef69Ku4OJl58DzQ7tLFDO
 9GvANFdmzddlRJJK66Ax9Y8b7HOjXFK6WEOP7Gtp/3GhVHUbB2438tgaxi1Vg2RVLoXk
 l1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBusLlaaNz/2IZSIaqYfgs6/xdT0ROMSHKfiBIhkdsE=;
 b=VxCtvOWdyZufMEFVDWb97bpzwJUoZVCObXV1v6FZ9Tdf9Pu0nEGHTPG/gsyXwiePPW
 vpskfmoDlTL1JOPqmdf6ASlQMkX/MqB747owB5RDHLhkK+hzqfP1YvgUclEZZiyq4g6W
 T2dhRPKzJngoXu3qtCQwsGxiQS0KFcyZlvEk3UWpWGpIhwzhJ6h2gD0Y1BxafzLqdVRi
 x5hya7GTdzcCJdNWuhFmcXbQ38ROQSsWLpB6BJj7GaS5n0D+3xRuzZei6IYxlzTTUXhE
 cQwT4wHVBNWTPu1R9CtEKxR9HhtgZyTZi0DN3D698dc3OemHC2NVZwoYT8scbubhhjck
 LmDA==
X-Gm-Message-State: ANoB5pkQBnp/SFuBvjR7jWAZaY03Yo1smmjG1n2HttJG1vYBrBInSGPk
 2FTBraItXGUaMQ8sRybCPesrrQ==
X-Google-Smtp-Source: AA0mqf7vvxL/xmrC6/yE9sA9AOuHHRmrasa80rT6NKUjVl0i95jt04rAjvEUusssVu8F+bFzV97rWw==
X-Received: by 2002:adf:efd2:0:b0:236:e5a2:4f66 with SMTP id
 i18-20020adfefd2000000b00236e5a24f66mr1861434wrp.357.1668697761285; 
 Thu, 17 Nov 2022 07:09:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r10-20020adfce8a000000b00241b371d73esm1255319wrn.77.2022.11.17.07.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:09:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5177C1FFB7;
 Thu, 17 Nov 2022 15:09:20 +0000 (GMT)
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <87cz9o9mr8.fsf@linaro.org> <20221116031441.GA364614@chaop.bj.intel.com>
 <87mt8q90rw.fsf@linaro.org> <20221117134520.GD422408@chaop.bj.intel.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim
 Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>, "J .
 Bruce Fields" <bfields@fieldses.org>, Andrew Morton
 <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Steven Price <steven.price@arm.com>, "Maciej S .
 Szmigiero" <mail@maciej.szmigiero.name>, Vlastimil Babka <vbabka@suse.cz>,
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang
 <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 tabba@google.com, Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Date: Thu, 17 Nov 2022 15:08:17 +0000
In-reply-to: <20221117134520.GD422408@chaop.bj.intel.com>
Message-ID: <87a64p8vof.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Chao Peng <chao.p.peng@linux.intel.com> writes:

> On Wed, Nov 16, 2022 at 07:03:49PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Chao Peng <chao.p.peng@linux.intel.com> writes:
>>=20
>> > On Tue, Nov 15, 2022 at 04:56:12PM +0000, Alex Benn=C3=A9e wrote:
>> >>=20
>> >> Chao Peng <chao.p.peng@linux.intel.com> writes:
>> >>=20
>> >> > This new KVM exit allows userspace to handle memory-related errors.=
 It
>> >> > indicates an error happens in KVM at guest memory range [gpa, gpa+s=
ize).
>> >> > The flags includes additional information for userspace to handle t=
he
>> >> > error. Currently bit 0 is defined as 'private memory' where '1'
>> >> > indicates error happens due to private memory access and '0' indica=
tes
>> >> > error happens due to shared memory access.
>> >> >
>> >> > When private memory is enabled, this new exit will be used for KVM =
to
>> >> > exit to userspace for shared <-> private memory conversion in memory
>> >> > encryption usage. In such usage, typically there are two kind of me=
mory
>> >> > conversions:
>> >> >   - explicit conversion: happens when guest explicitly calls into K=
VM
>> >> >     to map a range (as private or shared), KVM then exits to usersp=
ace
>> >> >     to perform the map/unmap operations.
>> >> >   - implicit conversion: happens in KVM page fault handler where KVM
>> >> >     exits to userspace for an implicit conversion when the page is =
in a
>> >> >     different state than requested (private or shared).
>> >> >
>> >> > Suggested-by: Sean Christopherson <seanjc@google.com>
>> >> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
>> >> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
>> >> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
>> >> > ---
>> >> >  Documentation/virt/kvm/api.rst | 23 +++++++++++++++++++++++
>> >> >  include/uapi/linux/kvm.h       |  9 +++++++++
>> >> >  2 files changed, 32 insertions(+)
>> >> >
>> >> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kv=
m/api.rst
>> >> > index f3fa75649a78..975688912b8c 100644
>> >> > --- a/Documentation/virt/kvm/api.rst
>> >> > +++ b/Documentation/virt/kvm/api.rst
>> >> > @@ -6537,6 +6537,29 @@ array field represents return values. The us=
erspace should update the return
>> >> >  values of SBI call before resuming the VCPU. For more details on R=
ISC-V SBI
>> >> >  spec refer, https://github.com/riscv/riscv-sbi-doc.
>> >> >=20=20
>> >> > +::
>> >> > +
>> >> > +		/* KVM_EXIT_MEMORY_FAULT */
>> >> > +		struct {
>> >> > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
>> >> > +			__u32 flags;
>> >> > +			__u32 padding;
>> >> > +			__u64 gpa;
>> >> > +			__u64 size;
>> >> > +		} memory;
>> >> > +
>> >> > +If exit reason is KVM_EXIT_MEMORY_FAULT then it indicates that the=
 VCPU has
>> >> > +encountered a memory error which is not handled by KVM kernel modu=
le and
>> >> > +userspace may choose to handle it. The 'flags' field indicates the=
 memory
>> >> > +properties of the exit.
>> >> > +
>> >> > + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is ca=
used by
>> >> > +   private memory access when the bit is set. Otherwise the memory=
 error is
>> >> > +   caused by shared memory access when the bit is clear.
>> >>=20
>> >> What does a shared memory access failure entail?
>> >
>> > In the context of confidential computing usages, guest can issue a
>> > shared memory access while the memory is actually private from the host
>> > point of view. This exit with bit 0 cleared gives userspace a chance to
>> > convert the private memory to shared memory on host.
>>=20
>> I think this should be explicit rather than implied by the absence of
>> another flag. Sean suggested you might want flags for RWX failures so
>> maybe something like:
>>=20
>> 	KVM_MEMORY_EXIT_SHARED_FLAG_READ	(1 << 0)
>> 	KVM_MEMORY_EXIT_SHARED_FLAG_WRITE	(1 << 1)
>> 	KVM_MEMORY_EXIT_SHARED_FLAG_EXECUTE	(1 << 2)
>>         KVM_MEMORY_EXIT_FLAG_PRIVATE            (1 << 3)
>
> Yes, but I would not add 'SHARED' to RWX, they are not share memory
> specific, private memory can also set them once introduced.

OK so how about:

 	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
 	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
 	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)
        KVM_MEMORY_EXIT_FLAG_SHARED     (1 << 3)
        KVM_MEMORY_EXIT_FLAG_PRIVATE    (1 << 4)

>
> Thanks,
> Chao
>>=20
>> which would allow you to signal the various failure modes of the shared
>> region, or that you had accessed private memory.
>>=20
>> >
>> >>=20
>> >> If you envision any other failure modes it might be worth making it
>> >> explicit with additional flags.
>> >
>> > Sean mentioned some more usages[1][]2] other than the memory conversion
>> > for confidential usage. But I would leave those flags being added in t=
he
>> > future after those usages being well discussed.
>> >
>> > [1] https://lkml.kernel.org/r/20200617230052.GB27751@linux.intel.com
>> > [2] https://lore.kernel.org/all/YKxJLcg%2FWomPE422@google.com
>> >
>> >> I also wonder if a bitmask makes sense if
>> >> there can only be one reason for a failure? Maybe all that is needed =
is
>> >> a reason enum?
>> >
>> > Tough we only have one reason right now but we still want to leave room
>> > for future extension. Enum can express a single value at once well but
>> > bitmask makes it possible to express multiple orthogonal flags.
>>=20
>> I agree if multiple orthogonal failures can occur at once a bitmask is
>> the right choice.
>>=20
>> >
>> > Chao
>> >>=20
>> >> > +
>> >> > +'gpa' and 'size' indicate the memory range the error occurs at. Th=
e userspace
>> >> > +may handle the error and return to KVM to retry the previous memor=
y access.
>> >> > +
>> >> >  ::
>> >> >=20=20
>> >> >      /* KVM_EXIT_NOTIFY */
>> >> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> >> > index f1ae45c10c94..fa60b032a405 100644
>> >> > --- a/include/uapi/linux/kvm.h
>> >> > +++ b/include/uapi/linux/kvm.h
>> >> > @@ -300,6 +300,7 @@ struct kvm_xen_exit {
>> >> >  #define KVM_EXIT_RISCV_SBI        35
>> >> >  #define KVM_EXIT_RISCV_CSR        36
>> >> >  #define KVM_EXIT_NOTIFY           37
>> >> > +#define KVM_EXIT_MEMORY_FAULT     38
>> >> >=20=20
>> >> >  /* For KVM_EXIT_INTERNAL_ERROR */
>> >> >  /* Emulate instruction failed. */
>> >> > @@ -538,6 +539,14 @@ struct kvm_run {
>> >> >  #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>> >> >  			__u32 flags;
>> >> >  		} notify;
>> >> > +		/* KVM_EXIT_MEMORY_FAULT */
>> >> > +		struct {
>> >> > +#define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
>> >> > +			__u32 flags;
>> >> > +			__u32 padding;
>> >> > +			__u64 gpa;
>> >> > +			__u64 size;
>> >> > +		} memory;
>> >> >  		/* Fix the size of the union. */
>> >> >  		char padding[256];
>> >> >  	};
>> >>=20
>> >>=20
>> >> --=20
>> >> Alex Benn=C3=A9e
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

