Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0B530296F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 18:59:59 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l469d-0007iT-Nt
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 12:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l467B-0006hI-KD
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:57:26 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:32786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4677-0005rA-HL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 12:57:23 -0500
Received: by mail-ed1-x531.google.com with SMTP id c6so16566324ede.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWbHLnxh96rTmzW3IKAb1X3X7eKXVHW6E88R42iXC2o=;
 b=uh1e5gZn5Wpitz82l3bNPxUFMKlaSPdcKqAQU6Mg3z+fFCNkkvva/AsJ2r5OhaWABA
 W3+y6SE0oDHEMGZqZ7da/MnvRhkZCNRLvwbm9YgCRImsDjiPAI6Gcl753iRtFhakfyWF
 rfuRUWyUmugZbyizG+ckYrty8kc8uGd0sAjcsvRY4KGW4fMnPKtMo7klq3sM44rXzThi
 0lWTblLW2wcDQHkE237Vb6KBdeUOJG1EZ7vyyCdU+jm0A4XLuCD81dJFSwz87csp9Pcv
 6mnC+PDRpFeTLplKIGRd/dT6IEtOJbf1lr668Sj1gp4ZQmO1sax/iJfBFlqtSQdgbedu
 aKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWbHLnxh96rTmzW3IKAb1X3X7eKXVHW6E88R42iXC2o=;
 b=jTAfrol2sj40HoUCLgI6tntjFpOg8d0ABRQRtjUPQoM/bzbNuyuAhX8l4ulIEl6Z1a
 MtckWzpXHOnHhozXWjVq5zyEQdTB7yzRpcq0x4woUG9uFXlCPqEBxUwLtR8s0ESJ0Xmr
 +V1KZ82HA060BnnsCZLHJ4b6DDpGmu4O8LFj/5DwDlolvCUW6ajmBpkpHI7T+hSRGjH6
 uaqa3/qgupM2A8icqR5qSuX9VLR07r/c3Q51IOhJVt74u5TpSJwNYrB7Lfc2hNCSxd9r
 NTbmRO+bDljBDkAsEOA3PuuzS0HOdXaHafP+x5cx53z2JUUHuhSdd0cgMiZwAYGBI/r8
 Jzmw==
X-Gm-Message-State: AOAM5316PSISesl86U//ZStjzDkO7zoL2maPqyUVKLW4HoGS2giHt7yW
 5tTV/5IhDd51i7iIMVPqC9A=
X-Google-Smtp-Source: ABdhPJwfHZoTa248NCMjpvKAkp6D4T7I9L7v4WOhQIC8JBkdbkpgnlkj+AdI2focqgzOWwjC1APycA==
X-Received: by 2002:a05:6402:94f:: with SMTP id
 h15mr1463374edz.106.1611597438291; 
 Mon, 25 Jan 2021 09:57:18 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j18sm8710443ejv.18.2021.01.25.09.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 09:57:17 -0800 (PST)
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
To: BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
 <f5466f0b-cc4f-4a71-8c06-7971198a7602@www.fastmail.com>
 <2e29d39-8622-3232-d6cd-80d77beb98@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d327831c-277d-c36b-33fc-6f6ad04066fb@amsat.org>
Date: Mon, 25 Jan 2021 18:57:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2e29d39-8622-3232-d6cd-80d77beb98@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 11:28 AM, BALATON Zoltan wrote:
> On Mon, 11 Jan 2021, Jiaxun Yang wrote:
>> On Mon, Jan 11, 2021, at 3:25 AM, BALATON Zoltan wrote:
>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>> +PCI experts
>>>>
>>>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>
>> [...]
>>
>>>> I'm not a PCI expert but my understanding is PCI device functions are
>>>> restricted to the PCI bus address space. The host bridge may map this
>>>> space within the host.
>>>>
>>>> QEMU might be using get_system_memory() because for some host bridge
>>>> the mapping is not implemented so it was easier this way?
>>>
>>> Maybe, also one less indirection which if not really needed is a good
>>> thing for performance so unless it's found to be needed to use another
>>> address space here I'm happy with this as it matches what other similar
>>> devices do and it seems to work. Maybe a separate address space is only
>>> really needed if we have an iommu?
>>
>> Hi Zoltan,
>>
>> It is possible for bonito to remap PCI address space so maybe it's
>> essential for bonito.
> 
> I'm still not sure it's needed or how that would work. Maybe while it's
> possible to remap these, all guests just map these one-to-one (otherwise
> they may need to do some address translation which is much better
> avoided) so in practice we don't need to emulate this. If we use a
> different memory region maybe we also need some additional iommu code
> somewhere to connect the two but I'm not sure, I haven't tried since
> most other isa bridges do the same way using system_memory and this
> seems to work. I'm also a bit concerned about additional overhead which
> we could avoid if possible. Just to model something that's not really
> used I don't think it's worth the additional complexity and possible
> performance loss unless it's found to be needed to get some guests work.

Fine.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


