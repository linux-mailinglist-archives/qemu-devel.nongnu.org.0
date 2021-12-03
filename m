Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF0466F06
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 02:12:35 +0100 (CET)
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msx7q-0008Q5-TE
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 20:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1msx6T-0007WU-8D
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:11:09 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1msx6R-0000Zm-En
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:11:09 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AD64B8257B;
 Fri,  3 Dec 2021 01:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C284C00446;
 Fri,  3 Dec 2021 01:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638493864;
 bh=R/KWoIy8A+QpAIZYriI3L7Yc6+H44YcDyCxAm0FjAwA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ihyFPI+9wQEgGHtHHyI1UGBdo+aBGtm3Q77KfZWJr/tltJr8YQZ5lCMqyoAZvT2ei
 +0CEvmFJIvBpYSzkeX9SOGZDBbhnkT2plO8mlGlqmtatHrcFa9oH0wEoWyXZhmiL5L
 Xcx3SIJrFK/qJzumkKdvu0dPrQkMjEtIhUv3OBMv5Horb4JfJZeDX3gJVN34m8EBGD
 b1XNke6O36NiZpOq2AgwGIX9u3/fKt/OzTD+uuL6XgwkwFjfGgVpmZdAVvOqZNd8uN
 Tn9A2X6WCVg4n2Wfid1giUg69N3xc1ggzwygloYsifUBdqDcD0TVL9vIvYQnnE/8ar
 zdvAaEh0D0mRA==
Message-ID: <faf88ba7-cb9c-f7ec-07f5-e3971bd35a4c@kernel.org>
Date: Thu, 2 Dec 2021 17:11:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20211119134739.20218-2-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=luto@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.3, SPF_HELO_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 05:47, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The new seal type provides semantics required for KVM guest private
> memory support. A file descriptor with the seal set is going to be used
> as source of guest memory in confidential computing environments such as
> Intel TDX and AMD SEV.
> 
> F_SEAL_GUEST can only be set on empty memfd. After the seal is set
> userspace cannot read, write or mmap the memfd.

I don't have a strong objection here, but, given that you're only 
supporting it for memfd, would a memfd_create() flag be more 
straightforward?  If nothing else, it would avoid any possible locking 
issue.

I'm also very very slightly nervous about a situation in which one 
program sends a memfd to an untrusted other process and that process 
truncates the memfd and then F_SEAL_GUESTs it.  This could be mostly 
mitigated by also requiring that no other seals be set when F_SEAL_GUEST 
happens, but the alternative MFD_GUEST would eliminate this issue too.

