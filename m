Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0115333F6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:39:07 +0200 (CEST)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nte7G-00068C-4D
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nte5E-0005QD-JD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 19:37:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nte56-0004GG-RR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 19:36:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id 10so13702903plj.0
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7d1GZoiIPgurRKHqYkbLbRfkJMBlTGlbTuzD6kjnHaA=;
 b=KeFIqxa6CCFetIxYiv9IdzoKB2DP/2IjtAPFyJN7ulMa+N9FmuID4xO83AXLE9XhxD
 QLC9D4pC5g086lAPfbPlDRGHNGdMHwddAVFaFt97S4GEoEBfL5enEWauuAld1AZRclVs
 vlk6RettmorUKl8wUHT10Vie0HCcM3Mx9wBPqG0i6qhZfHFc4kVMJS7KgOVSrQE0xBgI
 9LIyRn2BTe72SSbfwn7J7ox7BQCmbUiHCfzzLsvKvnGb9uty97mnBsqi4usWbcRHpKsb
 9kuGhvHlJM08XtjrVtsc39552A578wJHeQW3WGHq8tKjima0G3jN8kCS2zMVMq4kqLdj
 4kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7d1GZoiIPgurRKHqYkbLbRfkJMBlTGlbTuzD6kjnHaA=;
 b=Hv9e4PUcPxnYuEXBWCVXNgyR2YLi0FNiv6RDK51sF5SuiodtKOrYFu0RzITYBu75F4
 NAnW2GobkfKWDhxvmW9ZtdB262YhP9LfRtmBOjpW5sIZolYldyRjo7PmLH24K11/768+
 rTwJsXCtm1r4T2lGWp2PMwF+wKI3vkv9qcuhRB5YD5SWrhBJCMmuwvg/j9JTALFQ03DF
 MDPv1LcbjKV4Ntzgkkk/SuMM9FD5fvaZyZ9NxRmbFySnMUUucJX+F/NWq2hCDp0/Ufc4
 Yzv7xaFtCM166CsZHocaPgNKk4X05IdZ8L4Km/x0G2acb4bU2Tpimuwk3aT1Z8TxMhTx
 uSUQ==
X-Gm-Message-State: AOAM5301sb2BJdwthZUPIKyvAchruvV6J/hJOrprrwnT9Kv3tELPwh1Z
 xb/BqlTJZ3aa/Hhtx6ATQS9EjQ==
X-Google-Smtp-Source: ABdhPJyYL9A7b9Eq9H2YA+sOCWRW25ucZlQtBHk+GLvqCYdvPljMLdHOrNVkUrPOkTAZFApgB75bJQ==
X-Received: by 2002:a17:90b:388c:b0:1df:cb4b:3e72 with SMTP id
 mu12-20020a17090b388c00b001dfcb4b3e72mr7391714pjb.130.1653435410036; 
 Tue, 24 May 2022 16:36:50 -0700 (PDT)
Received: from [10.255.89.252] ([139.177.225.239])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a17090abc4b00b001df54d74adbsm272232pjv.25.2022.05.24.16.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 16:36:49 -0700 (PDT)
Message-ID: <79d17b10-3532-57d4-e70c-3ccf1ab0d87d@bytedance.com>
Date: Wed, 25 May 2022 07:32:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>, david@redhat.com
Cc: akpm@linux-foundation.org, naoya.horiguchi@nec.com, mst@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-4-pizhenwei@bytedance.com>
 <Yo0zmP28FqpivlxF@google.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <Yo0zmP28FqpivlxF@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/25/22 03:35, Sean Christopherson wrote:
> On Fri, May 20, 2022, zhenwei pi wrote:
>> @@ -59,6 +60,12 @@ enum virtio_balloon_config_read {
>>   	VIRTIO_BALLOON_CONFIG_READ_CMD_ID = 0,
>>   };
>>   
>> +/* the request body to commucate with host side */
>> +struct __virtio_balloon_recover {
>> +	struct virtio_balloon_recover vbr;
>> +	__virtio32 pfns[VIRTIO_BALLOON_PAGES_PER_PAGE];
> 
> I assume this is copied from virtio_balloon.pfns, which also uses __virtio32, but
> isn't that horribly broken?  PFNs are 'unsigned long', i.e. 64 bits on 64-bit kernels.
> x86-64 at least most definitely generates 64-bit PFNs.  Unless there's magic I'm
> missing, page_to_balloon_pfn() will truncate PFNs and feed the host bad info.
> 

Yes, I also noticed this point, I suppose the balloon device can not 
work on a virtual machine which has physical address larger than 16T.

I still let the recover VQ keep aligned with the inflate VQ and deflate 
VQ. I prefer the recover VQ to be workable/unworkable with 
inflate/deflate VQ together. So I leave this to the virtio balloon 
maintainer to decide ...

>> @@ -494,6 +511,198 @@ static void update_balloon_size_func(struct work_struct *work)
>>   		queue_work(system_freezable_wq, work);
>>   }
>>   
>> +/*
>> + * virtballoon_memory_failure - notified by memory failure, try to fix the
>> + *                              corrupted page.
>> + * The memory failure notifier is designed to call back when the kernel handled
>> + * successfully only, WARN_ON_ONCE on the unlikely condition to find out any
>> + * error(memory error handling is a best effort, not 100% coverd).
>> + */
>> +static int virtballoon_memory_failure(struct notifier_block *notifier,
>> +				      unsigned long pfn, void *parm)
>> +{
>> +	struct virtio_balloon *vb = container_of(notifier, struct virtio_balloon,
>> +						 memory_failure_nb);
>> +	struct page *page;
>> +	struct __virtio_balloon_recover *out_vbr;
>> +	struct scatterlist sg;
>> +	unsigned long flags;
>> +	int err;
>> +
>> +	page = pfn_to_online_page(pfn);
>> +	if (WARN_ON_ONCE(!page))
>> +		return NOTIFY_DONE;
>> +
>> +	if (PageHuge(page))
>> +		return NOTIFY_DONE;
>> +
>> +	if (WARN_ON_ONCE(!PageHWPoison(page)))
>> +		return NOTIFY_DONE;
>> +
>> +	if (WARN_ON_ONCE(page_count(page) != 1))
>> +		return NOTIFY_DONE;
>> +
>> +	get_page(page); /* balloon reference */
>> +
>> +	out_vbr = kzalloc(sizeof(*out_vbr), GFP_KERNEL);
>> +	if (WARN_ON_ONCE(!out_vbr))
>> +		return NOTIFY_BAD;
> 
> Not that it truly matters, but won't failure at this point leak the poisoned page?

I'll fix this, thanks!

-- 
zhenwei pi

