Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D46504AC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 21:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p70iK-00043f-No; Sun, 18 Dec 2022 15:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70iG-00043T-2U
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:56:48 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p70iE-0006qC-Fv
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 15:56:47 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 fa4-20020a17090af0c400b002198d1328a0so12659244pjb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 12:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIzECGJc9ib3rbU6YXl4ElkZeBf98f6OK1xD4JZOxKQ=;
 b=oqBoER9Ljc4s9aKpHn0cCMuECRCLCh59aCC2cBsVPHWdyVQUNYbycbqjeiKlnXM5g1
 5A3VI7kPXroL2qy+GRLIhwWIrNk3ldfTvjoMVBUIYUO/PsgQpul9tqV8aiqpL0XiEsy3
 /Sez7knY4CTRC4T/enRZMe6MKySeYmL40zNlLjb8uunlAuCwcFksnARbSS8zh+4roRwn
 lDi7I8Q8erNE3cItIlEhLdFAd/FBvxKUHqkJYb7qKYPl22eu6yvLZmJVUPesghirjAU/
 Lh4dWNhmA3aYhdc3oGk+cUdUvpCjCi03w1ZozXAao7jq6vulfuBCgczhMDEgNmRQwmuS
 TUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIzECGJc9ib3rbU6YXl4ElkZeBf98f6OK1xD4JZOxKQ=;
 b=xA6GLtugqrnPqhm29dZTKM1JN9rHBA1RR38dBZ0chwZyHIWA3OsLfieQHJpBcSE2IV
 hJX1JR2RjVSDLNDf9PeV6paLLny2BNefJuTuZsX74ft3PcOBpommb+3NwVZ3OzeH82JL
 cDjrvozXlEYxMZgu6Xa41DutAYCzCVGfP672HOFax44rNFkkN34bz8MfAky7YToxZubJ
 6wgEtf2EuEuiw2Q4ljmS80Hd+UfLNmQcvNwQ886I9CguhBFW3ouyXbgu+UmO3D8VUYSm
 ie1w2DyL95ED3pYPFKyqT7++1v2ZVT/W0f/iMC2ELF100fxO00QeD4QwVkzicZ2Bc+CN
 OIxw==
X-Gm-Message-State: ANoB5plSbW4rDFcRwqtEdcmxrlKb4q4RqFiHsbg401H0y3TCbKO5uPV0
 4yi80Rbc7Ga6LqbM+dj9MayUmA==
X-Google-Smtp-Source: AA0mqf42BaWYGqUNalDY+dsX8JVM3duYD1QAMY3xEONn5PeCfG4BtNdDk8jBDH7YwJXvS47bNZgWYg==
X-Received: by 2002:a17:902:7005:b0:189:dc47:fe40 with SMTP id
 y5-20020a170902700500b00189dc47fe40mr40489315plk.15.1671397004918; 
 Sun, 18 Dec 2022 12:56:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3808:f064:41b8:eb9e?
 ([2602:47:d48c:8101:3808:f064:41b8:eb9e])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a1709027fc500b0018963b8e131sm5427924plb.290.2022.12.18.12.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 12:56:44 -0800 (PST)
Message-ID: <81074bbc-8379-09d8-7b43-3a6d4b02a594@linaro.org>
Date: Sun, 18 Dec 2022 12:56:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/11] audio/mixeng: use g_new0() instead of audio_calloc()
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-5-vr_qemu@t-online.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221218171539.11193-5-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 12/18/22 09:15, Volker Rümelin wrote:
> Replace audio_calloc() with the equivalent g_new0().
> 
> With a n_structs argument of 1, g_new0() never returns NULL.
> Also remove the unnecessary NULL checks.
> 
> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
> ---
>   audio/audio.c          | 5 -----
>   audio/audio_template.h | 6 +-----
>   audio/mixeng.c         | 7 +------
>   3 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

