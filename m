Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7C662D07
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEw8m-0005L0-HL; Mon, 09 Jan 2023 12:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEw8h-0005Er-6j
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:40:51 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEw8e-0006lO-SO
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:40:50 -0500
Received: by mail-pl1-x632.google.com with SMTP id d3so10284881plr.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXWhE1XisfJ6nzvcUpo2PoJy/dKFyeRVIIfvt8sSBUo=;
 b=H0Fx1w892mswWkJQWeCtqSKpC2Jjmo//J42Q5qL3EghCwA0UVswrXC6d8V6u7vj41x
 VB+kCHQ3UqyA8G9xUyVKMuoppqFOJCRVDC4x5j33u19j9Ilw1BEyUDlpVeOokpdsYDse
 N1Vzf1tlyq7yC+CjSKCHk0o4kz5Zm1nI2pOfj0W6RzRTzmhgQ8Swj56cKPc/vwAeRHGv
 YDlb5+4N+aZJU+tF7JBvRo36WGTWrZGq4kZavmir0RnFNZ+wAfN77o94OfT3Ssz2BR+i
 uEcEqXelwOTTv3QzdbkB41TKwM9FCwLyW7Ek/bNgXwf5JnqXz6o78jsG6isAaZGCbfh/
 97Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tXWhE1XisfJ6nzvcUpo2PoJy/dKFyeRVIIfvt8sSBUo=;
 b=ca9b+sO6rN0G2m+/m6HJjg7d4PELr4oEG91f0Lfrqwy15xdPET63vQ1fz//4JuaIKE
 jZV/T0209UcH2KKkRnG2Yj+9IPyylYbUhnqnRYeNjIBRHn3SKB2/qHLlXOx8lJaSOZMU
 7lpnHBchSw6EVxHwEPhu2jV1D2uKXuJzXizarOEbyZq/zdplsXW0wUX+IZAmgSXD9a6c
 8yTdwUfvxLghIcE7IGC5LBEOyw1dfbmQBiBE3MHB1pc0Cs851IcXus3IZbyaLXOfTWdc
 8cxPW28HgL+RUUM4jFjc38TIG8qRjTUV1DRHMNG9wekmLMXqAgVLfrGQolnFiqGXQMgH
 S+0A==
X-Gm-Message-State: AFqh2koNfWyFIlw5Os+V+SutrpgBwIhpsrOp7MsFWAeBsThOWpf4XWAr
 FoFegQYOMh5BBm3KB7sgHZaO0w==
X-Google-Smtp-Source: AMrXdXtCXYNkllAOylWpZHjHBO3a1Lko8lVEA2L70s4H/oa4b44BsRoriR2dh0GHC+iq8tXOgq3mtA==
X-Received: by 2002:a05:6a20:d39a:b0:b0:2b4f:a9d9 with SMTP id
 iq26-20020a056a20d39a00b000b02b4fa9d9mr90288754pzb.5.1673286047313; 
 Mon, 09 Jan 2023 09:40:47 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 17-20020a630211000000b0049f77341db3sm5511554pgc.42.2023.01.09.09.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:40:46 -0800 (PST)
Message-ID: <5bcc36c3-ec86-9cd3-f62f-f27392eca69f@linaro.org>
Date: Mon, 9 Jan 2023 09:40:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/13] hw/arm: Cleanups before pflash refactor
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
References: <20230109115316.2235-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 1/9/23 03:53, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (13):
>    hw/arm/pxa2xx: Simplify pxa255_init()
>    hw/arm/pxa2xx: Simplify pxa270_init()
>    hw/arm/collie: Use the IEC binary prefix definitions
>    hw/arm/collie: Simplify flash creation using for() loop
>    hw/arm/gumstix: Improve documentation
>    hw/arm/gumstix: Use the IEC binary prefix definitions
>    hw/arm/mainstone: Use the IEC binary prefix definitions
>    hw/arm/musicpal: Use the IEC binary prefix definitions
>    hw/arm/omap_sx1: Remove unused 'total_ram' definitions
>    hw/arm/omap_sx1: Use the IEC binary prefix definitions
>    hw/arm/z2: Use the IEC binary prefix definitions
>    hw/arm/vexpress: Remove dead code in vexpress_common_init()
>    hw/arm: Remove unreachable code calling pflash_cfi01_register()

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

