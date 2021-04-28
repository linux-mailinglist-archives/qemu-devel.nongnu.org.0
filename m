Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7836D41C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 10:42:58 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbfma-0004El-Of
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 04:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfiq-0003Np-Dt
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 04:39:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37212
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfio-0005B9-NF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 04:39:04 -0400
Received: from host109-146-177-131.range109-146.btcentralplus.com
 ([109.146.177.131] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lbfj5-0005J0-9K; Wed, 28 Apr 2021 09:39:22 +0100
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210427192658.266933-1-f4bug@amsat.org>
 <20210427192658.266933-2-f4bug@amsat.org>
 <1e92cd61-5a55-94f5-42a3-d3c4021f3701@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4d26b8b9-5e04-b5b6-1326-ebf10055e2a0@ilande.co.uk>
Date: Wed, 28 Apr 2021 09:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1e92cd61-5a55-94f5-42a3-d3c4021f3701@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/2] hw/sparc: Allow building the leon3 machine stand-alone
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2021 01:11, Richard Henderson wrote:

> On 4/27/21 12:26 PM, Philippe Mathieu-Daudé wrote:
>> When building only the leon3 machine, we get this link failure:
>>
>>    /usr/bin/ld: target_sparc_win_helper.c.o: in function `cpu_put_psr':
>>    target/sparc/win_helper.c:91: undefined reference to `cpu_check_irqs'
>>
>> This is because cpu_check_irqs() is defined in hw/sparc/sun4m.c,
>> which is only built if the base sun4m machines are built (with
>> the CONFIG_SUN4M selector).
>>
>> Fix by moving cpu_check_irqs() out of hw/sparc/sun4m.c and build
>> it unconditionally.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   hw/sparc/irq.c       | 61 ++++++++++++++++++++++++++++++++++++++++++++
>>   hw/sparc/sun4m.c     | 32 -----------------------
>>   hw/sparc/meson.build |  1 +
>>   3 files changed, 62 insertions(+), 32 deletions(-)
>>   create mode 100644 hw/sparc/irq.c
> 
> I think this code should be in target/sparc/.  There doesn't seem to be any reference 
> to anything outside CPUSPARCState.

I suspect that this is based upon the existing precedent set by SPARC64 where the IRQ 
routines are stored in hw/sparc64/sparc64.c. I'd lean towards the current approach 
for now so that both 32-bit and 64-bit could be moved into target/sparc as a separate 
exercise for consistency.


ATB,

Mark.

