Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E5466EFC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 02:09:44 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msx54-0006ax-Kg
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 20:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1msx3x-0005wW-Vk
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:08:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1msx3w-00085W-6E
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 20:08:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76920B82025;
 Fri,  3 Dec 2021 01:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80DAC00446;
 Fri,  3 Dec 2021 01:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638493699;
 bh=GgJPejWHjB1hO23ZneIa2/JVxaKv5F32MA6/BnqDTaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mDPTRUte24dhMbvhYFICRGrHBprMS5iBPUmuKQp9y0yZLj7JSJLl9cKa135lOqdZI
 7JMd6VR1H0RJMCcityYODsMs3xqyTmpQ2w1ga7d5u6C2YgqYaK9qOBEqIOt50xg2R6
 bdy8sMyG1cMe+P7NKykT1HJXw23ujt9DhsVvchdu1F0EVSB5e091Ko3PBXbFtS/A5l
 ojnLUhEwSnPqireq9bSfbRnUfukDUQh2+S4kuidHuYVhhEkKcnmbMzM1dSvcWl/9uy
 YYMvqhk0IQyCsEwMK/86Y+JYN+Pv48XBxaI6Uda549qxuY/USvoklOq4tePWLmEZtT
 MfzVXzzz+Mzzg==
Message-ID: <34ffef96-a4d4-d16c-37a5-3c732f0a7a20@kernel.org>
Date: Thu, 2 Dec 2021 17:08:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC v2 PATCH 00/13] KVM: mm: fd-based approach for supporting
 KVM guest private memory
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
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
> This RFC series try to implement the fd-based KVM guest private memory
> proposal described at [1] and an improved 'New Proposal' described at [2].

I generally like this.  Thanks!

