Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E261331CB5A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:44:19 +0100 (CET)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0eI-00010Q-W4
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0d7-0000TN-3s; Tue, 16 Feb 2021 08:43:05 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC0d5-0002Ne-HV; Tue, 16 Feb 2021 08:43:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r21so13021230wrr.9;
 Tue, 16 Feb 2021 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z43kKCdxvSOoXLFMbdq5zMT8mPveQTUl00XI8BuBM1k=;
 b=UBAxW69DZcfLEk8qKmAj+eGDxNRmxhSL047iAlWHLsPGUvnx16VYXGAPOPFpfeLTDU
 dcgFKtZLsvVjDh0vm8IvW0ALomTqCqbSHn0lWPdmIJczhWZRpCt8iqB6zjZrFQIYYR0Z
 1dVOaVfOJdJrS7YsyEyR5hbgMmQXhNIxJlPYPEXlsfzD5d5nDxHDm00x5C4v5HdZQhoF
 gZmK9XZ1+Lhcx+92G9419blA0EtEtuND4qqV2N4PFxVUrd3xscPtJLLfy6y1MWrW8xBZ
 vsrzrKLNTKVJQjN8iqwtO2PGtUAHzOzAo95EB3BHAFlPRcm1h0sQLtH5nan/EQd5sthP
 1dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z43kKCdxvSOoXLFMbdq5zMT8mPveQTUl00XI8BuBM1k=;
 b=aAD3neG9cQaGxYrRjgxFkKE1Yh7IFlJea3LHQoy3CTaWRlcPCVEnAsBcYIeZLPESFs
 KnEWS5QxmMWqOvw7pI+yz9R8oGUXIVGSrdV5aMGj4ZwGLZnb2iKdDcD9rA3GAqgCWok0
 9gSzRCNswTKgMOqg2qpOWjbQZWPaY5Un7VZQJYYArz0S0ElUjstBcavy0ypbvGAMULGJ
 H43Z/uqhh2hfckKvebbiXJdJ6LgdCYdZNHGstL62Eig2dChQsHxqq2B/teYWl9rVgoBE
 218RGNiGUNlSwXBSYS22s5HjeRUjrFmDskecgGmUEeZ3tfSfGFei8krAXdNS3wVM2Y5Q
 TMtg==
X-Gm-Message-State: AOAM530jSOikhwgqO/ipMXrfCcCOlt5uFAuZ/73wNoz4UDx2GausF97v
 iE40wMKxVnLkAhA8InC0yDr1ZmeIeH0=
X-Google-Smtp-Source: ABdhPJygmr1GkizU+V/VFpV4Jd7vfJc9L5t7AotgPwQVw1UzXB9yCqXKI6xU4P5Ogh5ZekHd+uuWHw==
X-Received: by 2002:a5d:4982:: with SMTP id r2mr24695165wrq.41.1613482981574; 
 Tue, 16 Feb 2021 05:43:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t198sm3709511wmt.7.2021.02.16.05.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:43:01 -0800 (PST)
Subject: Re: [PATCH v4 0/9] hw/sd: Support block read/write in SPI mode
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210128063035.15674-1-bmeng.cn@gmail.com>
 <CAEUhbmXofQq9AerwBQfjDZkwp0kA9w+y+x_F0LUWZ6ArP+9H=g@mail.gmail.com>
 <CAEUhbmXb58yxg1TAgq0vdH=QE-o0qCTjYghX2XZag-S1cWB=Eg@mail.gmail.com>
 <2a425f7a-67c6-ad96-5351-ac6c28cbc5ce@amsat.org>
 <CAEUhbmUeYdfC8GEqJy798d1wmDW3TZA78siiJd3gGBZ0C_E9bg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf247b50-df7d-7544-01c2-46214b4dc1eb@amsat.org>
Date: Tue, 16 Feb 2021 14:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUeYdfC8GEqJy798d1wmDW3TZA78siiJd3gGBZ0C_E9bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 12:53 PM, Bin Meng wrote:
> On Wed, Feb 10, 2021 at 1:36 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 2/9/21 3:32 PM, Bin Meng wrote:
>>> Hi Philippe,
>>>
>>> On Thu, Feb 4, 2021 at 2:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> On Thu, Jan 28, 2021 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>>
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> This includes the previously v3 series [1], and one single patch [2].
>>>>>
>>>>> Compared to v3, this fixed the following issue in patch [v3,6/6]:
>>>>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>>>>>   receiving the STOP_TRAN token per the spec
>>>>>
>>>>> All software tested so far (U-Boot/Linux/VxWorks) do work without
>>>>> the fix, but it is better to comform with the spec.
>>>>>
>>>>> In addition to [2], one more issue was exposed when testing with
>>>>> VxWorks driver related to STOP_TRANSMISSION (CMD12) response.
>>>>>
>>>>> [1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=226136
>>>>> [2] http://patchwork.ozlabs.org/project/qemu-devel/patch/1611636214-52427-1-git-send-email-bmeng.cn@gmail.com/
>>>>>
>>>>> Changes in v4:
>>>>> - Keep the card state to SSI_SD_CMD instead of SSI_SD_RESPONSE after
>>>>>   receiving the STOP_TRAN token per the spec
>>>>> - new patch: fix STOP_TRANSMISSION (CMD12) response
>>>>> - new patch: handle the rest commands with R1b response type
>>>>>
>>>>
>>>> Ping?
>>>
>>> Will a PR be sent soon to include this series so that the SiFive SPI
>>> series can follow?
>>
>> I had it planned for yesterday but had problems with the mails from
>> the list, + the CVE (you fixed) took priority.
>>
>> Missing review is patch #8 "Fix STOP_TRANSMISSION (CMD12) response"
>> for which I don't have test yet.
> 
> Ping? If there is any comment for patch #8?

No more comment, series applied to sdmmc-next tree.

Thanks,

Phil.

