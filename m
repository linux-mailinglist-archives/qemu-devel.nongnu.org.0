Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE03E492C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 17:50:00 +0200 (CEST)
Received: from localhost ([::1]:36152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7XL-0006SU-7A
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 11:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7Vo-0005ZV-Uc; Mon, 09 Aug 2021 11:48:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD7Vn-00051I-FE; Mon, 09 Aug 2021 11:48:24 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h14so22049762wrx.10;
 Mon, 09 Aug 2021 08:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A80UFhLaEIL5T+HKUQPB+W+ONKgn6werpPn4PC1/494=;
 b=W1GowpzXjkXwL+Xac7AO3FWpYCtf6/NCSPQOXI/rYs9zoRobyrr9UkQQB20qiENiHJ
 Mcx/n5zJQ7Q5/+oGde/sqLUDByDC+bSRKCQeZhfhko4VITj9k7hqdO90OXOGecludM4g
 nXKFya2Z2CI3RbkvfSpOKD+OpGDypdHX7YFwRMzimbrKSMHLWgaxdSlBl12wzQJRd922
 zWGsFQq6SVvPyy6q2RKGIkRbKf9BbW2jSyZG5/e9hCmJyTa5yqa+HCnEpTGn3Jjh2EV6
 3RIosca6gvbgft1g+SzU13rr1kJMJV4GRWhF5f0Zd51Y5SxPMFuQzjnPftdlgShp3Tow
 0mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A80UFhLaEIL5T+HKUQPB+W+ONKgn6werpPn4PC1/494=;
 b=VPDerWxYV10PK+rRH6uP/4WmOEpThjxUFr+VXKfTQ4A3Qws7w3XCPCeDnG3fkPhYiC
 xr/nFUM/gaEWrXkeZP6bM4Z3acbYQXDBQX1bcUXCLTZbZMvobO4SyRO7pjb7KGkY1rkv
 VoJN1tz7fBLtb1Z+/Tb9Qu6sEjyZFZ5DbXq6ZGBYpkVcaPhFNd+yHjbLZ2ZZjbOmrTYE
 Pu0RYQ3Y4NSw55CQ7EtXBP9e4qR4qXxJf46Fc/YNaBQmIW3gKIEjFFdV+yvwWSMoezeF
 gqJNClgtVHxhn/EA5uGoGW1J1ehTEcMKjnx2udf/5PlLvwgVgjsAdpFweirBhwegFpls
 +fOg==
X-Gm-Message-State: AOAM532aISITzm+408u8KOAQs3qUOdg+AlPw8baJ+ThME/A96RKemMhS
 fupG7EIyL0D/EtAj26nsy3iQZEpi/kE=
X-Google-Smtp-Source: ABdhPJx1RDv+PNzLLa4/mI3F3AKw5VyJWp5E/pK2R4qHEMWEVyZH3ajdvODV4gAL21FIelQ/QiBw8w==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr24882741wrw.409.1628524101358; 
 Mon, 09 Aug 2021 08:48:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id l2sm7650185wme.28.2021.08.09.08.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 08:48:20 -0700 (PDT)
Subject: Re: [PATCH 03/10] watchdog: aspeed: Fix sequential control writes
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210809131556.686260-1-clg@kaod.org>
 <20210809131556.686260-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fe5aa2fd-70b1-ca61-ec08-131cc7ee4989@amsat.org>
Date: Mon, 9 Aug 2021 17:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131556.686260-4-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:15 PM, Cédric Le Goater wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
> 
> The logic in the handling for the control register required toggling the
> enable state for writes to stick. Rework the condition chain to allow
> sequential writes that do not update the enable state.
> 
> Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20210709053107.1829304-3-andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/watchdog/wdt_aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index faa3d35fdf21..69c37af9a6e9 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>          } else if (!enable && aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] = data;
>              timer_del(s->timer);
> +        } else {
> +            s->regs[WDT_CTRL] = data;
>          }

Alternatively easier to review:

           } else {
               if (!enable && aspeed_wdt_is_enabled(s)) {
                   timer_del(s->timer);
               }
               s->regs[WDT_CTRL] = data;
           }

>          break;
>      case WDT_RESET_WIDTH:
> 


