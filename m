Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFAE589F28
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:12:07 +0200 (CEST)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdSA-0005Ba-4q
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdKI-0004gD-F0
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:03:58 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdKG-00052H-PZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:03:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so220134pjk.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0IkOmkqD22a/DmXX9uWe9iOG1pZJhZn94vJ2qcprlEU=;
 b=yYReQz4ZS/qFIIsut+oQNz0m0Ve0Po6pUkdei7WV/QrmFfM/KfnnaaOiulYeAwlVG3
 ek70MQjkXsukXhPTQIUMyd3uVyxCz+oId56WhSAwOkXy25fzsI0WgbU+iwUPY4M7M3mC
 11oQez6Pkobh0u8P9PqIgnwzP7gDI7rR4JpTHCfa1bxKtcW5KrfAe+S2Hg3TSpmQFXiV
 25OlV+uEjZV6RAkklwZ2ltRAqvbX/aRHEMjAyuDB4ZdYPBNTU3CEnTMfeZyBBGnRyVEn
 RPRukMD47x/78XEC11AaXy51suPFH3aTh1oTQG/ZyyPhyFyut5Fkg3g0uvKT+dPiZe0o
 /cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0IkOmkqD22a/DmXX9uWe9iOG1pZJhZn94vJ2qcprlEU=;
 b=ST407uwY1O5C+dvxvOFEz/IS0Vrd/mkZver6TMAAJdQYQi1Z6tXj4qD1CuECtYWnB2
 DFojpupF2wWxtJHSIB4zOyZd75px/pNwhrzhYkzpUXfB8nYXhqohLityeg31hDI1afr6
 QkBUxqLcLa+weJoNMMoh7mwQ1xwKV98cX6UtR2PDVXtI1pvaFXKjNtWLYb2tFCzN9TGZ
 HcbNexY4kmLt3EPbTC9uNPz49rDdxNuQe22q/rOj2arztXhsUDIKc28KpdQLRbs4P8SG
 UrNk/vQLHysgxLA4evmaU10A4lhG+cWqNdmPkQSLO+FlNWv68kukWX2CrM20CLuemmVw
 wuUA==
X-Gm-Message-State: ACgBeo1zROb3vR+BHjidUbTFY3KRGKZKAaXv7T+WqRm2hAiplUGrLMrf
 bdtV0bf77iW4BGIlsLHbAd358A==
X-Google-Smtp-Source: AA6agR7dFcYoHkqrhqDkRLLCZx8jQSHlKv/FGS65hsw7y/o+oB6Oy25ch9Ecd0TzHhBJ1sSqjP4QYg==
X-Received: by 2002:a17:90a:a2a:b0:1f3:1479:e869 with SMTP id
 o39-20020a17090a0a2a00b001f31479e869mr2808735pjo.41.1659629035207; 
 Thu, 04 Aug 2022 09:03:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 x194-20020a6286cb000000b0052abfc4b4a4sm1257218pfd.12.2022.08.04.09.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 09:03:54 -0700 (PDT)
Message-ID: <57578e69-07ca-6563-eba5-4a688a769a28@linaro.org>
Date: Thu, 4 Aug 2022 09:03:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 3/5] target/loongarch: update loongarch-base64.xml
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220804130213.1364164-1-gaosong@loongson.cn>
 <20220804130213.1364164-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804130213.1364164-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/4/22 06:02, Song Gao wrote:
> Update loongarch-base64.xml to match the upstream GDB [1].
> 
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   gdb-xml/loongarch-base64.xml | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

