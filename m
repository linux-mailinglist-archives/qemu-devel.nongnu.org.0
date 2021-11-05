Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432ED445E7D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:18:15 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipk5-0003DY-P1
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mipj8-0002Yk-12
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mipj4-0003gH-ND
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636082229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcvtQyc6hcjSc3ufAjTPHAUcDAtfxRucdJUUiax52vw=;
 b=SmlQdsnb75/FnWRfF4ivb3C08zidydQTssv30MILDMXCpQ39Pkcjs98y/Cz3rIDfomz7rp
 ZOrV7eXrLjaKTmZ8oMnW4nDI7hhnSvk4VjM9yJxFGV/bRWyCIwTELo71nYagy4F/zr+BLS
 xL5wmPzfY6Gl+u8894bLpZvZNWsnxPo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-HxQrNa51Ntu_Bi9rd31g5Q-1; Thu, 04 Nov 2021 23:17:07 -0400
X-MC-Unique: HxQrNa51Ntu_Bi9rd31g5Q-1
Received: by mail-pj1-f70.google.com with SMTP id
 mv1-20020a17090b198100b001a67d5901d2so1550647pjb.7
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tcvtQyc6hcjSc3ufAjTPHAUcDAtfxRucdJUUiax52vw=;
 b=26TCcU9qemzZeryx9MKH864Y+drf+zN0haM/iAL/MkkiqjKX2IFW1Pb4t1eRR4aJn3
 omUXN9HUzPaRiUaWgKCFGdF3fquf3OxBCd7JINQgDvy58v5Rh4UtUG1yXOCXVHwSJ2/Q
 AWxgneJc2xJodvJ6VODEHOyT/1SljIWpPM5/ZUHn3y8F3boxYwNjbXkjtOCzycsBR/GA
 1qblUtXLUAH/IW9KG/9TjB3G7Nu8CiVo2ORUyATIvq6hhtTHtrBvjY36XUoexcROdE4k
 7G1W5TiOzT0nzU3UJc3rs4O/cv3upCunCEfe8WunX22lrF/Yy4en44ZsdAtjjFsqMmcJ
 NzAA==
X-Gm-Message-State: AOAM533IlQxCpKniq8E1bJqlwn9aISc1qLmvTMqhgcI08Ja/0T8K6l4A
 XNpCEGXa3KP+eFw5cinSHk5pqwd5hHqNWb8lZLIW4fs4QuHxBBXRMg+ZxDPO4XZPykJ1BIlu2AV
 uKnOzPlaofEVpeKo=
X-Received: by 2002:a17:90b:3908:: with SMTP id
 ob8mr8297702pjb.57.1636082226879; 
 Thu, 04 Nov 2021 20:17:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhWoXGSQnksj2mMNiN1PeXZs/KqZ+IWD8soUj9GTsA1p6FLa3WfNP/FQZdzQqrBz6gLeHL9g==
X-Received: by 2002:a17:90b:3908:: with SMTP id
 ob8mr8297684pjb.57.1636082226606; 
 Thu, 04 Nov 2021 20:17:06 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id lj15sm5208900pjb.12.2021.11.04.20.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 20:17:06 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
To: "Zhang, Chen" <chen.zhang@intel.com>, Markus Armbruster <armbru@redhat.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
Date: Fri, 5 Nov 2021 11:16:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/4 下午1:37, Zhang, Chen 写道:
>>>>>
>>>>> I wonder if we need to introduce new parameter, e.g force_vnet_hdr
>>>>> here, then we can always send vnet_hdr when it is enabled.
>>>>>
>>>>> Otherwise the "vnet_hdr_support" seems meaningless.
>>>> Yes, Current "vnet_hdr_support"  default enabled, and vnet_hdr_len
>>> already forced from attached nf->netdev.
>>>> Maybe we can introduce a new parameter "force_no_vnet_hdr" here to
>>> make the vnet_hdr_len always keep 0.
>>>> If you think OK, I will update it in next version.
>>> Let me explain, if I was not wrong:
>>>
>>> "vnet_hdr_support" means whether or not to send vnet header length. If
>>> vnet_hdr_support=false, we won't send the vnet header. This looks the
>>> same as you "force_no_vent_hdr" above.
>> Yes, It was.  But this series changed it.
>> Current "vnet_hdr_support" can't decide whether send vnet header length,
>> we always send it even 0.
>> It will avoid sender/receiver transfer protocol parse issues:
>> When sender data with the vnet header length, but receiver can't enable the
>> "vnet_hdr_support".
>> Filters will auto setup vnet_hdr_len as local nf->netdev and found the issue
>> when get different vnet_hdr_len from other filters.
>>
>>> And my "force_vnet_hdr" seems duplicated with vnet_hdr_support=true.
>>> So it looks to me we can leave the mirror code as is and just change
>>> the compare? (depends on the mgmt to set a correct vnet_hdr_support)
>> OK, I will keep the filter-mirror/filter-redirector/filter-rewriter same as this
>> version.
>> For the colo-compare module, It will get primary node's filter data's
>> vnet_hdr_len as the local value, And compare with secondary node's,
>> because it is not attached any nf->netdev.
>> So, it looks compare module's "vnet_hdr_support" been auto configuration
>> from the filter transport protocol.
>> If the "force_vnet_hdr" means hard code a compare's local vnet_hdr_len
>> rather than come from input filter's data?
>>
>> Thanks
>> Chen
>>
> Hi Jason/Markus,
>
> Rethink about it, How about keep the original "vnet_hdr_support" function,
> And add a new optional parameter "auto_vnet_hdr" for filters/compare?


It's a way but rethink of the whole thing. I wonder what if we just 
enable "vnet_hdr_support" by default for filter and colo-compare?

Thanks


>
> Thanks
> Chen
>
>
>>> Thanks
>>>
>>>> Thanks
>>>> Chen
>>>>
>>>>> Thanks
>>>>>
>>>>>


