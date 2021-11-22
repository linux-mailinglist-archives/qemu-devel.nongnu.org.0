Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39617459011
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:18:13 +0100 (CET)
Received: from localhost ([::1]:34984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpA95-0001Kz-QQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:18:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1mpA7i-0000fc-4r
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:16:46 -0500
Received: from [2a00:1450:4864:20::12a] (port=40642
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1mpA7g-0000tg-GN
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:16:45 -0500
Received: by mail-lf1-x12a.google.com with SMTP id l22so81187716lfg.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 06:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P+4zN2N2GD5InVPRag20OPT/f7vJcEHsDBTk4URQjTY=;
 b=i660LRu/4c8k5hZyBAeiN7vx0DBSwtD8jpUkhNkSzxlWCRi0bijMvkNpekOr7ODcqf
 UC0FELTodvWUnOuZjym86GSTh/2Zk2G58nuT2v5lRYn46uzum5yI7DHmlQ4HhO1Nm7T/
 aQH9kqwRvEP2U9SXB4mugfIDYeVG8Q83mR0ziru1aeYKVDvndcWcO2dGj6xLJFbVDXKn
 nChK1SZIjg7CvjRVK6vC6dXSOLsBwzmizr4u7jHyKx6OVdI3BWNtfNkiZu97/IcU80/r
 He6oR52eZ+2bEqk/XkG670vHL3LQAnjJvaBUqzPuTmX2lMgEKeEbNFXL0x2jxrgBfVWC
 MnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P+4zN2N2GD5InVPRag20OPT/f7vJcEHsDBTk4URQjTY=;
 b=1ZC18iZA51/dAbvegRmm0lu6dBozqCPn5W86b/XkLrC4CfD5e5O1NOMqnwWKcMqqki
 dACeKwz6PtPhkxuGuvl0VsLzCDB00GXjNmrbSZtLckP6SRwX6rrz+8Xu5LrQXWt0/GQS
 y0EnaN/naNcMkaCrKBxVxG1ELduZzBq3hVBzjNyY3SP3qnl6yYsETJ/8Xqg0KuqMRHFP
 C7BvANWXUDZfKRkom5ybEzQaQO4tpuY1Vv6y7rTUHDod7CeP3CcaF0c0Z251iY1T6+8m
 X5m9aGN9xPNVl3ZVrqeUpFSJN+ovb3v0CsGcWk8NvN59u0N4lIDI9gJTEmri3So/dp5R
 sEQg==
X-Gm-Message-State: AOAM533a1XdJpvqLQxrdwWHdMK+iwVFMORMWeQJ/Z0c+Zb8n1jIEgQgl
 yRQATOJi/AVJsts+nU0XrZlC5A==
X-Google-Smtp-Source: ABdhPJwA2Y8gfA+st0HYZ/WwMV2AWc6rzJCATTeuU95BmoAecu1lVYYz4BBqsxxXP2KWDyyXt38ykg==
X-Received: by 2002:a2e:8189:: with SMTP id e9mr52166761ljg.333.1637590602046; 
 Mon, 22 Nov 2021 06:16:42 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id q24sm979041lfp.103.2021.11.22.06.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 06:16:41 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 83FF5103610; Mon, 22 Nov 2021 17:16:47 +0300 (+03)
Date: Mon, 22 Nov 2021 17:16:47 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [RFC v2 PATCH 13/13] KVM: Enable memfd based page
 invalidation/fallocate
Message-ID: <20211122141647.3pcsywilrzcoqvbf@box.shutemov.name>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-14-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119134739.20218-14-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::12a;
 envelope-from=kirill@shutemov.name; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jim Mattson <jmattson@google.com>,
 linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 09:47:39PM +0800, Chao Peng wrote:
> Since the memory backing store does not get notified when VM is
> destroyed so need check if VM is still live in these callbacks.
> 
> Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  virt/kvm/memfd.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
> index bd930dcb455f..bcfdc685ce22 100644
> --- a/virt/kvm/memfd.c
> +++ b/virt/kvm/memfd.c
> @@ -12,16 +12,38 @@
>  #include <linux/memfd.h>
>  const static struct guest_mem_ops *memfd_ops;
>  
> +static bool vm_is_dead(struct kvm *vm)
> +{
> +	struct kvm *kvm;
> +
> +	list_for_each_entry(kvm, &vm_list, vm_list) {
> +		if (kvm == vm)
> +			return false;
> +	}

I don't think this is enough. The struct kvm can be freed and re-allocated
from the slab and this function will give false-negetive.

Maybe the kvm has to be tagged with a sequential id that incremented every
allocation. This id can be checked here.

> +
> +	return true;
> +}

-- 
 Kirill A. Shutemov

