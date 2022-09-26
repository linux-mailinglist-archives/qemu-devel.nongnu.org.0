Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FE5EA1B7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:55:41 +0200 (CEST)
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oclm0-00015J-UC
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oclSn-0006T6-Ho
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oclSf-0001K1-EA
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664188539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+ZbOYIFXSEJqplhVaiNThrZYYLuxY7C7urbtDbV/sM=;
 b=VXk+ea4x2AkI54yEzrRWyJog0cgrLgys3fny4SF5CScQR4wJF6rbiJ0rOIUMB0Sv9YBaFE
 23rA9Mw/gt79maz1ZzOz/tlxWS3XXlPYdoZ68oXpmhXxAyaAHWHZwFR55VLVJ55j6gSMO/
 0DbOJk/GPgdiOtki40fxST6+YF6BpHM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-4OkA0-dsO52gRayCkj8IxQ-1; Mon, 26 Sep 2022 06:35:38 -0400
X-MC-Unique: 4OkA0-dsO52gRayCkj8IxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso1034723wra.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 03:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=L+ZbOYIFXSEJqplhVaiNThrZYYLuxY7C7urbtDbV/sM=;
 b=OkKk/TxUahJRU3ft7xVrJBOBjTyC2Qkrn1Mrjzujsu2YCJBf1wREhOaW03cVHKJq8b
 RF7Qbk0WhF1JEmii2/BqzA/2NjxRcf9oc7FpslQDZNg0yYkT41ZQRk2SwX/RNqGZmNoO
 wQtvcm1PYeIWwjTffIIt1rdSaib+td/1sxrIwTr5AZZXJNRvPZL/wHaZLyAq8BkyNoA+
 Zmdh8niwHUCJIPNg0q8XEWA4N6roSOaxqNCEhBJbyELGaTG+kckPFipOeu9unCYccXWB
 8nYu/Uwe2T5NcVwfpL/fK4eubngXJARKw/JdNfBVn0yYC0SyVv7sOS4EQDDAARvDxWsU
 /iWw==
X-Gm-Message-State: ACrzQf22kJCZqcRfZtHuLzXcbJEnnm7GSU6wIdK3mUH1LEbs9YJY2GiO
 C/X2bEDtYnPtUWCF2/M51eAAMPcTaciqi4j/lGtinKkitLoTerGComCCtbvpa67QRjs5p4CAwDj
 M3imhceMT2lcYM1E=
X-Received: by 2002:a05:6000:1564:b0:226:dece:5630 with SMTP id
 4-20020a056000156400b00226dece5630mr13540783wrz.294.1664188537507; 
 Mon, 26 Sep 2022 03:35:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5u1Q2JTjA/FqGvI24o/KaCkInpRVUGg48R8VAI4FAuWRKXHrHhWxqHaWiVkWoqmb7Fe69iUg==
X-Received: by 2002:a05:6000:1564:b0:226:dece:5630 with SMTP id
 4-20020a056000156400b00226dece5630mr13540729wrz.294.1664188537097; 
 Mon, 26 Sep 2022 03:35:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7?
 (p200300cbc7034b00e0907fa6b7d6d4a7.dip0.t-ipconnect.de.
 [2003:cb:c703:4b00:e090:7fa6:b7d6:d4a7])
 by smtp.gmail.com with ESMTPSA id
 r64-20020a1c4443000000b003b4935f04a4sm13132198wma.5.2022.09.26.03.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 03:35:36 -0700 (PDT)
Message-ID: <f703e615-3b75-96a2-fb48-2fefd8a2069b@redhat.com>
Date: Mon, 26 Sep 2022 12:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Content-Language: en-US
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <20220923005808.vfltoecttoatgw5o@box.shutemov.name>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220923005808.vfltoecttoatgw5o@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.09.22 02:58, Kirill A . Shutemov wrote:
> On Mon, Sep 19, 2022 at 11:12:46AM +0200, David Hildenbrand wrote:
>>> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
>>> index 6325d1d0e90f..9d066be3d7e8 100644
>>> --- a/include/uapi/linux/magic.h
>>> +++ b/include/uapi/linux/magic.h
>>> @@ -101,5 +101,6 @@
>>>    #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
>>>    #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
>>>    #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
>>> +#define INACCESSIBLE_MAGIC	0x494e4143	/* "INAC" */
>>
>>
>> [...]
>>
>>> +
>>> +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
>>> +			 int *order)
>>> +{
>>> +	struct inaccessible_data *data = file->f_mapping->private_data;
>>> +	struct file *memfd = data->memfd;
>>> +	struct page *page;
>>> +	int ret;
>>> +
>>> +	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	*pfn = page_to_pfn_t(page);
>>> +	*order = thp_order(compound_head(page));
>>> +	SetPageUptodate(page);
>>> +	unlock_page(page);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
>>> +
>>> +void inaccessible_put_pfn(struct file *file, pfn_t pfn)
>>> +{
>>> +	struct page *page = pfn_t_to_page(pfn);
>>> +
>>> +	if (WARN_ON_ONCE(!page))
>>> +		return;
>>> +
>>> +	put_page(page);
>>> +}
>>> +EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
>>
>> Sorry, I missed your reply regarding get/put interface.
>>
>> https://lore.kernel.org/linux-mm/20220810092532.GD862421@chaop.bj.intel.com/
>>
>> "We have a design assumption that somedays this can even support non-page
>> based backing stores."
>>
>> As long as there is no such user in sight (especially how to get the memfd
>> from even allocating such memory which will require bigger changes), I
>> prefer to keep it simple here and work on pages/folios. No need to
>> over-complicate it for now.
> 
> Sean, Paolo , what is your take on this? Do you have conrete use case of
> pageless backend for the mechanism in sight? Maybe DAX?

The problem I'm having with this is how to actually get such memory into 
the memory backend (that triggers notifiers) and what the semantics are 
at all with memory that is not managed by the buddy.

memfd with fixed PFNs doesn't make too much sense.

When using DAX, what happens with the shared <->private conversion? 
Which "type" is supposed to use dax, which not?

In other word, I'm missing too many details on the bigger picture of how 
this would work at all to see why it makes sense right now to prepare 
for that.

-- 
Thanks,

David / dhildenb


