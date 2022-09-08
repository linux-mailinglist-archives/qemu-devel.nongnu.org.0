Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF515B233C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 18:13:12 +0200 (CEST)
Received: from localhost ([::1]:34320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWK9O-0005ZZ-Ge
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 12:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWK0X-0001cK-9x
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:04:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWK0V-0004ei-LJ
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 12:04:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id t14so19622509wrx.8
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ziO1PICYkd1+iLcNleYLqlQdY8ukDlyMQPdjik2ny9E=;
 b=mHTOkcB6ttHQusRuGSwEF6x4+oFscGtsPx5bXl7Yu9TAd4XgFDaz/eaJsqcu4/ogwK
 4SEqiT0yIlyhqe1hC57/Lgw14HlKS60I9B8motFC5J7DS966coFK1hTinPYQpM4o8ZQl
 VO6vE2h2MuK9YM+V8XK+SnaMrn1NjonMp87nSjoDpP+PRij82v+Xxlqmrp0CAGIOKmln
 9/3bdIaKvu0CvptOFB0TBf9vR/FgojripKoysq5zUi9XYJ0AcKS7YlZNA7PWPQ6hCZ+s
 L7bRYeMqNPvqUUzDzlqS4v+lHjFtNaGnwEO2kRPha6qTS3owZyvwXee9mf/O5pxkw3os
 IgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ziO1PICYkd1+iLcNleYLqlQdY8ukDlyMQPdjik2ny9E=;
 b=v/tpjRYVOX8izAyQiATdGXlsCUP6j+XDxUqzT6uB+YKCVejXA1uCE3+oSJoUqFs/FN
 uZ9yuPwr1DtRrqjYXlJmm+TcoVBjQ38cOoJ7QLBpDFyhInLcB6BBUHW4cXvkBoSKy7Vq
 WCetVFvSAzLJI4pf8QroKAraOc1sDxbUD+Xl3gowD3AdUhz4gETa49fDcVe/uRwrBcr0
 3nfx15G6ZWnFedz+OxzmhjT3GQS/2Sg5Sx5q6KLJ99dD9khArI1p/xmk4p2cios2CNEg
 BG8Mpt0TSKSmdEbcxJD9j7s9GlNdPaJsgJjMOPUIRQmAtai/GYqXbYmDYEeUqUk7gJLr
 M6Jg==
X-Gm-Message-State: ACgBeo1FIqFgGcy0cA7ekxCuVtl5FiuPBIsO0iiLHrjDDsUs0NfJh2DC
 AVgagNM+f9CkrpWYk6aExIK6QA==
X-Google-Smtp-Source: AA6agR4cDiyoVvMPH7DKIWq/805RVEzj4yBVawQQzsFn/sIQbpQCnTQMeNti/g8fE2R8EcGmpNK2nA==
X-Received: by 2002:adf:f385:0:b0:228:dbf1:d731 with SMTP id
 m5-20020adff385000000b00228dbf1d731mr5351045wro.364.1662653037986; 
 Thu, 08 Sep 2022 09:03:57 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 bk16-20020a0560001d9000b002258235bda3sm21090233wrb.61.2022.09.08.09.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 09:03:56 -0700 (PDT)
Message-ID: <8ddd2d61-1d0c-4280-bc5d-4b265819ddb3@linaro.org>
Date: Thu, 8 Sep 2022 17:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] accel: abort if we fail to load the accelerator
 plugin
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-4-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220908145308.30282-4-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/22 15:53, Claudio Fontana wrote:
> if QEMU is configured with modules enabled, it is possible that the
> load of an accelerator module will fail.
> Abort in this case, relying on module_object_class_by_name to report
> the specific load error if any.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   accel/accel-softmmu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

