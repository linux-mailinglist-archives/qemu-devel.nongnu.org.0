Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6E28B465
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 14:12:46 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRwh3-0002D1-Ud
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 08:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRwVk-0001oJ-M3; Mon, 12 Oct 2020 08:01:05 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRwVj-00027C-2d; Mon, 12 Oct 2020 08:01:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id e18so18854631wrw.9;
 Mon, 12 Oct 2020 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zzpuKuJoPPHqvVxmZa6G1ZEwoQ91WLNby3defQnS8u0=;
 b=Yg/dH53oiBbJkNtV1T1t/vzrzuC1oW1g8DrVge5kTkYacdnrkRwym6cHyytly2Vqx4
 MVMtxVuOkadAikLN+wfGxBkd7OIBavuBefd+Aajuwl+ObFX9ahfXT088fIJ5eKSyiSVe
 WueVDw+tB1KnzO+Adlc06WwnbMkyZMbAGU3gylJb0GXLnvCRovHsBPXo6d+7Kv2B7Ykc
 sxYiFX0EF2xzTk+rJapKjq56uMp2jJjHHVhCv417RGoHHOSUo8mPiLC0tYdjCDzjO/RB
 m9dlq0lWF36EBdXIHJxImeNiSbS/ymlFZHTxknJYU5rMnE/ErzvYXc0XhPMy1iFiJEIw
 J2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzpuKuJoPPHqvVxmZa6G1ZEwoQ91WLNby3defQnS8u0=;
 b=g7jkZAcsUOFUPq05NxO6GzVXO021rM7UcjZJ9jWrXs2Mvx4XxYPdt7m9YvrmT4lLfE
 ARUriNbEpI9AuGnChVE/jAA9e23YXHOy/OzpjM+LFOOfBx0M/9GO/EvYdxa6xR5QUtRv
 fNEjSVspAMLt3DJnEeWjv9nx4PVZxUnueYmGYOTVLQZO5uxVWpoXVpZWxhD61tEWJyP5
 i0tX1bjVkO2qCzqQ69Xld60yLDOVwv4fVyA4fQ8h/jWAJyKV9P5jFRdz5ZtyuxkCWODy
 UAFlcgrQecqkpss7diw7PXW6TAPDk3Uxe5cBXhJWLGCskyL4OwlUM+GvxmmI5OiMPX0W
 wqQw==
X-Gm-Message-State: AOAM530v4Cuqw2A8zsvFsXMmwmWxW6j7JgztEvImrMDEnSGwvWVFWPrK
 Y3LgZMw4LGR4pzU8hlT1AQhUyovgFZo=
X-Google-Smtp-Source: ABdhPJxI0PBPzt8hGANKDbBMCkZqZeF3NdFoDt+iivg/62Kzc/K61JMzwpBpFJFxsP/l96RlLr5q+Q==
X-Received: by 2002:adf:f50d:: with SMTP id q13mr28949812wro.215.1602504057590; 
 Mon, 12 Oct 2020 05:00:57 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id c132sm23330628wmf.25.2020.10.12.05.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 05:00:56 -0700 (PDT)
Subject: Re: [PATCH] hw/pci-host/grackle: Verify PIC link is properly set
To: BALATON Zoltan <balaton@eik.bme.hu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201011190332.3189611-1-f4bug@amsat.org>
 <20201011223446.GA4787@yekko.fritz.box>
 <369509c1-2e90-13cf-8845-892e754516d1@amsat.org>
 <20201012065436.GB71119@yekko.fritz.box>
 <9f7e4847-801d-dcd3-b876-bf2d276251@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e587154-4bc5-c44c-0c85-b46e0dddd3aa@amsat.org>
Date: Mon, 12 Oct 2020 14:00:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9f7e4847-801d-dcd3-b876-bf2d276251@eik.bme.hu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/20 1:50 PM, BALATON Zoltan via wrote:
> On Mon, 12 Oct 2020, David Gibson wrote:
>> On Mon, Oct 12, 2020 at 08:21:41AM +0200, Philippe Mathieu-DaudÃƒÂ© 
>> wrote:
>>> On 10/12/20 12:34 AM, David Gibson wrote:
>>>> On Sun, Oct 11, 2020 at 09:03:32PM +0200, Philippe Mathieu-DaudÃƒÂ© 
>>>> wrote:
>>>>> The Grackle PCI host model expects the interrupt controller
>>>>> being set, but does not verify it is present. Add a check to
>>>>> help developers using this model.
>>>>
>>>> I don't think thaqt's very likely, but, sure, applied to ppc-for-5.2
>>>
>>> Do you want I correct the description as:
>>> "The Grackle PCI host model expects the interrupt controller
>>> being set, but does not verify it is present.
>>> A developer basing its implementation on the Grackle model
>>> might hit this problem. Add a check to help future developers
>>> using this model as reference."?
>>
>> No, it's fine.  All I was saying is that the chances of anyone using
>> Grackle in future seem very low to me.
> 
> So maybe an assert instead of a user visible error would be enough?

My understanding is realize() shouldn't abort()
(the caller might choose to by using &error_abort).

> 
> Regards,
> BALATON Zoltan
> 
>>
>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <f4bug@amsat.org>
>>>>> ---
>>>>>   hw/pci-host/grackle.c | 4 ++++
>>>>>   1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
>>>>> index 57c29b20afb..20361d215ca 100644
>>>>> --- a/hw/pci-host/grackle.c
>>>>> +++ b/hw/pci-host/grackle.c
>>>>> @@ -76,6 +76,10 @@ static void grackle_realize(DeviceState *dev, 
>>>>> Error **errp)
>>>>>       GrackleState *s = GRACKLE_PCI_HOST_BRIDGE(dev);
>>>>>       PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>>>>> +    if (!s->pic) {
>>>>> +        error_setg(errp, TYPE_GRACKLE_PCI_HOST_BRIDGE ": 'pic' 
>>>>> link not set");
>>>>> +        return;
>>>>> +    }
>>>>>       phb->bus = pci_register_root_bus(dev, NULL,
>>>>>                                        pci_grackle_set_irq,
>>>>>                                        pci_grackle_map_irq,
>>>>
>>>
>>
>>

