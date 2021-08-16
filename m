Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B13ED9A6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:14:10 +0200 (CEST)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeJV-0007rE-Ia
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFeIK-0006RL-VU
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFeII-0005KJ-9J
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 11:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629126773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKAH550rr+Pv1ri3ED6qjrK8z9+HBqrlPlFnWj9rho4=;
 b=NSORnisC6biLULPvCeat26025YUlKbvRGtvNDXQ/fC9I0BOaNsmBsJGON6Nq/5KCeneH0S
 e/fWn97Vo8ExUYapSaTUEYT1N9BFNlu7TL4tY8/+oXWHbkWqTdwN/a8C4GHlAu8noAfOCO
 yNDspe6LBLlN5egpkrKrkQhP+oNCcqk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-YnCeWIWwPEGzCwBzQkAKrQ-1; Mon, 16 Aug 2021 11:12:50 -0400
X-MC-Unique: YnCeWIWwPEGzCwBzQkAKrQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso5111554wru.20
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bKAH550rr+Pv1ri3ED6qjrK8z9+HBqrlPlFnWj9rho4=;
 b=QFd0EMffgk6dzsQc0gxQDbf6eNC7h7LKxsTjn55fN9g62CaLb3j0x8s9uQX1rxgaJC
 JX/Q1CAzjjssUjLUMnSbsuKpui9CyilGFzJZOuQ571qVy8igzlwHWUPje/1N5wxQRGbJ
 IyTllPaC03EVuz181sedHKrj52MZ5vB3EWqVygIcP3vkTAYI/cHwCi3+yDN3q6yjXO/6
 UYELEwpciO+aWUnJdv05j05qYabRNJUgtRjYjhg7evjYt+fUYxQy8EtOQcYxPLsVMCYB
 emf81uAQUn586KjqZJpKZ4yA4O1T+OePcP2LnW0JBtFr6ZnxQUy3iyba5uWZzui/LcW4
 tcKg==
X-Gm-Message-State: AOAM532Tjz+fIE+1UdiM6MYlsLE8dQoHS3jO8wrIcO+K34IJlJdHH4c4
 Cdfp7FPntF1kerPo+wslD2knuLIQrqDYnyDiFnxW0o+Jw0HGA4mDKqz+mxroKehvK8sEOvWHRu8
 4HqOtkH/7zVXt7j8=
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19127657wrr.356.1629126769565; 
 Mon, 16 Aug 2021 08:12:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzea1FTsa40uh/G21XHGLc92E9GIzw5VHrWjdUkeNiQ6GhFtiAC6lz8Y0vMAT4mzp5W0VBtGg==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19127634wrr.356.1629126769373; 
 Mon, 16 Aug 2021 08:12:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c67f1.dip0.t-ipconnect.de. [91.12.103.241])
 by smtp.gmail.com with ESMTPSA id k13sm3143891wms.33.2021.08.16.08.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:12:49 -0700 (PDT)
Subject: Re: [PATCH v2 04/13] s390x/tcg: check for addressing exceptions for
 RRBE, SSKE and ISKE
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20210811090527.30556-1-david@redhat.com>
 <20210811090527.30556-5-david@redhat.com> <87pmudtogi.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <eb685953-5987-9289-3595-02388e1de363@redhat.com>
Date: Mon, 16 Aug 2021 17:12:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87pmudtogi.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.08.21 17:10, Cornelia Huck wrote:
> On Wed, Aug 11 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> Let's replace the ram_size check by a proper physical address space
>> check (for example, to prepare for memory hotplug), trigger addressing
>> exceptions and trace the return value of the storage key getter/setter.
>>
>> Provide an helper mmu_absolute_addr_valid() to be used in other context
>> soon. Always test for "read" instead of "write" as we are not actually
>> modifying the page itself.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   target/s390x/helper.h         |  6 +++---
>>   target/s390x/mmu_helper.c     |  8 ++++++++
>>   target/s390x/s390x-internal.h |  1 +
>>   target/s390x/tcg/mem_helper.c | 36 ++++++++++++++++++++++-------------
>>   4 files changed, 35 insertions(+), 16 deletions(-)
>>
> 
>> diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
>> index dd506d8d17..90ac82fdcc 100644
>> --- a/target/s390x/tcg/mem_helper.c
>> +++ b/target/s390x/tcg/mem_helper.c
>> @@ -28,6 +28,7 @@
>>   #include "qemu/int128.h"
>>   #include "qemu/atomic128.h"
>>   #include "tcg/tcg.h"
>> +#include "trace.h"
>>   
>>   #if !defined(CONFIG_USER_ONLY)
>>   #include "hw/s390x/storage-keys.h"
>> @@ -2171,15 +2172,15 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>>   /* insert storage key extended */
>>   uint64_t HELPER(iske)(CPUS390XState *env, uint64_t r2)
>>   {
>> -    MachineState *ms = MACHINE(qdev_get_machine());
>>       static S390SKeysState *ss;
>>       static S390SKeysClass *skeyclass;
>>       uint64_t addr = wrap_address(env, r2);
>>       uint8_t key;
>> +    int rc;
>>   
>>       addr = mmu_real2abs(env, addr);
>> -    if (addr > ms->ram_size) {
>> -        return 0;
>> +    if (!mmu_absolute_addr_valid(addr, false)) {
>> +        trigger_pgm_exception(env, PGM_ADDRESSING);
> 
> Don't you need s390_program_interrupt() instead?

Very good catch! Indeed, we want s390_program_interrupt() or even 
tcg_s390_program_interrupt().


-- 
Thanks,

David / dhildenb


