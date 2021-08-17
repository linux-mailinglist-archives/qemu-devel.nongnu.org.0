Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D083EF017
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:19:46 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1oX-00088N-DZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1js-00072f-2x; Tue, 17 Aug 2021 12:14:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mG1jp-0005Fe-MR; Tue, 17 Aug 2021 12:14:55 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 591BC21A87;
 Tue, 17 Aug 2021 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629216890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grBVHApd6zrlAZVbZ44nxxv6IOQ3pRbDcs97M/7T8Sc=;
 b=y0vFS7bVFgRnuylOcxiPFEw8NxIVmLfKA4b2yBpzNWCfy0DlfJi+HHMu/r3R5B2pqRxDeQ
 9wEUoZkG2jrg2cgjFublA/lfPV0O/3okbiIW2G3bucbxqAfTCquuJIgxa1gOqBhX8YZPze
 GfSkpFPYEaSrERSt2RJEvJvg0if9RnA=
Subject: Re: [PATCH for-6.2 21/25] hw/timer/armv7m_systick: Use clock inputs
 instead of system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-22-peter.maydell@linaro.org>
 <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
 <CAFEAcA93OvhA2_e52dZA-Thfkp8APRn9SkOGwfEe0oVkcrh5GA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <e08ef784-3c6f-97dc-7e15-f0580f502da9@greensocs.com>
Date: Tue, 17 Aug 2021 18:14:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA93OvhA2_e52dZA-Thfkp8APRn9SkOGwfEe0oVkcrh5GA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/17/21 5:59 PM, Peter Maydell wrote:
> On Tue, 17 Aug 2021 at 16:55, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 8/12/21 11:33 AM, Peter Maydell wrote:
>> According to
>> https://developer.arm.com/documentation/ddi0403/d/System-Level-Architecture/System-Address-Map/The-system-timer--SysTick/SysTick-Calibration-value-Register--SYST-CALIB
>> , the field is 24bits wide.
>>
>> Should we prevent an overflow into the reserved bits and other fields ?
>> by doing something like this:
>>            val &= SYSCALIB_TENMS;
>> with the following #define with the other ones, above.
>>     #define SYSCALIB_TENMS ((1U << 24) - 1)
>>
>> Note, the overflow would happen around ~1.68GHz refclk frequency, it is
>> probably a config that will never happen. I'm not sure if we should care
>> or do something if this happens because it is probably an error
>> somewhere else.
> 
> I guess we should do something, yes, though pretty much anything
> we do will not really provide the guest with sensible data...
> I suppose masking out the higher bits is no worse than anything else.
> 
> -- PMM
> 


Then, with the masking.
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

--
Damien

