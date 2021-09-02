Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D2400263
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 17:34:02 +0200 (CEST)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMBCb-0006wf-Px
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 11:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9Q-0003Nd-B9; Fri, 03 Sep 2021 11:30:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMB9N-00042P-Hv; Fri, 03 Sep 2021 11:30:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id g18so8764777wrc.11;
 Fri, 03 Sep 2021 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hjf8QsYwBZu51cOAGTBH/4kg3IJjsbbVX9/Xr7s+KJw=;
 b=LkNY7Dh5pWXa36A2WL+qPmTrZuCeFO1Ir70+TbQ+kXvQRRnEHey2P6V3659ePCTQof
 wTy778GFMXGAhssxVBKNeFQzcKTePckhdoOaLxOvh+LWNZj7hpmkA7KFDzsdf+KnsrOC
 G40xl6NFwkCkVd4aLya1eX7CHxBStdB/LFfdi2PNfOSIloI9fH4xlNodQHrxEuuPGBvj
 BFMREGfjjva3WSkM4+e4SmQz7PpSh/QK4GXr00JhwW7aXbaVBGN0uCiReqMoKCCJAvIy
 XXEZhp+f4lcw2Ap7gWVJIb3lxu8eELTGOM2kGhdj2us7+P22hBzBSsLGVJSaxyW5LPx3
 aBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hjf8QsYwBZu51cOAGTBH/4kg3IJjsbbVX9/Xr7s+KJw=;
 b=fD3IrHEZiU0dE43HaGs1vEVNvCctR3gaeHvvHGDxqFUQ0kJZMgocNVdgzjrMLFgX80
 eCFOtEN4/aqAyjZO1pdSJdG9P4LYyRN6xXqAeHAkHDID729WVNT7Tcc8MvpfBd5nNt4G
 BJvn/vsYRCI0GwtYNWb6PYEaCHxrgGXZdTFKjFwiXTHDEHtgH62r05fAzFHqfr2QrSiJ
 V7n5Ztg/fGru2cZvhxqCosGstRhWt3pc7mqtyFeyoFiDyDccWxKhtuWLTZ8FBV1NF21a
 5Py0Qkh5hxMnj4Pi3cvevcSOTmsGrNKZ4EkmxLgFMexM7CBiHfA1qSkCXUcN4h7QzaIh
 H5Sg==
X-Gm-Message-State: AOAM530Bej9lRrk8KfxMOEeUzNTwx8nguuXF+GjVk2r9fH3WbpByrfQk
 7oJh+M2GOsOSjoqqQZbZS5xcvWJaZe4=
X-Google-Smtp-Source: ABdhPJzioqMCm+j9WndfzX+qXVlheVRQOI+Sr9Fxt7mfJ+txRDsrJ/mFG6YEdUqyKN9OJmZ3pP5JAg==
X-Received: by 2002:a05:6000:250:: with SMTP id
 m16mr4446385wrz.349.1630683039541; 
 Fri, 03 Sep 2021 08:30:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c4sm5564439wme.14.2021.09.03.08.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:30:39 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/arm: Optimize MVE VNEG, VABS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08632bfb-ec6c-8d26-3f7b-a796e536b540@amsat.org>
Date: Thu, 2 Sep 2021 18:21:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.888,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Optimize the MVE VNEG and VABS insns by using TCG
> vector ops when possible.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

