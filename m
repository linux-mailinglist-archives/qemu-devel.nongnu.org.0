Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D71D36379D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:58:50 +0200 (CEST)
Received: from localhost ([::1]:32778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEVE-0000iG-LG
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYETo-0008Kq-C5
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:57:20 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYETm-0006N3-3z
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:57:20 -0400
Received: by mail-qt1-x835.google.com with SMTP id y12so24752816qtx.11
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x4oEavh8BXZ7NHfitN/DNRrEREYWK43IoU6fgZeacpQ=;
 b=XSZre+L9XQkkHboBkmyP/Qhf7qB9ojWTcwdzEkjdh1qbBoNcdZmuKqiy9gGyk+6UG+
 KQqM6xWXycY5Dyu2v7XjvJF33PJ3pKN8LAEga0XbALa9uW73XQOu12LMRxbUd8YkIA6i
 BtL81w6TX+04md3o4ll9NQn3yvJPoMbQtdv2Owu4/PWAr3Vk2wZmyLl2CEokqA7FmSPd
 7144qV4MbpZ1AufZr9T9OMxWxYSaLMK2jpD1MxzxYzEdCWIpQ1rTXGkzwpsOxYYf0lS0
 s6b3j3QQXXXmES8jhymSb0BuYVG+JqpOXM6afsAGyrm6Lix9F184NgO+ES/9w70cA+vl
 Mavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x4oEavh8BXZ7NHfitN/DNRrEREYWK43IoU6fgZeacpQ=;
 b=cr++h3N+CCk/M6sMVAYYjMdL8o2R3fDY3TNLN1UJuxdaYmiI2s5Ebzr0C1TzAlp3C4
 uDnOKNVrXoV7iu86nsp1FAMUyEV91KSPMOkxdgCSmnG4lO6bZkGga9moVDfGBG5myKng
 dIszAPtt3zFJYAwIWX/1x5khd2VZS21heZR5Ux0ZZBBuL7Py0lXl5X0RSZVLhdmCW9e3
 qPTkJzhk+684rme/Q4aXWQOvCl8CupsdTszHOVNdW1xLLu9FgiOHjEliCFb92QfNE8SQ
 sKs6XKC2jYKgCg2cSkA7g2T96RAS+lhsegcB+Qt4AKhMZWl6PE9KwoL25lnbaHWRoIje
 7Idw==
X-Gm-Message-State: AOAM530x1HGJiLhi25p6dY+1seVYozWV3+LyOH1QjKT8e48FSRPITDZu
 ZKWvvkjYxuy8WGiTcMwkFXTigg==
X-Google-Smtp-Source: ABdhPJy/OEBrSIQZMbAW6OdQ9UVkTM2ftMFN96RYZBU9ukuNFXFmrrSTto69Ar74i8w7u8mUz3tqqg==
X-Received: by 2002:ac8:502:: with SMTP id u2mr8755566qtg.218.1618779436528;
 Sun, 18 Apr 2021 13:57:16 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id y6sm8502401qkd.106.2021.04.18.13.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:57:16 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] tcg: expose TCGCond manipulation routines
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-2-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cc901073-716a-09c2-d577-d4aa9b90713a@linaro.org>
Date: Sun, 18 Apr 2021 13:57:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-2-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> From: Alessandro Di Federico<ale@rev.ng>
> 
> This commit moves into a separate file routines used to manipulate
> TCGCond. These will be employed by the idef-parser.
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> Signed-off-by: Paolo Montesel<babush@rev.ng>
> ---
>   include/tcg/tcg-cond.h | 101 +++++++++++++++++++++++++++++++++++++++++
>   include/tcg/tcg.h      |  70 +---------------------------
>   2 files changed, 102 insertions(+), 69 deletions(-)
>   create mode 100644 include/tcg/tcg-cond.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

