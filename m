Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B94D58ACFD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:22:21 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJz9X-0002UY-1p
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz74-000646-1U
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:19:46 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz72-0007DL-GO
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:19:45 -0400
Received: by mail-pl1-x629.google.com with SMTP id m2so2923875pls.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sG+qG7RXWjSRDKgJI+1m4QodNZ61WcY5G5j/3Cn4HDw=;
 b=zefepBaXtFmgSHxuy9xwnJgfrPWzuP7QCgNM+9VJlRGGlxyoO5CFd83iCth2/4jHfR
 cFuQ6RyST7z05Jm0qjbzUJ22s9KdtD0bVSrdw3tHjNUkYGTbD1Xi5PVjZ3pA8LAtLkE3
 X9YtYpy4jRMxC4PKDFathv5UDVaQlRqekpKHRiqqD8OhtgP1crZyliHjFe7f1jSvh0Qe
 hz/+ybMLfNEYhdqI92bVH65SPY1LOv0f+Axm0QpDkzSI5GhGUxkHuV0jHymJYBcQQ+I4
 Hjf3Xf6oSDvz/YrATClCgJmxNrAnmq4oEL5+uvXfzHoGOylqJBP4Lz+zkxNeasuhNSJ9
 G8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sG+qG7RXWjSRDKgJI+1m4QodNZ61WcY5G5j/3Cn4HDw=;
 b=M72bLr4vp0uLkOwHJBCKeN/PGcUHBa1L8er80C4lj3uk+Id84FbFbZdD8dkul7Jy5Q
 aXRLBUrvi/X+fPL8HcnQlmGviv6PiqFHU3qRzobMpPauAOpAfMR8s04tQby3+nHyiSvf
 LyeRFvi0adOw4T9SF9izhSE04/e6/bpI3JEFdSh/xtUMrorOyIA8oeTVuGMPFm0eJNCh
 OSGodqaMC3gl0rEukXmA3HOaf9Q/TDPD2euKM23BhocfoyMdHbPTYSVv1n3ZHzXbUsyu
 lz3392/dlwOyUeszYZF/Fivz/a6ZES6RYdgY8Rj0x/Rh6+rkETlOBKtzZXPqTjESrXw0
 46/g==
X-Gm-Message-State: ACgBeo09mWSvOvLMKT06ONUqSCmdEsCYurLR5v9dTZ1+wQzdhBF0+sCt
 BzmBH6S4M7L4UMJeIwpUmXG1SA==
X-Google-Smtp-Source: AA6agR5TIxWxQH16FfxOb5OlDrxZ1ef+wSpbC3yhLXFUWIYO9pU8Fx65lMeWqgZtVDv/8pnyHebV1Q==
X-Received: by 2002:a17:90a:6ba5:b0:1f5:3c80:6c0b with SMTP id
 w34-20020a17090a6ba500b001f53c806c0bmr8322315pjj.147.1659712782906; 
 Fri, 05 Aug 2022 08:19:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a170902d2c800b0016dc240b24bsm3185813plc.95.2022.08.05.08.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:19:42 -0700 (PDT)
Message-ID: <74564953-db2d-8617-1a91-9c4e0cd0cf5c@linaro.org>
Date: Fri, 5 Aug 2022 08:19:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/loongarch: Fix macros SET_FPU_* in cpu.h
Content-Language: en-US
To: Qi Hu <huqi@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org
References: <20220804132450.314329-1-huqi@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804132450.314329-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 8/4/22 06:24, Qi Hu wrote:
> The macros SET_FPU_* are used to set corresponding bits of fcsr.
> Unfortunately it forgets to set the result and it causes fcsr's
> "CAUSE" never being updated. This patch is to fix this bug.
> 
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   target/loongarch/cpu.h | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)

Thanks, queued.


r~

