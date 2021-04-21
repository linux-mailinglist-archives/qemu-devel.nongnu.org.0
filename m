Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875036635E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:30:23 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1h8-0004XS-F5
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1g4-0003vh-MC
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:29:16 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1g2-0004xX-Ux
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:29:16 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y1so5050030plg.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+oNV56bNgxRv9RApm7XjxjJ4vXS5VzHVGkeFfmDUuzM=;
 b=rejyzt8vs3d7AkjvHsEUnJdALY/Ht1RPi84GKKVBPYDbJoj38OERWc5VSpbUNsftMy
 maTvqRxYxx3yorZo1M1Mrfx75UAKvnN5MbGvUZB47FcwvHpZSuFwG3yE3/V0aWICRhIt
 fiJWegszpqCFYZ6wU0pcML/Mbjm4+we97CADsX+OwpsTopydbif5UVfg6xquU0je18QO
 FfA+xbJdWex1AJwtcXVU6u9NLL9b1EYfADmPn0o8Aaf5hnAMvGCnhZi953ZDZf8rR8k+
 7knT9LRmrxzU6NuxHSUPcjSrBVCig4tL0ilTicaE9+zKjjg7PGuKkh7niDYjEAwWjkG2
 PSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+oNV56bNgxRv9RApm7XjxjJ4vXS5VzHVGkeFfmDUuzM=;
 b=fUqM9IDHN/AUVdn7M6wJqdv1eFaSeMVBOEUoEspeYknrFhxTV446KoDSflHAVq1aK7
 hu4AdNtm6X7BFwa1o+LwGL4dZrVdv3oSiK8bc2RTK7LidDeMHJxFHoRDvDWSVxRuTOmb
 e7DU3pW4ero2dQd4Ewu+9DVJBMczGOje2voWtQvbjdpHCtf0ZSsP+yeZRgnmo/U64KN0
 0x8AESg+aP4LwBJOM83WSwMTmaTybDf//XM5Afz5tSjJEqAwP23OYO8o0q88v5AXNCal
 vTP/MqQ5/4JXrJMyFwAXb8eB6d/dTSWmAjFzy7B9vpteb81Gh5sm90S/tlenTbhF2pal
 l9RQ==
X-Gm-Message-State: AOAM530emsiB21WMfIDU50drUXqURhnWziEDlzVH6/A1/Rj9swqEfyzP
 Kn2pmW8dIFQybZPmVQRL/TWSWQ==
X-Google-Smtp-Source: ABdhPJyHb2X8Ldq2CKlw+tYhTn+G2s4fyReeDRwgoYFTelAiGz/Olgrvpv0ThakgQx9m5HTLU5zgsQ==
X-Received: by 2002:a17:902:8f8d:b029:ea:e059:84a6 with SMTP id
 z13-20020a1709028f8db02900eae05984a6mr32051715plo.35.1618968552491; 
 Tue, 20 Apr 2021 18:29:12 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id x22sm241002pgx.19.2021.04.20.18.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:29:12 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix CACHEE opcode (CACHE using EVA
 addressing)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420175426.1875746-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc94f283-45cb-4679-63d9-22450af7edc2@linaro.org>
Date: Tue, 20 Apr 2021 18:29:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420175426.1875746-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> The CACHEE opcode "requires CP0 privilege".
> 
> The pseudocode checks in the ISA manual is:
> 
>      if is_eva and not C0.Config5.EVA:
>        raise exception('RI')
> 
>      if not IsCoprocessor0Enabled():
>        raise coprocessor_exception(0)
> 
> Add the missing checks.
> 
> Inspired-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


