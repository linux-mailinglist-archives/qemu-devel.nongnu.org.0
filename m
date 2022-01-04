Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26F484343
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 15:23:39 +0100 (CET)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kiw-0001Mf-E0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 09:23:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n4khe-0000fb-0X
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n4khZ-0002oO-Sx
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641306132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kd7NsJXI8gYpybe5mVP7ztpJR15QwvvZgvb8pedcJXM=;
 b=axoRBK6p3Lp99Int9sYSISRZcVBIdf6hNqcTxmkQHN0A7etKV1aoblUsGk8fa4eZNJfamm
 paP0xkktK/gtvMLmSnYunPARdTdSKwT29vMe7Ix9gB40WKECnKuvAvUC3szlgAvgfGNAkQ
 u6jx0mmr3Pc02UjB2lFnq6xslgjVSAU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-r_Kt-IwwOoue5ds8T7xFCg-1; Tue, 04 Jan 2022 09:22:11 -0500
X-MC-Unique: r_Kt-IwwOoue5ds8T7xFCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a05600c3b0f00b003465ede5e04so357962wms.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Kd7NsJXI8gYpybe5mVP7ztpJR15QwvvZgvb8pedcJXM=;
 b=j5oNvBRp8EH34YUczFqGdC1BHoBT0KtzO+Dm8vjDt6bjAy1UrrpDqNzEpVCCPfD9tD
 mJ3H2xSOpQoOOwpS5/3Hgy+dAufcA675z7D+5ghoYsjhGbVAgY1qzEp9dq4r8+m+lVb5
 GgoAsxqJb3YkCj2qs6kU10LKJ2tMt6uV3TVjcU7EidD3d9PebPB+7EkHDTYhQH8ZSz9d
 X6Lpw+m8wOao4kOoQO8CqzKvwh8DY2C/5NAihhFW9NNFAcR80VXtzlGxMprynSeNQ7/p
 3Mk+/a8ikRgKMstG8HjZbI3Qq5lum5iZRCMVAASLg64cphjZKiVrrWO4HBqzhYmLt0BN
 mBmQ==
X-Gm-Message-State: AOAM533NNVVRdhB80PyQcZRNavbieoic3xWALmvDLlyB6O6cfEWzv9YL
 KuQXcls3M+XYuQs+VY3/6dp0qKzbeU1UeSWW8Eicb521PTJSasgPEITKIFJJV66mAsM9FXyAoUQ
 rDJw7Upp3q31e4Eg=
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr43117694wmq.109.1641306130012; 
 Tue, 04 Jan 2022 06:22:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw32qpFKWD69dT7hryNwrsfqQlIKMprgz5fqX/4Bi/8nva34KM25ikuyModAt0N7b2C0ORoeQ==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr43117653wmq.109.1641306129690; 
 Tue, 04 Jan 2022 06:22:09 -0800 (PST)
Received: from [192.168.3.132] (p5b0c62bd.dip0.t-ipconnect.de. [91.12.98.189])
 by smtp.gmail.com with ESMTPSA id
 r11sm38357940wrw.5.2022.01.04.06.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 06:22:09 -0800 (PST)
Message-ID: <7eb40902-45dd-9193-37f1-efaca381529b@redhat.com>
Date: Tue, 4 Jan 2022 15:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 kvm/queue 01/16] mm/shmem: Introduce F_SEAL_INACCESSIBLE
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-2-chao.p.peng@linux.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211223123011.41044-2-chao.p.peng@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org,
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

On 23.12.21 13:29, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> the file is inaccessible from userspace in any possible ways like
> read(),write() or mmap() etc.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this seal set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> At this time only shmem implements this seal.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/uapi/linux/fcntl.h |  1 +
>  mm/shmem.c                 | 37 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 2f86b2ad6d7e..e2bad051936f 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -43,6 +43,7 @@
>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
>  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
> +#define F_SEAL_INACCESSIBLE	0x0020  /* prevent file from accessing */

I think this needs more clarification: the file content can still be
accessed using in-kernel mechanisms such as MEMFD_OPS for KVM. It
effectively disallows traditional access to a file (read/write/mmap)
that will result in ordinary MMU access to file content.

Not sure how to best clarify that: maybe, prevent ordinary MMU access
(e.g., read/write/mmap) to file content?

>  /* (1U << 31) is reserved for signed error codes */
>  
>  /*
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 18f93c2d68f1..faa7e9b1b9bc 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1098,6 +1098,10 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
>  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
>  			return -EPERM;
>  
> +		if ((info->seals & F_SEAL_INACCESSIBLE) &&
> +		    (newsize & ~PAGE_MASK))
> +			return -EINVAL;
> +

What happens when sealing and there are existing mmaps?


-- 
Thanks,

David / dhildenb


