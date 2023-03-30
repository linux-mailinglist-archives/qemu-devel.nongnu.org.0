Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAF6D00B5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:10:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpDc-0005bk-S0; Thu, 30 Mar 2023 06:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phpDa-0005bP-Fd
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phpDW-0008BA-K5
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680170953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SWsQVvC1M3IWs2n3C+kirUssX4aDF7bfCA135913OzE=;
 b=e0eIfbkaf8zcTymQ7Oa1Hj4H1l8fPuW/VS2t2TNM448N/t/Yxs6iudmBR6HlBrhhnXhQfs
 +u6vGWlsKIVx5vcC6S9rQgYfYDyg9IYx7ECQ/rnQX7wXnvWy+HeSG0v33ICwvOavqcPwv7
 hkp1t8ODHEyVXSSFeOMnQ/SpiR1bwqI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-Pt2j-UUJMZm4EV_B9Es_RA-1; Thu, 30 Mar 2023 06:09:11 -0400
X-MC-Unique: Pt2j-UUJMZm4EV_B9Es_RA-1
Received: by mail-qv1-f70.google.com with SMTP id
 l18-20020ad44bd2000000b005a9cf5f609eso7963662qvw.15
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170950;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SWsQVvC1M3IWs2n3C+kirUssX4aDF7bfCA135913OzE=;
 b=NYLDLn/QWwmXLk3i3GrqJJnbOIvoFHjV27D0t2Ajrm22GA2qZcSyPtjvYP6vCctfm8
 p9FUT9IhvZ/wxaAsBxwJ8pX8XJBdJ7BqtumR8VvP0WFcnWkOABWvIPi05N3v6YFOjdF8
 vW0VoYs35evG8dKnhrpJFqibXd5zI2C2l/SCUJ3xpHA+2ollgLX+92eFgrq6ebt5DKx2
 CgLnCmla5h9qITYBiImj0cNdZZiYFpK4DDk+QZ+2I+Hc8YEIWU02TO3QP2+3igy6G3ke
 6GIRzxY90TdouhkV5EZzsg3UFpsbiLA8RYkbN15TLYoHGjJip386LZV+jSFOIByC1zkB
 c/2Q==
X-Gm-Message-State: AAQBX9fDl/+Z+tqJsCqfHmkLhPQvWI4CgVbj80XkpyGZQB5BzBMpqAQm
 Z1Fl6/fPgyocMFD+qE8mmQsVNx51lIj23wpWEPhoS0BdoFbR+3LixuZdsBYru8Fxeqpb/jL8FP+
 +Ai4ewudlX4X11z0=
X-Received: by 2002:a05:6214:761:b0:5ac:58cc:69d1 with SMTP id
 f1-20020a056214076100b005ac58cc69d1mr35933465qvz.31.1680170950035; 
 Thu, 30 Mar 2023 03:09:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YMP2C6gL6fUh2gj2ofYWcQO0+CAhVpZCasDfHcQPkzwgGNJf3/gqLq7fv8tmggRr+/J0pUKA==
X-Received: by 2002:a05:6214:761:b0:5ac:58cc:69d1 with SMTP id
 f1-20020a056214076100b005ac58cc69d1mr35933448qvz.31.1680170949731; 
 Thu, 30 Mar 2023 03:09:09 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 e7-20020ad450c7000000b005dd8b934592sm5320840qvq.42.2023.03.30.03.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 03:09:09 -0700 (PDT)
Message-ID: <4ba6df70-6fb9-6ee8-d6b6-0c7e403c34d7@redhat.com>
Date: Thu, 30 Mar 2023 12:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Rob Landley <rob@landley.net>, Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
 <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
In-Reply-To: <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 29/03/2023 18.07, Philippe Mathieu-Daudé wrote:
> On 29/3/23 18:09, Rob Landley wrote:
>> On 3/28/23 12:02, Philippe Mathieu-Daudé wrote:
>>> On 20/3/23 17:58, Nathan Chancellor wrote:
>>>> On Wed, Mar 08, 2023 at 12:33:38AM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 23/2/23 17:19, Jiaxun Yang wrote:
>>>>>> 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE
>>>>>> MemoryRegionOps") converted CFGADDR/CFGDATA registers to use 
>>>>>> PCI_HOST_BRIDGE's
>>>>>> accessor facility and enabled byte swap for both CFGADDR/CFGDATA 
>>>>>> register.
>>>>>>
>>>>>> However CFGADDR as a ISD internal register is not controled by MByteSwap
>>>>>> bit, it follows endian of all other ISD register, which means it ties to
>>>>>> little endian.
>>>>>>
>>>>>> Move mapping of CFGADDR out of gt64120_update_pci_cfgdata_mapping to 
>>>>>> disable
>>>>>> endian-swapping.
>>>>>>
>>>>>> This should fix some recent reports about poweroff hang.
>>>>>>
>>>>>> Fixes: 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using 
>>>>>> PCI_HOST_BRIDGE MemoryRegionOps")
>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>>> ---
>>>>>>     hw/pci-host/gt64120.c | 18 ++++++------------
>>>>>>     1 file changed, 6 insertions(+), 12 deletions(-)
>>>>>
>>>>> So this works on little-endian hosts, but fails on
>>>>> big-endian ones :(
>>>>>
>>>>> I.e. on Linux we have early_console_write() -> prom_putchar()
>>>>> looping:
>>>>>
>>>>> IN: prom_putchar
>>>>> 0x8010fab8:  lbu    v0,0(v1)
>>>>> 0x8010fabc:  andi    v0,v0,0x20
>>>>> 0x8010fac0:  beqz    v0,0x8010fab8
>>>>> 0x8010fac4:  andi    v0,a0,0xff
>>>>>
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> gt64120: Illegal register read reg:0x3fc size:4 value:0x00000000
>>>>> ...
>>>>>
>>>>
>>>> Is there going to be a new version of this patch or a different solution
>>>> to the poweroff hang then? I am still seeing that with tip of tree QEMU
>>>> and I see 8.0.0-rc0 has been tagged; I would hate for this to end up in
>>>> a release version.
>>>
>>> I couldn't work a fix, however I ran our (new) tests on merge
>>> commit 3db29dcac2 which is before the offending commit 145e2198d749,
>>> and they fail. So I suppose Malta on big-endian host is badly broken
>>> since quite some time. Thus clearly nobody tests/runs Malta there.
>>
>> I test/run malta with the mips and mipsel binaries at
>> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/ but I'm still
>> locally applying the first patch I saw to fix this (attached) until upstream
>> sorts itself out.
>>
>> Works fine for me. Somebody said it was the wrong fix but I don't remember 
>> why...
> 
> This is a correct /partial/ fix. With this patch, Malta works on little
> endian hosts. No luck with big-endian hosts, but this was broken
> previous to 3db29dcac2 rework, so apparently not a big deal ¯\_(ツ)_/¯

I've bisected now on a big endian s390x machine, and it looks like it has 
been broken here:

0c8427baf0f66bdaecae41891304f6e15242e682 is the first bad commit
commit 0c8427baf0f66bdaecae41891304f6e15242e682
Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date:   Wed Oct 26 21:18:21 2022 +0200

     hw/mips/malta: Use bootloader helper to set BAR registers

... we should maybe really run a selected list of avocado jobs on a big 
endian host (either .travis-ci.yml or the gitlab-CI custom runner?) to avoid 
such regressions?

  Thomas


