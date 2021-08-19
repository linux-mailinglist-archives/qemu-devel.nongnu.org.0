Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675143F1BD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:44:55 +0200 (CEST)
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjHq-0008Cy-HH
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEH-0008Vl-0j
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGjEF-0006pk-92
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pZTp2mVYflip3E5nsRQNy5q7lJCW3zlxbnnjwbkQAg=;
 b=NICOvIr/gLDCH+WGytwA0EBmRVcif/FX/R+7GDipIfp6orf13jxTPkM3+LtUBKUYweerk/
 z4vD8quGPuc7kDffxcOwEVBNg6rYLaaXpE/zMXuspmRMEFxl4YLei5ijebn0Ppnmb8IjjH
 Knga+RfyfeW1j+2+9JT6SPZU+4WTLos=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-QKOSJ3bRP1iIRqleeixNQw-1; Thu, 19 Aug 2021 10:41:09 -0400
X-MC-Unique: QKOSJ3bRP1iIRqleeixNQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n10-20020a5d660a0000b02901551ef5616eso1770275wru.20
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0pZTp2mVYflip3E5nsRQNy5q7lJCW3zlxbnnjwbkQAg=;
 b=RJXsL21NoqDAIecgI7kmytwez38HjIHTrOWROBA7ZRDILdRbUffBAUngNR4d2rdTQv
 SekaFivGVZaYsOHRYj5WUb0SAioSvkFthW3dk4fYQwG7A2YQfmbH/1yTJPT4qtEtJ5l6
 adxBSvKpkIt7EmJVHJQMjKCeFB9zaBwAh5oJxLwnxrwei4HCv9ii9vCuEmrF4lRb+YZP
 H7CZTtn2n4DdxHxYECYbKz3/vdCTBP+rlKtBxlwff8MJYl4A/8QK75c9OS+ty/ppfe0c
 dhJsYVNHSAmEF/ivRfdDY8XqG6RE8sVHrH1uU3ZYJ/FqCOuEbyF83kBuug2vldI5qWrN
 lHkw==
X-Gm-Message-State: AOAM531CjrJ43L/LuxjKmUWxUYqxJzLsuHbtz/ccrstmOOdDKsLLCPI6
 F7vRwCTKwSGioCz8gmnyIbzhVSN7L+tt7ft6fMiGyHRYTwWWhUebVcY3r3/OFhhfbp0VE/h1Xjq
 nT04zZTciBJ4a6rU=
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr4358470wrw.150.1629384067620; 
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7AshNrzQzFpo+twhRaJ6qi24Syv+Ry2gYXrQG1iwHyQj5+dtmOIS4xmqtjnz07LiELicCiQ==
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr4358445wrw.150.1629384067491; 
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e11sm3103524wrm.80.2021.08.19.07.41.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:41:07 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
 <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
 <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
 <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0afe6cbb-cfb8-2b08-d081-e62fb6f26e8f@redhat.com>
Date: Thu, 19 Aug 2021 16:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 4:38 PM, Peter Maydell wrote:
> On Thu, 19 Aug 2021 at 15:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 8/19/21 4:22 PM, Peter Maydell wrote:
>>> On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>
>>>> Replace g_malloc0() + address_space_init() by address_space_create().
>>>> Release the resource in DeviceUnrealize().
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
>>>>  hw/dma/xlnx_csu_dma.c |  9 ++-------
>>>>  2 files changed, 11 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
>>>> index fa38a556341..9f6b3fa47c6 100644
>>>> --- a/hw/dma/xlnx-zdma.c
>>>> +++ b/hw/dma/xlnx-zdma.c
>>>> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **errp)
>>>>          };
>>>>      }
>>>>
>>>> -    if (s->dma_mr) {
>>>> -        s->dma_as = g_malloc0(sizeof(AddressSpace));
>>>> -        address_space_init(s->dma_as, s->dma_mr, NULL);
>>>> -    } else {
>>>> -        s->dma_as = &address_space_memory;
>>>> -    }
>>>> +    s->dma_as = address_space_create(s->dma_mr ?: get_system_memory(), NULL);
>>>>      s->attr = MEMTXATTRS_UNSPECIFIED;
>>>>  }
>>>
>>> Why are these devices doing a heap allocation rather than
>>> having an AddressSpace whatever field in their device struct ?
>>
>> To easily use &address_space_memory if 'memory' link is NULL?
> 
> They could do that with
>     AddressSpace our_as;
>     AddressSpace *dma_as;
> 
> and set dma_as to &s->our_as or &address_space_memory.
> 
> Or we could fix the two boards which create these devices to always
> pass in an MR to use for DMA and drop the conditionality.

Clever, thanks.


