Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCB2F4891
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:24:53 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdKe-0005fV-17
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kzdG1-0004ss-39; Wed, 13 Jan 2021 05:20:05 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1kzdFx-0000qv-SI; Wed, 13 Jan 2021 05:20:04 -0500
Received: from [192.168.1.83] (lfbn-lyo-1-486-109.w2-7.abo.wanadoo.fr
 [2.7.75.109])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7AB7921E3B;
 Wed, 13 Jan 2021 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1610533196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLXYeLa2qrtOGMEr8vI1KvyUS/2WSXxXaJJKCFM8uGY=;
 b=jctQhDap/PIC7T8feNjXle7ZfgxPWYLty85B77xo802RnJxTBmhKp4dPPPdse/h4pnNZAb
 dW2zkca0T7CSXS85oodRbF0b12GpmgFvjzW4BzzScRK69sR/K/FmUerAL+v/oFypD33iSA
 Xvf/WIsMZFvLPCP4ZYpTD+1uzOAiJJM=
Subject: Re: [PATCH] Initialize Zynq7000 UART clocks on reset
To: Peter Maydell <peter.maydell@linaro.org>,
 Michael Peter <michael.peter@hensoldt-cyber.de>
References: <FRYP281MB0158389968A2A1C231F3A585ABFB0@FRYP281MB0158.DEUP281.PROD.OUTLOOK.COM>
 <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <15fc51bf-1473-2808-583e-c58eb1620577@greensocs.com>
Date: Wed, 13 Jan 2021 11:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-EP7s-gNCsXf_59eOfo+hvTX_EwJjg02dHt0eyWOk9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


This is ok but I'm afraid we may end up doing this kind of thing in a
lot of devices. So maybe we should consider changing the behavior of
device_is_in_reset() so that it returns false in the reset-exit case.
What do you think ? (I've a patch for this, which make this one useless)

But this patch does not harm so, anyway:
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

On 1/7/21 9:00 PM, Peter Maydell wrote:
> Alistair/Edgar/Damien -- could I get a review from one of you
> for this Xilinx clock-gen related patch, please?
> 
> thanks
> -- PMM
> 
> On Tue, 24 Nov 2020 at 18:54, Michael Peter
> <michael.peter@hensoldt-cyber.de> wrote:
>>
>> Pass an additional argument to zynq_slcr_compute_clocks that indicates whether an reset-exit condition
>> applies. If called from zynq_slcr_reset_exit, external clocks are assumed to be active, even if the
>> device state indicates a reset state.
>>
>> Signed-off-by: Michael Peter <michael.peter@hensoldt-cyber.de>
>> ---
>>  hw/misc/zynq_slcr.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
>> index a2b28019e3..073122b934 100644
>> --- a/hw/misc/zynq_slcr.c
>> +++ b/hw/misc/zynq_slcr.c
>> @@ -269,12 +269,12 @@ static uint64_t zynq_slcr_compute_clock(const uint64_t periods[],
>>   * But do not propagate them further. Connected clocks
>>   * will not receive any updates (See zynq_slcr_compute_clocks())
>>   */
>> -static void zynq_slcr_compute_clocks(ZynqSLCRState *s)
>> +static void zynq_slcr_compute_clocks(ZynqSLCRState *s, bool ignore_reset)
>>  {
>>      uint64_t ps_clk = clock_get(s->ps_clk);
>>
>>      /* consider outputs clocks are disabled while in reset */
>> -    if (device_is_in_reset(DEVICE(s))) {
>> +    if (!ignore_reset && device_is_in_reset(DEVICE(s))) {
>>          ps_clk = 0;
>>      }
>>
>> @@ -305,7 +305,7 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
>>  static void zynq_slcr_ps_clk_callback(void *opaque)
>>  {
>>      ZynqSLCRState *s = (ZynqSLCRState *) opaque;
>> -    zynq_slcr_compute_clocks(s);
>> +    zynq_slcr_compute_clocks(s, false);
>>      zynq_slcr_propagate_clocks(s);
>>  }
>>
>> @@ -410,7 +410,7 @@ static void zynq_slcr_reset_hold(Object *obj)
>>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>>
>>      /* will disable all output clocks */
>> -    zynq_slcr_compute_clocks(s);
>> +    zynq_slcr_compute_clocks(s, false);
>>      zynq_slcr_propagate_clocks(s);
>>  }
>>
>> @@ -419,7 +419,7 @@ static void zynq_slcr_reset_exit(Object *obj)
>>      ZynqSLCRState *s = ZYNQ_SLCR(obj);
>>
>>      /* will compute output clocks according to ps_clk and registers */
>> -    zynq_slcr_compute_clocks(s);
>> +    zynq_slcr_compute_clocks(s, true);
>>      zynq_slcr_propagate_clocks(s);
>>  }
>>
>> @@ -558,7 +558,7 @@ static void zynq_slcr_write(void *opaque, hwaddr offset,
>>      case R_ARM_PLL_CTRL:
>>      case R_DDR_PLL_CTRL:
>>      case R_UART_CLK_CTRL:
>> -        zynq_slcr_compute_clocks(s);
>> +        zynq_slcr_compute_clocks(s, false);
>>          zynq_slcr_propagate_clocks(s);
>>          break;
>>      }
>> --
>> 2.17.1
> 

