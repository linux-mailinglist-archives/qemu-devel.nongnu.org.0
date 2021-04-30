Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D636F496
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 05:42:09 +0200 (CEST)
Received: from localhost ([::1]:33170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcK2a-0004yp-SZ
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 23:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcK1P-0004ST-0H
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:40:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcK1N-0007yT-28
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 23:40:54 -0400
Received: by mail-pf1-x432.google.com with SMTP id m11so4396461pfc.11
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 20:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2YT9Mw0yd9vdTaWdJEUxhNeIQ3mp7q5hJpeEb73lAA=;
 b=dJ6cHfnUsI4/7TTqCUo5AWLlsQhK9eneuLIHJjjJVh1W92VIC59GWYR4U160JdAh96
 vURQLaglp3YvQ5lxVT6zI619yzFbAguMSpvlftc1/GkTGLNRdap1xzly0MOEx2pPDUX3
 zZd0RU4jSBm0hHYq0ewlYKiWH4cuLDjT6ltiKEdQq8FaqfA1ISQgeVR3YxzSxDupa2oR
 qVuxfBmy3hmE01QpEZdEygwpFHPhQzecsZcjKMtctBJTguqJ3e8gpm18DXBd/5V03avH
 tXVlDH6HDUxfgUgC9WK6BE/HgGVTnuYZ21SWjKlwrIWn3JKN8kVA+kWk0NBFM9VsIc3E
 nYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2YT9Mw0yd9vdTaWdJEUxhNeIQ3mp7q5hJpeEb73lAA=;
 b=ePkYJ8uk1GV5b+XIysG4JClDwuZUATJsAWMlt/ycc3yALXSB0KXl3zSmrIPYpcgxJD
 2iaBAxMY/TB4MqPQ5mrFncI3pbu6AYpH0AEZAPQOB1B7C1Y8Pkr2gpfM7Fr61oObZcq+
 Y3Y9xePAZWYe+9sZyjdHpBXw+xdUVxCCOWQFyDxOyFJl4yzHBKgQNYRUhw+zUjFgvPxB
 iFDKx0XkGZxE5U704xbb1CNtLfT8q16i1yk0CGBYC+eg5W+THR5QfPsFV+sNWD96MjxO
 Vdgd6bYpZTi15+X0evfIshGWGvISflyLUdbCCymiZ9ejYz2nKGSyu+X5UgAD5tNChuq/
 kU7w==
X-Gm-Message-State: AOAM533JMA1JBRgZvoAhadFyaxWqVRy6p1ZIeZrDfjeKk/U4n399bES+
 4FF1m3x4CBWprgqd84nAcz1h0Q==
X-Google-Smtp-Source: ABdhPJyivKAx2snKn901DO1VDRq1ylf3weBtokeKcn7LF57gFxb2IFMUeDWyhB9KM33Ss+ouERXNfg==
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr2712863pgr.73.1619754051263; 
 Thu, 29 Apr 2021 20:40:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id k11sm9169000pjq.47.2021.04.29.20.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 20:40:50 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] target/ppc: turned SPR R/W callbacks not static
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00258d05-3bb3-2ba3-07e5-19f766eded35@linaro.org>
Date: Thu, 29 Apr 2021 20:40:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:21 AM, Bruno Larsen (billionai) wrote:
> @@ -234,19 +235,19 @@ static void spr_read_tbu(DisasContext *ctx, int gprn, int sprn)
>   }
>   
>   ATTRIBUTE_UNUSED
> -static void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
> +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn)
>   {

You can drop the ATTRIBUTE_UNUSED at the same time.

It was only there to stop the static symbol from being signaled as unused; for 
a non-static symbol, the compiler obviously can't tell.

> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> new file mode 100644
> index 0000000000..b573a23e7b
> --- /dev/null
> +++ b/target/ppc/spr_tcg.h
> @@ -0,0 +1,121 @@
> +#ifndef SPR_TCG_H
> +#define SPR_TCG_H
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/translator.h"
> +#include "tcg/tcg.h"

All new files get copyright headers.  No headers include osdep.h.  It doesn't 
appear that you need any headers for this file; just add

typedef struct DisasContext DisasContext;

to the top of the file.


r~

