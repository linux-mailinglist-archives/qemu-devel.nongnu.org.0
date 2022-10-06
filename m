Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9DB5F6987
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:24:18 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogRnN-0002C4-G2
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogOw6-00073h-7r; Thu, 06 Oct 2022 07:21:07 -0400
Received: from hours.tkos.co.il ([84.110.109.230]:47914 helo=mail.tkos.co.il)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baruch@tkos.co.il>)
 id 1ogOw1-0006d8-Hk; Thu, 06 Oct 2022 07:21:05 -0400
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id C1FB1440072;
 Thu,  6 Oct 2022 14:19:03 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1665055143;
 bh=dC3jzoD9auFoIHAZd8QJL7uy0WTrFUZalGXvAp4PSFM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=IYdJaxhV8Vm/j5vZ7q/2y8HzQfJDuM4MXU5uc29agKfbJkyQgbq0K5QUFcUJ1orvo
 wkQCSLZuLmTqfHcqsLuu7H721fIGIp1sBjQ04dqPcXqYP3LbiXa3CVSsIVNyww8rVl
 6mb4tboKe1k7eLtKBCFU+UG26JrwpdkO8g6ihEmw0X/nxcAN73BjRDFMSTls1YM1N8
 4XhCUaF9UiQObpvqv+cs1doMmnOHLu5mW+rooPP+uKPE08eGShKWuT6s7S8BtvhajN
 6g8q3r+QXN+xT2UqQ3+1BTKC9sgo5HEP2Mz7UMGh4kplZnDcwUEnR0r26MI2bDkHGC
 2GxOL1bYrMB5A==
References: <1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai>
 <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
User-agent: mu4e 1.8.7; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/char/pl011: fix baud rate calculation
Date: Thu, 06 Oct 2022 14:12:43 +0300
In-reply-to: <CAFEAcA8fbToN9D4cm=2VfaUn3GHyYZhbETa3CY-Y0-2jqwbYcA@mail.gmail.com>
Message-ID: <87tu4hci5m.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=84.110.109.230; envelope-from=baruch@tkos.co.il;
 helo=mail.tkos.co.il
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 10:17:08 -0400
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

Hi Peter,

On Thu, Oct 06 2022, Peter Maydell wrote:
> On Thu, 6 Oct 2022 at 11:20, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
>> when this is the case". But the code looks at FBRD for the invalid case.
>> Fix this.
>>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  hw/char/pl011.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Thanks for this patch (I'll review it in a bit). Did you find this
> because it caused problems for a guest, or just because you were
> looking at the QEMU source code? (If it's the former, we like to
> include some details of that in the commit message.)

Initially I only looked at the source code while trying to understand
how clock initialization and use is meant to work. Once I figured that
out I confirmed the issue with ATF code that first sets IBRD and then
FBRD.

Before patch:

pl011_baudrate_change new baudrate 0 (clk: 100000000hz, ibrd: 54, fbrd: 0)
pl011_baudrate_change new baudrate 115204 (clk: 100000000hz, ibrd: 54, fbrd: 16)

With patch:

pl011_baudrate_change new baudrate 115740 (clk: 100000000hz, ibrd: 54, fbrd: 0)
pl011_baudrate_change new baudrate 115204 (clk: 100000000hz, ibrd: 54, fbrd: 16)

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

