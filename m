Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A40F610ED0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:41:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMmp-0003TU-5Q; Fri, 28 Oct 2022 06:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMmm-0003N4-Td
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:40:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooMml-00028Q-4V
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:40:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 14-20020a05600c228e00b003cf4eaef74eso3307215wmf.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BywBf/bgc/hZGC5++IG8Y+SLbPMcq9gMNduQAimcqVg=;
 b=OUIUUZlEM487zx3hX1RUvS/qtqAFkROT4JdIBwln4ht9vrH8UTnKhfBfw5hGiZlYfB
 85yTZVNDkAL92w/68BB4kLSQI2drLZGCWUtfGNaE21ot5z6xIm4Ihx1UPPQcqZEtOQdl
 OscAy8CVCKbRZqQQiZ2aRz5xQ08sDfOoTPxAU+lISXAs5YWBDgvhK6adWFeYU0Y1YC20
 X5/ZeKz/b2H1ATDESoTLSf0sfqBtYU1tBkW0FTXNp5SmbMBOfz6hP5SsMJNcNUYrPl+S
 K8y4y22IP3Cz8N2Ir0YeZC706d0OrbgZrEAVTtcPLrAV+lZuQKV9LYhAqcLlRzu70bG8
 Unvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BywBf/bgc/hZGC5++IG8Y+SLbPMcq9gMNduQAimcqVg=;
 b=MR+jqK/YkkVqiysMiKGLC7j2LlXPBNhbl/pKCPjIXXtr0UiqCtKM2C22oayd3ubBwu
 o4IIoYGF73DeKz4X+k2Iwwog9gHvflVPlPCtoEcmO4NkDEo0Hrn4G4setFUiNCPWuoCp
 90jLgx53GZj4qfMVd4o8kqFWJ+VKyC4LNcNpvQAELh49Z1R+zUrtA5VHmVip43V/CDEd
 LGCD2s3V+LOqSmtoKHItEUN99mOW8+NkVzgr3qb+xZQWdWJtMEczkTNuIGTtVkBtxaP8
 HSQV/2YidRk9Qq031NvhvayfJ0x6ry0PHYlghYXzM2K23hF/vDgt4sADgAZRNv5+ArSx
 hWwg==
X-Gm-Message-State: ACrzQf0CPU7LRCqlsZfoTQhLg/xexaObdB4FBbXGL1xalE/zZmU6i3pY
 nFlufsxauNgGG6wDtMwGVTxlfA==
X-Google-Smtp-Source: AMsMyM7gDmMPUOLuNbuYsAs9RDw+3FapKE+opL6Lg/UoGSVGWaqjx9Oc1dJlakzgTKyaenxBxo+IXA==
X-Received: by 2002:a05:600c:1553:b0:3c6:e12d:6f32 with SMTP id
 f19-20020a05600c155300b003c6e12d6f32mr8679856wmg.109.1666953621791; 
 Fri, 28 Oct 2022 03:40:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003b95ed78275sm4432037wmq.20.2022.10.28.03.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 03:40:21 -0700 (PDT)
Message-ID: <cd29f022-14df-94c3-5dbd-1f415b132df2@linaro.org>
Date: Fri, 28 Oct 2022 12:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] tcg/sparc64: Rename from tcg/sparc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221017062445.563431-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/10/22 08:24, Richard Henderson wrote:
> Emphasize that we only support full 64-bit code generation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   meson.build                                 | 4 +---
>   tcg/{sparc => sparc64}/tcg-target-con-set.h | 0
>   tcg/{sparc => sparc64}/tcg-target-con-str.h | 0
>   tcg/{sparc => sparc64}/tcg-target.h         | 0
>   tcg/{sparc => sparc64}/tcg-target.c.inc     | 0
>   5 files changed, 1 insertion(+), 3 deletions(-)
>   rename tcg/{sparc => sparc64}/tcg-target-con-set.h (100%)
>   rename tcg/{sparc => sparc64}/tcg-target-con-str.h (100%)
>   rename tcg/{sparc => sparc64}/tcg-target.h (100%)
>   rename tcg/{sparc => sparc64}/tcg-target.c.inc (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


