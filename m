Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D7232019E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:14:23 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEyc-0002b4-3V
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDExg-0002By-Dv
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:13:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDExe-0004Hh-P6
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 18:13:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id s11so12545510edd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 15:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ob1eIeD2Yl2XUsaY2RAYEWVoQv1DeuM57oGpuw4u1Z0=;
 b=WhW8WzkfXOX0bFjs0po8ro9AVmBlK0vJmbKAc0urcpeHc0aczjkvC5aWOny/KdpQY2
 crIX2uFlP0Y4sII6hJhkRWW5GpXrP5o5XFaXNlouMqa1NKhNcSNugWuYeu6EFvjQpN5p
 WGQARwacVwxdTEkm6qjw/kYlF7HsEmibkF+FMyYekcoh0AW8A6BHUmgmgfcVHDrA05lI
 XenZih7KkKldpU5RYEWCqulBIlcbVirAnlJZ7SwOOb6lM0vyx5+8Z4HL4IN4HR3Uyh49
 rfjzRimwr4JQ3J9Y+qMdg6JR1Q2fURfTJQr99ET7Cj07p+JBGpY5Uom7Lnw/ZNQtWWBD
 yUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ob1eIeD2Yl2XUsaY2RAYEWVoQv1DeuM57oGpuw4u1Z0=;
 b=CI0eUp/tRLBwruUpMNhaD3nvFgc/K6fVF8M+9B6lJD7IfMjSVI7IC4dHgOsDhw9NYN
 MCo4Fbwv6wG5o8XYoNGbK5WjSeN7X8jF8tbyLWKdfxsszq8PlLUq5S81ks1jomh7AUv9
 B6JkfN693CqFPRUbP2qiaWhWvdlsJFj3s9exZSTcu6dfkv7YIeD7lQUY0FRzugFewEuY
 iwdsQCZXt2KHyqv54UbGPX4pBNlR+O1surVBs2Z3tZTZ88Ksfrbh43drGNB1nfCE/+7W
 zUXmmFxuxYovQwWil0ql9G+/aJMJxNF8jyM4Tw5mLSwlGtr+XnVl8fJEC6p3JgkFUAjf
 oMcw==
X-Gm-Message-State: AOAM531pYRKA7MkIUY5qN88FtK6WFu1MDPP+FVYQv9D9lg4Lx9pvWCJb
 p0RjLx0ewoz89b1lT43CAMQ=
X-Google-Smtp-Source: ABdhPJzEFA+1gTCdAQCmje+OaxgX6nELoxM9HyY6qSOFv7bTySxYvkB0hIUK9Q+VYBe5RM5LthS9Gw==
X-Received: by 2002:a50:bc15:: with SMTP id j21mr11455771edh.187.1613776401123; 
 Fri, 19 Feb 2021 15:13:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bn2sm5437318ejb.35.2021.02.19.15.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:13:20 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/timer/renesas_tmr: Fix use of uninitialized data
 in read_tcnt()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210219223241.16344-1-peter.maydell@linaro.org>
 <20210219223241.16344-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <426ce624-9bbf-d76b-e25b-53ebbabb5630@amsat.org>
Date: Sat, 20 Feb 2021 00:13:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219223241.16344-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 11:32 PM, Peter Maydell wrote:
> The read_tcnt() function calculates the TCNT register values for the
> two channels of the timer module; it sets these up in the local
> tcnt[] array, and eventually returns either one or both of them,
> depending on whether the access is 8 or 16 bits.  However, not all of
> the code paths through this function set both elements of this array:
> if the guest has programmed the TCCR.CSS register fields to values
> which are either documented as not to be used or which QEMU does not
> implement, then the function will return uninitialized data.  (This
> was spotted by Coverity.)
> 
> Add the missing CSS cases to this code, so that we return a
> consistent value instead of uninitialized data, and so the code
> structure indicates what's happening.
> 
> Fixes: CID 1429976
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/renesas_tmr.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index 22260aaaba5..eed39917fec 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -46,7 +46,9 @@ REG8(TCCR, 10)
>    FIELD(TCCR, CSS,   3, 2)
>    FIELD(TCCR, TMRIS, 7, 1)
>  
> +#define CSS_EXTERNAL  0x00
>  #define CSS_INTERNAL  0x01
> +#define CSS_INVALID   0x02
>  #define CSS_CASCADING 0x03
>  #define CCLR_A    0x01
>  #define CCLR_B    0x02
> @@ -130,13 +132,20 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
>      if (delta > 0) {
>          tmr->tick = now;
>  
> -        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CSS_INTERNAL) {
> +        switch (FIELD_EX8(tmr->tccr[1], TCCR, CSS)) {
> +        case CSS_INTERNAL:
>              /* timer1 count update */
>              elapsed = elapsed_time(tmr, 1, delta);
>              if (elapsed >= 0x100) {
>                  ovf = elapsed >> 8;
>              }
>              tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
> +            break;
> +        case CSS_INVALID: /* guest error to have set this */
> +        case CSS_EXTERNAL: /* QEMU doesn't implement these */
> +        case CSS_CASCADING:
> +            tcnt[1] = tmr->tcnt[1];
> +            break;
>          }
>          switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
>          case CSS_INTERNAL:
> @@ -144,9 +153,11 @@ static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
>              tcnt[0] = tmr->tcnt[0] + elapsed;
>              break;
>          case CSS_CASCADING:
> -            if (ovf > 0) {
> -                tcnt[0] = tmr->tcnt[0] + ovf;
> -            }
> +            tcnt[0] = tmr->tcnt[0] + ovf;
> +            break;
> +        case CSS_INVALID: /* guest error to have set this */
> +        case CSS_EXTERNAL: /* QEMU doesn't implement this */
> +            tcnt[0] = tmr->tcnt[0];
>              break;
>          }

Elegant nice fix :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

