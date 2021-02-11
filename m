Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD2C3187FE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:24:21 +0100 (CET)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA992-0003Kl-Tn
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:24:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8vp-0000G4-Bj; Thu, 11 Feb 2021 05:10:44 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1lA8vm-0004u0-QA; Thu, 11 Feb 2021 05:10:41 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DA894C602E6;
 Thu, 11 Feb 2021 11:10:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1613038234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XBdFX38jptpi0BIEJ1yRhy9PuJYL9HLek6XR7hMRUW4=;
 b=iJxuED8MJ4azTSXo2rSrMZWCFL+MHglfISNdL/yr5G7Y1XF+fyVvzuLcUSN65bn2Kfrpl8
 tKDK3wI5jy6baxdwHOLQ40CsryU+4PZlWIFrJjTSfZ725KPC/+XQGww/v6djZdmUg5DvJO
 HGnTJ+5tvS79bikjv37Rx88uk7bc/7tzxcZpF8eGK4hwTlVNHW0iEe9OvOebXRsa9KWf0D
 GiUHnSeuUfdg//lULoY2/D3uYq3mBnWsnQkGMne/jaG63eaW0aryTe7WGBLmNkyZYk9sdS
 aJS96mkoferP0/Jr7s1eE7rsYSwJzm5jJWLQHrD+fjv2jk7lvXnOTpYJ15zvBA==
Date: Thu, 11 Feb 2021 11:11:06 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/4] clock: Add ClockPreUpdate callback event type
Message-ID: <20210211101106.t7y67bw4ecz4uk6a@sekoia-pc.home.lmichel.fr>
References: <20210209132040.5091-1-peter.maydell@linaro.org>
 <20210209132040.5091-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209132040.5091-3-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13:20 Tue 09 Feb     , Peter Maydell wrote:
> Add a new callback event type ClockPreUpdate, which is called on
> period changes before the period is updated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  docs/devel/clocks.rst | 9 ++++++++-
>  include/hw/clock.h    | 1 +
>  hw/core/clock.c       | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index cd344e3fe5d..f0391e76b4f 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -181,7 +181,14 @@ events.
>  
>  The events currently supported are:
>  
> - * ``ClockUpdate`` : called after the input clock's period has changed
> + * ``ClockPreUpdate`` : called when the input clock's period is about to
> +   update. This is useful if the device needs to do some action for
> +   which it needs to know the old value of the clock period. During
> +   this callback, Clock API functions like ``clock_get()`` or
> +   ``clock_ticks_to_ns()`` will use the old period.
> + * ``ClockUpdate`` : called after the input clock's period has changed.
> +   During this callback, Clock API functions like ``clock_ticks_to_ns()``
> +   will use the new period.
>  
>  Note that a clock only has one callback: it is not possible to register
>  different functions for different events. You must register a single
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index 5c73b4e7ae9..d7a6673c29e 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -30,6 +30,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>   */
>  typedef enum ClockEvent {
>      ClockUpdate = 1, /* Clock period has just updated */
> +    ClockPreUpdate = 2, /* Clock period is about to update */
>  } ClockEvent;
>  
>  typedef void ClockCallback(void *opaque, ClockEvent event);
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index 71dc1f4de65..2c86091d8a3 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -80,6 +80,9 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
>  
>      QLIST_FOREACH(child, &clk->children, sibling) {
>          if (child->period != clk->period) {
> +            if (call_callbacks) {
> +                clock_call_callback(child, ClockPreUpdate);
> +            }
>              child->period = clk->period;
>              trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
>                                 CLOCK_PERIOD_TO_HZ(clk->period),
> -- 
> 2.20.1
> 

-- 

