Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97638C8BF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:53:48 +0200 (CEST)
Received: from localhost ([::1]:46064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5b1-0003IN-OE
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5Zh-0001uI-79
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:25 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lk5Zf-0008Cm-P3
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:52:24 -0400
Received: by mail-qt1-x82e.google.com with SMTP id c10so15281840qtx.10
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=47zAWYAiK7za6vgptXGKZe7y5N3QjIgkfGnRCwQietQ=;
 b=thZfnSCVkukLHTkMaOkWiMuqhm0iC+qGtyaJXP7equ/ICpTv7RXWbh4xEMoGTKhGXA
 v7kzGp8au70zy+DOAKk9lkQWkYQfPE/q93bqMRjEknPSvHOCVHBFFeaBIlYq3epegdXW
 hyVurJZr7Gub750f2yw1Q2sfJRbuUrNLHwj3XU4JJQcN5dcRUwZ2tydwTclBzMOkmNof
 SSykX6U1LBnVzXs3kvt5dmPGSidgXREyFOgNy5w4phhd+GnDMJMey2qN3Uv929pQuoXV
 tZuazY77eO4naERmfkTXjsjPRtONM8XAdelnrfh2Llckf0KM9cuBAqLWX/kFZq10ch7A
 Zkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=47zAWYAiK7za6vgptXGKZe7y5N3QjIgkfGnRCwQietQ=;
 b=LkBsdih30k+VqnITq5U5o3BrVyOUPoED8rSQfO3WfP1Zv5UBMVfw9BFV3IeHRpMya0
 Mvn3ocY3flvh/34TJtXn5r9Rz8536zUeKqzV8W2rNhvMc4Ti+S6Zgmndf8H4KK6JlBLR
 bTl1ltxBI/gMT/cGeOO1AC6LcX6WLRVdXGYQETECa+q4cc6d1jL0K+NcBDmzlfrTZy/Z
 4H2N9k6IlbxGASOWU28ETNJroG3Bp5K4zrdntqaTy8pjZ7KtzexreZeyDTb8QLPN4R4c
 m7lskFdspqULjRUxxavSoJ1KxYbh0DY2IS2KsmQk6O8u+CQ855FRJkmS1DcboANi4BLQ
 KzsQ==
X-Gm-Message-State: AOAM532uOartKUdqR9kw78x5RJxvZIw9j/ojddvCQuiex1sgW908P0Uj
 3sYdTmf7CU6YK/wwfBN7aRhUpcLhHzP5LJu6
X-Google-Smtp-Source: ABdhPJx9QCuM9KXmg4uVTL8nWay43u/qEE3tMVdjLCUXvIHGHatwpq76aNO3qqljQ4s4nQeC3u8qRQ==
X-Received: by 2002:ac8:6c43:: with SMTP id z3mr11086976qtu.234.1621605142757; 
 Fri, 21 May 2021 06:52:22 -0700 (PDT)
Received: from [172.16.23.44] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id e12sm4679533qtj.81.2021.05.21.06.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 06:52:22 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/m68k: call gen_raise_exception() directly if
 single-stepping in gen_jmp_tb()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
 <20210519142917.16693-3-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22ff35e2-a973-c5d3-4d43-3a52efa12c03@linaro.org>
Date: Fri, 21 May 2021 08:52:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519142917.16693-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 9:29 AM, Mark Cave-Ayland wrote:
> In order to consolidate the single-step exception handling into a single
> helper, change gen_jmp_tb() so that it calls gen_raise_exception() directly
> instead of gen_exception(). This ensures that all single-step exceptions are
> now handled directly by gen_raise_exception().
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/translate.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

