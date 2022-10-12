Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4DB5FC557
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:32:40 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiaub-0001yN-6X
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiapt-0005Hh-Bz
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oiapq-0000ff-R7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665577661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mo15DHOSpcXHfgiRx35ZIjinHvVTLjzgZPMAHr+8DOo=;
 b=jS98QV/y5xdHJ+onu0r/Xdq//3yzJ+bw2I+We9/c7C+iuBl009NPrGr6S5ffRElxwFtI7m
 rrfO2tFHUwmI0X9DIXxUh8/0zmy1ArVH5AU3pSIn73SYWYAmDQTkRjkvDv6h2e1l/hCOo8
 B4pfO19AilSsF4EVCmteJi3D/zo86+M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-IZNQi53wOiKoNMDhGYlikA-1; Wed, 12 Oct 2022 08:27:40 -0400
X-MC-Unique: IZNQi53wOiKoNMDhGYlikA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so4961239wrd.22
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 05:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mo15DHOSpcXHfgiRx35ZIjinHvVTLjzgZPMAHr+8DOo=;
 b=A2rOIVgS7V87nk8OhwxolSZ4y+CUZWwz4cSM3TKagJGXrdxUO4FgbFkTuKFKDtK4cT
 EkcldnbRUk7btxUcjiGd34l5iG3XHIZ++MJQAN0q46mZMHgY/GedAqUoQkFKUixPbU+n
 ldOt3ML1Gq+xGsxg68IwQzdJT8WMf/rLN0rxTGnSw1HtyuRZnBagAzuCBt64wmbIxt10
 IsWNl7n1efYK3L/HbX16t1IMf+3WBlb8Cp0y8VU4iPq3yOGrtM/Ueg9ySV5LKpZpBxMl
 67UmH1bendW5918po6dA1DSFcbXT95bSmQShwjGnBr8qcQWu7kqADhJ97SL5t7r+tzYg
 uoUQ==
X-Gm-Message-State: ACrzQf0WUmhdz0ZbDEgVsqWmG4InqqpYSTf12fNtntbI9c3MuSbdUIh6
 v8BTLD68h4qgpXAbVGYKktdMAHm2Fw8zn7ks+G/4AX5HLs0hpq8eN9jdDsTdzDMPT++58rQUvgp
 vo/Aj/JfipDi7aHs=
X-Received: by 2002:adf:ec03:0:b0:22e:4d3:bb37 with SMTP id
 x3-20020adfec03000000b0022e04d3bb37mr17874810wrn.665.1665577659200; 
 Wed, 12 Oct 2022 05:27:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mtXgFIHIxxZN0d+GFTC5R9j4S0/Sk33PMHVwF6pVsF4ePW7P85Erp57mtx6Ep+hKY/iLFQA==
X-Received: by 2002:adf:ec03:0:b0:22e:4d3:bb37 with SMTP id
 x3-20020adfec03000000b0022e04d3bb37mr17874783wrn.665.1665577658867; 
 Wed, 12 Oct 2022 05:27:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:3a00:4f2c:105b:3371:a623?
 (p200300cbc7043a004f2c105b3371a623.dip0.t-ipconnect.de.
 [2003:cb:c704:3a00:4f2c:105b:3371:a623])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b0022e6f0d0d7csm17338108wrm.18.2022.10.12.05.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 05:27:38 -0700 (PDT)
Message-ID: <6637dec0-9adf-335b-c96a-749377dec15a@redhat.com>
Date: Wed, 12 Oct 2022 14:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com> <87czayj4ig.fsf@pond.sub.org>
 <e689f938-f95d-f34c-117d-da58315576fa@redhat.com>
 <874jw9fp0j.fsf@pond.sub.org>
 <ee441feb-3293-efe7-e273-3d28910a0b19@redhat.com>
 <878rlle3xj.fsf@pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <878rlle3xj.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

>>> Thanks!
>>
>> I'm adding
>>
>> "Note that the CPU affinity of previously created threads will not get adjusted."
>>
>> and
>>
>> "In general, the interface behaves like pthread_setaffinity_np(): host CPU numbers that are currently not available are ignored; only host CPU
>> numbers that are impossible with the current kernel will fail. If the list of host CPU numbers does not include a single CPU that is
>> available, setting the CPU affinity will fail."
> 
> This is one of the reasons why reviewing your work is such a pleasure:
> not only do you answer my questions with clarity and patience, you
> proactively improve your patches before I can even think to ask.
> 
> Thank you!

Thanks a lot Markus -- I have to say that your reviews are extremely 
helpful! You ask just the right questions that make one realize which 
parts of the documentation need improvement!

-- 
Thanks,

David / dhildenb


