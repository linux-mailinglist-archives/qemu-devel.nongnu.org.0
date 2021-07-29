Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8B3D9DB7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:36:27 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zec-0006J3-JH
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbI-0002DS-4i; Thu, 29 Jul 2021 02:33:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbG-0007nj-NP; Thu, 29 Jul 2021 02:32:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3240933wmp.1; 
 Wed, 28 Jul 2021 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HCHdsQzanzJy4nKWlivVc4Sng8fP/PG7w5X+Z2gtq4g=;
 b=jMjTGC9a1vP+m1LXGLp61zv9mBPcp6eytMmeMJHAeh1f1Uv3DwmrkRdpLYuPbfMPPK
 cxwo/We7z233wezwYVOU0nlDrNjgU9mpBgv6/p4CBKXgVoOUdklZMS4tACyd6UMWfrRz
 wrlflNhjn5fMWX+qqjBJrwF5x4DW1KiCJXFG8HTLIuY0MewLCEGe4YGRQgD0uSHaaH2F
 H2UkdCZAj0rSskB9339QSo7ihKO6B/kucDYg5xRiHCNL2OekindMpIRRpo8fPY2SXAQh
 qFg9VO7sYx8TvplT+L7rr8pby1GSusLmpsBVeTfvMrpZkVr1ODuwOAO1Gy8U1AB5Ki+l
 4QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCHdsQzanzJy4nKWlivVc4Sng8fP/PG7w5X+Z2gtq4g=;
 b=SkJXXNYTIXHGTc8xvHBY+FAAC7p8ffjjQFTTXSVBNwqI0MhmmA33OcgYsvmQIFoQs3
 2BBslG+AzuZy2gmECE69r36WMv+nq3kbk77tJ6HZZc4MBraz/RKMae0zmsIXZwjWOGPz
 r9KiZDsppiLlsk1QYhKNFd7KB6/nXZ13vkk2xiAKngOKk4yyH9ctbXV42ataUrl40BEv
 PmE5oWcNFF25wdfP9fC1ZUE+sC4DoseTahWE/wP3+kptHbw90y20CIR7xEZRuR00pShA
 fRRrZQBGvrTIkgJ3XLvVF0OWnuk6g8/njuaTlezP6M7k+I4NOhYszIbm4KbqT519arsq
 dP3g==
X-Gm-Message-State: AOAM530Fu+ByLpHikXVEBvm3XDIFNWO6OiuSxRNHKZTb/RuZo7cG4njC
 2CPZ0m4KjqplsEI/YNXY9cOEKbwV0ZsM2g==
X-Google-Smtp-Source: ABdhPJzaP4RMLFlIPHJQ7XGpa2FmEZU6Z26MOX+jXtVA7ZiB1rRj9u6Bnn8P3EQLvlCe3xxArR9ISg==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr12714958wmh.72.1627540376606; 
 Wed, 28 Jul 2021 23:32:56 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w5sm2636679wro.45.2021.07.28.23.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:32:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 27/43] target/arm: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf2612dc-57e5-8f32-1dae-d4c8374218d9@amsat.org>
Date: Thu, 29 Jul 2021 08:32:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

