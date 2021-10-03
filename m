Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B264203C5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 21:36:56 +0200 (CEST)
Received: from localhost ([::1]:51600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7I7-0006o4-Ew
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 15:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7Gd-0005uS-Iz
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:35:23 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX7Gc-0002Bn-5O
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 15:35:23 -0400
Received: by mail-qt1-x834.google.com with SMTP id f15so14095211qtv.9
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 12:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AiIA+F+zriH+AHQpLNUrMKLSnaxosrYKj/7NpvcAlxg=;
 b=hnIJpIIlRjwlhTTFwxV2vLUbDdIALl53Gh0gOnrEPruluP8Kq9gwnA9UtZ6ajLLAg5
 F8c/hD2OsmfUHLRHN6lq90qL/HN+0fnoAMVH2PVjVGPo0RtG3Fp3i9E29v2zO883j7GZ
 njY+7ABxntoEzq6pimFCKwx8VPlQR/yQZyYV6FSyAtsKIC+lMRKpdFb32aHd/e0GIa0u
 D6Eq/8J+uxGYt1qyi0XI//bQ3wNMsY+2l/zQ+ChMLXNKdxTG/0ZE4uWNZxHg/a8VsJXa
 5bVmwxhxHEwM/xjCi6YaCaOJG41/2wwxglyq1oeP+v1SxvmpglgFWhsZ67T6zIP5IHYF
 1RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AiIA+F+zriH+AHQpLNUrMKLSnaxosrYKj/7NpvcAlxg=;
 b=J+UCs4rs0GrLVlaNn8iYJT+6vKQClC/yS6zDbouoXBCnYrkL+fwtlFW0jiTL5ELipP
 +nk6DYYuhI/X44hQLRKRAl3jURYTu6aVxOVUj2JH2GGGsDWTLSYxFzZG07E/5YPePuLD
 2PB5+4OoPrMPxNu9SBN7yoOJJ9QPYMVNsX336UuhJBGiYtvtd1m3zOsl8Rk/DyPO7D0e
 aGiq8hzwJcu1rrJjT3kX+s2vuPGswLEmSnf6Eev/Yq2+JeExZKEWGvooHCIDutrn613z
 mVqEOdmc/otB2NHVIJJUjfI4h9XOa58f+CecODbx2auQa321dbJOQRv5lmqZcZBbdb36
 zqLQ==
X-Gm-Message-State: AOAM533WUuLO2Kqe5eVftjux3zbpgHQ/lgqWLfsVhGGFElHcUhxbb83a
 Nz0BksHEjPvaApe34Gr96HTpDw==
X-Google-Smtp-Source: ABdhPJwx5hxxuvMkEtXTP5bcP3TazxMEgEzTR5VAmBeUNlp4BFe0AtVasygK5WOIl7LNO5NEkzI6+g==
X-Received: by 2002:ac8:429a:: with SMTP id o26mr9894717qtl.317.1633289720756; 
 Sun, 03 Oct 2021 12:35:20 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id o21sm7458686qtt.12.2021.10.03.12.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 12:35:20 -0700 (PDT)
Subject: Re: [PATCH 6/8] target/mips: Use explicit extract32() calls in
 gen_msa_i5()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003175743.3738710-1-f4bug@amsat.org>
 <20211003175743.3738710-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d159a6ce-2b3a-2212-07ab-2082efebb07c@linaro.org>
Date: Sun, 3 Oct 2021 15:35:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003175743.3738710-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/21 1:57 PM, Philippe Mathieu-Daudé wrote:
> We already use sextract32(), use extract32() for completeness
> instead of open-coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

