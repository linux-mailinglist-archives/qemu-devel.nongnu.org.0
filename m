Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200B459EE68
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 23:48:22 +0200 (CEST)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQbkz-0000Lm-7D
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 17:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbiQ-0007AW-LZ
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:45:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbiP-0007Lb-5x
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 17:45:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id g129so11361865pfb.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7OgYArpRBizpVHjGzyad2JvHlXVqqb6CdF+7FA9xb6c=;
 b=K547mNNUlL1vIZA2xAX7e1DjauWXMwLkp8F6z7qI6IEgRuE6XfQ8zP2ibUL99Pj7G6
 VrvMOH2VAILQqyjURIDJBBmAzIMcw3Sr+dkpWfV0DSLC6sBgJKJrNeOgkM4AWSNPk/fB
 J1vCZJG6V38Zlii6pQu9mbmKljKRCV+nowkVSTLCY17iuJOCCh6AkdN5pOn80EVQ+lUB
 tqfg8ao5XFb7VuyqN9IhH2dmgzxUaa530vTzzpQ/r2aSRLqVQu0iQxMITpgzTFrNM6dW
 S2+hgoSWcOaeYPWBwl9wFG4VvJDBKBXwceG1Jrx/D3IzEHQfvgOHUycAED2nhgb1gAU5
 oiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7OgYArpRBizpVHjGzyad2JvHlXVqqb6CdF+7FA9xb6c=;
 b=72PeL7t5oE+5Ege6Ip/+IMN+UFBsGSn8fVne472pNUlEO2X6LWHR9unFRM7oPDY5Wi
 QDfpWDYKYN/lGUE+KQxhUTEvJ5vHfzg/XYWvGiThPeYA9Fds+27IM69zxijeUeqHuWnz
 /booKjmykgWTrLiPU4nWFDJKoFu3m61BEVlUn8XCoaSB4JOCTjbpJh01NaGKeNegeqU2
 b5S3xSeYkVsQKBaAg+qHTo9x5CqmgSlWWc2D7xWQX8lRU74H13vl2LAy2qWOStt1ZS3i
 9ncmcP9ADLQOPVWdeDgu6SPWPDClHzItyvH/fRIWxWQBngZBsocUDKuGNP/HptHoE8kI
 HfRw==
X-Gm-Message-State: ACgBeo2iytzNHbHFFvRg95iFk6/m+MJ7Oei+2hAg/0cuDzr4DsGf+eqs
 qHGT8xp7YadHl11YzKmx8wXFsg==
X-Google-Smtp-Source: AA6agR6t87cyNRfNCbnJCUTb6vSqoiKD3intwBPw7MYPM72uRxlhv3i/tVecyOpkXYMpo2bW8CZoxQ==
X-Received: by 2002:a63:81c7:0:b0:42a:9b7a:1f95 with SMTP id
 t190-20020a6381c7000000b0042a9b7a1f95mr11286538pgd.401.1661291138599; 
 Tue, 23 Aug 2022 14:45:38 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a170902d48900b0016db43e5212sm11152701plg.175.2022.08.23.14.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:45:37 -0700 (PDT)
Message-ID: <bb075424-365e-b40d-fab5-52231611c8cc@linaro.org>
Date: Tue, 23 Aug 2022 14:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Content-Language: en-US
To: Enrik Berkhan <Enrik.Berkhan@inka.de>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/12/22 07:35, Enrik Berkhan wrote:
> In more recent Raspbian OS Linux kernels, the fb driver gives up
> immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
> displays are reported.
> 
> This change simply always reports one display. It makes bcm2835_fb work
> again with these more recent kernels.
> 
> Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>

Thanks, queued to target-arm.next.


r~

