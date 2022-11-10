Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D029C624251
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6bG-0000IJ-Ty; Thu, 10 Nov 2022 07:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot6bF-0000Gt-42
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:24:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot6bD-0003F8-8r
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668083040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDrAryEekNs1fTCojr/1O9mZqVwyXZ3l5bd5HUqc7eo=;
 b=LLIEf58HE99G87yk8dp1Y3YWegsraLkZ2YQLYSR5FY9PMOKYhrAYLw/gQaMguqD+C4ns4G
 Jb/0MAS8gba4vszoD9a/271heD2kEQePqhbbaO/NVVC6eG7b0sV/E/oVEd74yN8hR7WYJS
 jVb9n0pYVFnFKKqivrxOazA89m/tPGI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-wfYQOkCnMX2VCgkREsbCvw-1; Thu, 10 Nov 2022 07:23:59 -0500
X-MC-Unique: wfYQOkCnMX2VCgkREsbCvw-1
Received: by mail-pj1-f70.google.com with SMTP id
 n4-20020a17090a2fc400b002132adb9485so1054208pjm.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDrAryEekNs1fTCojr/1O9mZqVwyXZ3l5bd5HUqc7eo=;
 b=t9NSHphBZExyokWE2NBTjXayPwHo475cP0PQfQFrU4ARvwK7IvFpE0zw2Axjy+pcBL
 /U9SfYudhZRRoZZi80DuKAwwQ/glojIMmW6/bwWprP8UsC2xLSGGmvsHWwm3R74hx5+O
 Sv8mCIdzT49r2lhB5HP3CsyQFt4Ar2b7xHQDOQVVuDJVMoWxJNxZwyZ7YQ+KsBeggg7e
 6dqpJI6dv/8v6QLG9qUlmf9fkE6QVuaNYGgxm2mNr/yb7FGNODpLUJf+iQ9FSQrHb97L
 EqGALvQWuRMyz6YLsMWcuUMelkjn4ePqsKbt4Trv9LZOcDhWESMDjnXmPXmbHbqVDc74
 Lo5g==
X-Gm-Message-State: ACrzQf1Jp5XXdGDvkfm+ZRED062mcDlX666hY8E+Ir/EAPtyE4hwqmf0
 DxTD7UMmYmPp6N6xphXyJmqQIE4SAV44vKw3iHaHnK5N1VLPrRsoFkbQVnfcIu6FivI0Vx9NmDm
 vqNi0e9faf3qcKPE=
X-Received: by 2002:a05:6a02:282:b0:439:7a97:ccd with SMTP id
 bk2-20020a056a02028200b004397a970ccdmr56128027pgb.297.1668083038451; 
 Thu, 10 Nov 2022 04:23:58 -0800 (PST)
X-Google-Smtp-Source: AMsMyM53VqlQA4QIHlA/IHVtZpQf9OXgaQfL7pEiZgc7WyndGuAvQEbN9nNQGma9wmlY7lecj2Y4gQ==
X-Received: by 2002:a05:6a02:282:b0:439:7a97:ccd with SMTP id
 bk2-20020a056a02028200b004397a970ccdmr56128006pgb.297.1668083038105; 
 Thu, 10 Nov 2022 04:23:58 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170903019200b001782f94f8ebsm11284143plg.3.2022.11.10.04.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 04:23:57 -0800 (PST)
Message-ID: <38b8709e-206c-0493-60c2-14b22030a9c2@redhat.com>
Date: Thu, 10 Nov 2022 13:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <4a72c7c6-4b70-b6bf-705e-3303865066b6@suse.de>
 <9a4db614-297d-a85f-9788-ed46c71bb66b@redhat.com>
 <38ca7d88-dcb8-597b-7d15-90cfd1bc5017@suse.de>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
In-Reply-To: <38ca7d88-dcb8-597b-7d15-90cfd1bc5017@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 13.05, Claudio Fontana wrote:
> On 11/10/22 12:42, Thomas Huth wrote:
>> On 08/11/2022 10.49, Claudio Fontana wrote:
>>> On 11/4/22 13:57, Thomas Huth wrote:
>>>> Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
>>>> (it showed the available netdev backends), but this feature got broken during
>>>> some refactoring in version 6.0. Let's restore the old behavior, and while
>>>> we're at it, let's also print the available NIC models here now since this
>>>> option can be used to configure both, netdev backend and model in one go.
>>>>
>>>> Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    net/net.c | 14 ++++++++++++--
>>>>    1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/net/net.c b/net/net.c
>>>> index c0516a8067..b4b8f2a9cc 100644
>>>> --- a/net/net.c
>>>> +++ b/net/net.c
>>>> @@ -1571,8 +1571,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>>>>        const char *type;
>>>>    
>>>>        type = qemu_opt_get(opts, "type");
>>>> -    if (type && g_str_equal(type, "none")) {
>>>> -        return 0;    /* Nothing to do, default_net is cleared in vl.c */
>>>> +    if (type) {
>>>> +        if (g_str_equal(type, "none")) {
>>>> +            return 0;    /* Nothing to do, default_net is cleared in vl.c */
>>>> +        }
>>>> +        if (is_help_option(type)) {
>>>> +            GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
>>>> +            show_netdevs();
>>>> +            printf("\n");
>>>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>>>> +            g_ptr_array_free(nic_models, true);
>>>
>>> nit: would not the order:
>>>
>>>> +            GPtrArray *nic_models;
>>>> +            show_netdevs();
>>>> +            printf("\n");
>>>> +            nic_models = qemu_get_nic_models(TYPE_DEVICE);
>>>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>>>> +            g_ptr_array_free(nic_models, true);
>>>
>>> flow more logically?
>>
>> I think that's mostly a matter of taste ...
> 
> To some extent, but for the reader it would make more sense not to intermix unrelated code?

I'm pretty sure that as soon as I change it, another reviewer
shows up and asks me to put everything into one line again
since they prefer more compact code ;-)

> I'd say:
> 
> - show_netdevs
> _ get nic models
> - show nic models
> 
> instead of:
> 
> - get nic models
> - show netdevs
> - show nic models

I get your point, and I would immediately agree with you if we
were allowed to do:

         show_netdevs();
         printf("\n");
         GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
         qemu_show_nic_models(type, (const char **)nic_models->pdata);
         g_ptr_array_free(nic_models, true);

Although this is possible nowadays (since we're using
not C89 anymore), it's against the QEMU coding style.

So it's a trade-off now - use two lines of code and have some more
chronological code flow, or use one line of more compact code.

I'm in favor of the more compact code. So please let's stop
bike-shedding now.

  Thanks,
   Thomas


