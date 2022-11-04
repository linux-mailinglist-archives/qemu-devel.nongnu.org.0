Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB6619368
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:24:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqsuC-00076S-5Q; Fri, 04 Nov 2022 05:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqssl-0006Lj-RF
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oqssi-0002xB-3r
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667553652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/uDVs+WbRAxDuhIuGKrU/El/HK+W+eAbOKXFNT99Zc=;
 b=Rx3/kFa6WO1XpJKMPWlkbjYzVxCc6sncg6lZfGBEPJBwcHuDO4l9dH8PHLXJ5Ctmb9zF9Y
 5U8ZvVLQh2knsYCzDcdniKAn/brj+VzO6VqMIiy7Q4PNJ4ZDSp3ewlhnsexaIFYDvD0QyO
 twOACdyN42+PoXd7Qg2cjZ6AAZm/QLo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-drmtN_PXMqGvBzYlu26d7w-1; Fri, 04 Nov 2022 05:20:51 -0400
X-MC-Unique: drmtN_PXMqGvBzYlu26d7w-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn34-20020a1709070d2200b0079330e196c8so2865861ejc.16
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 02:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F/uDVs+WbRAxDuhIuGKrU/El/HK+W+eAbOKXFNT99Zc=;
 b=4nQYBDQFjPatj74BzXkI6LDQuCENLy++7tuGH0Xxu0TJzHb73L4aEbhp/hug2Q9gAC
 TRypiw09k4vmMkXYHhyIN+B8kGgoa3FgYXEO4P+2MmAKH5cbeZv2BQwZMQbekGyBP7Qm
 +ERMZmDujLiDvtEI1d2hW1sP3yjCWQjG0oqSgT3WdEN3rI7wf/rYk1x6wqO0vtis5v43
 xDYxk3/XqYAdOGCAnQeyvDd6ypNvIG8m9NwrevzWB0I3hLGAf3kiX1pBvicOsqu9EgGK
 Q43rQKKG1pT4emPquC6pe9DhzeydfQslEiy1HQWNN4tbxJinHtEGwUnSSwJS4g5TkHKa
 dcvQ==
X-Gm-Message-State: ACrzQf1yHF9uziWqKQGoBtNIOxtT/5CMNR8XyasXcMm5/wDgeZwraVVM
 Dx9aqSArZbTMwkdlJIW+PXmoASuca60FRwqBQdc6ytgDNp5URbwlj36Ysq3MU/4B0igppZ5rcCm
 p9Ef8F179E+CGtT8=
X-Received: by 2002:a50:fc03:0:b0:461:5d8d:5811 with SMTP id
 i3-20020a50fc03000000b004615d8d5811mr34914878edr.351.1667553650176; 
 Fri, 04 Nov 2022 02:20:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dImflT162PFfS6YpSHTfWZTEcqMOql4Slb04/ECiaAmIIYGNlkMwkwOaR36Wg0ERCgUpbww==
X-Received: by 2002:a50:fc03:0:b0:461:5d8d:5811 with SMTP id
 i3-20020a50fc03000000b004615d8d5811mr34914860edr.351.1667553649976; 
 Fri, 04 Nov 2022 02:20:49 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 kz7-20020a17090777c700b007806c1474e1sm1528041ejc.127.2022.11.04.02.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:20:49 -0700 (PDT)
Message-ID: <a0594b2a-9ceb-9738-75d0-e583236cf38c@redhat.com>
Date: Fri, 4 Nov 2022 10:20:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/9] block-copy: add missing coroutine_fn annotations
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-3-eesposit@redhat.com>
 <8f24c24c-ca61-108c-924b-39465a3c67fe@redhat.com>
 <Y2QDPXegFTdpBy6S@redhat.com>
 <dfb4906f-5fff-0430-a3c8-c1f660d3497d@redhat.com>
 <aa37a312-96c1-3bf7-29fe-fbe83eb48f61@redhat.com>
 <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <ac92cf1f-49c4-b263-f48f-4be17044d61e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 04/11/2022 um 09:44 schrieb Paolo Bonzini:
> On 11/4/22 08:35, Emanuele Giuseppe Esposito wrote:
>> But isn't it a bug also not to mark a function _only_ called by
>> coroutine_fn? My point is that if this function is an implementation of
>> a BlockDriver callback marked as coroutine_fn (like in patch 6 with
>> vmdk), then it would make sense.
> 
> If a function implements a coroutine_fn callback but does not suspend,
> then it makes sense to mark it coroutine_fn.
> 
> In general it's not a bug.  In most cases it would only be a coincidence
> that the function is called from a coroutine_fn.  For example consider
> bdrv_round_to_clusters().  Marking it coroutine_fn signals that it may
> suspend now (it doesn't) or in the future.  However it's only doing some
> math based on the result of bdrv_get_info(), so it is extremely unlikely
> that this will happen.
> 
> In this case... oh wait.  block_copy_is_cluster_allocated is calling
> bdrv_is_allocated, and block_copy_reset_unallocated calls
> block_copy_is_cluster_allocated.  bdrv_is_allocated is a mixed
> coroutine/non-coroutine function, and in this case it is useful to
> document that bdrv_is_allocated will suspend.  The patch is correct,
> only the commit message is wrong.

[...]

>> This is actually the point of this serie (which I might not have
>> explained well in the cover letter), every function marked here is
>> eventually called by/calling a BlockDriver callback marked as
>> coroutine_fn.
> 
> Again I don't think this is useful in general, but your three patches
> (2/3/6) did catch cases that wants to be coroutine_fn.  So my objection
> is dropped with just a better commit message.

I see your point about "in general it's not a bug".
At this point I just want to make sure that we agree that it's correct
to add coroutine_fn because of "the function calls a g_c_w that
suspends" *&&* "all the callers are coroutine_fn". If the callers
weren't coroutine_fn then g_c_w would just create a new coroutine and
poll, and I don't think that would be part of your definition of "can
suspend".

Thank you,
Emanuele

> 
>> Currently we have something like this:
>> BlockDriver {
>>      void coroutine_fn (*bdrv_A)(void) = implA;
>> }
>>
>> void coroutine_fn implA() {
>>      funcB();
>>      funcC();
>> }
>>
>> void funcB() {}; <--- missing coroutine_fn?
>> void funcC() {}; <--- missing coroutine_fn?
>>
>> In addition, as I understand draining is not allowed in coroutines.
> 
> ... except we have bdrv_co_yield_to_drain() to allow that, sort of. :/
> 
>> If a function/callback only running in coroutines is not marked as
>> coroutine_fn, then it will be less obvious to notice that draining is
>> not allowed there.
> 
> I think it has to be judged case by base.  Your patches prove that, in
> most cases, you have coroutine_fn for things that ultimately do some
> kind of I/O or query.  In general the interesting path to explore is
> "coroutine_fn calls (indirectly) non-coroutine_fn calls (indirectly)
> generated_co_wrapper".  The vrc tool could be extended to help finding
> them, with commands like
> 
>     label coroutine_fn bdrv_co_read
>     label coroutine_fn bdrv_co_write
>     ...
>     label generated_co_wrapper bdrv_read
>     label generated_co_wrapper bdrv_write
>     paths coroutine_fn !coroutine_fn generated_co_wrapper
> 
> Paolo
> 


