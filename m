Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDBB3F5C26
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:30:22 +0200 (CEST)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIThF-0002hx-Ir
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITfY-0001XT-TF; Tue, 24 Aug 2021 06:28:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITfX-0005WZ-77; Tue, 24 Aug 2021 06:28:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v10so19294021wrd.4;
 Tue, 24 Aug 2021 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8KRoHArEDY3lh9bzd9PPDNoSkRo8LfN+Wb/23xVk9hM=;
 b=OIt2Qz2nSbQtdUzC1RyiFWQwXwSLEetVNnru1369z3b9701mVVhqv9Z3yY3XUV7vyi
 bl4vHcE3aeGmfxr9XTzQRaTsAO7N2xCwDWuWiyjU9vI3zfe0lyc+th/rnc/bMGql6Ehk
 6vId0/xUNPkrS8fPuRVgEnBlFqn64ZIz5gWdXCRPm63+JXE/YdQJD9ULBt8fEMvY24vA
 q9cdh7ajcdCw9LyoWSRYX/mOHHqPfbZhlRgghend0djnpCLuVD3HmHxYRNFALLQ6ERq6
 p3KQ2dtgQ/TrfVNgf4QywtCdn/cJGMop3VKcGZoOrACwuJ7zvM1neKSr7+296zGTlLFh
 B9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8KRoHArEDY3lh9bzd9PPDNoSkRo8LfN+Wb/23xVk9hM=;
 b=oV1E1y0oLaYTWmqbU2/uJqtFK7e/WdarkGXeG4TBeT/eKj+1oJwUr8Ntxeh6jV7uWn
 QTDZfMuYAKCMs9Isyjz7p2BLYnfi/Yj1V2F02ewrS6IgDzW1z7KTe0YYWGqvqF8+ltfP
 35dqiAHirfkNRiTWCwrsNiRc49QGr3G1Wikjgl6US+up6FjcVHvSxMN8qYZ2zbktEj55
 GqMpOSDgCIiaRfHcd06YdibCUv/vUHlsdOgGmHkNPGhcfgrAQlPwBikzA0DMNhvjVF5G
 cSVansh1eMgo7lZoriJTcuLl6sySbSn0aSchfapGXugwJI/E24dKLC7iqmoAZwNdyJaC
 z5KA==
X-Gm-Message-State: AOAM53343D0Nzsv8wUPCX+FRJHEsbfjIfpwn+iey/U2nEXvh7bmznI3r
 HPR837EX4xfaycD9XrjlFaRjjMAXdtA=
X-Google-Smtp-Source: ABdhPJx0ui1duQs3SXWdbnxICMlL5CkgB4HTAtdM11OUd7gO6kCLkithVHjpyrg4fMs9O2zzNL5nWQ==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr19013957wrq.204.1629800913174; 
 Tue, 24 Aug 2021 03:28:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n188sm1910066wmn.48.2021.08.24.03.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:28:32 -0700 (PDT)
Subject: Re: [RFC 09/10] hw/mos6522: Avoid using discrepant QEMU clock values
To: Finn Thain <fthain@linux-m68k.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <771801f0-3645-abed-4f18-18bf91c420ad@amsat.org>
Date: Tue, 24 Aug 2021 12:28:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <21f20ab5a100e4947d840080114f3f0511aade86.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:
> mos6522_read() and mos6522_write() may call various functions to determine
> timer irq state, timer counter value and QEMUTimer deadline. All called
> functions must use the same value for the present time.
> 
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  hw/misc/mos6522.c | 51 +++++++++++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 24 deletions(-)

> @@ -123,20 +123,19 @@ static int64_t get_next_irq_time(MOS6522State *s, MOS6522Timer *ti,
>      trace_mos6522_get_next_irq_time(ti->latch, d, next_time - d);
>      next_time = muldiv64(next_time, NANOSECONDS_PER_SECOND, ti->frequency) +
>                           ti->load_time;
> -
> -    if (next_time <= current_time) {
> -        next_time = current_time + 1;
> -    }

Maybe extract as an helper? Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      return next_time;
>  }
>  
>  static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
> -                                 int64_t current_time)
> +                                  int64_t now)
>  {
>      if (!ti->timer) {
>          return;
>      }
> -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> +    if (ti->next_irq_time <= now) {
> +        ti->next_irq_time = now + 1;
> +    }
>      if ((s->ier & T1_INT) == 0 ||
>          ((s->acr & T1MODE) == T1MODE_ONESHOT && ti->oneshot_fired)) {
>          timer_del(ti->timer);
> @@ -146,12 +145,15 @@ static void mos6522_timer1_update(MOS6522State *s, MOS6522Timer *ti,
>  }
>  
>  static void mos6522_timer2_update(MOS6522State *s, MOS6522Timer *ti,
> -                                 int64_t current_time)
> +                                  int64_t now)
>  {
>      if (!ti->timer) {
>          return;
>      }
> -    ti->next_irq_time = get_next_irq_time(s, ti, current_time);
> +    ti->next_irq_time = get_next_irq_time(s, ti, now);
> +    if (ti->next_irq_time <= now) {
> +        ti->next_irq_time = now + 1;
> +    }

