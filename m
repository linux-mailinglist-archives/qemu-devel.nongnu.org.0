Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07283ACE17
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 16:57:42 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luFwD-00031H-Pf
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 10:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFuv-0001eb-Rb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:56:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luFus-0004Mj-60
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 10:56:21 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so3184747pji.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pCMUqT3ZUOORWAKW5fX/AI8+X2BWJYhSpbRSCRRTlUg=;
 b=MQJYbg/ceUPwd/vtuHt58XWEIuQLGWVQp4HQSndvNHKyLZtd5pChqf87MAVKjOQmwB
 5UVwwnkzTf6M8MCGHEuSrxegMpRThywJVy9oCcEK7OLuQndyP6DTUaUDZL5C6ToHJ4gv
 2XwJMZvpGLXBKeWioySfN6EoY+Vt64QIjSX4DJMr1hh+70T2u+pDVeStx3dWbe64N1YE
 Mvk5dfiCRfTqpp3aXkvDPHbfr9BKwxwYpKV0IlHw1MccnMETSQiBqo7PSLJboxmf0tl4
 h1yApzWVjQT3KglVhwDPO//gohbOVq4k+1f94mBkDmBvqLQleY48y86pfvUL8WgX0Ty7
 D3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCMUqT3ZUOORWAKW5fX/AI8+X2BWJYhSpbRSCRRTlUg=;
 b=KaJptjAExCKoEDp9jQ5k7WnJFKKw9Y8NFjBZXYgQxGMbOYZnqWT6vEOV+qHIZ/uAuX
 iEaNvm1trPP1eGkuGycm2vEiUzR/hH1J8y73xuwhaoSNOuARhqpXF6LgH0H0B0z88cbb
 8A7nAEVFwLUmKeDsbae6Qd3pJ6zWtQIc+jzCYOrNczBgoUxuvrB0AWMpYhbUAQ09ntzL
 N6ZPvCQhn9syGG7+ycZ9RqfIsaIZxZw7GL7oR3uw1fliTwACxTQNE173UbdMVZme+YRT
 Eoj+bP+qD5rOhMTmv0JNEuqE16H5x0M4Ao4hPNdcCkyMrasnRLrcBwpwiKzy39s6FyLO
 rmnA==
X-Gm-Message-State: AOAM531TxAkN8CSJiWULshNA+/gm42mWQzvOAMghXr7ty83tKPBJOB9H
 8oz4eqaO60ipWqv/9E986+VCMwnMeEa6YQ==
X-Google-Smtp-Source: ABdhPJzM7s8rOmDuptuAByodaOHMj9p1kWY4CHaPAlvfXn/AWrXXz8pRLWUzZWbgdRctkEtkr5S9lg==
X-Received: by 2002:a17:90a:ba8e:: with SMTP id
 t14mr11760901pjr.211.1624028176820; 
 Fri, 18 Jun 2021 07:56:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u7sm9389706pgl.39.2021.06.18.07.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:56:16 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/mips: Remove pointless gen_msa()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174636.2902654-1-f4bug@amsat.org>
 <20210617174636.2902654-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <196c98ea-40cf-717a-ae72-a88435a5e512@linaro.org>
Date: Fri, 18 Jun 2021 07:56:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174636.2902654-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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

On 6/17/21 10:46 AM, Philippe Mathieu-Daudé wrote:
> Only trans_MSA() calls gen_msa(), inline it to simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

