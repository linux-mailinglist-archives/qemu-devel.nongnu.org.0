Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128096983E3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMwb-0005VF-0q; Wed, 15 Feb 2023 13:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMwY-0005UC-C6
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:55:50 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSMwW-0007cG-MP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:55:50 -0500
Received: by mail-pf1-x433.google.com with SMTP id j184so8465719pfg.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DC2afEabX9ChDBXxsZPP3PTNUaUOdDflYrzEtp9BYEA=;
 b=J3KHbKq51ABP6W8f34Iyqx0l7GXtLnsKjTd7/Y03IGnqI5wc6aE/gr6GfvPoxQX34f
 VzuTcdW+9EpLHNxRbo6TvHdIE6/UrseGxa2bRUr1FMlcnp+G5yWKOY8npJq1bSb14pgD
 5+q1OKtJfFui/IhIwPmu+qaXv+YnKOdzVdGx3C+Wv78cD3L2dLXlSzt7Ve/H4YLmPnMk
 Poe+Qp44ezFlZ+ODXHZ/MCTcEPBmYS0xKLP236MS+GvCDOTkLdNRIcHrpywEZdngzuYs
 hfU7Bwi0gRwPQMjMWvZuqL1vJAg6aAo7Z9f/ErVTIPt/I+wtsd/frNVRXdw160h7EVO4
 pC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DC2afEabX9ChDBXxsZPP3PTNUaUOdDflYrzEtp9BYEA=;
 b=pBNE62cJIPoZAzXoYMxzugczRxp80Vf0ATXfm9K4LcMau4RiS6UIJni4rSCuClKw5L
 eDezQTMkq0NOJFy/xUJmzaNNuuaOleRMjHC7psy/fxnwFW/TWm06XZ4F+N0775Fyp3N0
 4Xs1ZdaUJg4csvb7EU0bhQQfYa0RtJA3Bz9p/EY4e4xuRNODCI0VG4uSsIOUsPkcRXEL
 U9muFMJ1C9Tqlkm+BlnthMw9d2n8dkqJ3A8RbyxFjbnBpQYEstK9pQJsSnahuTJSfjkG
 DTTrZESWp4uGgxjimLG/ySDvHgOPDd7SkyzruQPhuZ0CLzBLgUvfntYS/Mqp/mM4f5mX
 Kc1Q==
X-Gm-Message-State: AO0yUKVg5G0oO4JRicDaH6iRxX5xXVbrXn88JNchtegFuUrqMSvPZcrd
 r+9N+TclEYMWlqP/oO0eCxhNrw==
X-Google-Smtp-Source: AK7set8gO0VmUQfx84hyD5ePnXnK8QU+jpjykYBrNvmI6TId3beE6c1E61QlRDyP+JqIPfKYKCxEmg==
X-Received: by 2002:a62:1c51:0:b0:5a8:b4a5:bf98 with SMTP id
 c78-20020a621c51000000b005a8b4a5bf98mr2793435pfc.3.1676487346832; 
 Wed, 15 Feb 2023 10:55:46 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 k14-20020aa790ce000000b0058bacd6c4e8sm12001732pfk.207.2023.02.15.10.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:55:46 -0800 (PST)
Message-ID: <8665b6e1-d962-c9d6-76e1-0967974c370e@linaro.org>
Date: Wed, 15 Feb 2023 08:55:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] hw/timer/hpet: Include missing 'hw/qdev-properties.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230215174353.37097-1-philmd@linaro.org>
 <20230215174353.37097-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215174353.37097-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/15/23 07:43, Philippe Mathieu-Daudé wrote:
> Avoid when refactoring unrelated headers:
> 
>    hw/timer/hpet.c:776:39: error: array has incomplete element type 'Property' (aka 'struct Property')
>    static Property hpet_device_properties[] = {
>                                          ^
>    hw/timer/hpet.c:777:5: error: implicit declaration of function 'DEFINE_PROP_UINT8' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>        DEFINE_PROP_UINT8("timers", HPETState, num_timers, HPET_MIN_TIMERS),
>        ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/timer/hpet.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 9520471be2..214d6a0501 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -30,6 +30,7 @@
>   #include "qapi/error.h"
>   #include "qemu/error-report.h"
>   #include "qemu/timer.h"
> +#include "hw/qdev-properties.h"
>   #include "hw/timer/hpet.h"
>   #include "hw/sysbus.h"
>   #include "hw/rtc/mc146818rtc.h"

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

