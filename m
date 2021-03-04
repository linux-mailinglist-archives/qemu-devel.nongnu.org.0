Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FBD32DD4C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:45:10 +0100 (CET)
Received: from localhost ([::1]:49522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwiS-0000c0-PZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwfi-00071j-O5; Thu, 04 Mar 2021 17:42:20 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwff-0001xa-Or; Thu, 04 Mar 2021 17:42:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so4114wrz.0;
 Thu, 04 Mar 2021 14:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5r96XHbxEG9hSvsSx5dN0YY4e7PdA6qBDvBBPYVlAIg=;
 b=JJWO2dBQTJQY7cTU1RRhytA+JGvMYLStYZIQL2EkuqOgFNz25eSLSuyta+oiDPMt66
 MPSkhBb067ndmsyIq8pBQhCHroIp5HJrpYmg6pehly3JRmEfphyUhUBah2ap2ffVlfkG
 OB0xj3KDMLu5mMI1zfc25Wqwa8mZ9zhImRLzHxguji5nwPJbs1JK/Cfaknz1XdjBLy5e
 otY0wK5QMMymQ8WXGwOTSUU9vXBJA7aMNZSQmQG3DsBIHIlzeo6ritY42MvAvlPYgS2a
 2N1A9FvqBK8bfW0Yhsd61KfeVWq4/s8DyuWN3BE/WcMoO6LLhT52pRmwOqLOBeoEOC6Y
 mVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5r96XHbxEG9hSvsSx5dN0YY4e7PdA6qBDvBBPYVlAIg=;
 b=s9ffy4vZUTwZFIlexxdtZqwf4Tq2pzRAanUgL/W3BnuSKn4BYIaPatw4cIgaaT2IDB
 LcJFVGyw4BHli+iwuZP4D2Eb8uVJoFA3MWUHDeMJnSbSBJR6U3d7sDdsuPeeHC/QydVC
 PFsMLOMpjTiq9wetB+MvZOPFXvJXbGBw/+c7SeZP29mnjgvEsVxxma20kHZj8idFXkFi
 rpsjDLnyTMrvvhkeH8eDxj6N4KvejA3nD0yoHw1pGN0ZAyQPBFrNLqsWdDgJfPCTkxOW
 oJB9Ex8WIeUhyW2687JA0oDznquDieOB9mSzA956HUY2kmHoK2xVrGtWN8rmfEQ6W+dW
 8X6w==
X-Gm-Message-State: AOAM531CXTHrIELIxoCmJae8Vej/gQn2eBYX0Jchtta+po5CT0fVE4jB
 dYInPlzb/xfP4DGOWhD9YVo=
X-Google-Smtp-Source: ABdhPJxIk4B8vHUSuUOrEtZoaMunaxhGuQ1by1P/MBMnUvvykjP1xJ1LfJErkljbuZN4T1Yqa3HA8A==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr6354609wru.88.1614897732211; 
 Thu, 04 Mar 2021 14:42:12 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m132sm1467963wmf.45.2021.03.04.14.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:42:11 -0800 (PST)
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
Date: Thu, 4 Mar 2021 23:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 9:16 PM, BALATON Zoltan wrote:
> On Thu, 4 Mar 2021, Philippe Mathieu-Daudé wrote:
>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
>>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>>> state of vt82c686b_isa emulation in an abstract via_isa class.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>>>  include/hw/pci/pci_ids.h |  2 +-
>>>  2 files changed, 40 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>> index 72234bc4d1..5137f97f37 100644
>>> --- a/hw/isa/vt82c686.c
>>> +++ b/hw/isa/vt82c686.c
>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info = {
>>>  };
>>>
>>>
>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>>> +#define TYPE_VIA_ISA "via-isa"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>>>
>>> -struct VT82C686BISAState {
>>> +struct ViaISAState {
>>>      PCIDevice dev;
>>>      qemu_irq cpu_intr;
>>>      ViaSuperIOState *via_sio;
>>>  };
>>>
>>> +static const VMStateDescription vmstate_via = {
>>> +    .name = "via-isa",
>>
>> You changed the migration stream name, so I think we have
>> a problem with migration... No clue how to do that properly.
> 
> I don't think these machines support migration or state description of
> vt86c686b was not missing something before these patches that would make
> it not work anyway so I did not worry about this too much. I doubt
> anybody wants to migrate a fuloong2e machine so this should not be a
> problem in practice but maybe you can mention it in the release notes if
> you think that would be necessary.

Maybe just add in the description:

 This change breaks migration back compatibility, but
 this is not an issue for the Fuloong2E machine.

?

