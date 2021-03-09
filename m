Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8493321B9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:14:03 +0100 (CET)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYRH-0003gM-0g
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:14:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYPn-0002pP-Rg; Tue, 09 Mar 2021 04:12:31 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYPj-0003he-PG; Tue, 09 Mar 2021 04:12:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so14320459wrc.13;
 Tue, 09 Mar 2021 01:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=19in327u/+ARTab/z/Il/bUWDFxZ/UtebVmYybj48OM=;
 b=gMR1nwFmvY9vMsHlXzXM+yn9hIQnvfYR5DW2iQsq81coWOy/ogmcOkkE2NkeEMKSrk
 gcWSdlnGYEh6d+InVmjvmEZ+i0gPp8ZW0Q70MWztzs4tLgunoR7He6nDl53N/MDnmFad
 Z2bFCUYZcWQ0TnNMVtQJ9on95TyX2PHdWgTNZvKaX2ZFBZ7NfjO1xqrKatEvrkKttNhh
 B5WFKYg6wX1vSkvjDolGWlJRX96tJO9fqQxA3AyX7+ygtHQTzKcks8OBHyckwBMlNM22
 w752eQuCXLhyiKV+QSnjtTYTHhImW7fUP7fUBeFo/R46R2+l6QzITBpb5wyVXJjrhpjh
 zQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=19in327u/+ARTab/z/Il/bUWDFxZ/UtebVmYybj48OM=;
 b=j/DlqsEPTEeqo0i+VaWQaM6k4kQCwXrTmIT+Jygsr9EjXelE4XYTRM/j8H5A4ORujG
 lLjNtsopJwOVXdSPvTPCMb6HWZE3HxiXOO0nKUFKepmnE8kH7JsfrWA1imCO4hRRtI8X
 CgIbAwh93CN78YIAB7a85Gh7KMpAht3/TNaFLIXLXucaMatXH9uqazUE/tZAHuT80iyO
 Fm9qO/xUX29FNt7Ax0HruvGHB0mwUEXaZHhw4ChspBqHFyZgdtUJ6QYVBw/lXp6fkCU2
 HvobvQXkln3WJiuuzaWPy5HXK7+WloLOGA3HdtPkteoC1ZdqgoFnuFyYR9wiIR6NMeZ3
 xViA==
X-Gm-Message-State: AOAM530eN0QDUIb6CiYrXMC4O6Fml9GUTt4QGcQWfvD5M7/unjuI+Nxe
 a4RvPIcQkwGxuWRFsK2mcoo=
X-Google-Smtp-Source: ABdhPJyqGAHDpbjrBgWSN0YnHfZ2Ai3EkzeWM48w+PeNwO6ajKXBEpuhr11NE0Hv3azrQw8heE51VA==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr28542181wrm.308.1615281145768; 
 Tue, 09 Mar 2021 01:12:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d204sm3122797wmc.17.2021.03.09.01.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:12:25 -0800 (PST)
Subject: Re: [PATCH v5 4/8] vt82c686: Introduce abstract TYPE_VIA_ISA and base
 vt82c686b_isa on it
To: David Gibson <david@gibson.dropbear.id.au>
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <07df96112b78673ca191f9a4ffa17bf3a11160f3.1614719482.git.balaton@eik.bme.hu>
 <da48a752-9b2d-6cd8-9603-4cc528fea628@amsat.org>
 <11fb7590-89f3-62e7-48e3-d44226876e78@eik.bme.hu>
 <14cc6696-869d-679a-883f-fbcd30fe6ba1@amsat.org>
 <YEGDLehnK3Vhp56s@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5f147fc-a834-72fb-26ca-0c37cac7253c@amsat.org>
Date: Tue, 9 Mar 2021 10:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEGDLehnK3Vhp56s@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 2:02 AM, David Gibson wrote:
> On Thu, Mar 04, 2021 at 11:42:10PM +0100, Philippe Mathieu-Daudé wrote:
>> On 3/4/21 9:16 PM, BALATON Zoltan wrote:
>>> On Thu, 4 Mar 2021, Philippe Mathieu-Daudé wrote:
>>>> On 3/2/21 10:11 PM, BALATON Zoltan wrote:
>>>>> To allow reusing ISA bridge emulation for vt8231_isa move the device
>>>>> state of vt82c686b_isa emulation in an abstract via_isa class.
>>>>>
>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>> ---
>>>>>  hw/isa/vt82c686.c        | 70 ++++++++++++++++++++++------------------
>>>>>  include/hw/pci/pci_ids.h |  2 +-
>>>>>  2 files changed, 40 insertions(+), 32 deletions(-)
>>>>>
>>>>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>>>>> index 72234bc4d1..5137f97f37 100644
>>>>> --- a/hw/isa/vt82c686.c
>>>>> +++ b/hw/isa/vt82c686.c
>>>>> @@ -609,24 +609,48 @@ static const TypeInfo vt8231_superio_info = {
>>>>>  };
>>>>>
>>>>>
>>>>> -OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
>>>>> +#define TYPE_VIA_ISA "via-isa"
>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(ViaISAState, VIA_ISA)
>>>>>
>>>>> -struct VT82C686BISAState {
>>>>> +struct ViaISAState {
>>>>>      PCIDevice dev;
>>>>>      qemu_irq cpu_intr;
>>>>>      ViaSuperIOState *via_sio;
>>>>>  };
>>>>>
>>>>> +static const VMStateDescription vmstate_via = {
>>>>> +    .name = "via-isa",
>>>>
>>>> You changed the migration stream name, so I think we have
>>>> a problem with migration... No clue how to do that properly.
>>>
>>> I don't think these machines support migration or state description of
>>> vt86c686b was not missing something before these patches that would make
>>> it not work anyway so I did not worry about this too much. I doubt
>>> anybody wants to migrate a fuloong2e machine so this should not be a
>>> problem in practice but maybe you can mention it in the release notes if
>>> you think that would be necessary.
>>
>> Maybe just add in the description:
>>
>>  This change breaks migration back compatibility, but
>>  this is not an issue for the Fuloong2E machine.
> 
> Hrm.  If migration was never supported, why is there a vmstate
> description there at all though?
> 
> That said, I don't think breaking compat is a problem: that's only an
> issue where we actually have versioned machine types, which covers
> only pc, pseries, arm virt and a very few others.  I don't think this
> device was used on any of them.

OK. Can you provide a formal Ack-by tag then? :)

