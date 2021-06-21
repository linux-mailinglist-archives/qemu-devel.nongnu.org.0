Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FF3AEBB5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:49:28 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLEt-0002cc-Bg
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvLBr-0001Bg-8b
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:46:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvLBo-0004h2-5N
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624286775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjzwAQR3QhfiuyGQYHx9/E8UnK615zQ7Zv7VeolZiNY=;
 b=W4SBjAJPStlCEeyCD8yyAwpOHWh73hDW6z0zESpGzJoWcYHJBnmqTc91UUHyTXbcgbLBWM
 x8mbgVVyNUH/K5OBH2eyzO0c7ZSXMqxaxFSI0a8TK+BBZ3hxA1boyEKbIiKmvo/Ntqz43z
 ApLs0OmEqhmizX8MTxDrVN0qXxXRMoY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-EZ3TQZR6N9-9gudmVjuzrw-1; Mon, 21 Jun 2021 10:46:08 -0400
X-MC-Unique: EZ3TQZR6N9-9gudmVjuzrw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020a0560001865b0290119bba6e1c7so8524997wri.20
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjzwAQR3QhfiuyGQYHx9/E8UnK615zQ7Zv7VeolZiNY=;
 b=Czbo6lFT6btl0sMMU8l9ljnmc5qebu7SvQ6nITBgVsw2A/iYjpMMD1jkfrzAcjVXjF
 Ko0zhwJVU0H0BThHN0ASdlkSomh2ySQIwct10AkYG8sevtvz1HiwwBtLRYSGOX9r3HHU
 He0qtZ7V8syF9LYKWnzlGCxrNi5zZahu/UfI7eZVOiAh8WKrmyX8AcHTm0mFxNoePKI1
 8L4EuwdrxtYv7Day0+mwf8l+rXTFp4mNVWxeddDIAws/E4JF+SFUgs1PmC0sQ674mBkF
 cTV4ZbvuOj6SvNSninifNms1UXD6NA7Q41q65qfhWrTBLjXFU9euNcWcGRBONjBjAzvb
 Ox8Q==
X-Gm-Message-State: AOAM531XFOrDGVwSYJhdN5auUGA/3uIg+bBVwqT6D+kOtib09YGgOR/1
 aoHJU2m1sWhxOSJ5nM4im0WCqT5lgfgVImmTgf43smqJvbupnGvHJeyBQiNgNvHwtjcPUN0fPgo
 Dd12LqVi7ZV5wDHA=
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr28089983wmq.27.1624286767691; 
 Mon, 21 Jun 2021 07:46:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbNHtxjWhhB96nfLAZIxW/sJnFsm04q6Rjhk6Iikz3GINE4Z9zxPUGmtPimiWy/32CL1222A==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr28089965wmq.27.1624286767493; 
 Mon, 21 Jun 2021 07:46:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o203sm2604028wmo.36.2021.06.21.07.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:46:06 -0700 (PDT)
Subject: Re: [PATCH v2] mc146818rtc: Make PF independent of PIE
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210619193849.27889-1-thorpej@me.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b9e20dbc-fa5f-1e37-ad8a-5d433d77c4b0@redhat.com>
Date: Mon, 21 Jun 2021 16:46:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619193849.27889-1-thorpej@me.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/06/21 21:38, Jason Thorpe wrote:
> Make the PF flag behave like real hardware by always running the
> periodic timer without regard to the setting of the PIE bit, so
> that the PF will be set when the period expires even if an interrupt
> will not be raised.  This behavior is documented on page 16 of the
> MC146818A advance information datasheet.
> 
> Signed-off-by: Jason Thorpe <thorpej@me.com>

I agree that there's obviously a bug in QEMU.  However, I'm worried of 
two things with this patch.

First, the RTC device model has a complicated mechanism to deliver 
missed ticks of the periodic timer.  This is used with old versions of 
Windows which lose track of time if periodic timer interrupts are not 
delivered.  This mechanism (implemented by rtc_coalesced_timer) right 
now always triggers an interrupt.  You need to change 
periodic_timer_update to not activate this mechanism if PIE=0, by 
checking for PIE=1 at the

     if (s->lost_tick_policy == LOST_TICK_POLICY_SLEW)

conditional.

Second, the firmware could set a nonzero period, and this would cause 
continuous interruptions of the guest after the firmware stops, due to 
s->periodic_timer firing.  This is "optimized" by the bug that you are 
fixing.  To keep the optimization you could:

- do the timer_mod in periodic_timer_update only if !PF || (PIE && 
lost_tick_policy==SLEW)

- in cmos_ioport_read, if !timer_pending(s->periodic_timer) call

     periodic_timer_update(s, qemu_clock_get_ns(rtc_clock),
                           s->period, true);

to update s->next_periodic_time for the next tick and ensure PF will be set.

Thanks,

Paolo

> ---
>   hw/rtc/mc146818rtc.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 4fbafddb22..85abdfd9d1 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -155,9 +155,24 @@ static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>   {
>       int period_code;
>   
> -    if (!(s->cmos_data[RTC_REG_B] & REG_B_PIE)) {
> -        return 0;
> -     }
> +    /*
> +     * Quoting the data sheet "MC146818A Advance Information", 1984,
> +     * page 16:
> +     *
> +     * <quote>
> +     * PF - The periodic interrupt flag (PF) is a read-only bit which is
> +     * set to a "1" when a particular edge is detected on the selected tap
> +     * of the divider chain.  The RS3 to RS0 bits establish the periodic
> +     * rate.  PF is set to "1" independent of the state of the PIE bit.
> +     * PF initiates an ~IRQ signal and sets the IRQF bit when PIE is also
> +     * a "1".  The PF bit is cleared by a ~RESET or a software read of
> +     * Register C.
> +     * </quote>
> +     *
> +     * As such, we always run the timer irrespective if the state of
> +     * either bit so as to always set PF at regular intervals regardless
> +     * of when software reads it.
> +     */
>   
>       period_code = s->cmos_data[RTC_REG_A] & 0x0f;
>   
> 


