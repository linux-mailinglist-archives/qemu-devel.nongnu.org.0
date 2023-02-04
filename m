Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF6868AAE3
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKFT-0001P9-HF; Sat, 04 Feb 2023 10:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pOKFR-0001Nb-77; Sat, 04 Feb 2023 10:14:37 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pOKFP-00070F-7j; Sat, 04 Feb 2023 10:14:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 2CC904001D;
 Sat,  4 Feb 2023 18:14:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1A5B39A;
 Sat,  4 Feb 2023 18:14:30 +0300 (MSK)
Message-ID: <155d63ce-39a2-ad00-229a-6100e1cd5fd3@msgid.tls.msk.ru>
Date: Sat, 4 Feb 2023 18:14:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] configure: normalize riscv* cpu types too
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20230204112502.2558739-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA-cgoe9gzACaob=jBkCTQNG-+ahh41t0cYML4NM_DfNZA@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA-cgoe9gzACaob=jBkCTQNG-+ahh41t0cYML4NM_DfNZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

04.02.2023 18:05, Peter Maydell пишет:
> On Sat, 4 Feb 2023 at 11:26, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>
>> For most CPU types out there, ./configure normalizes all
>> variations into base form plus, optionally, variations,
>> to find the proper arch-specific code.  In particular,
>> it's possible to use
>>     ./configure --cpu=$(uname -m)
>> and it will figure out the right base cpu family out of
>> that. But this does not work for riscv64 for example,
>> since there's no similar normalisation for that one.
> 
> I don't think that's something we should be encouraging
> users to do. The most common case should be "configure
> correctly detects the host CPU type by probing the
> compiler #defines, and the user does not need to specify".
> The next most common thing should be "the user has some
> special-case need to override this, and they know what
> they want, and they specify the right value, in this
> case "riscv".
...

This all makes perfect sense, thank you Peter for explaining.

I already told the original reporter (on IRC) that it looks
like what they're doing is wrong, just using proper CC (or
--cross-prefix) should DTRT, and it turned out they don't
even remember anymore why they've put this --cpu= there.

The current code in ./configure just looked incomplete to
me, so I went on and sent a patch to make it more, in my
view, uniform.

It is for the better that it is not needed.

/mjt

