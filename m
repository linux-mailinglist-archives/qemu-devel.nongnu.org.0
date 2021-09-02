Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B93FF2D1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 19:48:51 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLqpW-0007xh-Au
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 13:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLqnE-0005uU-AW
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 13:46:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58762
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLqnB-00062p-Ds
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 13:46:27 -0400
Received: from host86-133-17-27.range86-133.btcentralplus.com ([86.133.17.27]
 helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mLqmi-000462-VW; Thu, 02 Sep 2021 18:46:01 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902102205.7554-1-mark.cave-ayland@ilande.co.uk>
 <20210902102205.7554-5-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9hr6r-QpGQL_JmDrcCHJkTJdD8ZWKYuf8U+2VA0jSCPw@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <fa9b6c97-7d76-f613-4005-9662283b9d85@ilande.co.uk>
Date: Thu, 2 Sep 2021 18:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9hr6r-QpGQL_JmDrcCHJkTJdD8ZWKYuf8U+2VA0jSCPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.133.17.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 4/9] escc: introduce escc_hard_reset_chn() for hardware
 reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.225,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2021 16:42, Peter Maydell wrote:

> On Thu, 2 Sept 2021 at 11:33, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This new hardware reset function is to be called for both channels when the
>> hardware reset bit is written to register WR9. Its initial implementation is
>> the same as the existing escc_reset_chn() function used for device reset.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> The datasheet says the only differences between hard and soft
> reset are for registers W9, W10, W11 and W14. I wasn't expecting
> the functions to be completely separated out like this.

I did consider doing it that way, but felt having the 2 separate functions was the 
easiest to read against the tables in the datasheet. What do you think would be the 
best way to organise the reset functions?


ATB,

Mark.

