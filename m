Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD5404024
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 22:19:07 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO42E-0002pA-AN
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 16:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO414-0001X8-E1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:17:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO412-0006xL-F0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 16:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631132271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHvCWRtnSH8d3gd3+/Tv8tD0rKfzpVGcOiY1Ubdnq/E=;
 b=MyJ82jXAn5LVcIo82gLqWNWnV2QMjznOGUgw8Nz4vYa4/wpeSepSomBAe7IrHo7IKpubD+
 B4ap8RiChcRoXa3dqHd2oIcyJXfWmPwsoA7bBJj1D3uyPRxFDjfBtxXzq1g+E5kH8kFxXG
 jOYbWYp4cT4c2ROGY9nMF180OhTFpRY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ztT_ulD0PAC2x6DbFR1xzQ-1; Wed, 08 Sep 2021 16:17:50 -0400
X-MC-Unique: ztT_ulD0PAC2x6DbFR1xzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so1339946wmc.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 13:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XHvCWRtnSH8d3gd3+/Tv8tD0rKfzpVGcOiY1Ubdnq/E=;
 b=KUFFpGLmIhob//pCgK/w9SXYRExJl1LBVS4VQ4P1sN6KcXZyiBQcF0dFddwqvgWQA5
 H7gH1foYEdhOGCy8wAdRHGH7v2Ogu8Av0tvZB/VBGVZ9kC24j6076wp8llLwPbB8Ifda
 goThMOsbY+7zPqyucQTQ4uy1SVwZZ4VJ97dZ08WV4wU9xz7CvpiVGp7WOoa/zJmnQxbw
 1pG+/uzj3H+7ptsaqXYMEYR9IQQ+ZcpeLOCyih3cXZT/X4/nPTwjzZ2OHoDuYeto2cKF
 CaV646mJdfDqgJAHVSngbuEmpfnlSDyhdPAEZHNi7DM/BnD3DTze5Q2V7Rhk9+BeQ+0L
 oExA==
X-Gm-Message-State: AOAM5322OlGOjmQkaq6kCFEOSAzIZq4jv54psNcwTOW5Taik0Yl0HHWL
 w033S2sZEcNoxH3UcTK3axqZMOX0wP+HTQa2XXNzwRH5trmKFJfzmb3bmD3wKaDmQCl5Ruos/IH
 ZxWV+sBCkJrdy+F8IdBwP1hmo7Ir61RqtYuKLTG9KxsJQZbLJjee5BsILF/2vQx2T
X-Received: by 2002:adf:eb83:: with SMTP id t3mr90784wrn.365.1631132269114;
 Wed, 08 Sep 2021 13:17:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1AeyEv40X8Eui/4+NIAJWfzMT80aFg80wAISLISH7IuzOp4DWRpj9NJx4+mj82WrJct7+qg==
X-Received: by 2002:adf:eb83:: with SMTP id t3mr90761wrn.365.1631132268815;
 Wed, 08 Sep 2021 13:17:48 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z7sm142756wre.72.2021.09.08.13.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 13:17:48 -0700 (PDT)
Subject: Re: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
To: Peter Xu <peterx@redhat.com>
References: <20210906122020.5793-1-bmeng.cn@gmail.com>
 <54817618-59b9-d6e6-f903-f7d6938c17ba@redhat.com> <YTkF99YYW8cwa77F@t490s>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b52319f1-3c4c-a098-7581-5d976b3160c1@redhat.com>
Date: Wed, 8 Sep 2021 22:17:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTkF99YYW8cwa77F@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:50 PM, Peter Xu wrote:
> On Mon, Sep 06, 2021 at 03:01:54PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/6/21 2:20 PM, Bin Meng wrote:
>>> It's been a requirement that at least one function pointer for read
>>> and one for write are provided ever since the MemoryRegion APIs were
>>> introduced in 2012.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>>
>>>  docs/devel/memory.rst | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
>>> index 5dc8a12682..7b589b21d2 100644
>>> --- a/docs/devel/memory.rst
>>> +++ b/docs/devel/memory.rst
>>> @@ -344,6 +344,11 @@ based on the attributes used for the memory transaction, or need
>>>  to be able to respond that the access should provoke a bus error
>>>  rather than completing successfully; those devices can use the
>>>  ->read_with_attrs() and ->write_with_attrs() callbacks instead.
>>> +The requirement for a device's MemoryRegionOps is that at least
>>> +one callback for read and one for write are provided. If both
>>> +->read() and ->read_with_attrs() are provided, the plain ->read()
>>> +version takes precedence over the with_attrs() version. So does
>>> +the write callback.
>>
>> What about also adding a runtime check?
>>
>> -- >8 --
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index bfedaf9c4df..8ab602d3379 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1516,6 +1516,17 @@ MemTxResult
>> memory_region_dispatch_write(MemoryRegion *mr,
>>      }
>>  }
>>
>> +static void memory_region_set_ops(MemoryRegion *mr, const
>> MemoryRegionOps *ops)
>> +{
>> +    if (ops) {
>> +        assert(ops->valid.accepts || (ops->read || ops->read_with_attrs));
>> +        assert(ops->valid.accepts || (ops->write ||
>> ops->write_with_attrs));
> 
> Curious why accepts() matters.. Say, if there's only accepts() provided and it
> returned true, then I think we still can't avoid the coredump when read/write?

Good point :(

> I'm also curious what's the issue that Paolo mentioned here:
> 
> https://lore.kernel.org/qemu-devel/8da074de-7dff-6505-5180-720cf2f47c70@redhat.com/
> 
> I believe Paolo was referring to this series from Prasad:
> 
> https://lore.kernel.org/qemu-devel/20200811114133.672647-10-ppandit@redhat.com/
> 
> We may need to solve that issue then maybe we can consider revive Prasad's
> patchset?
> 


