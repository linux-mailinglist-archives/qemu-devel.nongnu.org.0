Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE7677DC6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:16:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxcN-0003Hb-Od; Mon, 23 Jan 2023 09:16:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxcI-0003H6-Sv
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxcG-0003PP-LA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 09:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674483367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6R6e3dnr1e49oNzp2q5pzMMJ6QfBRKCTu69jRq7nDo=;
 b=F45Eucz3LrJaVAX5PC5/PYfcZBMEp4wO4FBVQurQCUFb8+NUE+9Px0UAWUPv4OrlLUHgHP
 Koz95ijtQ38nyQSyfjJ9uruQpIk09gtnptWYmjBu69G66N3Y5RJ7IpPM4j5d1B/vpAiOTs
 pWfv56d4p3Jp7BWgLuV1wC42C7/zE4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-hJ5eWMebPYGwYxLm41pu_A-1; Mon, 23 Jan 2023 09:16:06 -0500
X-MC-Unique: hJ5eWMebPYGwYxLm41pu_A-1
Received: by mail-wm1-f70.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so7560700wma.6
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 06:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q6R6e3dnr1e49oNzp2q5pzMMJ6QfBRKCTu69jRq7nDo=;
 b=osU7zCsFGxb+2FNQtqK41npIZMR7Gv5+YmmtPgpayGx6uBmbTjPuqrdNSmLEcscijb
 2r5jd86EQqE3M41kms8YySGPSE2NJOSSYPinISzASTm9o45T8UYMUCgsWM38h13hoSz0
 4sdfX8MNn1BqZq4ZfN1iPthww+KpJ+aSC+6jbK8lMSEnOz7MzofOmZyjyRuhCm8mLDNz
 /eBlJEPGl4Lubl2qzyK9hRsXIGCGHz4R9iGhkcZxb37DhWeghx6zeTWSa6Xlrw7+Ur3C
 U3J7BDN33ADkw+1yhQ8SOk2T1Ldfwtrx0MOhQHJTZxt7v/tNZKMwSobcTHBm5tp+l8T8
 6v3w==
X-Gm-Message-State: AFqh2krpjHnVvaBgmQxZO9c5WBo/j7kFmf3VSW8+5B64DjZY5FNfhW+n
 cbSvr48e/jogKqzmYVFNFUxkqZCiDpQmNb2yI6VcYIU2c+8wB5YLAS5g1kKKyYRqS7lsfVlaRSi
 YxyFLKuX8YBTvc88=
X-Received: by 2002:a05:600c:1c83:b0:3db:27b3:a654 with SMTP id
 k3-20020a05600c1c8300b003db27b3a654mr15691860wms.26.1674483365247; 
 Mon, 23 Jan 2023 06:16:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsb2gvNrbHRrxL64DKWY2g2lDkQAf1QANauv+5g2ADInTkJSxxBbE1i+2PKmAfTToCrs7RQcA==
X-Received: by 2002:a05:600c:1c83:b0:3db:27b3:a654 with SMTP id
 k3-20020a05600c1c8300b003db27b3a654mr15691846wms.26.1674483364972; 
 Mon, 23 Jan 2023 06:16:04 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c3ba300b003db12112fcfsm12196517wms.4.2023.01.23.06.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 06:16:04 -0800 (PST)
Message-ID: <e5423461-489f-b4c8-542b-113d8816a65a@redhat.com>
Date: Mon, 23 Jan 2023 15:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
Content-Language: en-US
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Igor Mammedov <imammedo@redhat.com>,
 yc-core@yandex-team.ru
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
 <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
 <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
 <Y86QBGquzIOb96MU@redhat.com>
 <aacfa4a8-21bc-6401-10e0-25b84155c9cf@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <aacfa4a8-21bc-6401-10e0-25b84155c9cf@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23.01.23 15:14, Daniil Tatianin wrote:
> On 1/23/23 4:47 PM, Daniel P. Berrangé wrote:
>> On Mon, Jan 23, 2023 at 04:30:03PM +0300, Daniil Tatianin wrote:
>>> On 1/23/23 11:57 AM, David Hildenbrand wrote:
>>>> On 20.01.23 14:47, Daniil Tatianin wrote:
>>>>> This series introduces new qemu_prealloc_mem_with_timeout() api,
>>>>> which allows limiting the maximum amount of time to be spent on memory
>>>>> preallocation. It also adds prealloc statistics collection that is
>>>>> exposed via an optional timeout handler.
>>>>>
>>>>> This new api is then utilized by hostmem for guest RAM preallocation
>>>>> controlled via new object properties called 'prealloc-timeout' and
>>>>> 'prealloc-timeout-fatal'.
>>>>>
>>>>> This is useful for limiting VM startup time on systems with
>>>>> unpredictable page allocation delays due to memory fragmentation or the
>>>>> backing storage. The timeout can be configured to either simply emit a
>>>>> warning and continue VM startup without having preallocated the entire
>>>>> guest RAM or just abort startup entirely if that is not acceptable for
>>>>> a specific use case.
>>>>
>>>> The major use case for preallocation is memory resources that cannot be
>>>> overcommitted (hugetlb, file blocks, ...), to avoid running out of such
>>>> resources later, while the guest is already running, and crashing it.
>>>
>>> Wouldn't you say that preallocating memory for the sake of speeding up guest
>>> kernel startup & runtime is a valid use case of prealloc? This way we can
>>> avoid expensive (for a multitude of reasons) page faults that will otherwise
>>> slow down the guest significantly at runtime and affect the user experience.
>>>
>>>> Allocating only a fraction "because it takes too long" looks quite
>>>> useless in that (main use-case) context. We shouldn't encourage QEMU
>>>> users to play with fire in such a way. IOW, there should be no way
>>>> around "prealloc-timeout-fatal". Either preallocation succeeded and the
>>>> guest can run, or it failed, and the guest can't run.
>>>
>>> Here we basically accept the fact that e.g with fragmented memory the kernel
>>> might take a while in a page fault handler especially for hugetlb because of
>>> page compaction that has to run for every fault.
>>>
>>> This way we can prefault at least some number of pages and let the guest
>>> fault the rest on demand later on during runtime even if it's slow and would
>>> cause a noticeable lag.
>>
>> Rather than treat this as a problem that needs a timeout, can we
>> restate it as situations need synchronous vs asynchronous
>> preallocation ?
>>
>> For the case where we need synchronous prealloc, current QEMU deals
>> with that. If it doesn't work quickly enough, mgmt can just kill
>> QEMU already today.
>>
>> For the case where you would like some prealloc, but don't mind
>> if it runs without full prealloc, then why not just treat it as an
>> entirely asynchronous task ? Instead of calling qemu_prealloc_mem
>> and waiting for it to complete, just spawn a thread to run
>> qemu_prealloc_mem, so it doesn't block QEMU startup. This will
>> have minimal maint burden on the existing code, and will avoid
>> need for mgmt apps to think about what timeout value to give,
>> which is good because timeouts are hard to get right.
>>
>> Most of the time that async background prealloc will still finish
>> before the guest even gets out of the firmware phase, but if it
>> takes longer it is no big deal. You don't need to quit the prealloc
>> job early, you just need it to not delay the guest OS boot IIUC.
>>
>> This impl could be done with the 'prealloc' property turning from
>> a boolean on/off, to a enum  on/async/off, where 'on' == sync
>> prealloc. Or add a separate 'prealloc-async' bool property
> 
> I like this idea, but I'm not sure how we would go about writing to live
> guest memory. Is that something that can be done safely without racing
> with the guest?

You can use MADV_POPULATE_WRITE safely, as it doesn't actually perform a 
write. We'd have to fail async=true if MADV_POPULATE_WRITE cannot be used.

-- 
Thanks,

David / dhildenb


