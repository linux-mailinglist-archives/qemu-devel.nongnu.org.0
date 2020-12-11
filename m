Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334422D76F2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:52:24 +0100 (CET)
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniqN-0001zw-7z
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:52:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kniox-00018S-Jp
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:50:55 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kniow-0005cI-1S
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:50:55 -0500
Received: by mail-ed1-x541.google.com with SMTP id c7so9412137edv.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n23/qEWjYZ9m8+7Gk684qb9sVlpmJhAeujubtbI3s84=;
 b=bR3ZCT6GFQyhXIAncFB7wco8QG99k/bY1zkMSXDuJ6BvgSJcoUM8Bij82Emh2Qoh/I
 X8kCZLDxBzH0E7qcC6e8Y5YUmAI3sGIqKZLpq65EYSCeM4utHuLcLpKi/G9KQuGVPne/
 dMEPcMaOgex5lvJbyf/ndUFMiMbtIhJLKbAIVExnaHphrBvB0Kbq1vl7mn7fJ3tLybmh
 4SiXWDdaknocrZi7klUtFhb8pPkS0AFhrUmA3l25HpDrvHZBVu+ZBFQZYGhX1Ycm6Jc/
 W1OKjjRfjlMF1WVwgf53Zjx4NPgLDDVOLsKjaWay8R1aPRNhBzDd3ut0wqciZ65efwk8
 X6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n23/qEWjYZ9m8+7Gk684qb9sVlpmJhAeujubtbI3s84=;
 b=PmbJO2z4nnk/MDJlYqdcLA+sHG+R7GTdtCTFR7f7dl0DjS78lL+B8sbXbwffMPWnIg
 r0JaOk9nvLMpb5gsJy09jXiWkiOM4JHJxmiuNkX1whEDn7YuvL186s9iveNWe6KUNp0Q
 8C/sidjSG5RkvzqqKwF6+xeADUfGkqy5qUO2HMqL0m6nYqKSWaq3JYxZlCMe1detX2At
 y4dtVFH+fNkEiqYxXMv06LShclE5yerbW6vtWQDQ//LXWEPTpYMBU7B4BXSnY82wPRP5
 dYlLHMl8zU2pn15Px1qrY/qkh2mBcZboj1qCiOmnDwWIz/qCvzXNETtVl5jG+tcDpMC7
 1mLw==
X-Gm-Message-State: AOAM532baRtjxaJ3hBw0srQK55VwPXonZRxpQuoZDq9jxXpNhpw4ToF0
 5LXNC/9g53xXKgw/9x5MdBA=
X-Google-Smtp-Source: ABdhPJymiB96OgzK8qrE65AQJh7O/o9WbBdPTxpX4XG0tscxa5zMoTORbjsOBpzQ7QOJgfbUFY1H9g==
X-Received: by 2002:a50:e60a:: with SMTP id y10mr11455030edm.157.1607694652770; 
 Fri, 11 Dec 2020 05:50:52 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k18sm7681445edx.18.2020.12.11.05.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 05:50:52 -0800 (PST)
Subject: Re: [PATCH 0/4] clock: Get rid of clock_get_ns()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a958bd8d-81fc-a134-18c4-f54b49f38fa6@amsat.org>
Date: Fri, 11 Dec 2020 14:50:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208181554.435-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 7:15 PM, Peter Maydell wrote:
> This patchseries makes some changes to the clock API:
>  * Remove clock_get_ns()
>  * Add clock_ticks_to_ns() to return number of nanoseconds
>    it will take the clock to tick N times
>  * clock_display_freq() to return prettily-formatted string
>    for showing humans the approximate clock frequency
> 
> This is based on discussions we had about these APIs a little while
> back.  The core driver here is that the clock objects internally
> store the period in units of 2^-32 ns, so both clock_get_ns() and
> clock_get_hz() are inherently returning a rounded-off result, which
> can be badly inaccurate for fast clocks or if you want to multiply it
> by a large tick count.
> 
> Ideally I'd like to get rid of clock_get_hz() as well, but
> that looks trickier than handling clock_get_ns().
> 
> Patch 4 borrows a lot of the concept from one of Philippe's that he
> sent out previously.

Thanks for tackling the clock_get_ns() part. I had some work in
progress I was procrastinating for after the release, but your
patches are much better documented :)

(I also started to get rid of clock_get_hz() but, as you figured,
this is not a trivial task).

> NB: tested with 'make check' and 'make check-acceptance' only.

I hit this issue while testing Huacai's MIPS Loongson3 virt machine
which sets the core freq at 1GHz IIRC. I still have the branch
so I'll test your series (or v2) during the week-end.

Regards,

Phil.

