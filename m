Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425957274E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:32:51 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMYs-0002GC-2c
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUW-0004ul-EB
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:21 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUU-0004pE-9p
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id l42so5304143wms.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUXgOi7xhWLDj74V3dLbpwpaZVWbhOgOdX9pj8pkZAk=;
 b=G5XIeau26FBDiG3V/iO90qO7GJ/m5TGxYxZBkhBIsBzTRlOpUq0Mgc9+nyufDObxDD
 ZeNn6GZrWB+AZ8XiPbs2OfV7NyFopI6S6TseTCiV/P2O1pEDsvOW3LRKcRqTZ/jTYbdN
 gME/0RDAiWqLO1RkdOZrPDpoitAwMPNEtevut9ZBeyL+iLeAp8kCrFZe0kTI97bqBScP
 91NWraur0cxCEY9GNSZP4PXi/lBqXVyUsBYa14MKOIXrJ7oeKZzWPB7J8IuNMEKEkpuP
 2Um7gtlmm13pE0gPuT4DQ9cZ9lF/9O2hj3QLGBMpm1YI4G58ePRObq180hARr4jEu5dr
 o04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KUXgOi7xhWLDj74V3dLbpwpaZVWbhOgOdX9pj8pkZAk=;
 b=ARApZuWVAROpPQa+swlI0oNr1tFVJxLgjI2alBYi9ZZCHZyrOv1QwUzorEiRbAtvPH
 1H/bk7pfg/xvGXkx6RGSJOjyM7lpgO8KNibox4zDA4lc9Bh6oBq/HaVdN+DsXmOsS3Am
 Dg4wep9C8W7Om7cAdxSYTZCfwVrPga+/R0GnTUpPPOyIpKz7g5W15P23UpPdd+bUogGT
 eTeJsvsxlnLpppjmDfhhbjOXl4Mmbvfipv5jE10nAqjaJr5KZBflRu9Fdb1TgAATDgv8
 S9gjRX1GMERLNeS7hKm+gkFbZgyKH0vsIspWgpgPtUIfDgw0wtukeS76zXTrtpVyV8Ed
 9ukA==
X-Gm-Message-State: AJIora/4Bz+ia57NbCBcMr5KC3RO7bDepzUifo3Q0ow8k/cD9c1QVAxW
 jRFn6CJM2AIn1pCwXdnMzLo=
X-Google-Smtp-Source: AGRyM1tTodoxn30fp3byd7TI4HeCrYrzifMXfaFm5E77F0BCuITT/fuJWNFUq1nOiK/ht17h1jOLDA==
X-Received: by 2002:a1c:ed04:0:b0:3a2:b7d7:2843 with SMTP id
 l4-20020a1ced04000000b003a2b7d72843mr5906754wmh.43.1657657696751; 
 Tue, 12 Jul 2022 13:28:16 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d6604000000b0021d650e4df4sm9017448wru.87.2022.07.12.13.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:16 -0700 (PDT)
Message-ID: <54df7007-6b84-dfeb-950a-55f798d660e3@amsat.org>
Date: Mon, 11 Jul 2022 18:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/9] tests/style: check for mixups of bool constants
 with int variables
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-4-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-4-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/7/22 18:37, Daniel P. Berrangé wrote:
> The 'true' and 'false' constants should only ever be used with the
> 'bool' type, never 'int'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/style.yml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/style.yml b/tests/style.yml
> index b4e7c6111f..704227d8e9 100644
> --- a/tests/style.yml
> +++ b/tests/style.yml
> @@ -86,3 +86,8 @@
>   #        A match added to the front of the regex. Useful when
>   #        'terms' is a list of strings and a common prefix is
>   #        desired
> +
> +int_assign_bool:
> +  files: \.c$

Why not check .c.inc and .h (for static inlined func)?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +  prohibit: \<int\>.*= *(true|false)\b
> +  message: use bool type for boolean values

