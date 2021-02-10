Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6D3165C0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:55:38 +0100 (CET)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9o5p-0006jh-2u
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9o4T-00068s-9J
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:54:13 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9o4R-0004X6-Ov
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:54:13 -0500
Received: by mail-ej1-x631.google.com with SMTP id jj19so3641830ejc.4
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZpBT6naGguf2v3CEHsLdsw0YNsnSUEqIQIMNWACrUgc=;
 b=R8C+2EUBpSZJpyNIk7c2qj5pyL0Itmc8LiSiy8Fa+tj8ghOD+42kwm97Kja30YOjmT
 jdIS9g2Ys7wXOEUONnSxkx+OISc4NYTiRjeJIfDiOvpIVZIUYkqt0Kvf5rvzRJareJxP
 CR947Q/e+/SmQJ+rLHOf7eXWpsJjT6S7s31LbdMydgne3wP/ua5s5INIeAkj/LGEDwBd
 OsOiqjXLGoq6r5iDESmxL9J+rH28tTZ3iLQ14O+Gs8Rb+0FtbP1ZXp18RIYZr6gmeAPI
 qPdU/jJ7Xlxo571ymP5ZtEVikXYbsixpqvsMTHxDo9DBC/bQCETwzRv9jl8tFyk0f0Xh
 YkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZpBT6naGguf2v3CEHsLdsw0YNsnSUEqIQIMNWACrUgc=;
 b=ag+j6xwv9/et4NBtbuuLlE9TeuPtLJowNNRDaf6pHr8LdFj2FVt1ILiNA6jHsE8i5F
 kVz+1qCT4ubLF0bRZELO8No/UJlQEtwDylCgbeI73CoIAYRRirufqEge3Q4gv/SFh1b+
 h/DJvwbSnp3SE8faL1MprWgFZGvbnotLh9AxCIlLPGEkLI4VPr/IVCDqmU4lCMj8ZyFn
 DG2cbUz1BRhtSD65f/Lt+URDnu+/DXyqM/NbYp2nh+w3s56dYSd3yHr3S9fb7ZDwGDyV
 IoMlkQsFkk9czJUgee/+AWYR5Up2UD6IimXIFLZb6mv/B/yemz6pVY/Zyes5UlbAlNFk
 fhaw==
X-Gm-Message-State: AOAM533/qh97JnxgXaoFASJ9zqj5qeIIms487ZqVMhzw09Fb2I/YjOzK
 y6WoqxYLdVlZ+v6lXtyHTBo=
X-Google-Smtp-Source: ABdhPJzPg5f6fYDXpCANCpcwDHT/Tnr3QuUoWd0+Y2KFkk2b8H/0mW3icLFL8oGGF6CnIvf7fPT+8Q==
X-Received: by 2002:a17:906:7d4f:: with SMTP id
 l15mr2505200ejp.95.1612958050044; 
 Wed, 10 Feb 2021 03:54:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a15sm813432edv.95.2021.02.10.03.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 03:54:09 -0800 (PST)
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Hao Wu <wuhaotsh@google.com>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
 <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
 <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a20af976-b428-06ae-4d55-ca81f977065b@amsat.org>
Date: Wed, 10 Feb 2021 12:54:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Tyrone Ting <kfting@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 11:37 PM, Hao Wu wrote:
> I don't see this error. It could be some error in the clock that the
> timer module does not get a correct clock input.
> How do you reproduce this?

I got it only once, can not reproduce, but it happened on our CI too:
https://gitlab.com/qemu-project/qemu/-/jobs/1006073367#L4430

> 
> On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     Hi,
> 
>     On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell
>     <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>>
>     wrote:
>     >
>     > From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>     >
>     > This patch makes NPCM7XX Timer to use a the timer clock generated
>     by the
>     > CLK module instead of the magic number TIMER_REF_HZ.
>     >
>     > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com
>     <mailto:hskinnemoen@google.com>>
>     > Reviewed-by: Tyrone Ting <kfting@nuvoton.com
>     <mailto:kfting@nuvoton.com>>
>     > Signed-off-by: Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>>
>     > Message-id: 20210108190945.949196-3-wuhaotsh@google.com
>     <mailto:20210108190945.949196-3-wuhaotsh@google.com>
>     > Reviewed-by: Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>>
>     > Signed-off-by: Peter Maydell <peter.maydell@linaro.org
>     <mailto:peter.maydell@linaro.org>>
>     > ---
>     >  include/hw/misc/npcm7xx_clk.h    |  6 -----
>     >  include/hw/timer/npcm7xx_timer.h |  1 +
>     >  hw/arm/npcm7xx.c                 |  5 ++++
>     >  hw/timer/npcm7xx_timer.c         | 39
>     +++++++++++++++-----------------
>     >  4 files changed, 24 insertions(+), 27 deletions(-)
> 
>     Is that a spurious error (building with Clang)?
> 
>     Running test qtest-arm/npcm7xx_timer-test
>     ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
>     assertion failed (tim_read(td, TISR) == tim_timer_bit(td)): (0x00000000
>     == 0x00000004)
>     ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
>     'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
>     FAIL 155 qtest-arm/npcm7xx_timer-test
>     /arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
>     make: *** [Makefile.mtest:1033: run-test-127] Error 1
> 

