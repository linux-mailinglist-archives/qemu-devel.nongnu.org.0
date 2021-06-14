Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8713A6C60
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:49:24 +0200 (CEST)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspm7-0002kw-6a
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspkx-0001OP-RB; Mon, 14 Jun 2021 12:48:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspkv-00016p-Qo; Mon, 14 Jun 2021 12:48:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so15251398wrh.7;
 Mon, 14 Jun 2021 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RgAEWXV5nmKU4Q3sRG1D5iVG3H2VEgfGtqlH75QAXBU=;
 b=h7VmdlcDOytExUrn1YjBWVrOg6lNRTwrJFPNja3CZHs7NzUw+33TvJXpfmlSit/uj8
 f+tx6rsEzEbwSHPMF5qDvcSZX//62/NM+r6HmZZ3iyJKg6iPMhSuQVZeG0jNepgjrPY2
 MrUvTv9GM/Re0cIx0OBBCh9D8WUbTNZ2Ol0a1od2Fv2c5uq1CBFVh5Nr6EqQ0JkKDvb3
 8oO3cRHPapgLigcaBAugF8bRxUij6KzNSzxNiV1FaKaZFMO3810krEuwF2zIV7kWAloM
 LKbNuAyoAReSdp3LgqF3qA/np5gOy+m6qHh/fOaSqtGbR8FrB7BixxUvTzXURMvZRCrj
 iSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RgAEWXV5nmKU4Q3sRG1D5iVG3H2VEgfGtqlH75QAXBU=;
 b=RDLHYji1H2bnspgXZdvKMcjpOHEhNnbKL6cyVlC4L1Eo45vX6XzSTaQRU+ZPpGVzWM
 PqbdhVAMxT8Pb4AJgc6W7EMmBSpUp7nJ3WGPE9wSLpHXWMVx8XRFlZ8SpDkuv9JF2rT2
 eGRvrBOmuYjy8AASifocDz07iGweoBIE6y6TpkEx7sdmKzgrbf5vG3VEeAbApUxW19I8
 lz/RPxPVcL5Qae+Y4K+YOSj8L8y0u2OXaJ8/KiEghKt4+3dAxOOp3FQhlfZwHc5ruqYZ
 ojODniClHGsmfzp+v5XzAyNM17XAmzuwaqXM/63U37bLiby5X3xSXDaQ73g2Lqk5YdZ2
 oR+w==
X-Gm-Message-State: AOAM530t7kd0IPX7ebM18evxP2IuRXOd14pC7UYqlUvup0oFz19dvNWE
 o1A1VkwF+xxE5K1D+vkBnxQ=
X-Google-Smtp-Source: ABdhPJzGD1dcQVbUhdISGbMyJUfgw0bxvrSI3JC4s2zsJ06qz2wb8l18ikOsCk6bgbAFfbkqxzkH0A==
X-Received: by 2002:a5d:540a:: with SMTP id g10mr20087578wrv.254.1623689287677; 
 Mon, 14 Jun 2021 09:48:07 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x125sm14643733wmg.37.2021.06.14.09.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 09:48:06 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] i2c: Match parameters of i2c_start_transfer and
 i2c_send_recv
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200623063123.20776-1-f4bug@amsat.org>
 <46692025-50b-2734-e394-513b2761b979@eik.bme.hu>
 <8230aaa5-73b4-4bf6-6567-38bb5cde3883@amsat.org>
 <b5f020d9-53e6-602c-74f8-d2695462a5c@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df15b240-af9b-49d3-178a-d0fb8de63aa3@amsat.org>
Date: Mon, 14 Jun 2021 18:48:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b5f020d9-53e6-602c-74f8-d2695462a5c@eik.bme.hu>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 12:02 PM, BALATON Zoltan wrote:
> On Mon, 14 Jun 2021, Philippe Mathieu-Daudé wrote:
>> On 6/12/21 9:33 PM, BALATON Zoltan wrote:
>>> Hello,
>>>
>>> On Tue, 23 Jun 2020, Philippe Mathieu-Daudé wrote:
>>>> This is v2 of Zoltan's patch:
>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
>>>>
>>>> - rebased
>>>> - added docstring
>>>> - include hw/misc/auxbus.c fix
>>>>
>>>> Supersedes: <20200621145235.9E241745712@zero.eik.bme.hu>
>>>
>>> What happened to this series? I did not find it in patchew, only my
>>> original patch:
>>>
>>> https://patchew.org/QEMU/20200621145235.9E241745712@zero.eik.bme.hu/
>>>
>>> I still have this in one of my branches so I think it was not merged at
>>> the end. Could this be resurrected or should I forget about it and live
>>> with the inconsistency in parameters instead?
>>
>> I suppose it was not queued because you asked to remove the
>> "Reported-by" tag :/ I agree with you it would be nice to get this in
>> the tree
> 
> I think I said only Reported-by is enough no need for Suggested-by as
> well but I don't see this as a reason to drop these patches. So maybe
> just nobody cared enough.

Ah OK now got it.

>> for good. However 1 year passed, so it might need adjustment.
> 
> Should I try to rebase it or will you do it eventually?

Found the branch and clean rebase, so no change needed.

Corey, if you are busy, I could send a pull request if you provide
and Acked-by tag.

Regards,

Phil.

