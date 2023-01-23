Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2B677D28
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:57:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxJX-0001DO-Gz; Mon, 23 Jan 2023 08:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxJW-0001Cr-0A
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJxJU-0007T9-3W
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674482203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEKMr7ZbekR9gDHxqWyzL4jVQGBLf4G7mMEG+BJ61PE=;
 b=PRt10o8hU3jJ0jiFD5t5dWitEBP/hQGZuNs56TET27sCPILoW+P4DGjJo/AlME0VSC9Z/A
 VZ8JwfilNki17HEMWNaBtWxCVTEuBmZfiI+XJTNSBM30Vkyd6fGPiIqCbYmaSZ7DqLMvpS
 xb6O6XpsLXHvBmmySTAQRqLOmg8/BeY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-247-yXH_KlrOMQWJjphDxFe2PA-1; Mon, 23 Jan 2023 08:56:41 -0500
X-MC-Unique: yXH_KlrOMQWJjphDxFe2PA-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl5-20020a05600c0b8500b003db12112fdeso7544206wmb.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BEKMr7ZbekR9gDHxqWyzL4jVQGBLf4G7mMEG+BJ61PE=;
 b=bL4F5fz6Ajyw9xrQvL/YRnCjRyzT+iQzMccA+lESxxjCeCcfT7d4QD1MNMKsfHlKau
 xRmTqE4XphQIk0lOsoYDlU4NjLJXlMofXnaAa4hff07dQfaDuHEsMIITNDS76G2LelCh
 Hnemkk+baQ6yo2iOlMfFc5vSGTZszuNae9ZuSVVWL95QMj3BHARg3kmpsg0gcDTBnav7
 uDMgKI21gbz2mzKW67+/jOmRCvDTwZhBhkG74BYwAbXtPbEkHRhZaZKEVHQ0rXSVFz68
 TY+BGnMOmjTSvsNpkHCy+vl9vaE5dI+aB4wbSLMw0ybdeLC5CNwPcrURxfC45FaF+luO
 qqyg==
X-Gm-Message-State: AFqh2koE45S5abmnzm/NEU358lPWuuJ0pDBmzIbC/Cb48BfI72eEXPa7
 bLtf1i75wrQJ38Qr6iMexjzbe8bDtFYsIOq+AXT1DY2CrMAPyua0YGP0Q4QiCACVRvMERUsBREA
 g+NYHaQzWN5QOimY=
X-Received: by 2002:a05:600c:1912:b0:3db:f0a:8707 with SMTP id
 j18-20020a05600c191200b003db0f0a8707mr20997019wmq.40.1674482200638; 
 Mon, 23 Jan 2023 05:56:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLNWydZkNkMBSctDJ2gp7AAQVt7VFhy3H5MhBthVkafeLtb8VcHdqVh9kC57OaUxhCy4X/Ug==
X-Received: by 2002:a05:600c:1912:b0:3db:f0a:8707 with SMTP id
 j18-20020a05600c191200b003db0f0a8707mr20997000wmq.40.1674482200315; 
 Mon, 23 Jan 2023 05:56:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b003db0b0cc2afsm11759150wmq.30.2023.01.23.05.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 05:56:39 -0800 (PST)
Message-ID: <be1e940e-0188-9b52-a0d8-9ab3d6bfad3f@redhat.com>
Date: Mon, 23 Jan 2023 14:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
 <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
 <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
In-Reply-To: <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23.01.23 14:30, Daniil Tatianin wrote:
> On 1/23/23 11:57 AM, David Hildenbrand wrote:
>> On 20.01.23 14:47, Daniil Tatianin wrote:
>>> This series introduces new qemu_prealloc_mem_with_timeout() api,
>>> which allows limiting the maximum amount of time to be spent on memory
>>> preallocation. It also adds prealloc statistics collection that is
>>> exposed via an optional timeout handler.
>>>
>>> This new api is then utilized by hostmem for guest RAM preallocation
>>> controlled via new object properties called 'prealloc-timeout' and
>>> 'prealloc-timeout-fatal'.
>>>
>>> This is useful for limiting VM startup time on systems with
>>> unpredictable page allocation delays due to memory fragmentation or the
>>> backing storage. The timeout can be configured to either simply emit a
>>> warning and continue VM startup without having preallocated the entire
>>> guest RAM or just abort startup entirely if that is not acceptable for
>>> a specific use case.
>>
>> The major use case for preallocation is memory resources that cannot be
>> overcommitted (hugetlb, file blocks, ...), to avoid running out of such
>> resources later, while the guest is already running, and crashing it.
> 
> Wouldn't you say that preallocating memory for the sake of speeding up
> guest kernel startup & runtime is a valid use case of prealloc? This way
> we can avoid expensive (for a multitude of reasons) page faults that
> will otherwise slow down the guest significantly at runtime and affect
> the user experience.

With "ordinary" memory (anon/shmem/file), there is no such guarantee 
unless you effectively prevent swapping/writeback or run in an extremely 
controlled environment. With anon memory, you further have to disable 
KSM, because that could immediately de-duplicate the zeroed pages again.

For this reason, I am not aware of preallocation getting used for the 
use case you mentioned. Performance-sensitive workloads want 
determinism, and consequently usually use hugetlb + preallocation. Or 
mlockall() to effectively allocate all memory and lock it before 
starting the VM.

Regarding page faults: with THP, the guest will touch a 2 MiB range 
once, and you'll get a 2 MiB page populated, requiring no further write 
faults, which should already heavily reduce page faults when booting a 
guest.

Preallocating all guest memory to make a guest kernel boot up faster 
sound a bit weird to me. Preallocating "some random part of guest 
memory" also sounds weird, too: what if the guest uses exactly the 
memory locations you didn't preallocate?

I'd suggest doing some measurements if there are actually cases where 
"randomly preallocating some memory pages" are actually beneficial when 
considering the overall startup time (setting up VM + starting the OS).

> 
>> Allocating only a fraction "because it takes too long" looks quite
>> useless in that (main use-case) context. We shouldn't encourage QEMU
>> users to play with fire in such a way. IOW, there should be no way
>> around "prealloc-timeout-fatal". Either preallocation succeeded and the
>> guest can run, or it failed, and the guest can't run.
> 
> Here we basically accept the fact that e.g with fragmented memory the
> kernel might take a while in a page fault handler especially for hugetlb
> because of page compaction that has to run for every fault.
> 
> This way we can prefault at least some number of pages and let the guest
> fault the rest on demand later on during runtime even if it's slow and
> would cause a noticeable lag.

Sorry, I don't really see the value of this "preallcoating an random 
portion of guest memory".

In practice, Linux guests will only touch all memory once that memory is 
required (e.g., allocated), not as default during bootup".

What you could do, is start the VM from a shmem/hugetlb/... file, and 
concurrently start preallocating all memory from a second process. The 
guest can boot up immediately and eventually you'll have all guest 
memory allocated. It won't work with anon memory (memory-backend-ram) 
and private mappings (shared=false), of course.

> 
>> ... but then, management tools can simply start QEMU with "-S", start an
>> own timer, and zap QEMU if it didn't manage to come up in time, and
>> simply start a new QEMU instance without preallocation enabled.
>>
>> The "good" thing about that approach is that it will also cover any
>> implicit memory preallocation, like using mlock() or VFIO, that don't
>> run in ordinary per-hostmem preallocation context. If setting QEMU up
>> takes to long, you might want to try on a different hypervisor in your
>> cluster instead.
> 
> This approach definitely works too but again it assumes that we always
> want 'prealloc-timeout-fatal' to be on, which is, for the most part only
> the case for working around issues that might be caused by overcommit.

Can you elaborate? Thanks.

-- 
Thanks,

David / dhildenb


