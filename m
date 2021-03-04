Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BBC32CA6E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:23:03 +0100 (CET)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHddm-00029E-Dv
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdcL-0001b2-CO
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:21:33 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHdcH-00085U-OR
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:21:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id o6so5784922pjf.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Do32jtq3pITg/a+EwtLy7QaHNQdiUs+LprRacPk6P/0=;
 b=KoEgKuQ8ntxX2kpGy/GcYXD/8n5qFAaSxQqclcbJIa6WUso9QUT2gos4C6tGIy9gX1
 GqOs+soQl5Kfh41Hvg35fYE+lrL08LM/PvngD/RxrBstON1X2dFmGnZwnQ90u5w2cAo+
 y5dAxUIJJDa6i0ekvxLT5MwzHYGr+3q0DqXrvYMxN/hwG35rN1LW8MA+wbM+gUnBAonv
 zHs6XYd3x+JoFUA7oYfwLCc2+SIIDEJiLt5XBR/cjhlsXDpIjM+IFUnMCuRQhbCyJ77v
 1VIBSLg8jku7dFKNUQ/nsyCsIyDdw07ACeDrJeYlbqAqIDAPvLTb+TF+/XqGTQ7CY6+L
 4+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Do32jtq3pITg/a+EwtLy7QaHNQdiUs+LprRacPk6P/0=;
 b=pSxrK0PXFryAPFT1zgtRuqA6Rfn9j9z/eRr9/rCdYJ9fiOgMYe49nTlbOgY7lxeAVd
 vlszrXQYZIDZUhM/4JUJuhwZTk18yb2pNzHh/0j5dhq06TXCyC4d+knVOZupzHt81K2O
 N0tMSfPtnLdsNOhBVSCShVqBJOJHfMFTZX8ULaagkaY8ym0XgNgTsgGZalF1ptLrVCCt
 /dEN/ZNNoS+cpDiUU0i0rbTlyWCwl+vmijshztkGLCJKou9zqq5VcJIp48waQYdiwSZS
 RlbuqdafYWvEufmnBVRQDtZ32MOzt7iGG72kIAh4mLyP0gopZGgGqkSLZVWg9PNfMHhb
 68Dg==
X-Gm-Message-State: AOAM533z/Np9z5cJz74wqgYEkF0Tk/TjYQ9kF3ICth+Uu5Byj/E92+5U
 FBaEGce1dcyFIN1ZFMnGuqRzWw==
X-Google-Smtp-Source: ABdhPJz+ZzlFQYoSVV/bWvfKXEB2q9acL4dZVAnRnsMtP4GXYb77wMPRyQyIuiYa0EqF1ge4mvsv/g==
X-Received: by 2002:a17:902:e54f:b029:e2:8f59:6fe0 with SMTP id
 n15-20020a170902e54fb02900e28f596fe0mr1900539plf.76.1614824488028; 
 Wed, 03 Mar 2021 18:21:28 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id w200sm26679799pfc.200.2021.03.03.18.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:21:27 -0800 (PST)
Subject: Re: [PATCH v2 22/24] hw/arm/mps2-tz: Provide PL031 RTC on mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fadbc6d1-c0b5-c994-6bbb-bd133a90ad2a@linaro.org>
Date: Wed, 3 Mar 2021 18:21:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has a PL031 RTC, which we have a model of; provide it
> rather than an unimplemented-device stub.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


