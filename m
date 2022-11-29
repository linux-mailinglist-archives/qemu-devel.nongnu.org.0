Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45C63BF3B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 12:40:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozyxM-0001kZ-I8; Tue, 29 Nov 2022 06:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ozyxK-0001kK-7O
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ozyxH-0004z5-O2
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 06:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669721951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRu/Hx0QeU09vI6dag4oeFynexJuKZWNYSe4MiEdyGs=;
 b=DY1pFbkUM1MIGvkYmEzktWFDEJKIDajUf044NWj1aFCx6VfR3SCLfpmRCKjsnEYsub5Awe
 QCfsxMM/j3ywnZurS9Qcb/sD9qqH41O+7AG53X/WBLMdI0vxZSJrISQFnIy14Yy+oxZprj
 M77lSprXFA5jMIqYUDPGM/sCTQWturo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-4JFuTD8MM92WDcUvkUbPbQ-1; Tue, 29 Nov 2022 06:39:10 -0500
X-MC-Unique: 4JFuTD8MM92WDcUvkUbPbQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so4620453wme.8
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 03:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eRu/Hx0QeU09vI6dag4oeFynexJuKZWNYSe4MiEdyGs=;
 b=XWcqYOxY1zYskL9WoK0VlluZOVwMEbpyPLwhHBA36u1K1prfWeFkM3nmEl5n8FRVn5
 9MiFvpaseXahaW5zCUK7v9W9RlIlK99UkMjgIC1zaIC0qw2amcwvXLh4glMsL6Hvmzq+
 zLwM3hRk6+tCOTp7mqRqClRrKIHyP9R2B/dEDg42RBMN02UmxjCTm8WZ82bJXdY+O1zZ
 uJ1JLbnFMZhLo3Z0z/s+qYdcSSrQC4N3WRMCpsuGK9Ya/Y5x7SyeRDEdCAEv5+ccFVrW
 v26accN9cEejY9AfY5/2XICERKZO/Mh6jKt9Q7SW0DfhCxHpIr+EXlvt05igQIeVTHG8
 j0kQ==
X-Gm-Message-State: ANoB5pmMSK5OZr4jBPiJ6UYA1naKjNrBg/dFmM3ClpqgVU3AYucZ6z9d
 MJjAP4sRGLl+6o7YiO9yZf5Irke/OQG0qBaIQaijLPHMkYR43qCcNHDMQqPqyPOsgUfTerRMAGk
 +uC0fxPrGqoFL0K4=
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr44926222wml.6.1669721948943; 
 Tue, 29 Nov 2022 03:39:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6s03pDZ7+AzRjiuWChsKfmd6tu6WfpxK1aogO4cyP+8Olozy3bxlj+8EqBduo9KzTHvAm5sQ==
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id
 m5-20020a7bca45000000b003c4bda17c57mr44926175wml.6.1669721948661; 
 Tue, 29 Nov 2022 03:39:08 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6623.dip0.t-ipconnect.de. [91.12.102.35])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b003d069fc7372sm1471927wmb.1.2022.11.29.03.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 03:39:08 -0800 (PST)
Message-ID: <6d7f7775-5703-c27a-e57b-03aafb4de712@redhat.com>
Date: Tue, 29 Nov 2022 12:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Michael Roth <michael.roth@amd.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <20221129000632.sz6pobh6p7teouiu@amd.com>
 <20221129112139.usp6dqhbih47qpjl@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221129112139.usp6dqhbih47qpjl@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29.11.22 12:21, Kirill A. Shutemov wrote:
> On Mon, Nov 28, 2022 at 06:06:32PM -0600, Michael Roth wrote:
>> On Tue, Oct 25, 2022 at 11:13:37PM +0800, Chao Peng wrote:
>>> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>>>
>>
>> <snip>
>>
>>> +static struct file *restrictedmem_file_create(struct file *memfd)
>>> +{
>>> +	struct restrictedmem_data *data;
>>> +	struct address_space *mapping;
>>> +	struct inode *inode;
>>> +	struct file *file;
>>> +
>>> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +	if (!data)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	data->memfd = memfd;
>>> +	mutex_init(&data->lock);
>>> +	INIT_LIST_HEAD(&data->notifiers);
>>> +
>>> +	inode = alloc_anon_inode(restrictedmem_mnt->mnt_sb);
>>> +	if (IS_ERR(inode)) {
>>> +		kfree(data);
>>> +		return ERR_CAST(inode);
>>> +	}
>>> +
>>> +	inode->i_mode |= S_IFREG;
>>> +	inode->i_op = &restrictedmem_iops;
>>> +	inode->i_mapping->private_data = data;
>>> +
>>> +	file = alloc_file_pseudo(inode, restrictedmem_mnt,
>>> +				 "restrictedmem", O_RDWR,
>>> +				 &restrictedmem_fops);
>>> +	if (IS_ERR(file)) {
>>> +		iput(inode);
>>> +		kfree(data);
>>> +		return ERR_CAST(file);
>>> +	}
>>> +
>>> +	file->f_flags |= O_LARGEFILE;
>>> +
>>> +	mapping = memfd->f_mapping;
>>> +	mapping_set_unevictable(mapping);
>>> +	mapping_set_gfp_mask(mapping,
>>> +			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
>>
>> Is this supposed to prevent migration of pages being used for
>> restrictedmem/shmem backend?
> 
> Yes, my bad. I expected it to prevent migration, but it is not true.

Maybe add a comment that these pages are not movable and we don't want 
to place them into movable pageblocks (including CMA and ZONE_MOVABLE). 
That's the primary purpose of the GFP mask here.

-- 
Thanks,

David / dhildenb


