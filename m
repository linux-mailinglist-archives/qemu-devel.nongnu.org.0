Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7233A180
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 22:49:51 +0100 (CET)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLC8r-0006LC-OV
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 16:49:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLC7t-0005ss-Rq
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 16:48:49 -0500
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLC7s-0003uw-4n
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 16:48:49 -0500
Received: by mail-qt1-x82b.google.com with SMTP id s2so6613831qtx.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 13:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uuJlbcDm0GICpe7tIhk3wVkNNj1wLEZjhcQ1R68OqB4=;
 b=llT0PL8HhjOvF1jitDT+FTtd1HmpPdFTa3F6u8aqZKMiOLiqUeIzKw1087zFJlAPLc
 DXE80aYlOsDEoPhf5FGq9CUYLUwwyufIc0ccpx5uw3obxbLcPFlzdSguE3RROiMwxU49
 DKklTIqZA47en/DHy+IcIkJdNb/yxn24/p5XuE3XvVUNqEQDdk1bcxpCtxwn+2hu2/1Z
 +Zp5/Jl8dNmHhnanrwtAgm1nvgYZARmA6P3pFCJFw+B04xW3uhFxV2xCEe2/GvELHU5d
 yqjvrE/9U4HoF0HDFpHYi1mzsTKI+89LN0EClZamh93vSPrYmqc/duAwcnbC5Uwj7rqB
 gtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uuJlbcDm0GICpe7tIhk3wVkNNj1wLEZjhcQ1R68OqB4=;
 b=IPNy++vKU9vrZ5cScVJaejzj4KnpYUFjqUdIOk3oCHSaInP+HioO25TBVl9mzGd/AH
 DGWCseSDqFsY3re6kLtWJ5nNWxnrbOPvy3gnP7tF0iuF6oEsoz5zXJvMJx+yJSdKfneN
 QrTotVk3Z6X0ZWgNoJ8rx0/OZ/s84cc02EtscJGw2p/PST49skoLlY+ugLnR5Lut5tER
 VyeAmLQd58/uGEwFZxHvo42kLGqFtwkMKwTaHoJnuZEkYvyblM6mqvZs4ZAaUMt8ldAZ
 J/TGtL8nVn7g/3NGLupMUjb3l+G0hvaXN2JcFfCidNX/JEQK4DCD3sAw309/4F0JQLT2
 DgDQ==
X-Gm-Message-State: AOAM532892kedx0ndnxrM0Xwi79Srh0zjYHPnEdsQtlqXWQd1QOaOvrt
 Mf2CqB2ltENm4OZwaoqNBZ+srQ==
X-Google-Smtp-Source: ABdhPJx2t36spSfxbPrRZ6QCj+I0t1wOmw+UqdyluJc0xHordp/LEpjg1CvssV9I2nr4DBMbuKF9vg==
X-Received: by 2002:ac8:7b8b:: with SMTP id p11mr8120768qtu.57.1615672127031; 
 Sat, 13 Mar 2021 13:48:47 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m13sm7330409qkm.103.2021.03.13.13.48.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 13:48:46 -0800 (PST)
Subject: Re: [PATCH] utils: Reduce chance of rounding inaccuracy in
 qemu_strtosz.
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210311200702.1302855-1-eblake@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f5648ec4-2a02-2c4e-a865-5c0fcda04436@linaro.org>
Date: Sat, 13 Mar 2021 15:48:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311200702.1302855-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 2:07 PM, Eric Blake wrote:
> +        /*
> +         * Add in a fudge-factor (2^53 when double is IEEE format) for
> +         * all scales less than P (2^50), so that things like
> +         * 12.345M with unit 1000 produce 12345000 instead of
> +         * 12344999.
> +         */
> +        if (mul > 1e49) {

The comment says less than, the code says greater than.


> An alternative patch might be writing (uint64_t)(fraction * mul + 0.5)
> (that is, introduce the fudge factor after the multiplication instead
> of before).  Preferences?

I think I would prefer this, or for further rounding error reduction, 
fma(fraction, mul, 0.5).


r~

