Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74D5F0D74
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:23:04 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGuu-0002wa-0i
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGbA-00088h-NM
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:02:41 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGb1-0003Mo-0t
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:02:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r8-20020a17090a560800b00205eaaba073so4339253pjf.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Qxuf3VlWLSO1XaAx3psaOiPMVQhtyHFUi+T19ENvRRA=;
 b=KJObGf0Ky0ur+bVCHq4uf8GHPBv0Yer0a3oVJVtfX657zFHoBlNAysWVzZRToPxjNw
 bnnxQ/4NIXBvBgv0YbvHTqJFfR0cTy3jxb71C3/h76R7bTOBsXySqslZ925dKCvjKVZh
 tPb8a5qhrDzV0Vsy7Bzsq8752GWUbWx5gtLanbVfO6ibaW0cjkZTmPGPpNWQGEUX+6sv
 pK3DBWvcbU1ApNWMWhS0HlOfXY0bYMoMQUodmVGTgB/cG9sDkxvB6rvdmvphhBZ1aMqR
 0n1cwhMSk2lXLGnZzE6laEQ4SOTPctXy1yY/zI+ddtQJw2msNIW3zQl4Uw3QtZJuBLe7
 nnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Qxuf3VlWLSO1XaAx3psaOiPMVQhtyHFUi+T19ENvRRA=;
 b=AKT2m3PH/e03xqJ/Kd6Ro3ee3c+x1Jx9FYis3p2F2YJebHyq6HekvQb4VTtLfdv9gZ
 9ip43lBZbPWoigsVNMT+NouzMVkt5zCxG9Mo++chWHWX+Vj7qCPylC+KWuWri6H6MK/n
 l7iLdSNvflJvbnDTvfgrCD2uaE6QAULXXV2IuHrDe3MP1XqxRWgL0bp+eLUGSe/PtSzf
 jhZ+RKKvUMCeu/5ZxtPjyPjHXw49vryju+TDjWyd40pzWT/b5V4J8g+7nHTv8x2KC1VR
 K8VhAeY7wIHgEQgR5ZBN8tYJijVvJMeY5RVgmnB6Tb1WOsYUqx0JDMxY5wiQyZxKpwrO
 V/NA==
X-Gm-Message-State: ACrzQf05tW1Wt55VRy1lA86pV2zTSlwCpVsf2Hu/MMkT1RC3z5W6PxFm
 PavlBDyeoFXe/udPHDuCJ4oJYg==
X-Google-Smtp-Source: AMsMyM7ATNblxeVs//aHvaIu8oYm9jDkVIK3KQ4VPMTKxk73afAZGwF1vuXLnF5maNrjfeMJFla4SA==
X-Received: by 2002:a17:902:db0a:b0:178:32b9:6f51 with SMTP id
 m10-20020a170902db0a00b0017832b96f51mr8925073plx.145.1664546541212; 
 Fri, 30 Sep 2022 07:02:21 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a01c300b001fb1de10a4dsm1669581pjd.33.2022.09.30.07.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:02:20 -0700 (PDT)
Message-ID: <0e4b61fc-0553-8f9d-5b84-ff23166ab0b4@linaro.org>
Date: Fri, 30 Sep 2022 07:02:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] softfloat: logB(0) should raise divideByZero
 exception
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@Loongson.cn, huqi@loongson.cn
References: <20220930024510.800005-1-gaosong@loongson.cn>
 <20220930024510.800005-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930024510.800005-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 19:45, Song Gao wrote:
> logB(0) should raise divideByZero exception from IEEE 754-2008 spec 7.3
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   fpu/softfloat-parts.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

