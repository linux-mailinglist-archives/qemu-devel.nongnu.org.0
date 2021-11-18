Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BB4564DB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 22:06:32 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnoc3-0003jh-2Z
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 16:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnoae-0002kt-RA
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 16:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnoaa-0002dE-Ht
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 16:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637269499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtfO0r4hMF1t67Fm/nFejKUhC7rrKBlw0HYHrwB3cdQ=;
 b=YXXR3RKA8T+F7w6DZggobzbaP2WKIjfzzdVs00UdCkxWNRiyYZTth55b9V5SvjhOqGXTQ4
 qJtTkkdB/FuWG6lbCxw8wiQ1MTqFRgmLED7IXODyJg7/Kx53tpQAddVjwmmzwyhClyGtUp
 AVWErjw7hdRel5n23kU0Z9f93nCCxTo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-PQlArHEFO_-y7sVI8Sd_fg-1; Thu, 18 Nov 2021 16:04:58 -0500
X-MC-Unique: PQlArHEFO_-y7sVI8Sd_fg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso3738190wmq.2
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 13:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KtfO0r4hMF1t67Fm/nFejKUhC7rrKBlw0HYHrwB3cdQ=;
 b=sH0RRfS1/503gHnQrERh2vo79qni3kzEANGlOp9EzRTHbrlvDAdKmTZwjEdqaChTN4
 OTnT+gbqwa/fj5f/JNyGXyPPK5Azq+JgquYFkWaSge8OX51J5sHWliPhCtKazgrZYd9v
 tsoAfoCSRS+loJSkquSB18AwKtp7g0+gVrhlaZxDcvYhGSsskMD2UEigs60+eC261LOo
 BYg7Rd+borASV3WXVWkFjFrDXrVkQPB39Ny4L+POGkl0Lph1jMtn+yXDVAQaWILwL70E
 LJhuQkAHw6UKp6w43JVr0MQoefnn/Bqk6UVMmESl6BnaqIkDT68KvhN40ImFhxNUrka3
 PYng==
X-Gm-Message-State: AOAM532rWlwzsRdhZ2LcZgcHQFbSQF0G2HGroyLbkWXwEnCM5sj828vA
 eC8W+21/ywvoZvPhPqYnOOU15haE78bxtciwKL5wSiqTZQl8T3wp5zPfsYahLLMnSLZze9nl9GD
 BKGPZmrZXGVFjKpo=
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr37589wmh.171.1637269496835;
 Thu, 18 Nov 2021 13:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwVO6umKglMiTxihO7WEVaBz13myx0olg7oNSAhJ0OJLgjS1il/Mfxup79R03U4U7SeXrfQw==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr37540wmh.171.1637269496591;
 Thu, 18 Nov 2021 13:04:56 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o3sm11718511wms.10.2021.11.18.13.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 13:04:55 -0800 (PST)
Message-ID: <c91b4ea2-3b2e-f79f-b5ad-3f01961e2974@redhat.com>
Date: Thu, 18 Nov 2021 22:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
 <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
 <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
 <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 16:21, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 14:50, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 8/24/21 3:15 PM, Stefan Hajnoczi wrote:
>>> On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Check bus permission in flatview_access_allowed() before
>>>> running any bus transaction.
>>>>
>>>> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
>>>>
>>>> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
>>>> using it won't be checked by flatview_access_allowed().
>>>>
>>>> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
>>>> using this flag will reject transactions and set the optional
>>>> MemTxResult to MEMTX_BUS_ERROR.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  softmmu/physmem.c | 17 ++++++++++++++++-
>>>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index 0d31a2f4199..329542dba75 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
>>>>                                             hwaddr addr, hwaddr len,
>>>>                                             MemTxResult *result)
>>>>  {
>>>> -    return true;
>>>> +    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
>>>> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
>>>> +            return true;
>>>> +        }
>>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>>> +                      "Invalid access to non-RAM device at "
>>>> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
>>>> +                      "region '%s'\n", addr, len, memory_region_name(mr));
>>>> +        if (result) {
>>>> +            *result |= MEMTX_BUS_ERROR;
>>>
>>> Why bitwise OR?
>>
>> MemTxResult is not an enum but used as a bitfield.
>>
>> See access_with_adjusted_size():
>>
>>     MemTxResult r = MEMTX_OK;
>>     ...
>>     if (memory_region_big_endian(mr)) {
>>         for (i = 0; i < size; i += access_size) {
>>             r |= access_fn(mr, addr + i, value, access_size,
>>                         (size - access_size - i) * 8,
>>                         access_mask, attrs);
>>         }
>>     } else {
>>         for (i = 0; i < size; i += access_size) {
>>             r |= access_fn(mr, addr + i, value, access_size, i * 8,
>>                         access_mask, attrs);
>>         }
>>     }
>>     return r;
>> }
>>
>> and flatview_read_continue() / flatview_write_continue():
>>
>>     for (;;) {
>>         if (!memory_access_is_direct(mr, true)) {
>>             release_lock |= prepare_mmio_access(mr);
>>             l = memory_access_size(mr, l, addr1);
>>             val = ldn_he_p(buf, l);
>>             result |= memory_region_dispatch_write(mr, addr1, val,
>>                                                    size_memop(l),
>>                                                    attrs);
>>     ...
>>     return result;
>> }
> 
> In these two examples we OR together the MemTxResults because
> we are looping over multiple accesses and combining all the
> results together; we want to return a "not OK" result if any
> of the individual results failed. Is that the case for
> flatview_access_allowed() ?

You are right, this is not the case here, so we can simplify as
Stefan suggested. Thanks for clarifying the examples.


