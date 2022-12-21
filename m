Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE1652AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nTI-0000By-OI; Tue, 20 Dec 2022 20:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTH-0000Bp-QU
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:00:35 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nTG-00036j-7k
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:00:35 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so561196pjp.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 17:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyekTRW+97ltxUXOINXM2jx9fnDKNYTKA/E4fwTFN+Y=;
 b=o91XmJU8U1B+QMX/D6mOem543OTrZVUnlUuM3eN/vxfdgcaEuziETw+Qz1uE8zWzqI
 ir0tDE2YZfHOEqyDr2ku98ZQpwVH9liu84IpI0de6WiLnJzPhwuOUjCZWTi5xfW+fKEh
 1gVph+LJmhRvtR46wNNOTiA3nGv2WzFzZnos8Xd8cbtWBiJT76ft4MtNXF0AS0vdfpqU
 JU/lvgNTilAOMMPX8Z8VM0zHElKA3z96gmhn1bzxPX+4mbw83EfUo8Q/EmlYnKlhnFxp
 p2cGsz5NjHhTb+eKNPIqV9qozmYv4XqFA9OYKCQU9P+CFtLjVbX+0O77jOcG9EjRgJNb
 DfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WyekTRW+97ltxUXOINXM2jx9fnDKNYTKA/E4fwTFN+Y=;
 b=R4NebN5QJ/BfWrtb6UvOSDswPGWqWxRVl9jJoYgrhcDoSo/lpwofBNC3YshX5CzIWE
 Km4jursiI8+D2GcGlPAZGqDprdDa4gUuX/OJYa7V/5dsbQWIjExKOqFusPtzYcPTDHkY
 AjseGQtiqUAwbpCXSSNbHEFyErE3tEhf2kCoxUXLDJpxZm7D0M3v7s69Yw4cklIrjXBk
 EOq56wtF08XtpPw8wNxL+ObQIrBtTXevZ3F6lex7rCT6nBU6P1qI0rJPhvGtnRwAlZZv
 1l/DxptU8zwwtoiONY6WM/uXfdDk4xtvGNAfAQr2VYJAF1Jh5+IROYZPEPaWrg3Rfdht
 vXAg==
X-Gm-Message-State: AFqh2krS9sfIVTI7XRAT+wVk9MPUgah0PA8MrVmZ3dQ1FZ2hX9z+gs0f
 5FxUqDx68RjEK4W8TMXatsAKzQ==
X-Google-Smtp-Source: AMrXdXtBCku6gtSpqLmtCyvDjqOaoY4DNC1U3uBvJ42E/63fVPl9fQ0AqzJAe5hx+yTnrXjNkbbTAw==
X-Received: by 2002:a17:902:c401:b0:189:ba1f:b168 with SMTP id
 k1-20020a170902c40100b00189ba1fb168mr176284plk.1.1671584432519; 
 Tue, 20 Dec 2022 17:00:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a656804000000b004792b557b1csm9013133pgt.87.2022.12.20.17.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 17:00:31 -0800 (PST)
Message-ID: <ca7c39b0-c3d1-2993-b1cc-b4550c674440@linaro.org>
Date: Tue, 20 Dec 2022 17:00:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] hw/input/tsc2xxx: Constify set_transform()'s
 MouseTransformInfo arg
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20221220142520.24094-1-philmd@linaro.org>
 <20221220142520.24094-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220142520.24094-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 12/20/22 06:25, Philippe Mathieu-Daudé wrote:
> The pointed MouseTransformInfo structure is accessed read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/input/tsc2005.c         | 2 +-
>   hw/input/tsc210x.c         | 3 +--
>   include/hw/input/tsc2xxx.h | 4 ++--
>   3 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

