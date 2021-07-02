Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677CB3B9F76
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 13:05:40 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGzL-0001X9-F8
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 07:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGwS-00076w-GG; Fri, 02 Jul 2021 07:02:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGwQ-0006yo-Is; Fri, 02 Jul 2021 07:02:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id u8so11943989wrq.8;
 Fri, 02 Jul 2021 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3UpXLrUcUVHsR+PTTArmLpUrfX2es6cKF/X/Qy81ie0=;
 b=E3gTZ1e7VqKQXHUF6yOctkqOkQcV7RMxjKlfcTBQWPgVdcFv90yQ5BX2aRxPkczh6y
 c5ujGtd4vcElaHDzQlysiX6ObMb/vKKXsAKiPcYLpZ+GuTr7u7RZ2DZxHqyLrQOfnSyd
 yom6aj3/VTmPBxogkgiRTynD4fS3Q+qI/il3H9lpiiWNrfE+4Jzj3t2TXB/i94+qkAtU
 H7l3S1yO6Gs/ur1hml+cRyQsgx24cuObiPiTXki1RbWRcW00815WbTkVn6ES4shEqPjb
 i+6AJcp3esxSY81gOMSNiPKmkCz2aHDY4iegGb1negPs9wGWNrL+pG4m2Lc9zoQ2gb7s
 nkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3UpXLrUcUVHsR+PTTArmLpUrfX2es6cKF/X/Qy81ie0=;
 b=Yt0tqxub4KJTXMuLg8W3D8SA4Qch4TguR529hhExxgLrfNMH58xwZ+KrEr2ZTHxP0w
 OYP0JEXexSM3Ko8nxowZwxAjGvSb3t4nJ/Dn4/GmTaYTThg5EMf+mu1m/S0kAkkSrqSx
 f7Ux8UE8PTjyQgNLgQZbDPBssoRJNrANB+8u5PNkxPJzSpc4zP2iFFEZeZfEZmOH2dOb
 6T9WwEOVZ76sPVsdj7Ch80eiYZl4GgLTBVdfzAwiIz/jFaTAg5JRqBokBFqsmVCK8s9g
 KKbeFsBmHfQ0ArwJ1dNWmFrgGZSYHt5VkWFtpKi8NJq/rjH6HYX03ssf71jY8MXYW/qK
 975g==
X-Gm-Message-State: AOAM532YzfbbpF9uKUDy6wD6AoGRF+n7bMw/CrsgmRePnTBLTQoQyhSt
 7NiihFCEhCSFCf5EzCkwEsu1b/nHfaMZwNBI
X-Google-Smtp-Source: ABdhPJz/DI5gtnnHEft0Xv5PSbrk6I2jCUGu/I9fcy99jti6evI7WT2HHPhrjaIWHD/iwAjwYMRhzA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr5186479wri.10.1625223756741;
 Fri, 02 Jul 2021 04:02:36 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id m18sm2697657wmq.45.2021.07.02.04.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 04:02:36 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
Date: Fri, 2 Jul 2021 13:02:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Currently the pl061_read() and pl061_write() functions handle offsets
> using a combination of three if() statements and a switch().  Clean
> this up to use just a switch, using case ranges.
> 
> This requires that instead of catching accesses to the luminary-only
> registers on a stock PL061 via a check on s->rsvd_start we use
> an "is this luminary?" check in the cases for each luminary-only
> register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 81 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index a6ace88895d..0f5d12e6d5a 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -55,7 +55,6 @@ struct PL061State {
>      qemu_irq irq;
>      qemu_irq out[N_GPIOS];
>      const unsigned char *id;
> -    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
>  };
>  
>  static const VMStateDescription vmstate_pl061 = {
> @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
>  {
>      PL061State *s = (PL061State *)opaque;
>  
> -    if (offset < 0x400) {
> -        return s->data & (offset >> 2);
> -    }
> -    if (offset >= s->rsvd_start && offset <= 0xfcc) {
> -        goto err_out;
> -    }
> -    if (offset >= 0xfd0 && offset < 0x1000) {
> -        return s->id[(offset - 0xfd0) >> 2];
> -    }
>      switch (offset) {
> +    case 0x0 ... 0x3fc: /* Data */
> +        return s->data & (offset >> 2);

Don't we need to set pl061_ops.impl.min/max_access_size = 4
to keep the same logic?

