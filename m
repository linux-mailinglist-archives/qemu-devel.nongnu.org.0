Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4157C71D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:09:42 +0200 (CEST)
Received: from localhost ([::1]:55504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESBh-0007zS-Bt
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oES5x-0004LU-5H
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:03:45 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1oES5t-0003MG-DI
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:03:43 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y141so1176604pfb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 02:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RWmrzemr7N8yt/+XQWXjdA62ClNalOW0O9cqGXUXTv0=;
 b=UVtAMMMCvZaAvHHzzs5eD3jr8hKdBXeUVlYATKpm3jC2XYv62Mn5g/Z+xekaBqZRUi
 90cXPGMqZJvSHcBeX/Z2iJKllpADFmUpZTaDLK58lWCaJ+DN7+ItWROlg0dGpv2g4PSA
 hgTz24JvqX1+oy3vK5TxZH8JLOcSn4l2ADKRkvb2Q+flpbV6u6hNM934jy1sIwzpS0CI
 UPHAuntRgOWmrK8We7u52MaW70nuzPPoyER1Ird5Hi4d4tj12B0vMMp7Y8it1okX/2+X
 m/TvcudltGywClTeZ8G1duMxTrSY2hx/674sCF3qDZVJ4Uk3to3ZNTx9SE2L+O9hdFdD
 U2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RWmrzemr7N8yt/+XQWXjdA62ClNalOW0O9cqGXUXTv0=;
 b=RYj8wdJX1Xxy0wEE29t0g8slVZnkJeW9RI0XegBpMdKHPSi67P2QkRv33A91nycJvG
 AwtGUInXLKazeRQVqmvnIaqWKJsxgTCtvrhhMlX79S2zn8qkKmra+sfdU0vR6OSOmCKS
 EOV5WMdROnChU3f7pW57ky/w2Xk5b2pfMwoo9KxH3PSuJwRZW48KTXRO01GRkU9lqMRQ
 OdJPqShrQvMPLhw0EzC5nHtL+cr0pNwBKIXqIQYTMhSYCt3eeroloRjCv6C25pnRxL9j
 VkyIdW5EZJrcp8a02u0n/tRWAEG1ynoAtyUcIf8omlC6YsiyqjKvae2OGBbAq3soTVOz
 bPnQ==
X-Gm-Message-State: AJIora9dBtrKvEjko2K+7GTdu/8BzGXV2jjFdOL+lb/DR/Fu3HDgNoSs
 +osHDWeUAE3eO40xBaLbYjN9QQ==
X-Google-Smtp-Source: AGRyM1v/OzgUfU6EsUm7gyhaPCjB7kgwLtk65aBh9uiL9lEm7r+wSa0ly6nzYEOtMHjqz8EQA/XYYg==
X-Received: by 2002:a05:6a00:1628:b0:52a:bd79:c175 with SMTP id
 e8-20020a056a00162800b0052abd79c175mr42759538pfc.14.1658394218474; 
 Thu, 21 Jul 2022 02:03:38 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902780200b0016a091eb88esm1084407pll.126.2022.07.21.02.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 02:03:37 -0700 (PDT)
Message-ID: <a6831bc7-c796-e11e-9a3d-e1e46caf1fa4@ozlabs.ru>
Date: Thu, 21 Jul 2022 19:03:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
 <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/07/2022 18:48, Peter Maydell wrote:
> On Thu, 21 Jul 2022 at 09:19, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> On 21/07/2022 02:08, Daniel Henrique Barboza wrote:
>>> Hey,
>>>
>>> On 7/19/22 04:59, Alexey Kardashevskiy wrote:
>>>> Alexey Kardashevskiy (1):
>>>>         pseries: Update SLOF firmware image
>>>>
>>>>    docs/system/ppc/pseries.rst |   2 +-
>>>>    pc-bios/README              |   2 +-
>>>>    pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
>>>>    roms/SLOF                   |   2 +-
>>>>    4 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>>
>>>> *** Note: this is not for master, this is for pseries
>>>> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
>>>> too soon so I am posting it anyway.
>>>
>>> I forgot to send a reply yesterday, sorry.
>>>
>>> Don't worry about rushing this SLOF pull. Given that this build doesn't
>>> have bug fixes we can wait to pull it in 7.2. You'll have the time to
>>> sync it up with git.qemu.org and so on.
>>
>>
>> Well, the git.qemu.org is still not updated, and I have no control over
>> this process anyway, who manages it?
> 
> Syncing of those git repos is supposed to be automatic, but
> occasionally something falls over. Stefan, who looks after
> the sync process ?
> 
> Alexey, which specific repo is not syncing ?


https://git.qemu.org/git/SLOF.git from git@github.com:aik/SLOF.git

For example, the latest is:
https://github.com/aik/SLOF/releases/tag/qemu-slof-20220719

But it has not made it to where git.qemu.org redirects to:
https://gitlab.com/qemu-project/SLOF


-- 
Alexey

