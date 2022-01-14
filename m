Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2148E2CA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 04:04:38 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8CtJ-0007vm-QD
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 22:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8CrH-0007GM-UW
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:02:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8CrG-0001f2-8w
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 22:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642129348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mtAV8rAoNiQV58JOL62ADrfBnZod2H4fsUUQMdOiquI=;
 b=HCkhXvYydC1X8x2sv26EZSrDQ01mmokK0EGeAx4a9mFKJvspLyZNrMbfBQum/xodnHgowX
 me/zRMTVwkkQDMRUwbcZ4iKFW9W1fq84PDXtIk8quqHiEurX/hoWVNEJSRzecOmKPHuUYY
 ByLwso2c7o7v9Esy2gVFHCnWfLSxqWs=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-0-JWzr8dP96Ih6YDkECtsQ-1; Thu, 13 Jan 2022 22:02:27 -0500
X-MC-Unique: 0-JWzr8dP96Ih6YDkECtsQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 f24-20020aa782d8000000b004bc00caa4c0so950786pfn.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 19:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mtAV8rAoNiQV58JOL62ADrfBnZod2H4fsUUQMdOiquI=;
 b=j/6rtKA9KuUT/SCn0PBf1fQS89RjmD23scSvMJRQQ0RUm1k8mZ17ez90MuQtEi3dXU
 Kr+/La7HOh8IFUgmO5P8tVhdp7C2F54wbYyDFZffUbJovL37U9QOvoeD0Fr+dfNgLDJ+
 +d0Zk8xP2u6fb0ogGwcMQ/FUDCXrVKMuM5csKBTUfFOy4c19+zSf0dBTZndt5vl5AHDH
 //R1RDGw6jM2cQTCWZvul79tZ2FYmTN26O0CYWaRCtNBMtNGUozyygnVSZlFhp2QcrIs
 O1TfMam/hMfaBAqdlZO7KwwgfPXVqvq/XAUg2k6mTk02mhUVCvII6rROVAJWRaqN5Cmr
 uj7w==
X-Gm-Message-State: AOAM533dlu1MAlifcwHW6oq7FTlkymQrZNs7hupKMoJ6tbJ/ZNVjuGVY
 M/9IHJ6WPVLL3h/5DR4amIwZe9CejbNhWV4ZwSdOEI4HceYZub6P5A+kMmSquD/W+D2goxayksF
 d7HmoJREttteGItU=
X-Received: by 2002:a62:1e05:0:b0:4bd:4b03:c1dc with SMTP id
 e5-20020a621e05000000b004bd4b03c1dcmr7321157pfe.21.1642129345958; 
 Thu, 13 Jan 2022 19:02:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTv02UPtXpgY7NXH87WUBzeIim6LnALKUHfy18hnLbffvrrI8TM2C6E3C2wRI3kXCytJ9f1Q==
X-Received: by 2002:a62:1e05:0:b0:4bd:4b03:c1dc with SMTP id
 e5-20020a621e05000000b004bd4b03c1dcmr7321125pfe.21.1642129345410; 
 Thu, 13 Jan 2022 19:02:25 -0800 (PST)
Received: from [10.72.13.172] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id ob12sm3284947pjb.17.2022.01.13.19.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 19:02:24 -0800 (PST)
Message-ID: <a0ccd6aa-f85e-fd4a-1c1b-17316ea60b18@redhat.com>
Date: Fri, 14 Jan 2022 11:02:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/3] intel-iommu: don't warn guest errors when getting
 rid2pasid entry
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-3-jasowang@redhat.com> <Yd+d9ydZl7tLYWBj@xz-m1.local>
 <20220113020426-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220113020426-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yi.l.liu@intel.com, yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/13 下午3:05, Michael S. Tsirkin 写道:
> On Thu, Jan 13, 2022 at 11:35:19AM +0800, Peter Xu wrote:
>> On Wed, Jan 05, 2022 at 12:19:43PM +0800, Jason Wang wrote:
>>> We use to warn on wrong rid2pasid entry. But this error could be
>>> triggered by the guest and could happens during initialization. So
>>> let's don't warn in this case.
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>>   hw/i386/intel_iommu.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>>> index 4c6c016388..f2c7a23712 100644
>>> --- a/hw/i386/intel_iommu.c
>>> +++ b/hw/i386/intel_iommu.c
>>> @@ -1524,8 +1524,10 @@ static bool vtd_dev_pt_enabled(IntelIOMMUState *s, VTDContextEntry *ce)
>>>       if (s->root_scalable) {
>>>           ret = vtd_ce_get_rid2pasid_entry(s, ce, &pe);
>>>           if (ret) {
>>> -            error_report_once("%s: vtd_ce_get_rid2pasid_entry error: %"PRId32,
>>> -                              __func__, ret);
>>> +            /*
>>> +             * This error is guest triggerable. We should assumt PT
>>> +             * not enabled for safety.
>>> +             */
>>>               return false;
>>>           }
>>>           return (VTD_PE_GET_TYPE(&pe) == VTD_SM_PASID_ENTRY_PT);
>>> -- 
>>> 2.25.1
>>>
>> No strong opinion, but the thing is mostly all error_report_once() in this file
>> is guest triggerable.  If we remove this one then it's debatable on whether we
>> want to remove all.
>>
>> IMHO we used the _once() variant just for this: it won't go into any form of
>> DoS, meanwhile we'll still get some information (as hypervisor) that the guest
>> OS may not be trustworthy.
>>
>> So from that pov it's still useful?  Or is this error very special in some way?
>>
>> Thanks,
>
> Well we have LOG_GUEST_ERROR for guest errors now.


Ok, but this is not necessarily a guest error. (Inferring from the 
comment in vtd_as_pt_enabled()).

Thanks


>
>> -- 
>> Peter Xu


