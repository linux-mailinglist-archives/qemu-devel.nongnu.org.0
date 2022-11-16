Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A062C779
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovMxR-0003nQ-U3; Wed, 16 Nov 2022 13:16:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1ovMxO-0003kA-Nl
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:16:18 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1ovMxM-0008D5-JE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:16:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D992B81E4F;
 Wed, 16 Nov 2022 18:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95388C433D7;
 Wed, 16 Nov 2022 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668622570;
 bh=HzuBDu3c95vDubumkqmlUpDyU7sgxHKyh2YYcB7elbo=;
 h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
 b=tbSKt+iS+ArJZH7FJKEexbX35zrcPf5QqKW8WsaNMDoUMljvV4CnKDVuRLpX9W2iv
 15K3gQ6Sazx5/d5rYurnP+MMEMRjokB86JMqO3jOjCTCB8z1pvbGY3dv7FCI9nP1ps
 rAEqZZRiMjfiisvPGNC3vjIX64/k/R7N8dDCBRgZdkSVw8R+ldRw/X2cZB5oDfAJyC
 rhtRTHH8ACQoCJlnFKbO7SInkxlE5Bwp3USwXCxYvVZhKBJHumvuSoKAH+AvNDoq6w
 auk1tOJXDeTflHsBnt8/O1XvrvlGLzkF5hppy/IoFox5xibLs0oERMPaSFZlr9/Px0
 8Dh3Hn3B1OpTw==
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 6393627C0054;
 Wed, 16 Nov 2022 13:16:07 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute2.internal (MEProxy); Wed, 16 Nov 2022 13:16:07 -0500
X-ME-Sender: <xms:5Sh1Y1NrfbI5X60nb4Gnx7ZV-ilL_3Li9-02p3BGix6vTEUY6DE_ow>
 <xme:5Sh1Y39gTeCLKOCzug-TrCeNVC4YoC8WfbmUemSekyuZO7jW0yxaosHjfxs2FreUr
 1Wmi2-yJfT7zuogWes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ugihucfnuhhtohhmihhrshhkihdfuceolhhuthhosehkvghrnhgvlhdrohhrgheqnecugg
 ftrfgrthhtvghrnhepgedugedtledtieduteffveevhfefheeuhfegfeduvdeltdeugeet
 veeliedvfeehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguhidomhgvshhmthhprghu
 thhhphgvrhhsohhnrghlihhthidqudduiedukeehieefvddqvdeifeduieeitdekqdhluh
 htoheppehkvghrnhgvlhdrohhrgheslhhinhhugidrlhhuthhordhush
X-ME-Proxy: <xmx:5Sh1Y0SIGBRWjHPgw0gZVUynVki-ebrw0n7pcfImaqgmn1uZIAHRmQ>
 <xmx:5Sh1YxuJcnTST-m2004h2nObDbtvT6QkQqCgfbQ9D9aR2LZz9UsGMw>
 <xmx:5Sh1Y9dmGoebp-r9bA8soBDwFTUbJiblLXWqMZC-TzWcIOk-u2j3Lw>
 <xmx:5yh1Y1ZRsN15NhtPIZ3lY35CZ-2Br2ATLP2xtPKtZnCXnnhu5KIb2_qAs6M>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4E7E831A0063; Wed, 16 Nov 2022 13:16:05 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <2e252f4f-7d45-42ac-a88f-fa8045fe3748@app.fastmail.com>
In-Reply-To: <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
Date: Wed, 16 Nov 2022 10:15:44 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Chao Peng" <chao.p.peng@linux.intel.com>,
 "kvm list" <kvm@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, "Linux API" <linux-api@vger.kernel.org>,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: "Paolo Bonzini" <pbonzini@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Sean Christopherson" <seanjc@google.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "Wanpeng Li" <wanpengli@tencent.com>,
 "Jim Mattson" <jmattson@google.com>, "Joerg Roedel" <joro@8bytes.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Hugh Dickins" <hughd@google.com>,
 "Jeff Layton" <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Shuah Khan" <shuah@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Steven Price" <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Vishal Annapurve" <vannapurve@google.com>,
 "Yu Zhang" <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, "Dave Hansen" <dave.hansen@intel.com>,
 "Andi Kleen" <ak@linux.intel.com>,
 "David Hildenbrand" <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 "Quentin Perret" <qperret@google.com>, "Fuad Tabba" <tabba@google.com>,
 "Michael Roth" <michael.roth@amd.com>, "Michal Hocko" <mhocko@suse.com>,
 "Muchun Song" <songmuchun@bytedance.com>,
 "Wei W Wang" <wei.w.wang@intel.com>
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Content-Type: text/plain
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=luto@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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



On Tue, Oct 25, 2022, at 8:13 AM, Chao Peng wrote:
> This new KVM exit allows userspace to handle memory-related errors. It
> indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> The flags includes additional information for userspace to handle the
> error. Currently bit 0 is defined as 'private memory' where '1'
> indicates error happens due to private memory access and '0' indicates
> error happens due to shared memory access.
>
> When private memory is enabled, this new exit will be used for KVM to
> exit to userspace for shared <-> private memory conversion in memory
> encryption usage. In such usage, typically there are two kind of memory
> conversions:
>   - explicit conversion: happens when guest explicitly calls into KVM
>     to map a range (as private or shared), KVM then exits to userspace
>     to perform the map/unmap operations.
>   - implicit conversion: happens in KVM page fault handler where KVM
>     exits to userspace for an implicit conversion when the page is in a
>     different state than requested (private or shared).
>
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  Documentation/virt/kvm/api.rst | 23 +++++++++++++++++++++++
>  include/uapi/linux/kvm.h       |  9 +++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/Documentation/virt/kvm/api.rst 
> b/Documentation/virt/kvm/api.rst
> index f3fa75649a78..975688912b8c 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6537,6 +6537,29 @@ array field represents return values. The 
> userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on 
> RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
> 
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
> +			__u32 flags;
> +			__u32 padding;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
> +

Would it make sense to also have a field for the access type (read, write, execute, etc)?  I realize that shared <-> private conversion doesn't strictly need this, but it seems like it could be useful for logging failures and also for avoiding a second immediate fault if the type gets converted but doesn't have the right protection yet.

(Obviously, if this were changed, KVM would need the ability to report that it doesn't actually know the mode.)

--Andy

