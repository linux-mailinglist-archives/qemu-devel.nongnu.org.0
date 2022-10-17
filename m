Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD2D601AD2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 22:59:26 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXCm-0001DX-Ce
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 16:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXAg-0007ed-CI
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 16:57:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXAd-0000BD-Sp
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 16:57:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bu30so20367484wrb.8
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5kFD4SzwgAwbAJ6WbWi/JOqiQSZeXvwssDDc9Ce1hlw=;
 b=Smzy6eZoF+L9YSw5VBGsvSUtQyR9Vsrf61feaggQo574sgVA4981/A8rPRtABbRprg
 alsguEnpWLQasS8GO/7ghPie5nB3nYjOUP/Kp8atWb765SmOsQ0z6StVy9PUsP1VGoyl
 lsrzaFdIyTD62umOTJu0iaCHp6kfat1xsqNFcgPBDc3tNMmy4xvcJxCp1yE3xLobmLdg
 OyG82bweUDtdg7TwWjMKcR+HeQA9GE6BbZVSDoMvUyo8lxkaoW5JGWsCSp5xV3cYGgRI
 hl7+seHZKhPJbXf2tnzlxFIpo716hzUVph6+a5fmSrPckEVod/nXSPsZY2yD8qeJOnsu
 ArnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5kFD4SzwgAwbAJ6WbWi/JOqiQSZeXvwssDDc9Ce1hlw=;
 b=oIKuFk9xwjj+QIGEWj/xPfcdzL8NWL80UWbNsmhKdoaJ77KNAMk/tfw3mTiRReWGlO
 Q+a+EihQWKfQN+P53qKTzrlhf+HM7oNxLZ2FbBlKon0X9nM1eiYDv9/M2TzKatSLmksL
 6hEeFHiDJ+IwX9kJ6aQGPheY0lGz2zI4DtzlK2stTYhSk/lrj3Sg9duv7yF2eNFBQsdQ
 jqeaRZAzubo9dsZvAuZNTwmPuOuaEBLIzsLp5Yt8Zb14XvItpvY5I1Uyvu1D9j538LRm
 y2xdv6q53YSsf4CKs+cKQY4uCpM/xJ5ZXpxYA3ExiMXnpFv58J+PBAy2VlVaSt8VsAhB
 85Mw==
X-Gm-Message-State: ACrzQf0TKrhTF6X70H96PlZee9WX8faB5oPLEQ6XYCg5d+rf5FCYUA9D
 706k0D3r+7vgTWvup8Eqvcn6lA==
X-Google-Smtp-Source: AMsMyM7s+q2cRB1cV0YqBNTvWSxSFi825E8c/tyu30V5jErhL8vjg4KAes/lzEATFarGQ+MJk87ZgQ==
X-Received: by 2002:a5d:4f83:0:b0:22e:3ab7:e181 with SMTP id
 d3-20020a5d4f83000000b0022e3ab7e181mr7081355wru.702.1666040229821; 
 Mon, 17 Oct 2022 13:57:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003b4868eb71bsm17143172wmq.25.2022.10.17.13.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 13:57:09 -0700 (PDT)
Message-ID: <ac4a6fd0-9e60-df0f-533e-a9e102350deb@linaro.org>
Date: Mon, 17 Oct 2022 22:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v3 2/9] hw/{arm,ppc}: Resolve unreachable code
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Jan Kiszka <jan.kiszka@web.de>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf
 <kwolf@redhat.com>, qemu-block@nongnu.org, Bin Meng
 <bin.meng@windriver.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221016122737.93755-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/10/22 14:27, Bernhard Beschow wrote:
> pflash_cfi01_register() always returns with a non-NULL pointer (otherwise
> it would crash internally). Therefore, the bodies of the if-statements
> are unreachable.

This is true, pflash_cfi0X_register() use an hardcoded &error_fatal.

Shouldn't it be better to pass an Error* argument?

 From the pflash API perspective I don't see much value in
returning a PFlashCFI0X type instead of a simple DeviceState
(but this is another story...).

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/gumstix.c     | 18 ++++++------------
>   hw/arm/mainstone.c   | 13 +++++--------
>   hw/arm/omap_sx1.c    | 22 ++++++++--------------
>   hw/arm/versatilepb.c |  6 ++----
>   hw/arm/z2.c          |  9 +++------
>   hw/ppc/sam460ex.c    | 12 ++++--------
>   6 files changed, 28 insertions(+), 52 deletions(-)

