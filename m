Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0CD440C5F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 01:49:09 +0200 (CEST)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgy5z-00080T-TB
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 19:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy2U-0006Ie-CR
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:45:30 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy2S-0006qK-H0
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:45:30 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x66so12797344pfx.13
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4HSzZgkJyeqEQJXA8TwYUfUmKF6/XkNBatKQTythjj0=;
 b=KgpgD0nRYcL1pRN/ltlhvSH3llB1dBAj9EIB4QfyL1PpshOEl0DHn1+0qm02RQpJjK
 JOCDlz6/FKi3v5nSJWpzPNwid7VN+65W2AZ2kN8bZRxr+Z/pcx8MPg4GNdivDE6MmF6u
 ae2WrijsSynu86EHr/7kEJyO9/l5do+Q6g1o+NsaejaI6IWgANPHXDG4NYc4yQfjmCPP
 ST6eUCFF74aBRa+rjOX/N/VOUR3m+R5ywb1T6D5FMPdfhew7R/0Hc5m4wkKTX4MLeXjb
 0lOm9jLjuKL3ASDPkNiim/8SLGFK5jhrhaN/qCkqlmoFYT4/XrmyKi3tYLSOFii72PbM
 efBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4HSzZgkJyeqEQJXA8TwYUfUmKF6/XkNBatKQTythjj0=;
 b=yWpP1y5V7eE/YJGK+WXu2IZSoQKowStqtrGFVF46CoY72Can88Ji0jR5E4zOZbJA+Q
 Q9Z977QFg0ujbpT/KD7/nYkjdyyPNa1eNbGVgYM/trUcazvsuGOLCLeSoF2DaeaXd8yt
 Bn8bAmhXG/6EdvHKoYsK7uc5TPVtgfnpnq4NuCluV0S1JH/nXnfeTPqBqmIRylphEl9q
 5pVPduJyD/8261pXOCIasyWzxL7Rx9ppZwfUOOVAtuymINmONqTINtfk+B2PU67qNkD+
 BtyaEkutJXeXhBI0F0Uf2QAmObDODDFh24boeF5Q5iWkfQtJ4LzEhEOwdfl+qUAZhi4C
 0NpA==
X-Gm-Message-State: AOAM532CRHVIDDCZxV8TEw0WA+Q/A2GrbWj8NRwWY2exa3/Kx5cgQH1D
 gJNN2FHvv7m2c3ePcJK3mt1kjg==
X-Google-Smtp-Source: ABdhPJwNuqKeP07k311aKTeKe0eUqp6lp8S0gN+HPv/P6TdCe8sEc5JtL9/YQjPiTaky4rvdPCe/fg==
X-Received: by 2002:a05:6a00:2345:b0:47c:aea:7c01 with SMTP id
 j5-20020a056a00234500b0047c0aea7c01mr19782714pfj.68.1635637526879; 
 Sat, 30 Oct 2021 16:45:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e8sm842842pgn.46.2021.10.30.16.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:45:26 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] target/arm: Introduce store_cpu_field_constant()
 helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
 <20211029231834.2476117-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <737671dd-1db3-1d4d-4ba5-6c25684087ae@linaro.org>
Date: Sat, 30 Oct 2021 16:45:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 4:18 PM, Philippe Mathieu-Daudé wrote:
> Similarly to the store_cpu_field() helper which takes a TCG
> temporary, store its value to the CPUState, introduce the
> store_cpu_field_constant() helper which store a constant to
> CPUState (without using any TCG temporary).
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate-a32.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

