Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CDC3EEA7F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:04:57 +0200 (CEST)
Received: from localhost ([::1]:47040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvxn-0002yY-Uq
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mFvsL-0008MF-Ln; Tue, 17 Aug 2021 05:59:19 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:52178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mFvsJ-0000Vy-4F; Tue, 17 Aug 2021 05:59:17 -0400
Received: from [192.168.15.170] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2AFB92089E;
 Tue, 17 Aug 2021 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629194348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cM6Sf5OTkdz5rNX48R+XN99E7FX2KbQEoavqHHnxdPg=;
 b=6yKiE1yyIa1+qsgurh6UVEWrtHLs32IolbSDdIFEO056D/m15jsQa2mHKVlBA0BhzaPgpO
 1KRa/7CAEK32MgEiGQVYJzPu4JBcoO5JsTP4GC71ypmiZw044WWcaqhCP20s4o7dpyApJt
 G/CR0SMgAMFLYh3btA1TeIWbYpoNnmA=
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
Date: Tue, 17 Aug 2021 11:59:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/12/21 11:33 AM, Peter Maydell wrote:
> It is quite common for a clock tree to involve possibly programmable
> clock multipliers or dividers, where the frequency of a clock is for
> instance divided by 8 to produce a slower clock to feed to a
> particular device.
> 
> Currently we provide no convenient mechanism for modelling this.  You
> can implement it by having an input Clock and an output Clock, and
> manually setting the period of the output clock in the period-changed
> callback of the input clock, but that's quite clunky.
> 
> This patch adds support in the Clock objects themselves for setting a
> multiplier or divider.  The effect of setting this on a clock is that
> when the clock's period is changed, all the children of the clock are
> set to period * multiplier / divider, rather than being set to the
> same period as the parent clock.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
>  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
>  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
>  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
>  4 files changed, 100 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 956bd147ea0..430fbd842e5 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, *Clock 3* and *Clock 4*.
>  It is not possible to disconnect a clock or to change the clock connection
>  after it is connected.
>  
> +Clock multiplier and divider settings
> +-------------------------------------
> +
> +By default, when clocks are connected together, the child
> +clocks run with the same period as their source (parent) clock.
> +The Clock API supports a built-in period multiplier/divider
> +mechanism so you can configure a clock to make its children
> +run at a different period from its own. If you call the
> +``clock_set_mul_div()`` function you can specify the clock's
> +multiplier and divider values. The children of that clock
> +will all run with a period of ``parent_period * multiplier / divider``.
> +For instance, if the clock has a frequency of 8MHz and you set its
> +multiplier to 2 and its divider to 3, the child clocks will run
> +at 12MHz.
> +
> +You can change the multiplier and divider of a clock at runtime,
> +so you can use this to model clock controller devices which
> +have guest-programmable frequency multipliers or dividers.
> +
> +Note that ``clock_set_mul_div()`` does not automatically call
> +``clock_propagate()``. If you make a runtime change to the
> +multiplier or divider you must call clock_propagate() yourself.a
> +
>  Unconnected input clocks
>  ------------------------
>  
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index a7187eab95e..11f67fb9701 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -81,6 +81,10 @@ struct Clock {
>      void *callback_opaque;
>      unsigned int callback_events;
>  
> +    /* Ratio of the parent clock to run the child clocks at */
> +    uint32_t multiplier;
> +    uint32_t divider;
> +
>      /* Clocks are organized in a clock tree */
>      Clock *source;
>      QLIST_HEAD(, Clock) children;
> @@ -350,4 +354,29 @@ static inline bool clock_is_enabled(const Clock *clk)
>   */
>  char *clock_display_freq(Clock *clk);
>  
> +/**
> + * clock_set_mul_div: set multiplier/divider for child clocks
> + * @clk: clock
> + * @multiplier: multiplier value
> + * @divider: divider value
> + *
> + * By default, a Clock's children will all run with the same period
> + * as their parent. This function allows you to adjust the multiplier
> + * and divider used to derive the child clock frequency.
> + * For example, setting a multiplier of 2 and a divider of 3
> + * will run child clocks with a period 2/3 of the parent clock,
> + * so if the parent clock is an 8MHz clock the children will
> + * be 12MHz.
> + *
> + * Setting the multiplier to 0 will stop the child clocks.
> + * Setting the divider to 0 is a programming error (diagnosed with
> + * an assertion failure).
> + * Setting a multiplier value that results in the child period
> + * overflowing is not diagnosed.
> + *
> + * Note that this function does not call clock_propagate(); the
> + * caller should do that if necessary.
> + */
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
> +
>  #endif /* QEMU_HW_CLOCK_H */
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 260b13fc2c8..07bb45d7ed4 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -14,6 +14,24 @@
>  #include "migration/vmstate.h"
>  #include "hw/clock.h"
>  
> +static bool muldiv_needed(void *opaque)
> +{
> +    Clock *clk = opaque;
> +
> +    return clk->multiplier != 1 || clk->divider != 1;
> +}
> +
> +const VMStateDescription vmstate_muldiv = {
> +    .name = "clock/muldiv",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = muldiv_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(multiplier, Clock),
> +        VMSTATE_UINT32(divider, Clock),
> +    },
> +};
> +
>  const VMStateDescription vmstate_clock = {
>      .name = "clock",
>      .version_id = 0,
> @@ -21,5 +39,9 @@ const VMStateDescription vmstate_clock = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT64(period, Clock),
>          VMSTATE_END_OF_LIST()
> -    }
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_muldiv,
> +        NULL
> +    },
>  };
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index fc5a99683f8..c371b9e977a 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -64,6 +64,15 @@ bool clock_set(Clock *clk, uint64_t period)
>      return true;
>  }
>  
> +static uint64_t clock_get_child_period(Clock *clk)
> +{
> +    /*
> +     * Return the period to be used for child clocks, which is the parent
> +     * clock period adjusted for for multiplier and divider effects.
> +     */
> +    return muldiv64(clk->period, clk->multiplier, clk->divider);
> +}
> +
>  static void clock_call_callback(Clock *clk, ClockEvent event)
>  {
>      /*
> @@ -78,15 +87,16 @@ static void clock_call_callback(Clock *clk, ClockEvent event)
>  static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  {
>      Clock *child;
> +    uint64_t child_period = clock_get_child_period(clk);
>  
>      QLIST_FOREACH(child, &clk->children, sibling) {
> -        if (child->period != clk->period) {
> +        if (child->period != child_period) {
>              if (call_callbacks) {
>                  clock_call_callback(child, ClockPreUpdate);
>              }
> -            child->period = clk->period;
> +            child->period = child_period;
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
> -                               CLOCK_PERIOD_TO_HZ(clk->period),
> +                               CLOCK_PERIOD_TO_HZ(child->period),
>                                 call_callbacks);
>              if (call_callbacks) {
>                  clock_call_callback(child, ClockUpdate);
> @@ -110,7 +120,7 @@ void clock_set_source(Clock *clk, Clock *src)
>  
>      trace_clock_set_source(CLOCK_PATH(clk), CLOCK_PATH(src));
>  
> -    clk->period = src->period;
> +    clk->period = clock_get_child_period(src);
>      QLIST_INSERT_HEAD(&src->children, clk, sibling);
>      clk->source = src;
>      clock_propagate_period(clk, false);
> @@ -133,10 +143,21 @@ char *clock_display_freq(Clock *clk)
>      return freq_to_str(clock_get_hz(clk));
>  }
>  
> +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +{
> +    assert(divider != 0);
> +
> +    clk->multiplier = multiplier;
> +    clk->divider = divider;
> +}
> +
>  static void clock_initfn(Object *obj)
>  {
>      Clock *clk = CLOCK(obj);
>  
> +    clk->multiplier = 1;
> +    clk->divider = 1;
> +
>      QLIST_INIT(&clk->children);
>  }
>  
> 

Regarding migration, you made the vmstate_muldiv subsection optional. I
suppose it is to keep backward migration working in case of simple
mul=1,div=1 clocks.

Do we need to ensure multiplier and divider fields are set to 1 upon
receiving a state if the vmstate_muldiv subsection is absent ? I
remember there are post_load() tricks to achieve that.

Thanks,
Damien

