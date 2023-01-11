Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E9666833
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 02:02:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlas-0007wq-SH; Wed, 11 Jan 2023 19:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlar-0007we-As
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlap-0001sy-Tt
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:21 -0500
Received: by mail-pf1-x430.google.com with SMTP id 200so6507189pfx.7
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k2A9GzkNc3eoHZtnHgRtBW8eYEZhsKykbn1lV9mK4ZA=;
 b=fzeAu5+3TNhxHRTpobiWIzs1NjoiAhicwg/BuYZJyywELqiFxBGV2HtomBDmRPyDuU
 07upjt9YVtusJJai9ud12+Pcb9ECmu5pXPB5/oxKCs0QN+1R60CD3OiCKjx2y5Y7Nulc
 wojEjJRwNCyhjjoscv4CdDnCr0F1C1tMTzs+5g2ZxPGae5WWEV+iHyMqB8zQ/JcPVXVp
 1R3mTeqQIsWOLsDZtTu4tS9TTxzGz+Ndov3hExQ0fzt43Y8djML/OWCIRHQErYARaw3r
 VVGorr/Ze5BM7/T1CZVSAKog8FZo25djOczMojIplBG8Cc7BeAjAGJRR4qMB3YkSx4F/
 l5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k2A9GzkNc3eoHZtnHgRtBW8eYEZhsKykbn1lV9mK4ZA=;
 b=Qsd/xwqAEJrlpmuGGvS3CAlABcRjD/4LVYUTSRwj+loiySfQEM85rOKiup7eBq9FVo
 k6RGdKMIT9ftVRJNM7VL8c7x6imAMQBY6wN6oM8adrhEM6uWsHJUaL8/XUlXMoLWm6fB
 BittOdpdmrY0Jmetnvh5iTIf9jzPXrl6UrXjDWgssS0CJmNYEZMdZufHLbuiuopNgk2g
 qMOcEfNROGNzrozocOSR0DCuJSQ3g92brxhw7z601sLtJSBT6TNnh+P6yU0sXnK9VaQ3
 gl4VJ7QXwY44EcJcqm//hRHyQshLOGIQaJiwzu+swrhwCUvqG9ymRIg4e8VvBZN7h/TL
 Lw4g==
X-Gm-Message-State: AFqh2kooHHtukx+SAANogal3cS/a2wiwMJ7zDJH4RRvP0qPPFMvdFiTo
 03vls2IO2t7+dLNYF1k6GE8XtmI0pC/kKA2J
X-Google-Smtp-Source: AMrXdXuCDtz667kq1g/H1PKQI8UHdTA7CNyhFxHwkwUArq4/nlBNuFKQanbvyRPkXMK40uK8slHd8g==
X-Received: by 2002:a05:6a00:21c6:b0:576:a74a:13c3 with SMTP id
 t6-20020a056a0021c600b00576a74a13c3mr96023694pfj.1.1673483838535; 
 Wed, 11 Jan 2023 16:37:18 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e2-20020aa798c2000000b005829c60a838sm10527294pfm.183.2023.01.11.16.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:18 -0800 (PST)
Message-ID: <a1b1f653-683a-9245-902b-520b39fdca48@linaro.org>
Date: Wed, 11 Jan 2023 10:04:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/18] hw/arm/digic: Remove unnecessary target_long use
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> load_image_targphys(), declared in "hw/loader.h", returns a ssize_t.
> 
> Remove the 'target_long' type which size changes per target.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/digic_boards.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

