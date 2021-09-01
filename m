Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F73FD4FF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:13:32 +0200 (CEST)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLND-0005Rf-VV
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLLMR-0004ib-52
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:12:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55742
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLLMP-00006p-00
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:12:42 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLLLy-0004qq-Ce; Wed, 01 Sep 2021 09:12:19 +0100
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210724134902.7785-1-peter.maydell@linaro.org>
 <CAFEAcA9zMdFwJ6TPG2G7+boV4zPGrg2nZHXzUmBKZ-BkHdnqjA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <1e626fe9-fb8c-2d0a-f828-7c3e969f6c24@ilande.co.uk>
Date: Wed, 1 Sep 2021 09:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9zMdFwJ6TPG2G7+boV4zPGrg2nZHXzUmBKZ-BkHdnqjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2021 08:58, Peter Maydell wrote:

> On Sat, 24 Jul 2021 at 14:49, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> The sparc frontend is now the only user of the obsolete gen_io_end()
>> function (used for icount support). This patchset removes the
>> use from sparc as well, and then tidies up the generic icount
>> infrastructure to remove the function altogether.
>>
>> This is for-6.2 material because it's just cleanup.
> 
>> Peter Maydell (2):
>>    target/sparc: Drop use of gen_io_end()
>>    tcg: Drop gen_io_end()
> 
> Mark, are you planning a sparc pullreq, or should I take these
> via target-arm.next?

I can take them: my plan was to take the sun4m smp fix and the updated ESCC patches 
together, so I can add these too.


ATB,

Mark.

