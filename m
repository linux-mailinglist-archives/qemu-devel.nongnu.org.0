Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220469D39A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:00:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBO4-0006ag-KR; Mon, 20 Feb 2023 13:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBO2-0006a3-2m
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:59:42 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBO0-0007gL-Gy
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:59:41 -0500
Received: by mail-pf1-x42a.google.com with SMTP id f11so1121630pfe.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XeXAMC5pzMeV4MhHdndOM+Pp8+I+JphiJ6jaQ7rsluU=;
 b=B7cSFqnPp+VKiw9fAw8ktqr+/0IcJOgPYlFn1PpYVd53wvaYfrOytZAmjTSQikvir9
 9AXfeFjfs5cwTYSMrvGEzzxEEF3bR8PBVoQ0oDb4YdkPk1lbdefubt9EzEY7kzA2e2W7
 R4Lc9BUIPlfrUulk6SxbS58SyGiK5rEZ46vd71NO1D5PEf9bl+AfZyJ5c1R4MFjirB5H
 x/oGJjfs04A4yYgOkv+cuXy9ycgrJyzmlQ0XIN+HGKhMp+Rl2xuUIUX8dmbH+rcKKoco
 PU/WVZkFeHKo874QqEpVwWFYavgJgouBjKdcc7d3HIGq1CWH+OAmbPi9L6+wGIzZFQ0t
 dc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeXAMC5pzMeV4MhHdndOM+Pp8+I+JphiJ6jaQ7rsluU=;
 b=ui2dMSH6rvuXp/nL14HnVAxwEmujiw+g5lYKjymGEfsyxhzCAaYImCsSBR0YJIXcIc
 MC5QSVgNm1w/aJc/dkeRrNFffDZBNoB4uGTV4VH9GoKMZSqDr+twIyassyymKeBLYDc4
 8vFoYf4+kQiNrTq179xGRxHUyOlJ6GrCk6CY5kiupXM9rBWatVM6J9IAh56RAffZ5ark
 Tr61HchjOjB3phrd+7YpK9u5tGziW5COdG8aqqMUSlcKDJ5+Te9aCRaIWy44oU/SD37l
 XBldO8ZW5TLIVqUe2Yt4vgYoknSq38ymT/7oPYTpeOTanUgW+66xXLxhdsPIXNB5Tdva
 EIsQ==
X-Gm-Message-State: AO0yUKWfgIrdTpakn9zvmn1FFrI1WxFYF8KTjFk8zN+fJ7JQkxARkDNU
 c98A6U/ptlWa1i1MuYhpZtzszw==
X-Google-Smtp-Source: AK7set/HOSHE2738hrHYyc+ntcg5iBHhhmvV9WTO+7ot3/J3L8+qZ+ZVJwjEXWHTZPE4JAFgl+/Vdg==
X-Received: by 2002:aa7:99c9:0:b0:5a8:b419:9a51 with SMTP id
 v9-20020aa799c9000000b005a8b4199a51mr1880935pfi.26.1676919578854; 
 Mon, 20 Feb 2023 10:59:38 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 k7-20020aa792c7000000b0058d92d6e4ddsm1047629pfa.5.2023.02.20.10.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 10:59:38 -0800 (PST)
Message-ID: <ca68a6b0-3271-677a-596a-b9a05392c514@linaro.org>
Date: Mon, 20 Feb 2023 08:59:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] hw/audio/hda-codec: Avoid forward-declaring
 HDAAudioState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230220131837.26292-1-philmd@linaro.org>
 <20230220131837.26292-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220131837.26292-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 03:18, Philippe Mathieu-Daudé wrote:
> To avoid forward-declaring HDAAudioState, declare HDA_AUDIO QOM
> definitions before its use in the HDAAudioStream structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/hda-codec.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

