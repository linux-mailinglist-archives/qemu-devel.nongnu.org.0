Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83004B314D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 00:34:57 +0100 (CET)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfRI-00048o-AU
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 18:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nIfQD-0003Jo-5K
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 18:33:49 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:44398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nIfQB-0001hF-5L
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 18:33:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01230618C1;
 Fri, 11 Feb 2022 23:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6308C340E9;
 Fri, 11 Feb 2022 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644622418;
 bh=NcXN/ZExFBWEE/4j7wW8A6WXqsCsTCy55XEhj/QVImY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MD/s1KgbDdFqUM3Vb1BzoByXZiIGv1RlMk7utUYwSOUf2JBAZFlRXxt4ECnUyYqy2
 W2P/xae6UgnONaMt/yfHTrkcp/Ewnkisg3q/XL2qGzszRkrYQfhNfDKBUVkaTyjKiI
 TMeacNN8OOe3NX8ZpbtDEriWYxrQhsGFC7y9uGqj0S7moAb1kWthU5wOueV/EfmDja
 96CZMpWUQRSafptUAWevRxcbiJHzmf1Bt5DG3KdDxxX9JAXkqI6HsnPE0GyAOsixEF
 V+mxb58acULwgB8+JZQHVywpmh7FewNQBkD25shtBrNaMabuc4v6KV0+VFfKIvJZXJ
 fcZZKVqrIZMqg==
Message-ID: <619547ad-de96-1be9-036b-a7b4e99b09a6@kernel.org>
Date: Fri, 11 Feb 2022 15:33:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Linux API <linux-api@vger.kernel.org>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220118132121.31388-2-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 05:21, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> the file is inaccessible from userspace through ordinary MMU access
> (e.g., read/write/mmap). However, the file content can be accessed
> via a different mechanism (e.g. KVM MMU) indirectly.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this seal set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> At this time only shmem implements this seal.
> 

I don't dislike this *that* much, but I do dislike this. 
F_SEAL_INACCESSIBLE essentially transmutes a memfd into a different type 
of object.  While this can apparently be done successfully and without 
races (as in this code), it's at least awkward.  I think that either 
creating a special inaccessible memfd should be a single operation that 
create the correct type of object or there should be a clear 
justification for why it's a two-step process.

(Imagine if the way to create an eventfd would be to call 
timerfd_create() and then do a special fcntl to turn it into an eventfd 
but only if it's not currently armed.  This would be weird.)

