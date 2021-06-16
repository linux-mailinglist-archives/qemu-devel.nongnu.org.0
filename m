Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B2F3AA3BF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:03:50 +0200 (CEST)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltapI-0002lH-Hr
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaoP-0001jU-3u
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:02:53 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaoN-0000If-5h
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:02:52 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e33so2778299pgm.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s4TOvHX318f9h9ao1O6xP4xdg33Xz6ackDWY+LYz5uc=;
 b=sEPTjN5wbWpqvY7aOJ5Yd/R+MggeSokJ3BySK+2HOLGKBomqa5MEWjBvAz/GpZr3k5
 LOX+aQ8Fi6UvGIkFR5cMjSFQ8UWoCBivTydxGsy+CO/vZE2gE8rGU7VjN7AFcOqfBvgp
 X8FVTNzMWtF/qEWzTITQwp+ShUHq5xjSHXIfdpo8dinAchQgig4Lz5xzc9JbmA+T1CVe
 f5pGuJsBO8aaKNcFdvee2w9cFKBBZlu/+Ta3xedWIHOzjiIYR19J722UtaS2EpQd9L74
 yRrOcsYTV1I2VWeNbRpfr26w2GJFNGJlbw1jwPwcTju5uLb2fPmOXlMp9jokuN89ABRO
 MC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s4TOvHX318f9h9ao1O6xP4xdg33Xz6ackDWY+LYz5uc=;
 b=AIqUivyXtW6SuE/310coXJWAtBJ2MH+C3Meb1p4zs7Yd/J093GUFdB3CUDlotcV6Ls
 PVL8YES7BoClZ6rc24CdOCZXdNzLCtkBOG6cGq8En9H1q6bVrmADB83GrWC7jHdUZFsR
 vLbjRQfRnnNAOhyLVl7DB+Uo5Nqfn9qFwFghv6SZTjLMer19IzOYiTjN7T9PnIiJlUc1
 9h4rAfTdKEffcDZCvvrPnbfKkZyqVf/NSz29gPcGfv/DEfb2SwYzEZm7bU32HwXHvOXg
 7IRb3yXVqLZ/ILbh7oIacYAK0ptZwIcjU+BcyxFCC4DLRMKCHZOv1Qr+BDjipg8E85yt
 UKhA==
X-Gm-Message-State: AOAM533brBabynpWkIwIBKLYCJRu2diT22VByjmWPU9I+23sELSeDhvc
 4Nxtd6Rzb4OKuKHsLNNopkVsEA==
X-Google-Smtp-Source: ABdhPJzQn1f18OKRfvma8kw6tNXwt0Te7Jw8OVKXSuE12AEggU67acQcL8j1vylm8+liSXr+WM/oAQ==
X-Received: by 2002:a63:195b:: with SMTP id 27mr1096287pgz.450.1623870169455; 
 Wed, 16 Jun 2021 12:02:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y15sm2870715pji.47.2021.06.16.12.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:02:49 -0700 (PDT)
Subject: Re: [PATCH v3 13/13] hw/i2c: Make i2c_start_transfer() direction
 argument a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-14-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31490775-a16e-1e4e-a180-d3c473cc87be@linaro.org>
Date: Wed, 16 Jun 2021 12:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> From: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Make the argument representing the direction of the transfer a
> boolean type.
> Rename the boolean argument as 'is_recv' to match i2c_recv_send().
> Document the function prototype.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Message-Id: <20200621145235.9E241745712@zero.eik.bme.hu>
> [PMD: Split patch, added docstring]
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/i2c/i2c.h | 11 ++++++++++-
>   hw/i2c/core.c        |  4 ++--
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 2adf521b271..5fe94c62c00 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,7 +80,16 @@ struct I2CBus {
>   
>   I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
>   int i2c_bus_busy(I2CBus *bus);
> -int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv);
> +/**
> + * i2c_start_transfer: start a transfer on an I2C bus.
> + *
> + * @bus: #I2CBus to be used
> + * @address: address of the slave
> + * @is_recv: indicates the transfer direction
> + *
> + * Returns: 0 on success, -1 on error
> + */
> +int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv);
>   void i2c_end_transfer(I2CBus *bus);
>   void i2c_nack(I2CBus *bus);
>   int i2c_send(I2CBus *bus, uint8_t data);
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 6af24c9e797..6639ca8c2e0 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -115,7 +115,7 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>    * without releasing the bus.  If that fails, the bus is still
>    * in a transaction.
>    */
> -int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
> +int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>   {
>       I2CSlaveClass *sc;
>       I2CNode *node;
> @@ -157,7 +157,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, int recv)
>   
>           if (sc->event) {
>               trace_i2c_event("start", s->address);
> -            rv = sc->event(s, recv ? I2C_START_RECV : I2C_START_SEND);
> +            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I did wonder about passing in the I2C_START_{RECV,SEND} enum directly, as that 
auto-documents the sense of the argument.  But there are quite a few instances remaining 
which would need updating.

Perhaps one more patch would be nice: introduce i2c_start_{send,recv} as inline wrappers?


r~

