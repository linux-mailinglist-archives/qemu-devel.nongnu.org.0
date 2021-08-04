Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6053E09E2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 23:12:24 +0200 (CEST)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBOBb-0008WO-7b
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 17:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBOAa-0007QU-PS
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:11:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBOAZ-000662-3p
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 17:11:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id j2so3680731wrx.9
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 14:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KIxg99syXp2YaFpge/9xW5i/F3jE7QPjiKQ8iTiAPXM=;
 b=IU+HUYEkIKhxUiFkmTgxWlBj5QYsVku/pWO8JxBo63bYu9PB+VjsQlfINd1mWi6woQ
 fz3Ogxj1VtrdP/5fnGBMUmLXfPPkCIAZxPp0LLHaKK+XYSSQZkWsGIKi97WZIQQ+qY57
 NBLeDQlUavekxMvkLEgGEyOpX1DWHeGKfqGQVUpauuu2LaUTNHZ46ALy52Rm7TGtYEkv
 M/MgHAgeYZVMejmeG+5DeT0slg2BcA+l+LTP/SgOknx1O8B86kc5ePcYBzpbi5Zl6E5T
 37jyOa2MyS1mP+fXqpC1X35VAebzhvHxvHyMGF4U5GrLUWITsbazXMfsmhPMXRgvO+yV
 0ZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KIxg99syXp2YaFpge/9xW5i/F3jE7QPjiKQ8iTiAPXM=;
 b=Fo5Ci7obMohuMZs/qn6hrJu9IStHT/DAf9WvDokeHZ0eqUTE1OuTe5k3RXoo3nJw4m
 uZzuZeUGiI0QEok32RwbSm9ky9NQNVK2PT+5SEFMziBni1aqkbiB/hydMUx1jTkrqdqL
 kegDC+xQzx99LzHnxX0rQQI0BW1j4zzCS9AVQRMswNaf4m/dzE3L8Q+ARwPw8fiNQWiO
 ab5uY6z0dS28UU03YyAw2Qasbyli050kkIA05SM/8WiaH8QDYZ9M+Xi4MOE8AB18Nbd2
 X/ZfDNwkrb67Uxlahp/B3pKC4seS/ytD9KbgZXTbKQsSgI5ZvgZlBaI/8TD8+ufgN6RU
 MQ/g==
X-Gm-Message-State: AOAM531lKOjMJMxBehm/oIvnC1iH+MergWtkY+ThFvI6T2pNj2ZRNiLP
 jcrIBFNAl37tqoPs+qaRVH4=
X-Google-Smtp-Source: ABdhPJxskBDsrR+NFyGUfuvMiwbrTPxWGEymHqpA3dIfM6vvgVQtzp+SHwYzTMvBnmLk8fpQbRTehg==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr1278716wrx.88.1628111476790; 
 Wed, 04 Aug 2021 14:11:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y11sm4669515wru.0.2021.08.04.14.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 14:11:15 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 v4] memory: Directly dispatch alias accesses on
 origin memory region
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210418055708.820980-1-f4bug@amsat.org>
 <6305a06b-c8a0-bcf7-f693-244aa34b16f4@amsat.org>
Message-ID: <9a2b2717-f531-8774-b631-a4048cc16e6b@amsat.org>
Date: Wed, 4 Aug 2021 23:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6305a06b-c8a0-bcf7-f693-244aa34b16f4@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's be honest, this won't make 6.1, so update the subject to 6.2,
as some scan the list for "6.2" in the subject when 6.1 release
is out.

On 7/7/21 3:58 PM, Philippe Mathieu-Daudé wrote:
> Peter Xu already reviewed, but Cc'ing Peter Maydell too due to
> his last comment on v3:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg800482.html
> 
> On 4/18/21 7:57 AM, Philippe Mathieu-Daudé wrote:
>> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
>> regions"), all newly created regions are assigned with
>> unassigned_mem_ops (which might be then overwritten).
>>
>> When using aliased container regions, and there is no region mapped
>> at address 0 in the container, the memory_region_dispatch_read()
>> and memory_region_dispatch_write() calls incorrectly return the
>> container unassigned_mem_ops, because the alias offset is not used.
>>
>> Consider the following setup:
>>
>>     +--------------------+ < - - - - - - - - - - - +
>>     |     Container      |  mr
>>     |  (unassigned_mem)  |                         |
>>     |                    |
>>     |                    |                         |
>>     |                    |  alias_offset
>>     +                    + <- - - - - - +----------+---------+
>>     | +----------------+ |              |                    |
>>     | |  MemoryRegion0 | |              |                    |
>>     | +----------------+ |              |       Alias        |  addr1
>>     | |  MemoryRegion1 | | <~ ~  ~  ~ ~ |                    | <~~~~~~
>>     | +----------------+ |              |                    |
>>     |                    |              +--------------------+
>>     |                    |
>>     |                    |
>>     |                    |
>>     |                    |
>>     | +----------------+ |
>>     | |  MemoryRegionX | |
>>     | +----------------+ |
>>     | |  MemoryRegionY | |
>>     | +----------------+ |
>>     | |  MemoryRegionZ | |
>>     | +----------------+ |
>>     +--------------------+
>>
>> The memory_region_init_alias() flow is:
>>
>>   memory_region_init_alias()
>>   -> memory_region_init()
>>      -> object_initialize(TYPE_MEMORY_REGION)
>>         -> memory_region_initfn()
>>            -> mr->ops = &unassigned_mem_ops;
>>
>> Later when accessing offset=addr1 via the alias, we expect to hit
>> MemoryRegion1. The memory_region_dispatch_read() flow is:
>>
>>   memory_region_dispatch_read(addr1)
>>   -> memory_region_access_valid(mr)   <- addr1 offset is ignored
>>      -> mr->ops->valid.accepts()
>>         -> unassigned_mem_accepts()
>>         <- false
>>      <- false
>>    <- MEMTX_DECODE_ERROR
>>
>> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
>>
>> Fix by dispatching aliases recursively, accessing its origin region
>> after adding the alias offset.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v4:
>> - added ASCII schema
>> v3:
>> - reworded, mentioning the "alias to container" case
>> - use recursive call instead of while(), because easier when debugging
>>   therefore reset Richard R-b tag.
>> v2:
>> - use while()
>> ---
>>  softmmu/memory.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index d4493ef9e43..b899ca6a6b7 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1442,6 +1442,11 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>>      unsigned size = memop_size(op);
>>      MemTxResult r;
>>  
>> +    if (mr->alias) {
>> +        return memory_region_dispatch_read(mr->alias,
>> +                                           mr->alias_offset + addr,
>> +                                           pval, op, attrs);
>> +    }
>>      if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
>>          *pval = unassigned_mem_read(mr, addr, size);
>>          return MEMTX_DECODE_ERROR;
>> @@ -1486,6 +1491,11 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>>  {
>>      unsigned size = memop_size(op);
>>  
>> +    if (mr->alias) {
>> +        return memory_region_dispatch_write(mr->alias,
>> +                                            mr->alias_offset + addr,
>> +                                            data, op, attrs);
>> +    }
>>      if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
>>          unassigned_mem_write(mr, addr, data, size);
>>          return MEMTX_DECODE_ERROR;
>>
> 

