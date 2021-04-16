Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4143619CE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:25:31 +0200 (CEST)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXHuz-0002Zz-MG
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXHto-0001so-F7; Fri, 16 Apr 2021 02:24:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXHtm-0001rP-4l; Fri, 16 Apr 2021 02:24:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so13523672wrm.1;
 Thu, 15 Apr 2021 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/SBDXKDMbFao64focPhNSp5xHUFzymOtjJc1vnARJFw=;
 b=ozabp7Kp2kifAfFq/bf3mliF1NwaE06j/UZXTHoMlvurGUvpSeGouMCWmy1HpN6N/n
 MVpROt8Ma3qr911Ph3ltl0zjM9uvRZ/onf54IsX/bkyHxAJKyT3z6zlFdR3azEE1Aa3X
 q+4wDBeKgPUOWDN9knFDWBLuWFNLGJWLRljrqIfqWdXKMzSQtoUsNPA89MpS172ejMQH
 rpjWyQwXNg+nN0ASZPx/11X466f40U+LMeF+vqYPoQBgcUX9caLiON47/XMd+xdjkrqX
 PuWWacmtNe+vs3sLj+2FN97FrwRn/cawJ9TZ3Bb+pnpguwP4TCKk2x+2cY3hWyiW0uJb
 S6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/SBDXKDMbFao64focPhNSp5xHUFzymOtjJc1vnARJFw=;
 b=FLaTx+pHHb3OS+zEGZaZrv4PazGUsyScRDo9QtRp+J+ktuFeQ0fM9o5s0hMwqtIH55
 IjzCDQf5BzBHkmAcReboliGBqtAkLu5V/LtPodwGoMIYAd/hP5J8DUDCBTlXP/NDqciT
 PQPltV1WZEW9Tn4Kx65PkaowLT6Yt3+5L6dTG8ADXtifrM7u1SMxKN9xh2FPgVAYL5QI
 3C7X6h9N7GsAM1samaIvVa3JqpbqNCVRqKcb481umb1Ft5fd82tPZajXZEjtxexnEB1b
 JETu/rPX3OJ5Ye7i7rTqopvZ9wRdv4fjkWKl3qmhSbjPsyIMrxHXAETGDuGBn0mHKajA
 w7Aw==
X-Gm-Message-State: AOAM530eTr9M3RTyIxU+T321z7n1sEUgxWP5Y//l2Z6dO//nmQ/5tpqe
 KZ8hzw06wGksYOeveHtnu54=
X-Google-Smtp-Source: ABdhPJxhMGr+D0Y5XDVvyIi16SqKU6bbZOiHA7tLbpbICTzogNSRJ1aQ0vXe6lutgfBmn8jjMtM59g==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr6976238wru.415.1618554251507; 
 Thu, 15 Apr 2021 23:24:11 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m3sm8185940wme.40.2021.04.15.23.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 23:24:10 -0700 (PDT)
Subject: Re: [PATCH 3/5] hw/pci-host/prep: Remove unuseful memory region
 mapping
To: David Gibson <david@gibson.dropbear.id.au>, Peter Xu <peterx@redhat.com>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-4-f4bug@amsat.org> <20210312203821.GN194839@xz-x1>
 <YFgYYHOroOLHBbm7@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <095a86c6-1ead-5a6d-54e6-601aa43853bf@amsat.org>
Date: Fri, 16 Apr 2021 08:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFgYYHOroOLHBbm7@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 5:09 AM, David Gibson wrote:
> On Fri, Mar 12, 2021 at 03:38:21PM -0500, Peter Xu wrote:
>> On Fri, Mar 12, 2021 at 07:28:49PM +0100, Philippe Mathieu-Daudé wrote:
>>> The pci_io_non_contiguous region is mapped on top of pci_io
>>> with higher priority, but simply dispatch into this region
>>> address space. Simplify by directly registering the former
>>> region in place, and adapt the address space dispatch offsets.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/pci-host/prep.c | 11 ++++-------
>>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
>>> index 0a9162fba97..00a28c2d18c 100644
>>> --- a/hw/pci-host/prep.c
>>> +++ b/hw/pci-host/prep.c
>>> @@ -159,8 +159,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
>>>      uint8_t buf[4];
>>>  
>>>      addr = raven_io_address(s, addr);
>>> -    address_space_read(&s->pci_io_as, addr + 0x80000000,
>>> -                       MEMTXATTRS_UNSPECIFIED, buf, size);
>>> +    address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
>>>  
>>>      if (size == 1) {
>>>          return buf[0];
>>> @@ -191,8 +190,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
>>>          g_assert_not_reached();
>>>      }
>>>  
>>> -    address_space_write(&s->pci_io_as, addr + 0x80000000,
>>> -                        MEMTXATTRS_UNSPECIFIED, buf, size);
>>> +    address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED, buf, size);
>>
>> This changes access to s->pci_io_as, but below didn't change s->pci_io_as
>> layout at all (below is about address_space_mem).  Is this intended?
>>
>>>  }
>>>  
>>>  static const MemoryRegionOps raven_io_ops = {
>>> @@ -294,9 +292,8 @@ static void raven_pcihost_initfn(Object *obj)
>>>      address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
>>>  
>>>      /* CPU address space */
>>> -    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
>>> -    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
>>> -                                        &s->pci_io_non_contiguous, 1);
>>> +    memory_region_add_subregion(address_space_mem, 0x80000000,
>>> +                                &s->pci_io_non_contiguous);
>>
>> I don't know any of this code at all... but it seems the two memory regions are
>> not identical in size:
>>
>>     memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
>>     memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
>>                           "pci-io-non-contiguous", 0x00800000);
>>
>> Then it seems the memory access dispatching to (0x00800000, 0x3f800000) would
>> change too, from s->pci_io to nothing.  Raise this up too since I don't know
>> either whether it's intended..
> 
> Right, it seems like this removes the mapping of s->pci_io entirely.

Yes, this is on purpose. The dispatching is done via raven_io_ops:

    address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");

raven_io_ops uses raven_io_address() which returns an address in
"pci-io" range if < 0x800000, else it returns io_mem_unassigned
because the address is outside the pci_io_as AddressSpace.

Note, the flatview is unchanged with this patch.

My take here is 1/ I squashed too much changes and 2/ I didn't
documented enough. I'll respin improved.

Thanks for your reviews!

Phil.

