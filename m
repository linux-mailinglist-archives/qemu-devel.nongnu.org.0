Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DE51C793
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:23:18 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg8D-0005oR-3v
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfZU-0002p3-08
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:47:24 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfZS-0000OF-Ja
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:47:23 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so3411601oty.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=9w+gTKJPpT+0wLdAN8lsGrKJqWtzGiJsLvUX08/exQw=;
 b=NyqovUEf8Obtdm27JM0qbB/sdwFcx3/08B/gX7thmm2+mrGuKRVTrsjMWp9KLMGySl
 EXuU750nCTsEUgbc0JL/SMKFrCwATrvwbNmcb1xz5g57tHw2NmHqsu9lvXeEOBxZm2Ra
 gpxbNs9aWgrrA/noZ/Ew7aNQUzV6HjustrmD/aSKZRanJTwE4w+o0KiYJ/UeKiCcwUQB
 FI0tOlgnCMhaeix8CPFs+q//jIyfw+bHC59qGqEYVNYOADBrMZ12o8K8z2uKaMCBz/6j
 jFOl0dskX2METiApazQ2Pe2uvmupIIrTxEDZo6/mKYUu3TWNN2UFjlbu/7FRij8461Mi
 Vapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9w+gTKJPpT+0wLdAN8lsGrKJqWtzGiJsLvUX08/exQw=;
 b=xFeDj/GjiVavykCoGuljGfH2Gt7LqW68ePnS0V6VKWf9vbZmvJqVJg9XABhUMWwjSf
 VNEjXQMQPZ+mJoL1Ggyk7r+o9fyKBJ/iIsGuq2qVBIxwIOBFrEJ+KnExWHpGuCVQxDRB
 oJdLp2voTpLIe1XcaJVZF3MasCZclEMEbtZty3iJ4jMC9UpOkSxoxgfGgY0Ik88Ijtwz
 a+XY6sUWUo38GUl6qD3J7zhf8YbjVD7KfFmZbJ8YGFz4fyc1nR5N7tXvDg4bz1t9ToTY
 gEU7DaLIteGz3DZm0eNugagsBbSrB6pUJfy4/48Wl/VGauesUJlZAWu8+XzNd4U3sSkK
 MyUw==
X-Gm-Message-State: AOAM530k0eSlUs1dbDq800f++qUDgTHgeNvbaNZEUHHpR3LwRLQpnz+p
 kAk2xp8LZJf5P7zTKJsLe90YbHlPRSGddA==
X-Google-Smtp-Source: ABdhPJzqhJAK5OdtASbq5pf9EL4735/I5jU3bOXQQqa3cmkOh+4gKuoqzPwVSq4bSc2nZ1nWVjoUVA==
X-Received: by 2002:a9d:3ad:0:b0:604:c1fd:cd4c with SMTP id
 f42-20020a9d03ad000000b00604c1fdcd4cmr10200875otf.288.1651772841348; 
 Thu, 05 May 2022 10:47:21 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a0568301d9700b006060322126esm805197oti.62.2022.05.05.10.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:47:20 -0700 (PDT)
Message-ID: <f8346f00-6eef-fb6b-025d-e1e78e9e3035@linaro.org>
Date: Thu, 5 May 2022 12:47:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 16/50] dino: define IRQ inputs as qdev GPIOs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-17-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 2 ++
>   hw/hppa/dino.h | 2 ++
>   2 files changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

