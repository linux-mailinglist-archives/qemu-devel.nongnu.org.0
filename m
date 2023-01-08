Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A934E6618F6
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 20:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEbmZ-0002p7-M8; Sun, 08 Jan 2023 14:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEbmX-0002ov-UU
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:56:37 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEbmW-0005O8-FX
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 14:56:37 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so5083689wms.2
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 11:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DTKv7aNoWjWbDuKruSf6qKEdZQDPkCHXul9lNNtBjQU=;
 b=rQHGCSTPm3yrI8p29teHS3iBYuRK6xwIim5ZeqkRyb5FmqIm8H6+5JfLoBgE7/uUjO
 hQBe6/9V1NKj2EJszku31kBaM9iBOWH1CyHA5AH2+nEMjUwt8gB53J9M/fUMB4S5PcLO
 7jsYMda2A7bZC5KA7xJvLedg4RCIVNrF+XbM4qThNiY35eLi7IRoHC8XNoNhOrviULq9
 AX+Yvcpleda6Oe4rhmvNwIGYd+MXApiht5WGbNX/15CTlE6ye3mV5nOLC+OCRbPCE1uk
 PTdQQngSvxfhvR9xm2hKHnTM+kW4fduV91CyAECh0glBjUq19tEQ5NxaorXAKU5gR+t0
 gQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DTKv7aNoWjWbDuKruSf6qKEdZQDPkCHXul9lNNtBjQU=;
 b=wtJ+6idXxkdIZvtSxxOaPSKTH0ZWrJ7+OiaoDNVgJhlmVgsKAd6NHGPrBTrDHlNBRm
 Xo4E/IwCv44GVpU03mw7srZirhgkIXX3xHzSKBzdW0s4pyxysInR3VSn2UeJqHby6VQf
 FOjDQhprS/H1+oi37771CfDNmGDT0gh8DZSxGISu2xnF6NO6AJhm+xxV8/DdFZ8jG+vc
 41oZzqgE80xu7q6EBatA+Pr6MFbLtTGCZRbqn1402xR6wl+MUIa6+LpdertVM8iypVnr
 yCtoNJODNhNpqAVjhxIxUnMEoqNtgWHp0vtQxTgsaTaRcijPo/oxOpPyDcfQmgCjkTbH
 qQsA==
X-Gm-Message-State: AFqh2kqj7DqEI08V0YDrn1TkEEIXY4rCN023lAZouO+kDcbKpza2+cmy
 QKXpQWkt27dpfCCyzN/V9P2vdQ==
X-Google-Smtp-Source: AMrXdXtzO0JyDyrOcGENKhVGP32SDbn7DaRMfENBnScPmDLQh0AyaOHXTMVqzaVBWw+Ka+k6MHcSdw==
X-Received: by 2002:a05:600c:4f83:b0:3d2:3f55:f73f with SMTP id
 n3-20020a05600c4f8300b003d23f55f73fmr44925224wmq.8.1673207794836; 
 Sun, 08 Jan 2023 11:56:34 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003d1f3e9df3csm14559951wmo.7.2023.01.08.11.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 11:56:34 -0800 (PST)
Message-ID: <18825832-4c4d-825d-efc9-b541a5db5037@linaro.org>
Date: Sun, 8 Jan 2023 20:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] translator: always pair plugin_gen_insn_{start, end}
 calls
Content-Language: en-US
To: Emilio Cota <cota@braap.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20230108164731.61469-1-cota@braap.org>
 <20230108164731.61469-3-cota@braap.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108164731.61469-3-cota@braap.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/1/23 17:47, Emilio Cota wrote:
> Related: #1381
> 
> Signed-off-by: Emilio Cota <cota@braap.org>
> ---
>   accel/tcg/translator.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


