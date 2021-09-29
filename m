Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7C41C160
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:12:41 +0200 (CEST)
Received: from localhost ([::1]:52756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVdo-0000hV-1m
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVVbk-0007HI-MQ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVVbi-00072k-Id
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1ZjcAqnoIeVYB9ics8Fwj4YBQPJEULmqKN6XEFhskw=;
 b=QtILZINIsfq7+DC2scVs5L7XaCR6HBwxF1+u51q8sA2Fs/FmQzr0eCBNmY05SemblUq8Tk
 qD12LIyqmhDWUcFMO1ftxEluoTZyZKqwxkQWE+/v6NyktoZ/IJpTbBJnzk7Q1SmJ775Oji
 3WJXdmhktKPoxDeXHkPzi8hTM56STcg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-LH3V2ov8MkStPP35RsEUaQ-1; Wed, 29 Sep 2021 05:10:27 -0400
X-MC-Unique: LH3V2ov8MkStPP35RsEUaQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j15-20020a5d564f000000b00160698bf7e9so395823wrw.13
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 02:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M1ZjcAqnoIeVYB9ics8Fwj4YBQPJEULmqKN6XEFhskw=;
 b=FjCPF0FJUuYJtY2y/YDCVjq2KSbxEI9wg50Bm0Q/w9f70M2IznuypVdjafebV8pdcV
 fGmcI8DcJQqvnqESToQaoPqzYnR1G4sH/Wb3lP39c+JnTkeojBJQuVDHIS0isy9w9zaM
 dMBofrbDv7sGx05nZ0SnrlWZtPrKE4tbeYBXyBoWVtWx59LN7igPkRo74aS0zZ8V1sTR
 GqczGUqbTCWve40U76k3d2hvaOt/G/hNbudP8DVz0sZTV5kv/PQVEygH2LUkAwzM5aQE
 CeNFnDhuxq1r6FkoB1pJsXeF64D3s54Cu/Sbofpv8YTRoCPJX4E5YkIUoxqf+HVk7qA0
 VSBg==
X-Gm-Message-State: AOAM532WpENSpy4jXmr58SyVv2C1T1NfVfyexaDU795iGmqJYDlDZsnr
 vEmTVXYKUq3taFEnFMCJ9yF0phJJnv4G3SE0RK2c8ljPPkg+Km/r3zFWpqL8xbtHzXsdnXvy6CC
 RHuanH0a/Mhkd8slFmpb8ShKFZyMZFPNd3kJxPEDRwdnKR9wH8pa4eStA8ck3n0s=
X-Received: by 2002:adf:e9c8:: with SMTP id l8mr5559580wrn.48.1632906625879;
 Wed, 29 Sep 2021 02:10:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8RuucgN3C0a4r7FNuDkJz/JPuKM/bUd7uyvgqM9L6VCv5KciTQ4Jsm6yfclpxjGz+DoYXDA==
X-Received: by 2002:adf:e9c8:: with SMTP id l8mr5559556wrn.48.1632906625595;
 Wed, 29 Sep 2021 02:10:25 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 w17sm712122wmi.42.2021.09.29.02.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 02:10:25 -0700 (PDT)
Subject: Re: [External] Re: [PATCH] hostmem: change default prealloc threads
 number
To: Igor Mammedov <imammedo@redhat.com>, Nan Wang <wangnan.light@bytedance.com>
References: <20210927131951.1810823-1-user@n248-145-203>
 <b14aebb1-489b-b15b-f9eb-047073920175@redhat.com>
 <e1a98460-ad0a-9b9c-5958-bb39635886ec@bytedance.com>
 <20210929110531.0724f911@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f15860ef-e53f-3980-d915-641aa201e8c8@redhat.com>
Date: Wed, 29 Sep 2021 11:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929110531.0724f911@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mikughoull@gmail.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.09.21 11:05, Igor Mammedov wrote:
> On Tue, 28 Sep 2021 00:47:01 +0800
> Nan Wang <wangnan.light@bytedance.com> wrote:
> 
>> On 2021/9/27 11:16, David Hildenbrand wrote:
>>> On 27.09.21 15:19, Nan Wang wrote:
>>>> From: "wangnan.light" <wangnan.light@bytedance.com>
>>>>
>>>> the default number of prealloc threads is 1, for huge memory backend
>>>> file, single thread touch page is really slow.
>>>> We can adjust thread number by prealloc-threads property, but if the
>>>> default value updated to MachineState::smp::cpus may be better.
>>>> For example, old version of qemu(prealloc-threads have not been
>>>> introduced yet), the value of threads num is MachineState::smp::cpus,
>>>> so if someone use the same commandline to start current verion of qemu
>>>> and old version of qemu which will lead to different behaviors.
>>>
>>> The introducing patch mentions:
>>>
>>> commit ffac16fab33bb42f17e47624985220c1fd864e9d
>>> Author: Igor Mammedov <imammedo@redhat.com>
>>> Date:   Wed Feb 19 11:09:50 2020 -0500
>>>
>>>       hostmem: introduce "prealloc-threads" property
>>>
>>>       the property will allow user to specify number of threads to use
>>>       in pre-allocation stage. It also will allow to reduce implicit
>>>       hostmem dependency on current_machine.
>>>       On object creation it will default to 1, but via machine
>>>       compat property it will be updated to MachineState::smp::cpus
>>>       to keep current behavior for hostmem and main RAM (which is
>>>       now also hostmem based).
>>>
>>> So it looks like we want to do the latter via compat properties eventually.
>>>
>>> However, I'd like to note that more prealloc threads might be good for
>>> large backends, and might be bad for small backends. To me, it feels
>>> like a workload that relies on this should really do this manually. So I
>>> am still not sure if this is the right thing to do.
>> Yes, I agree with you "more prealloc threas are good for large backends,
>> and bad for small backends". But I think most situation large backends
>> always with large vcpu numbers and small backens always with small vcpu
>> numbers, because most users will not create a vm with large vcpu numbers
>> with small memory.
>>
>>
>>>
>>> Note that qapi/qom.json:
>>>
>>> "@prealloc-threads: number of CPU threads to use for prealloc (default:
>>> 1", so that doc would be wrong now.
>>>
>>> Why exactly can't workload that cares not simply set this manually?
>>> Performance tuning smells like something to be done manually for a
>>> specific workload.
>>>   
>> It is a simply way that let workload set the prealloc threads manually.
>> For example, for large backends it set many prealloc threads, and set 1
>> prealloc threads manually for small backends. Yes, workload can
>> `maunally` set prealloc thread to 1, rather than use `default` value 1.
>> So when workload want to(or maybe just forget specify the
>> prealloc-threads property) use the default value, I think the
>> MachineState::smp::cpus maybe better than 1.
> 
> as commit mentioned by David states, it creates implicit dependency
> on Machine and we were working getting rid of such dependencies
> where it's possible.
> 
> So if you have to change prealloc-threads to a larger number,
> you can try to use specific machine compat properties to do it,
> instead of pushing machine to generic backend code. But 'good'
> default for your workload doesn't guaranties it's a good one
> another.
> 
> My preference is that user (mgmt layer) should set property
> explicitly if it cares. It's leads to more stable VM config,
> as opposed to using defaults which could change over time and
> unexpectedly 'regress' such VMs, and can factor in host/workload
> specific nuances without need to change QEMU.

Exactly my thoughts, thanks Igor.

-- 
Thanks,

David / dhildenb


