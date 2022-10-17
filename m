Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21B600FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 15:08:48 +0200 (CEST)
Received: from localhost ([::1]:40722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okPrK-0007Tj-OZ
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 09:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vbabka@suse.cz>) id 1okPjH-0002gE-HI
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:00:29 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:38356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vbabka@suse.cz>) id 1okPjF-00066g-OV
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 09:00:27 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C7EA20628;
 Mon, 17 Oct 2022 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1666011622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MB8IK99devSsbVKuCFsHUWmVzyz2mqfU8Y26jvqzv4=;
 b=zhssMzsy/2w3OsoMr5WAqLlA15XAps4taHC3oW1kGemgiv5Of9mor6m5UgiloYUrq2u49x
 uDXT5zpFbYy9NZ0ASsOtsb+1Qs6LN7GNt7HIVECX8kRRRI3VZDkM5TDsZSFVpj/QXQNNwK
 yanlAR/KhCIc2KkUwCruBQ0yKEZ+4Kg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1666011622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MB8IK99devSsbVKuCFsHUWmVzyz2mqfU8Y26jvqzv4=;
 b=kbo9YyUMH19Ty6ZeoQYYH6O8OBIIOCUsNjK8YY66kGueMJBtfGm21E2ES6nlbGbqGWxjnN
 LDRgm2Xy/RcUW8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D189713ABE;
 Mon, 17 Oct 2022 13:00:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QVZuMuVRTWOhRgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Mon, 17 Oct 2022 13:00:21 +0000
Message-ID: <de680280-f6b1-9337-2ae4-4b2faf2b823b@suse.cz>
Date: Mon, 17 Oct 2022 15:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=2001:67c:2178:6::1d;
 envelope-from=vbabka@suse.cz; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=ham autolearn_force=no
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

On 9/15/22 16:29, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> KVM can use memfd-provided memory for guest memory. For normal userspace
> accessible memory, KVM userspace (e.g. QEMU) mmaps the memfd into its
> virtual address space and then tells KVM to use the virtual address to
> setup the mapping in the secondary page table (e.g. EPT).
> 
> With confidential computing technologies like Intel TDX, the
> memfd-provided memory may be encrypted with special key for special
> software domain (e.g. KVM guest) and is not expected to be directly
> accessed by userspace. Precisely, userspace access to such encrypted
> memory may lead to host crash so it should be prevented.
> 
> This patch introduces userspace inaccessible memfd (created with
> MFD_INACCESSIBLE). Its memory is inaccessible from userspace through
> ordinary MMU access (e.g. read/write/mmap) but can be accessed via
> in-kernel interface so KVM can directly interact with core-mm without
> the need to map the memory into KVM userspace.
> 
> It provides semantics required for KVM guest private(encrypted) memory
> support that a file descriptor with this flag set is going to be used as
> the source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV.
> 
> KVM userspace is still in charge of the lifecycle of the memfd. It
> should pass the opened fd to KVM. KVM uses the kernel APIs newly added
> in this patch to obtain the physical memory address and then populate
> the secondary page table entries.
> 
> The userspace inaccessible memfd can be fallocate-ed and hole-punched
> from userspace. When hole-punching happens, KVM can get notified through
> inaccessible_notifier it then gets chance to remove any mapped entries
> of the range in the secondary page tables.
> 
> The userspace inaccessible memfd itself is implemented as a shim layer
> on top of real memory file systems like tmpfs/hugetlbfs but this patch
> only implemented tmpfs. The allocated memory is currently marked as
> unmovable and unevictable, this is required for current confidential
> usage. But in future this might be changed.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---

...

> +static long inaccessible_fallocate(struct file *file, int mode,
> +				   loff_t offset, loff_t len)
> +{
> +	struct inaccessible_data *data = file->f_mapping->private_data;
> +	struct file *memfd = data->memfd;
> +	int ret;
> +
> +	if (mode & FALLOC_FL_PUNCH_HOLE) {
> +		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> +			return -EINVAL;
> +	}
> +
> +	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> +	inaccessible_notifier_invalidate(data, offset, offset + len);

Wonder if invalidate should precede the actual hole punch, otherwise we open
a window where the page tables point to memory no longer valid?

> +	return ret;
> +}
> +

...

> +
> +static struct file_system_type inaccessible_fs = {
> +	.owner		= THIS_MODULE,
> +	.name		= "[inaccessible]",

Dunno where exactly is this name visible, but shouldn't it better be
"[memfd:inaccessible]"?

> +	.init_fs_context = inaccessible_init_fs_context,
> +	.kill_sb	= kill_anon_super,
> +};
> +


