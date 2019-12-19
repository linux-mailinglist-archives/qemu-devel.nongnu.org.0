Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28012660C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 16:48:05 +0100 (CET)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihy20-00086g-7j
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 10:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <a13xp0p0v88@gmail.com>) id 1ihy0g-0006re-On
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 10:46:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <a13xp0p0v88@gmail.com>) id 1ihy0f-0002JG-9Q
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 10:46:42 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37571)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <a13xp0p0v88@gmail.com>)
 id 1ihy0b-0001uw-Pt; Thu, 19 Dec 2019 10:46:38 -0500
Received: by mail-lj1-f193.google.com with SMTP id u17so6754599lja.4;
 Thu, 19 Dec 2019 07:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pK7H4vvTcFfkS1CtP4dW4FA5xZd2JE+X2nONfOPvzcQ=;
 b=jafBK/x3Kw04k6bd46DBs8Wg+2cHpYsqNEPW9gfvjjcPlqoAs49D/nzCka7fzqmAGu
 QaSn1IV2TNVF8N1CrRHHUyzD4inOMW0aXbzaPj68FsAgEwftQfLFqCnzppwg8Mb4tBvA
 L7k7yepcTCuObVXrvOkqjPndv0BGq6cy0D3RcOHL1gZc5MUrDT/AAKgt5FEH+GxTCyFp
 oBEPRXhC4oHqoQFhGJrq21VIT6M+RcjwenATm29WdctrPvLpncwWzLTgf7DtTnK0C8dV
 kfWAyN767gez8YcXvEfBR99Tk6pkedfNiTO7foGVZrVDOuFTtT0DOxyJewVArrgG+CJu
 i3bg==
X-Gm-Message-State: APjAAAWOFbPSoOV8onJE2Y689wE0BlpujkcnxH02yCIPGggTkUhNYJAY
 iYORUKlSYu/2PwM2fdS4aG0=
X-Google-Smtp-Source: APXvYqxWg7+xqVpKQwFHTPSLau4RRZq3zRk46YgvfX0mS5kW8tj5vKkBiwX63s25kPzA7ZnpkVEyyQ==
X-Received: by 2002:a2e:8613:: with SMTP id a19mr6472145lji.210.1576770396336; 
 Thu, 19 Dec 2019 07:46:36 -0800 (PST)
Received: from [192.168.42.234] ([213.87.152.106])
 by smtp.gmail.com with ESMTPSA id 138sm2853317lfa.76.2019.12.19.07.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2019 07:46:35 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ide: Fix incorrect handling of some PRDTs in
 ide_dma_cb()
To: Kevin Wolf <kwolf@redhat.com>
References: <20191216181405.462292-1-alex.popov@linux.com>
 <20191216181405.462292-2-alex.popov@linux.com>
 <20191219150136.GL5230@linux.fritz.box>
From: Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <b26978b1-0343-b902-077e-4dd06a919b61@linux.com>
Date: Thu, 19 Dec 2019 18:46:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191219150136.GL5230@linux.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.208.193
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
Reply-To: alex.popov@linux.com
Cc: Andrea Arcangeli <aarcange@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, sstabellini@kernel.org,
 pmatouse@redhat.com, mdroth@linux.vnet.ibm.com, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Kashyap Chamarthy <kashyap.cv@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, pjp@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Kevin!

Thanks again for your review.

On 19.12.2019 18:01, Kevin Wolf wrote:
> Am 16.12.2019 um 19:14 hat Alexander Popov geschrieben:
>> The commit a718978ed58a from July 2015 introduced the assertion which
>> implies that the size of successful DMA transfers handled in ide_dma_cb()
>> should be multiple of 512 (the size of a sector). But guest systems can
>> initiate DMA transfers that don't fit this requirement.
>>
>> For fixing that let's check the number of bytes prepared for the transfer
>> by the prepare_buf() handler. The code in ide_dma_cb() must behave
>> according to the Programming Interface for Bus Master IDE Controller
>> (Revision 1.0 5/16/94):
>> 1. If PRDs specified a smaller size than the IDE transfer
>>    size, then the Interrupt and Active bits in the Controller
>>    status register are not set (Error Condition).
>> 2. If the size of the physical memory regions was equal to
>>    the IDE device transfer size, the Interrupt bit in the
>>    Controller status register is set to 1, Active bit is set to 0.
>> 3. If PRDs specified a larger size than the IDE transfer size,
>>    the Interrupt and Active bits in the Controller status register
>>    are both set to 1.
>>
>> Signed-off-by: Alexander Popov <alex.popov@linux.com>
>> ---
>>  hw/ide/core.c | 30 ++++++++++++++++++++++--------
>>  1 file changed, 22 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>> index 754ff4dc34..171831c7bd 100644
>> --- a/hw/ide/core.c
>> +++ b/hw/ide/core.c
>> @@ -849,6 +849,7 @@ static void ide_dma_cb(void *opaque, int ret)
>>      int64_t sector_num;
>>      uint64_t offset;
>>      bool stay_active = false;
>> +    int32_t prep_size = 0;
>>  
>>      if (ret == -EINVAL) {
>>          ide_dma_error(s);
>> @@ -863,13 +864,15 @@ static void ide_dma_cb(void *opaque, int ret)
>>          }
>>      }
>>  
>> -    n = s->io_buffer_size >> 9;
>> -    if (n > s->nsector) {
>> -        /* The PRDs were longer than needed for this request. Shorten them so
>> -         * we don't get a negative remainder. The Active bit must remain set
>> -         * after the request completes. */
>> +    if (s->io_buffer_size > s->nsector * 512) {
>> +        /*
>> +         * The PRDs were longer than needed for this request.
>> +         * The Active bit must remain set after the request completes.
>> +         */
>>          n = s->nsector;
>>          stay_active = true;
>> +    } else {
>> +        n = s->io_buffer_size >> 9;
>>      }
>>  
>>      sector_num = ide_get_sector(s);
>> @@ -892,9 +895,20 @@ static void ide_dma_cb(void *opaque, int ret)
>>      n = s->nsector;
>>      s->io_buffer_index = 0;
>>      s->io_buffer_size = n * 512;
>> -    if (s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size) < 512) {
>> -        /* The PRDs were too short. Reset the Active bit, but don't raise an
>> -         * interrupt. */
>> +    prep_size = s->bus->dma->ops->prepare_buf(s->bus->dma, s->io_buffer_size);
>> +    /* prepare_buf() must succeed and respect the limit */
>> +    assert(prep_size > 0 && prep_size <= n * 512);
> 
> Hm, I'm not sure about prep_size > 0. Maybe it's true for
> bmdma_prepare_buf() for PCI (I'm not even sure there: What happens if we
> pass a PRDT with 0 entries? Should we have another test case for this?),

As I just mentioned in the previous letter, the specification says that a value
of zero in PRD size indicates 64K. My test covers that case.

> but other controllers like AHCI don't seem to interpret an entry with
> size 0 as maximum size.

I see this assertion can be changed to:
    /* prepare_buf() must succeed and respect the limit */
    assert(prep_size >= 0 && prep_size <= n * 512);

In case of error prepare_buf() returns -1, and the assertion will catch it.
And zero will be handled in the short PRD case below.

Do you like it?

> John, what do you think?
> 
>> +    /*
>> +     * Now prep_size stores the number of bytes in the sglist, and
>> +     * s->io_buffer_size stores the number of bytes described by the PRDs.
>> +     */
>> +
>> +    if (prep_size < n * 512) {
>> +        /*
>> +         * The PRDs are too short for this request. Error condition!
>> +         * Reset the Active bit and don't raise the interrupt.
>> +         */
>>          s->status = READY_STAT | SEEK_STAT;
>>          dma_buf_commit(s, 0);
>>          goto eot;
> 
> Here you decided that we don't need to do partial I/O for short PRDTs. I
> think my conclusion was that the spec doesn't really say what we need to
> do, so this is fine with me.

Yes, the changes for partial I/O are much more profound. I've decided to avoid that.

> Apart from the assertion above, the patch looks good to me.

Thanks a lot.
Looking forward to your reply.

Alexander

